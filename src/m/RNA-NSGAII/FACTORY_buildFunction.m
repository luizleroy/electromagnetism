function [ x, y, rna ] = FACTORY_buildFunction( rna, func )
%FACTORY_buildFunction Summary of this function
%   Responsável por escolhar a função de aproximação
% É necessário inserir a entrada 'x' e o nome da função 'func'.
% Se não for inserida a função, a default é RASTRIGIN.
% help nndatasets
%   Neural Network Datasets
%   -----------------------
%  
%   Function Fitting, Function approximation and Curve fitting.
%  
%   Function fitting is the process of training a neural network on a
%   set of inputs in order to produce an associated set of target
%   outputs. Once the neural network has fit the data, it forms a
%   generalization of the input-output relationship and can be used 
%   to generate outputs for inputs it was not trained on.
% 
%    simplefit_dataset     - Simple fitting dataset.
%    abalone_dataset       - Abalone shell rings dataset.
%    bodyfat_dataset       - Body fat percentage dataset.
%    *building_dataset      - Building energy dataset.
%    *chemical_dataset      - Chemical sensor dataset.
%    *cho_dataset           - Cholesterol dataset.
%    *engine_dataset        - Engine behavior dataset.
%    house_dataset         - House value dataset

% http://www.mathworks.com/help/nnet/gs/neural-network-toolbox-sample-data-sets.html
rna.nAmostra = -1;
rna.nAmostra = 500

switch func
    case 'GUSTAVO'
        if rna.n_neur(1) ~= 6
            x = rand(rna.n_neur(1),rna.nAmostra);
        else
            n_amostras=rna.nAmostra;
            a=1; b=1001;
            x(1,:)=a + (b-a)*rand(1,n_amostras);
            a=-10; b=90;
            x(2,:)=a + (b-a)*rand(1,n_amostras);
            a=99; b=999;
            x(3,:)=a + (b-a)*rand(1,n_amostras);
            a=0; b=100;
            x(4,:)=a + (b-a)*rand(1,n_amostras);
            a=0; b=100;
            x(5,:)=a + (b-a)*rand(1,n_amostras);
            a=0; b=100;
            x(6,:)=a + (b-a)*rand(1,n_amostras);
        end
        y = TMP_testFunctionGustavo(x); %versão original do Gustavo
    case 'EASY'
        if (rna.n_neur(1) < 1)
            error('Need input bigger or equal 1!');
        end
        x = rand(rna.n_neur(1),rna.nAmostra);
        y = TEST_easy(x);
    case 'IDENTITY'
        x = rand(rna.n_neur(1),rna.nAmostra);
        y = FUNC_identityX1(x);
    case 'BODY'
        if (rna.n_neur(1) ~= 13) || (rna.nAmostra ~= 252)
            error('Need 13x252 input!');
        end
        load('bodyInputs.mat');
        load('bodyTargets.mat');
        x = bodyfatInputs;
        y = bodyfatTargets;
     case 'ABALONE'
        if (rna.n_neur(1) ~= 8) || (rna.nAmostra ~= 4177)
            error('Need 8x4177 input!');
        end
        load('abaloneInputs.mat');
        load('abaloneTargets.mat');
        x = abaloneInputs;
        y = abaloneTargets;
     case 'HOUSE'
        if (rna.n_neur(1) ~= 13) || (rna.nAmostra ~= 506)
            error('Need 13x506 input!');
        end
        load('houseInputs.mat');
        load('houseTargets.mat');
        x = houseInputs;
        y = houseTargets;
     case 'SIMPLE'
        if (rna.n_neur(1) ~= 1) || (rna.nAmostra ~= 94)
            error('Need 1x94 input!');
        end
        load('simplefitInputs.mat');
        load('simplefitTargets.mat');
        x = simplefitInputs;
        y = simplefitTargets;
    otherwise
        error('Not implementation function!');
end
if rna.nAmostra < 1
    error('Sem amostras!')
end
end