function [funcao domInf domSup offset] = TabelaFuncoes(opcao,nVar)
switch opcao
    case 1
        funcao = 'Sphere';
        for i=1:nVar
            domInf(i) = -100;
            domSup(i) =  100;
        end
        offset =  0;
    case 2
        funcao = 'Rosenbrock';
        for i=1:nVar
            domInf(i) = -2.48;
            domSup(i) =  2.48;
        end
        offset =  0;
    case 3
        funcao = 'DeJong_1';
        for i=1:nVar
            domInf(i) = -5.12;
            domSup(i) =  5.12;
        end
        offset =  0;
    case 4
        funcao = 'DeJong_2';
        for i=1:nVar
            domInf(i) = -1.28;
            domSup(i) =  1.28;
        end
        offset =  0;
    case 5
        funcao = 'Shekel_Foxholes';
        for i=1:nVar
            domInf(i) = -65;
            domSup(i) =  65;
        end
        offset =  0;
    case 6
        funcao = 'Schaffer';
        for i=1:nVar
            domInf(i) = -100;
            domSup(i) =  100;
        end
        offset =  0;
    case 7
        funcao = 'SemNome';
        for i=1:nVar
            domInf(i) = -10;
            domSup(i) =  10;
        end
        offset =  0;
    case 8
        funcao = 'Sphere';
        for i=1:nVar
            domInf(i) = -30;
            domSup(i) =  30;
        end
        offset =  0;
    case 9
        funcao = 'Schwefel_1';
        for i=1:nVar
            domInf(i) = -30;
            domSup(i) =  30;
        end
        offset =  0;
    case 10
        funcao = 'Ackley';
        for i=1:nVar
            domInf(i) = -30;
            domSup(i) =  30;
        end
        offset =  0;
    case 11
        funcao = 'Rastrigin';
        for i=1:nVar
            domInf(i) = -5.12;
            domSup(i) =  5.12;
        end
        offset =  0;
    case 12
        funcao = 'Schwefel_2';
        for i=1:nVar
            domInf(i) = -500;
            domSup(i) =  500;
        end
        offset =  420;
    case 13
        funcao = 'Griewangk';
        for i=1:nVar
            domInf(i) = -600;
            domSup(i) =  600;
        end
        offset =  0;
    case 14
        funcao = 'Schwefel_3';
        for i=1:nVar
            domInf(i) = -30;
            domSup(i) =  30;
        end
        offset =  0;
    case 15
        funcao = 'Rosenbrock';
        for i=1:nVar
            domInf(i) = -5.12;
            domSup(i) =  5.12;
        end
        offset =  0;
    case 16
        funcao = 'Bohachevsky';
        for i=1:nVar
            domInf(i) = -5.12;
            domSup(i) =  5.12;
        end
        offset =  0;
    otherwise
        funcao = 'default';
        for i=1:nVar
            domInf(i) = 0;
            domSup(i) = 15;
        end
        offset = 15;
end