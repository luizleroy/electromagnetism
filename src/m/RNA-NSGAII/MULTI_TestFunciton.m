%% antigamente era ... function [ f ] = functionTable( pop, func )
function [ f ] = MULTI_TestFunciton(x,func) %TODO inserir offset ???
[pop,n] = size(x);
switch func
    case 'gustavo';
        display('gustavo:');
%        a=-2; b=2;
%        x = a + (b-a).*rand(pop,2);
        f(:,1)=x(:,1).^2+x(:,2).^2;
        f(:,2)=(x(:,1)-1).^2+x(:,2).^2;
    case 'SCH'
        %convex
        f(:,1)= x.^2;
        f(:,2)=(x-2).^2;
    case 'FON'
        %FON: nonconvex
        invSqrt3 = 1/sqrt(3);
        f(:,1) = (x(:,1) - invSqrt3).^2 + (x(:,2) - invSqrt3).^2 + (x(:,3) - invSqrt3).^2;
        f(:,1) = 1 - exp(-f(:,1));
        f(:,2) = (x(:,1) + invSqrt3).^2 + (x(:,2) + invSqrt3).^2 + (x(:,3) + invSqrt3).^2;
        f(:,2) = 1 - exp(-f(:,2));
    case 'POL'
        %nonconvex and disconnected
        A1 = 0.5*sin(1) - 2*cos(1) + sin(2) - 1.5*cos(2);
        A2 = 1.5*sin(1) - cos(1) + 2*sin(2) - 0.5*cos(2);                
%        a = -pi; b = pi; n = 2;
%        x = a + (b-a).*rand(pop,n);
        B1 = 0.5*sin(x(:,1)) - 2*cos(x(:,1)) + sin(x(:,2)) - 1.5*cos(x(:,2));
        B2 = 1.5*sin(x(:,1)) - cos(x(:,1)) + 2*sin(x(:,2)) - 0.5*cos(x(:,2));
        f(:,1) = 1 + (A1 - B1).^2 + (A2 - B2).^2;
        f(:,2) = (x(:,1) + 3).^2 + (x(:,2) + 1).^2;
    case 'KUR'
        %nonconvex
%        a = -5; b = 5; n = 3;
%        x = a + (b-a).*rand(pop,n);
        f(:,1)=-10*(exp(-0.2*sqrt(x(:,1).^2+x(:,2).^2))+exp(-0.2*sqrt(x(:,2).^2+x(:,3).^2)));
        f(:,2)= zeros(pop,1);
        for j=1:3
            f(:,2) = f(:,2) + (abs(x(:,j))).^0.8 + 5*sin(x(:,j).^3);
        end
    case 'ZDT1'
         %convex
		 %fixme COMO VERIRICAR DIMENS�O?
        n = 30;
%        x = rand(pop,n);
        g(:,1) = ones(pop,1);
        for j=2:n
            g(:,1) = g(:,1) + (9/(n-1))*(x(:,j));
        end
        f(:,1)=x(:,1);
        f(:,2)=g(:,1).*(1 - sqrt(x(:,1)./g(:,1)));
    case 'ZDT2'
         %nonconvex
        n = 30;
		%FIXME COMO VERIRICAR DIMENS�O?
        %x = rand(pop,n);
        g(:,1) = ones(pop,1);
        for j=2:n
            g(:,1) = g(:,1) + (9/(n-1))*(x(:,j));
        end
        f(:,1)=x(:,1);
        f(:,2)=g(:,1).*(1 - (x(:,1)./g(:,1)).^2);
    case 'ZDT3'
        %convex and disconected
        n = 30;
        %x = rand(pop,n);
		%FIXME COMO VERIRICAR DIMENS�O?
        g(:,1) = ones(pop,1);
        for j=2:n
            g(:,1) = g(:,1) + (9/(n-1))*(x(:,j));
        end
        f(:,1)=x(:,1);
        f(:,2)=g(:,1).*(1 - sqrt(x(:,1)./g(:,1)) -( x(:,1)./g(:,1)).*sin(10*pi*x(:,1)));
    case 'ZDT4'
        %nonconvex
		%FIXME COMO VERIRICAR DIMENS�O?
        %a = -5; b = 5; 
        n = 10;
        %x = [rand(pop,1),(a + (b-a).*rand(pop,n-1))];
        g(:,1) = ones(pop,1) + 10*(n-1);
        for j=2:n
            g(:,1) = g(:,1) + x(:,j).^2 - 10*cos(4*pi*x(:,j));
        end
        f(:,1)=x(:,1);
        f(:,2)=g(:,1).*(1 - sqrt(x(:,1)./g(:,1)));
    case 'ZDT6'
        %nonconvex, nonunifromly and spaced
        n = 10;
		%FIXME COMO VERIRICAR DIMENS�O?
        %x = rand(pop,n);
        g(:,1)=zeros(pop,1);
        for j = 2:n
            g(:,1) = g(:,1) + x(:,j);
        end
        g(:,1) = (g(:,1)./(n-1)).^(0.25);
        g(:,1) = 1 + 9*g(:,1);
        f(:,1) = 1 - exp(-4*x(:,1)).*((sin(6*pi*x(:,1))).^6);
        f(:,2) = g(:,1).*(1 - (f(:,1)./g(:,1)).^2);
    otherwise
        f = -1;
        display('Not implementation function!');
end

end