function x=dataentry(choice,nbus,nlines,nshunts,tolerance);
%nbus=input('enter the number of buses.');
%nlines=input('enter the number of lines.');
%nshunts=input('enter the number of shunts.');
%tolerance=input('enter the tolerance.');
nbus=nbus;
nlines=nlines;
nshunts=nshunts;
tolerance=tolerance;
%Entering bus data
disp('The following code is employed for the status of the buses.');
disp('0-Slack Bus');
disp('1-Buses of PV or PQ type');
disp('You will now be asked data pertaining to initial conditions of each bus.');
bus_status=[];
v_bus=[];
ang_bus=[];
%weight variable for voltage magnitudes and power injections
%funda of wts: if the value is somewhat near desired then wts are low, else
%if values drop very low then wts have to be very high. no measure implies
%very high weights
v_wts=[];
p_wts=[];
q_wts=[];
bus_number=[];
for i=1:nbus
    
    bus_number=[bus_number i];
    disp('This is the data for bus');
    disp(i);
    bus_status(i)=input('Bus status:');
    disp('Please enter the starting conditions.');
    v_bus(i)=input('Initial voltage:');
    ang_bus(i)=input('Initial angle:');
    disp('Please enter the measured values.');
    v_meas(i)=input('Please enter the measured value of voltage.');
    v_wts(i)=input('Enter the weight for this voltage measure.');
    p_meas(i)=input('Please enter the measured value of real power injection.');
    p_wts(i)=input('Enter the weight for this real power injection measure.');
    q_meas(i)=input('Please enter the measured value of reactive power injection.');
    q_wts(i)=input('Enter the weight for this reactive power injection measure.');
end
a=[bus_status' v_bus' ang_bus' v_meas' p_meas' q_meas'];
a=a';
fid=fopen('busdata.txt','w');
fprintf(fid,'%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n',a);
fclose(fid);
%Entering line data
disp('You will now be asked to enter line data.');
start_bus=[];
end_bus=[];
resistance=[];
reactance=[];
shunt_admit=[];
tap=[]; %This refers only to the tap magnitude
%line flows
pij_flow=[];
qij_flow=[];
pji_flow=[];
qji_flow=[];
%weights for line flows..same fundas apply
pij_wts=[];
qij_wts=[];
pji_wts=[];
qji_wts=[];
for i=1:nlines
    fprintf('This is data for line %d',i);
    start_bus(i)=input('Enter the starting bus:');
    end_bus(i)=input('Enter the ending bus:');
    resistance(i)=input('Enter the resistance of the line:');
    reactance(i)=input('Enter the reactance of the line:');
    shunt_admit(i)=input('Enter the shunt admittance of the line:');
    tap(i)=input('Enter the tap of the line (only magnitude)');
    fprintf('Line flow from bus %d to bus %d',start_bus(i),end_bus(i));
    pij_flow(i)=input('Enter the real power flow on the line.');
    pij_wts(i)=input('Enter the weights for this measure.');
    qij_flow(i)=input('Enter the reactive power flow on the line.');
    qij_wts(i)=input('Enter the weights for this measure.');
    %fprintf('Line flow from bus %d to bus %d',end_bus(i),start_bus(i));
    %pji_flow(i)=input('Enter the real power flow on the line.');
    %pji_wts(i)=input('Enter the weights for this measure.');
    %qji_flow(i)=input('Enter the reactive power flow on the line.');
    %qji_wts(i)=input('Enter the weights for this measure.');
end
b=[start_bus' end_bus' resistance' reactance' shunt_admit' tap' pij_flow' qij_flow'];
b=b';
fid=fopen('linedata.txt','w');
fprintf(fid,'%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n',b);
fclose(fid);
%Entering shunt data
shunts=[];
bus_shunt=[];
for i=1:nshunts
    bus_shunt(i)=input('Enter the bus number of the shunt.');
    shunts(i)=input('Enter the shunt magnitude.');
end
c=[bus_shunt' shunts'];
c=c';
fid=fopen('shuntdata.txt','w');
fprintf(fid,'%6.2f %6.2f\n',c);
fclose(fid);

%writing weights data into file
buswts=[v_wts' p_wts' q_wts'];
%linewts=[pij_wts' qij_wts' pji_wts' qji_wts'];
linewts=[pij_wts' qij_wts'];
buswts=buswts';
linewts=linewts';
fid=fopen('busweightsdata.txt','w');
fprintf(fid,'%6.2f %6.2f %6.2f',buswts);
fclose(fid);
fid=fopen('lineweightsdata.txt','w');
fprintf(fid,'%6.2f %6.2f',linewts);
fclose(fid);


%x=[nbus nlines nshunts tolerance];