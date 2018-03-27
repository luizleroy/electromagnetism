function [ x, y, rna ] = FACTORY_buildFunction( rna, func )
%FACTORY_buildFunction Summary of this function
%   Respons�vel por escolhar a fun��o de aproxima��o
% � necess�rio inserir a entrada 'x' e o nome da fun��o 'func'.
% Se n�o for inserida a fun��o, a default � RASTRIGIN.
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

rna.nAmostra = 500;

switch func
    case 'IDENTITY'
        x = rand(rna.n_neur(1),rna.nAmostra);
        y = FUNC_identityX1(x);
    case 'BODY'
        rna.nAmostra = 252
        if (rna.n_neur(1) ~= 13) || (rna.nAmostra ~= 252)
            error('Need 13x252 input!');
        end
        load('bodyInputs.mat');
        load('bodyTargets.mat');
        x = bodyfatInputs;
        y = bodyfatTargets;
    case 'ABALONE'
        rna.nAmostra = 4177
        if (rna.n_neur(1) ~= 8) || (rna.nAmostra ~= 4177)
            error('Need 8x4177 input!');
        end
        load('abaloneInputs.mat');
        load('abaloneTargets.mat');
        x = abaloneInputs;
        y = abaloneTargets;
    case 'HOUSE'
        rna.nAmostra = 506
        if (rna.n_neur(1) ~= 13) || (rna.nAmostra ~= 506)
            error('Need 13x506 input!');
        end
        load('houseInputs.mat');
        load('houseTargets.mat');
        x = houseInputs;
        y = houseTargets;
    case 'SIMPLE'
        rna.nAmostra = 94;
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