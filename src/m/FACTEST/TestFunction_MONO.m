function [f]=TestFunction_MONO(x,func)
offset = 0.0;
desloc = 0.0;
[L,C] = size(x);
switch func
    case 'SCHWEFEL_1'
        x = x - desloc;
        f = offset + sum((x + 0.5).^2,2);
    case 'SCHWEFEL_2'
        x = x - desloc;
        f = zeros(L,1);
        for l = 1:L
            target = 0;
            for c = 1:C
                if (x(l,c) < -500 || x(l,c) > 500)
                    target = inf;
                    break;
                end
                target = target - sin(sqrt(abs(x(l,c))))*x(l,c);
            end
            f(l) = target;
        end
    case 'Schwefel_3' %função número 14 da lista de funções teste
        f = offset + sum(cumsum(x.^2));
    case 'SCHAFFER'
        x = x - desloc;
        somaQuad = sum(x.^2,2);
        f = offset + ( (somaQuad).^0.25 ) .* ( (sin(50*somaQuad.^0.1)).^2 + 1.0 );
    case 'ROSENBROCK'
        x = x - desloc;
        f = 0;
        for i = 1:(C-1)
            f = f + 100*(x(:,i).^2 - x(:,i+1)).^2 + (1 - x(:,i)).^2;
        end
        f = offset + f;
    case 'DEJONG_1'
        x = x - desloc;
        f = offset + sum(x.^2,2);
    case 'RASTRIGIN'
         x = x - desloc;
        f = offset + 10*C + sum(x.^2 - 10*cos(2*pi*x),2);
    case 'SPHERE'
        x = x - desloc;
        xx = x.^2;
        f = offset + sum(xx,2);
    case 'Ackley' %função número 10 da lista de funções teste
        [~,c] = size(x);
        f = offset + -20 * exp( -0.2 * ( (1/c)*(sum(x.^2)) ).^0.5 ) ...
            - exp( (1/c)*sum(cos(2*pi*x)) ) + 20 + exp(1);
    case 'Griewangk' %função número 13 da lista de funções teste
        [~,c] = size(x);
        aux = 1:c;
        f = offset + 1 + (1/4000)*sum(x.^2) - prod(cos(x./(aux).^0.5));
    case 'Bohachevsky' %função número 16 da lista de funções teste
        [~,c] = size(x);
        if(c < 2)
            error('A função Bohachevsky precisa de mais de uma variável de entrada.');
        end
        f = 0;
        for i = 1:(c-1)
           f = f + x(i)^2 + 2*x(i+1)^2 - 0.3*cos(3*pi*x(i)) ...
               - 0.4*cos(4*pi*x(i+1)) + 0.7;
        end
        f = offset + f;
    case 'Shekel_Foxholes'
        [~,c] = size(x);
        if(c > 2)
            error('A função Shekel_Foxholes não pode ter mais de duas variáveis de entrada.');
        end
        a = [-32, -16,   0,  16,  32, -32, -16,   0,  16,  32, -32, -16, 0, 16, 32, -32, -16,  0, 16, 32, -32, -16,  0, 16, 32;...
             -32, -32, -32, -32, -32, -16, -16, -16, -16, -16,   0,   0, 0,  0,  0,  16,  16, 16, 16, 16,  32,  32, 32, 32, 32];
        f = 0;
        for j = 1:25
            somatorio1=0;
            for i = 1:c
                somatorio1 = somatorio1 + (x(i) - a(i,j))^6;
            end
            f = f + 1/(j + somatorio1);
        end
        f = offset + (1/((1/500) + f)) - 0.9980038378;
     otherwise
        error('Not implementation function!');
end
