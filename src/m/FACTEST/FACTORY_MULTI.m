function [f]=FACTORY_MULTI(func,x)
if nargin < 2
    error('Not valid number of param.');
end
[L,C] = size(x);
switch func
    case 'SPHERES'
        f(:,1)=sum(x.^2); % centro no vetor nulo
        f(:,2)=(x(:,1)-1).^2+sum(x(:,2:C).^2); %deslocamento na primeira dim.
    case 'SCH'
        %convex
        f(:,1)= x.^2;
        f(:,2)=(x-2).^2;
    case 'FON'
        %nonconvex
        a = -4; b = 4;
        x = a + (b-a).*rand(L,C);
        invSqrt3 = 1/sqrt(3);
        f(:,1) = (x(:,1) - invSqrt3).^2 + (x(:,2) - invSqrt3).^2 + (x(:,3) - invSqrt3).^2;
        f(:,1) = 1 - exp(-f(:,1));
        f(:,2) = (x(:,1) + invSqrt3).^2 + (x(:,2) + invSqrt3).^2 + (x(:,3) + invSqrt3).^2;
    case 'POL'
       %nonconvex and disconnected
        A1 = 0.5*sin(1) - 2*cos(1) + sin(2) - 1.5*cos(2);
        A2 = 1.5*sin(1) - cos(1) + 2*sin(2) - 0.5*cos(2);                
        x = -pi + 2*pi.*rand(L,C);
        B1 = 0.5*sin(x(:,1)) - 2*cos(x(:,1)) + sin(x(:,2)) - 1.5*cos(x(:,2));
        B2 = 1.5*sin(x(:,1)) - cos(x(:,1)) + 2*sin(x(:,2)) - 0.5*cos(x(:,2));
        f(:,1) = 1 + (A1 - B1).^2 + (A2 - B2).^2;
        f(:,2) = (x(:,1) + 3).^2 + (x(:,2) + 1).^2; 
    case 'KUR'
        %nonconvex
        x = -5 + 10.*rand(L,C);
        f(:,1)=-10*(exp(-0.2*sqrt(x(:,1).^2+x(:,2).^2))+exp(-0.2*sqrt(x(:,2).^2+x(:,3).^2)));
        f(:,2)= zeros(L,1);
        for j=1:3
            f(:,2) = f(:,2) + (abs(x(:,j))).^0.8 + 5*sin(x(:,j).^3);
        end
    case 'ZDT1'
        %convex
        g(:,1) = ones(L,1);
        for j=2:L
            g(:,1) = g(:,1) + (9/(L-1))*(x(:,j));
        end
        f(:,1)=x(:,1);
        f(:,2)=g(:,1).*(1 - sqrt(x(:,1)./g(:,1)));
    case 'ZDT2'
         %nonconvex
        n = C;
        g(:,1) = ones(L,1);
        for j=2:n
            g(:,1) = g(:,1) + (9/(n-1))*(x(:,j));
        end
        f(:,1)=x(:,1);
        f(:,2)=g(:,1).*(1 - (x(:,1)./g(:,1)).^2);
    case 'ZDT3'
        %convex and disconected
        n = L;
        x = rand(L,C);
        g(:,1) = ones(L,1);
        for j=2:n
            g(:,1) = g(:,1) + (9/(n-1))*(x(:,j));
        end
        f(:,1)=x(:,1);
        f(:,2)=g(:,1).*(1 - sqrt(x(:,1)./g(:,1)) -( x(:,1)./g(:,1)).*sin(10*pi*x(:,1)));
    case 'ZDT4'
        %nonconvex
        a = -5; b = 5; n = C;
        x = [rand(L,1),(a + (b-a).*rand(L,n-1))];
        g(:,1) = ones(L,1) + 10*(n-1);
        for j=2:n
            g(:,1) = g(:,1) + x(:,j).^2 - 10*cos(4*pi*x(:,j));
        end
        f(:,1)=x(:,1);
        f(:,2)=g(:,1).*(1 - sqrt(x(:,1)./g(:,1)));
    case 'ZDT6'
        %nonconvex, nonunifromly and spaced
        n = C;
        x = rand(L,n);
        g(:,1)=zeros(L,1);
        for j = 2:n
            g(:,1) = g(:,1) + x(:,j);
        end
        g(:,1) = (g(:,1)./(n-1)).^(0.25);
        g(:,1) = 1 + 9*g(:,1);
        f(:,1) = 1 - exp(-4*x(:,1)).*((sin(6*pi*x(:,1))).^6);
        f(:,2) = g(:,1).*(1 - (f(:,1)./g(:,1)).^2);
    otherwise
        error('Not implementation function!');
end