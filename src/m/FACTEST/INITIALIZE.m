function [ObjFunc, min_range_of_decesion_variable, max_range_of_decesion_variable] ...
    = INITIALIZE(func)
if nargin < 1
    error('You have choose one function!');
end
ObjFunc.func = func;
switch func
    case 'SPHERES'      
        ObjFunc.M = 2;
        ObjFunc.dim = 2;
        min_range_of_decesion_variable = zeros(ObjFunc.dim) -1;
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 1;
    case 'SCH'
        %convex
        ObjFunc.M = 2;
        ObjFunc.dim = 1;
        min_range_of_decesion_variable = zeros(ObjFunc.dim) - 1000;
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 1000;
    case 'FON'
        ObjFunc.M = 2;
        ObjFunc.dim = 3;
        min_range_of_decesion_variable = zeros(ObjFunc.dim) - 4;
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 4;
    case 'POL'
        ObjFunc.M = 2;
        ObjFunc.dim = 2;
        min_range_of_decesion_variable = zeros(ObjFunc.dim) - pi;
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + pi;
    case 'KUR'
        ObjFunc.M = 2;
        ObjFunc.dim = 3;
        min_range_of_decesion_variable = zeros(ObjFunc.dim) - 5;
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 5;
    case 'ZDT1'
        ObjFunc.M = 2;
        ObjFunc.dim = 30;
        min_range_of_decesion_variable = zeros(ObjFunc.dim);
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 1;
    case 'ZDT2'
        ObjFunc.M = 2;
        ObjFunc.dim = 30;
        min_range_of_decesion_variable = zeros(ObjFunc.dim);
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 1;
    case 'ZDT3'
        ObjFunc.M = 2;
        ObjFunc.dim = 30;
        min_range_of_decesion_variable = zeros(ObjFunc.dim);
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 1;
    case 'ZDT4'
        ObjFunc.M = 2;
        ObjFunc.dim = 10;
        min_range_of_decesion_variable = zeros(ObjFunc.dim);
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 1;
    case 'ZDT6'
        ObjFunc.M = 2;
        ObjFunc.dim = 10;
        min_range_of_decesion_variable = zeros(ObjFunc.dim);
        max_range_of_decesion_variable = zeros(ObjFunc.dim) + 1;
end