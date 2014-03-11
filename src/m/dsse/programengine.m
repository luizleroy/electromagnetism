function x1=programengine(choice,nbus,nlines,nshunts,tolerance);
nbus=nbus;
nlines=nlines;
nshunts=nshunts;
tolerance=tolerance;

%reading data related to buses
fid=fopen('busdata.txt','r');
a=textread('busdata.txt');
fclose(fid);

%reading data pertaining to lines
fid=fopen('linedata.txt','r');
b=textread('linedata.txt');
fclose(fid);

%reading data pertaining to shunts
fid=fopen('shuntdata.txt','r');
c=textread('shuntdata.txt');
fclose(fid);

%reading data pertaining to weights
fid=fopen('busweightsdata.txt','r');
buswts=textread('busweightsdata.txt');
fclose(fid);

fid=fopen('lineweightsdata.txt','r');
linewts=textread('lineweightsdata.txt');
fclose(fid);

v_wts=buswts(:,1:nbus);
p_wts=buswts(:,nbus+1:2*nbus);
q_wts=buswts(:,2*nbus+1:3*nbus);
pij_wts=linewts(:,1:nlines);
qij_wts=linewts(:,nlines+1:2*nlines);
%pji_wts=linewts(:,2*nlines+1:3*nlines);
%qji_wts=linewts(:,3*nlines+1:4*nlines);

%STATE ESTIMATION PROGRAM

%Formation of Ybus
Ybus=zeros(nbus);
tap=b(:,6);
x=b(:,1);
y=b(:,2);
zreal=b(:,3);
zimag=b(:,4);
y1=b(:,5);

if size(c)~=0
    shun_bus=c(:,1);
    shun_val=c(:,2);
end

%effect of line impedances and shunt admittances
for i=1:length(x)
    tap_effect11=(1/(zreal(i)+zimag(i)*j))/(tap(i)^2);
    tap_effect12=(-1/(zreal(i)+zimag(i)*j))/(tap(i));
    tap_effect21=(-1/(zreal(i)+zimag(i)*j))/(tap(i));
    tap_effect22=(1/(zreal(i)+zimag(i)*j));
    Ybus(x(i),x(i))=Ybus(x(i),x(i))+tap_effect11+y1(i);
    Ybus(y(i),y(i))=Ybus(y(i),y(i))+tap_effect22+y1(i);
    Ybus(x(i),y(i))=Ybus(x(i),y(i))+tap_effect12;
    Ybus(y(i),x(i))=Ybus(y(i),x(i))+tap_effect21;
end
Ybus;

%inclusion of shunts
if size(c)~=0
    for i=1:length(shun_bus)
        Ybus(shun_bus(i),shun_bus(i))=Ybus(shun_bus(i),shun_bus(i))+shun_val(i);
    end
end

%separation into G and B
G=real(Ybus);
B=imag(Ybus);

%computation of measurement mismatch
%the measurement mismatch vector is of the form [V Pi Qi Pij Qij Pji Qji]' where each
%term represents a subvector

%state mismatch vector
%state mismatch vector is of the form [theta V] where term represents a
%subvector and the theta subvector excludes the slack bus angle


v_bus=a(:,2);
ang_bus=a(:,3);
v_meas=a(:,4);
p_meas=a(:,5);
q_meas=a(:,6);

pij_flow=b(:,7);
qij_flow=b(:,8);
%pji_flow=b(:,9);
%qji_flow=b(:,10);

count=0;
flag=1;
while flag>0
%for count=0:5
 %voltage calculation 
 v_calc=v_bus;

%Real power injection calculation
p_calc=[];
for i=1:nbus
    p_calc(i)=0;
    1:nbus
    for k=1:nbus
        p_calc(i)=p_calc(i)+v_bus(i)*v_bus(k)*(G(i,k)*cos(ang_bus(i)-ang_bus(k))+B(i,k)*sin(ang_bus(i)-ang_bus(k)));
    end
end

%reactive power injection calculations
q_calc=[];
for i=1:nbus
    q_calc(i)=0;
    for k=1:nbus
        q_calc(i)=q_calc(i)+v_bus(i)*v_bus(k)*(G(i,k)*sin(ang_bus(i)-ang_bus(k))-B(i,k)*cos(ang_bus(i)-ang_bus(k)));
    end
end

start_bus=x;
end_bus=y;

%i to j real flows calculation
pij_calc=[];
length(x)
for i=1:length(x)
    q=start_bus(i);
    r=end_bus(i);
    pij_calc(i)=-((v_bus(q))^2)*G(q,r)+v_bus(q)*v_bus(r)*(cos(ang_bus(q)-ang_bus(r))*G(q,r)+sin(ang_bus(q)-ang_bus(r))*B(q,r));
end

%i to j reactive flows calculation
qij_calc=[];
for i=1:length(x)
    q=start_bus(i);
    r=end_bus(i);
    qij_calc(i)=((v_bus(q))^2)*B(q,r)+v_bus(q)*v_bus(r)*(sin(ang_bus(q)-ang_bus(r))*G(q,r)-cos(ang_bus(q)-ang_bus(r))*B(q,r));
end


%the data for flows from bus j to bus i is not computed in this algorithm
%because the transformer taps are taken wrt bus i. hence since no separate
%calculations are performed for the tapping j to i flows are not considered
%j to i real flows calculation
%pji_calc=[];
%for i=1:length(x)
 %   q=start_bus(i);
  %  r=end_bus(i);
  %  pji_calc(i)=-((v_bus(r))^2)*G(q,r)+v_bus(q)*v_bus(r)*(cos(ang_bus(r)-ang_bus(q))*G(q,r)+sin(ang_bus(r)-ang_bus(q))*B(q,r));
  %end

%j to i reactive flows calculation
%qji_calc=[];
%for i=1:length(x)
 %   q=start_bus(i);
  %  r=end_bus(i);
   % qji_calc(i)=((v_bus(r))^2)*B(q,r)+v_bus(q)*v_bus(r)*(sin(ang_bus(r)-ang_bus(q))*G(q,r)-cos(ang_bus(r)-ang_bus(q))*B(q,r));
   %end

%DETERMINING MISMATCH VECTORS
%voltage mismatch
%v_meas
%v_calc
mmv=v_meas-v_calc;
%mmv
%real injections 
%p_meas
%p_calc
mmp=p_meas'-p_calc;
%mmp
%reactive injections
%q_meas
%q_calc
mmq=q_meas'-q_calc;
%mmq
%real ij flows
%pij_flow
%pij_calc
mmpij=pij_flow'-pij_calc;
%mmpij
%reactive ij flows
%qij_flow
%qij_calc
mmqij=qij_flow'-qij_calc;
%mmqij
%real ji flows
%pji_flow
%pji_calc
%mmpji=pji_flow'-pji_calc;
%mmpji
%reactive ji flows
%qji_flow
%qji_calc
%mmqji=qji_flow'-qji_calc;
%mmqji

%FINAL MISMATCH VECTOR
%mm=[mmv' mmp mmq mmpij mmqij mmpji mmqji]'
mm=[mmv' mmp mmq mmpij mmqij]';
nmeas=length(mm);

matrixstate=zeros(2*nbus);
state=(matrixstate(1,:))';
nstate=length(state);

%formation of the Jacobian
Hv=zeros(nbus,nstate);
Hp=zeros(nbus,nstate);
Hq=zeros(nbus,nstate);
Hpij=zeros(nlines,nstate);
Hqij=zeros(nlines,nstate);
%Hpji=zeros(nlines,nstate);
%Hqji=zeros(nlines,nstate);

bus_number=[];
for i=1:nbus
    bus_number=[bus_number i];
end

%The complete Jacobian H will be an agglomeration of these submatrices
line_tracker=[x';y'];
bus_number;
%formation of Hv submatrix corresponding to voltage mismatches
for i=1:length(mmv)
    for k=1:nstate
        if j~=(nbus+i)
            Hv(i,k)=0;
        end
        if k==(nbus+i)
            Hv(i,k)=1;
        end
    end
end
%Hv

%formation of Hp submatrix corresponding to real power injection mismatches
for i=1:length(mmp)
    for k=1:nstate
        if i==k
            Hp(i,k)=-q_calc(i)-B(i,i)*v_bus(i)*v_bus(i);
        end
        if k~=i & k<=nbus
            Hp(i,k)=v_bus(i)*v_bus(k)*(G(i,k)*sin(ang_bus(i)-ang_bus(k))-B(i,k)*cos(ang_bus(i)-ang_bus(k)));
        end
        if k==i+nbus
            Hp(i,k)=p_calc(i)/v_bus(i)+G(i,i)*v_bus(i);
        end
        if k~=i+nbus & k>nbus
            Hp(i,k)=v_bus(i)*v_bus(k-nbus)*(G(i,k-nbus)*cos(ang_bus(i)-ang_bus(k-nbus))+B(i,k-nbus)*sin(ang_bus(i)-ang_bus(k-nbus)));
        end
    end
end
%Hp

%formation of Hq submatrix corresponding to reactive power injection
%mismatches
for i=1:length(mmq)
    for k=1:nstate
        if i==k
            Hq(i,k)=p_calc(i)-G(i,i)*v_bus(i)*v_bus(i);
        end
        if k~=i & k<=nbus
            Hq(i,k)=-v_bus(i)*v_bus(k)*(G(i,k)*cos(ang_bus(i)-ang_bus(k))+B(i,k)*sin(ang_bus(i)-ang_bus(k)));
        end
        if k==i+nbus
            Hq(i,k)=q_calc(i)/v_bus(i)-B(i,i)*v_bus(i);
        end
        if k~=i+nbus & k>nbus
            Hq(i,k)=v_bus(i)*v_bus(k-nbus)*(G(i,k-nbus)*sin(ang_bus(i)-ang_bus(k-nbus))-B(i,k-nbus)*cos(ang_bus(i)-ang_bus(k-nbus)));
        end
    end
end
%Hq

%formation of Hpij matrix corresponding to real power flow between bus i and k
%mismatches
for i=1:length(mmpij)
    for k=1:nstate
        temp=line_tracker(:,i);
        Hpij(i,k)=0;
        if k==temp(1)
            Hpij(i,k)=v_bus(temp(1))*v_bus(temp(2))*(-G(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2)))+B(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2))));
        end
        if k==temp(2)
            Hpij(i,k)=v_bus(temp(1))*v_bus(temp(2))*(G(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2)))-B(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2))));
        end
        if k==temp(1)+nbus
            Hpij(i,k)=-2*v_bus(temp(1))*G(temp(1),temp(2))+v_bus(temp(2))*(G(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2)))+B(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2))));
        end
        if k==temp(2)+nbus
            Hpij(i,k)=v_bus(temp(1))*(G(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2)))+B(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2))));
        end
    end
end
%Hpij

%formation of Hqij matrix corresponding to reactive power flow between bus i and j
%mismatches
for i=1:length(mmqij)
    for k=1:nstate
        temp=line_tracker(:,i);
        Hqij(i,k)=0;
        if k==temp(1)
            Hqij(i,k)=v_bus(temp(1))*v_bus(temp(2))*(G(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2)))+B(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2))));
        end
        if k==temp(2)
            Hqij(i,k)=v_bus(temp(1))*v_bus(temp(2))*(-G(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2)))-B(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2))));
        end
        if k==temp(1)+nbus
            Hqij(i,k)=2*v_bus(temp(1))*B(temp(1),temp(2))+v_bus(temp(2))*(G(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2)))-B(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2))));
        end
        if k==temp(2)+nbus
            Hqij(i,k)=v_bus(temp(1))*(G(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2)))-B(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2))));
        end
    end
end
%Hqij

%formation of Hpji matrix corresponding to real power flow between bus j
%and i mismatches
%for i=1:length(mmpji)
 %   for j=1:nstate
  %      temp=line_tracker(:,i);
   %     trash=temp(1);
    %    temp(1)=temp(2);
     %   temp(2)=trash;
      %  Hpji(i,j)=0;
       % if j==temp(1)
        %    Hpji(i,j)=v_bus(temp(1))*v_bus(temp(2))*(-G(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2)))+B(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2))));
        %end
       % if j==temp(2)
           % Hpji(i,j)=v_bus(temp(1))*v_bus(temp(2))*(G(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2)))-B(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2))));
           %end
        %if j==temp(1)+nbus
         %   Hpji(i,j)=-2*v_bus(temp(1))*G(temp(1),temp(2))+v_bus(temp(2))*(G(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2)))+B(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2))));
         %end
        %if j==temp(2)+nbus
        %    Hpji(i,j)=v_bus(temp(1))*(G(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2)))+B(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2))));
        %end
        %end
        %end
%Hpji

%formation of Hqji matrix corresponding to reactive power flow between bus
%j and i mismatches
%for i=1:length(mmqji)
 %   for j=1:nstate
  %      temp=line_tracker(:,i);
   %     trash=temp(1);
   %     temp(1)=temp(2);
   %     temp(2)=trash;
   %     Hqji(i,j)=0;
   %     if j==temp(1)
   %         Hqji(i,j)=v_bus(temp(1))*v_bus(temp(2))*(G(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2)))+B(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2))));
   %     end
  %      if j==temp(2)
  %          Hqji(i,j)=v_bus(temp(1))*v_bus(temp(2))*(-G(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2)))-B(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2))));
  %      end
 %       if j==temp(1)+nbus
 %           Hqji(i,j)=2*v_bus(temp(1))*B(temp(1),temp(2))+v_bus(temp(2))*(G(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2)))-B(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2))));
 %       end
%        if j==temp(2)+nbus
%            Hqji(i,j)=v_bus(temp(1))*(G(temp(1),temp(2))*sin(ang_bus(temp(1))-ang_bus(temp(2)))-B(temp(1),temp(2))*cos(ang_bus(temp(1))-ang_bus(temp(2))));
%        end
%    end
%end
%Hqji

%birth of Jacobian
%H=[Hv; Hp; Hq; Hpij; Hqij; Hpji; Hqji]
H=[Hv; Hp; Hq; Hpij; Hqij];
hsize=size(H);
if count==0
   fid=fopen('output.txt','w');
   fprintf(fid,'Iteration number %d\n\n',count);
   fprintf(fid,'The Jacobian\n\n');
    for i=1:hsize(1)
    fprintf(fid,'%10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f\n',H(i,:));
end
fclose(fid);
end
if count>0
    fid=fopen('output.txt','a');
    fprintf(fid,'Iteration number %d\n\n',count);
    fprintf(fid,'The Jacobian\n\n');
    for i=1:hsize(1)
        fprintf(fid,'%10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f\n',H(i,:));
    end
    fclose(fid);
end
%determination of weight matrix
%v_wts
%p_wts
%q_wts
%pij_wts
%qij_wts
%pji_wts
%qji_wts
%W=eye(nmeas,nmeas);
W=zeros(nmeas,nmeas);
%W
for i=1:nbus
    %i
    for k=1:nmeas
     %   k
        W(i,k)=0;
        if k==i
            W(i,k)=v_wts(i);
        end
    end
    %W
end
i_temp=i;

for i=i_temp+1:i_temp+nbus
    %i
    for k=1:nmeas
        W(i,k)=0;
        if k==i
            W(i,k)=p_wts(i-i_temp);
        end
    end
    %W
end
i_temp=i;
for i=i_temp+1:i_temp+nbus
    %i
    for k=1:nmeas
        W(i,k)=0;
        if k==i
            W(i,k)=q_wts(i-i_temp);
        end
    end
    %W
end
i_temp=i;
for i=i_temp+1:i_temp+nlines
    for k=1:nmeas
        W(i,k)=0;
        if k==i
            W(i,k)=pij_wts(i-i_temp);
        end
    end
    %W
end
i_temp=i;
for i=i_temp+1:i_temp+nlines
    for k=1:nmeas
        W(i,k)=0;
        if k==i
            W(i,k)=qij_wts(i-i_temp);
        end
    end
    %W
end
%i_temp=i;
%for i=i_temp+1:i_temp+nlines
 %   for j=1:nmeas
  %      W(i,j)=0;
   %     if j==i
    %        W(i,j)=pji_wts(i-i_temp);
    %   end
    %end
   % W
   %end
%i_temp=i;
%for i=i_temp+1:i_temp+nlines
 %   for j=1:nmeas
  %      W(i,j)=0;
   %     if j==i
    %        W(i,j)=qji_wts(i-i_temp);
    %   end
    %end
    %W
    %end
 %   size(H)
  %  size(H')
   % size(W)

%determination of state mismatch vector
%W;
Gain=H'*W*H;
%Gain
Gain(1,1)=10000000;
gsize=size(Gain);
fid=fopen('output.txt','a');
fprintf(fid,'\n\nThe following is the Gain matrix.\n\n');
for i=1:gsize(1);
    fprintf(fid,'%10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f\n',Gain(i,:));
end
fclose(fid);
niag=inv(Gain);
smm=inv(Gain)*H'*W*mm;
%test=smm*1000
count=count+1;
%v_bus
%ang_bus
smm(1)=0; %to ensure that bus angle 1 remains as reference. no change in it
%smm
smma=smm(1:nbus,:);
smmv=smm(nbus+1:2*nbus,:);
%determination of tolerance 
plz_giveta=[];
for i=1:length(smm)
    if smm(i)>tolerance
        plz_giveta(i)=1;
    end
end
if length(plz_giveta)>0
   flag=1;
    v_bus=v_bus+smmv;
   ang_bus=ang_bus+smma;
end
%v_bus
%ang_bus
if length(plz_giveta)==0
    flag=0;
   % clc;
   fid=fopen('output.txt','a');
    fprintf(fid,'\n\nConvergence has occured in %d iterations.\n',count);
    fprintf(fid,'Estimated bus voltages.\n');
    fprintf(fid,'Bus number  Voltage\n');
    for i=1:nbus
        fprintf(fid,'%f %f\n',bus_number(i),v_bus(i));
    end
    fprintf(fid,'Estimated bus angles\n.');
    fprintf(fid,'Bus number  Angle\n');
    for i=1:nbus
        fprintf(fid,'%f %f\n',bus_number(i),ang_bus(i));
    end
    %Real power injection calculation
p_calc=[];
for i=1:nbus
    p_calc(i)=0;
    for k=1:nbus
        p_calc(i)=p_calc(i)+v_bus(i)*v_bus(k)*(G(i,k)*cos(ang_bus(i)-ang_bus(k))+B(i,k)*sin(ang_bus(i)-ang_bus(k)));
    end
end
fprintf(fid,'Estimated real power bus injections.\n');
    fprintf(fid,'Bus number  P\n');
    for i=1:nbus
        fprintf(fid,'%f %f\n',bus_number(i),p_calc(i));
    end

%reactive power injection calculations
q_calc=[];
for i=1:nbus
    q_calc(i)=0;
    for k=1:nbus
        q_calc(i)=q_calc(i)+v_bus(i)*v_bus(k)*(G(i,k)*sin(ang_bus(i)-ang_bus(k))-B(i,k)*cos(ang_bus(i)-ang_bus(k)));
    end
end
fprintf(fid,'Estimated reactive power bus injections.\n');
    fprintf(fid,'Bus number  Q\n');
    for i=1:nbus
        fprintf(fid,'%f %f\n',bus_number(i),q_calc(i));
    end

start_bus=x;
end_bus=y;

%i to j real flows calculation
pij_calc=[];
length(x);
for i=1:length(x)
    q=start_bus(i);
    r=end_bus(i);
    pij_calc(i)=-((v_bus(q))^2)*G(q,r)+v_bus(q)*v_bus(r)*(cos(ang_bus(q)-ang_bus(r))*G(q,r)+sin(ang_bus(q)-ang_bus(r))*B(q,r));
end
fprintf(fid,'Real line flows\n.');
fprintf(fid,'From_bus   To_bus  Real power flow\n');
for i=1:length(start_bus)
fprintf(fid,'%f %f  %f\n',start_bus(i),end_bus(i),pij_calc(i));

end

%i to j reactive flows calculation
qij_calc=[];
for i=1:length(x)
    q=start_bus(i);
    r=end_bus(i);
    qij_calc(i)=((v_bus(q))^2)*B(q,r)+v_bus(q)*v_bus(r)*(sin(ang_bus(q)-ang_bus(r))*G(q,r)-cos(ang_bus(q)-ang_bus(r))*B(q,r));
    
end
fprintf(fid,'Reactive line flows\n.');
fprintf(fid,'From_bus   To_bus  Reactive power flow\n');
for i=1:length(start_bus)
fprintf(fid,'%f %f  %f\n',start_bus(i),end_bus(i),qij_calc(i));

end
fclose(fid);
  break;
end
%if count==1
 %   fid=fopen('output.txt','w');
  %  fprintf(fid,'%6.2f %6.ff %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n',smm');
   %fclose(fid);
   %end
%if count>1
 %  fid=fopen('output.txt','a');
  %fprintf(fid,'%6.2f %6.ff %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n',smm');
 %fclose(fid);
 %end
%count
end