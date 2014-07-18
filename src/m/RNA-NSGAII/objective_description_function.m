function [min_range_of_decesion_variable, max_range_of_decesion_variable] = objective_description_function(rna)

for i = 1 : rna.dim
    % Obtain the minimum possible value for each decision variable
    min_range_of_decesion_variable(i) = -1.0;
    % Obtain the maximum possible value for each decision variable
    max_range_of_decesion_variable(i) = 1.0;
end