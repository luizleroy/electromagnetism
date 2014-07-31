function [ObjFunc, min_range_of_decesion_variable, max_range_of_decesion_variable] ...
    = INITIALIZE(func)
if nargin < 1
    error('You have choose one function!');
end
ObjFunc.func = func;
switch func
    case 'RASTRIGIN'
        ObjFunc.M=1;
        ObjFunc.dim = 5;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1) - 5.12;
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 5.12;
    case 'SPHERE'      
        ObjFunc.M = 1;
        ObjFunc.dim = 10;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1) - 100;
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 100;
    case 'SPHERES'      
        ObjFunc.M = 2;
        ObjFunc.dim = 2;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1) -1;
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 1;
    case 'SCH'
        %convex
        ObjFunc.M = 2;
        ObjFunc.dim = 1;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1) - 1000;
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 1000;
    case 'FON'
        ObjFunc.M = 2;
        ObjFunc.dim = 3;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1) - 4;
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 4;
    case 'POL'
        ObjFunc.M = 2;
        ObjFunc.dim = 2;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1) - pi;
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + pi;
    case 'KUR'
        ObjFunc.M = 2;
        ObjFunc.dim = 3;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1) - 5;
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 5;
    case 'ZDT1'
        ObjFunc.M = 2;
        ObjFunc.dim = 30;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1);
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 1;
    case 'ZDT2'
        ObjFunc.M = 2;
        ObjFunc.dim = 30;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1);
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 1;
    case 'ZDT3'
        ObjFunc.M = 2;
        ObjFunc.dim = 30;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1);
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 1;
    case 'ZDT4'
        ObjFunc.M = 2;
        ObjFunc.dim = 10;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1);
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 1;
    case 'ZDT6'
        ObjFunc.M = 2;
        ObjFunc.dim = 10;
        min_range_of_decesion_variable = zeros(ObjFunc.dim,1);
        max_range_of_decesion_variable = zeros(ObjFunc.dim,1) + 1;
end