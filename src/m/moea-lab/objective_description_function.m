function [number_of_objectives, number_of_decision_variables, min_range_of_decesion_variable, max_range_of_decesion_variable] = objective_description_function(func)

%% function [number_of_objectives, number_of_decision_variables, min_range_of_decesion_variable, max_range_of_decesion_variable] = objective_description_function(func)
% func IS THE NAME OF FUNCTION TO TEST...
% This function is used to completely describe the objective functions and
% the range for the decision variable space etc. The user is prompted for
% inputing the number of objectives, numebr of decision variables, the
% maximum and minimum range for each decision variable and finally the
% function waits for the user to modify the evaluate_objective function to
% suit their need.

%  Copyright (c) 2009, Aravind Seshadri
%  All rights reserved.
%
%  Redistribution and use in source and binary forms, with or without
%  modification, are permitted provided that the following conditions are
%  met:
%
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
%
%  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
%  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
%  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
%  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
%  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
%  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
%  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
%  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
%  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
%  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%  POSSIBILITY OF SUCH DAMAGE.

if nargin < 1
    error('You have choose one function!');
end

number_of_objectives = 2;
if number_of_objectives < 2
    error('This is a multi-objective optimization function hence the minimum number of objectives is two');
end
switch func
    case 'SPHERES';
        number_of_decision_variables = 100;
        a=-2; b=2;
        for i = 1 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = a;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = b;
        end
    case 'SCH'
        number_of_decision_variables = 1;
        a = -1000; b = 1000;
        % Obtain the minimum possible value for each decision variable
        min_range_of_decesion_variable(1) = a;
        % Obtain the maximum possible value for each decision variable
        max_range_of_decesion_variable(1) = b;
    case 'FON'
        number_of_decision_variables = 3;
        a = -4; b = 4;
        for i = 1 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = a;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = b;
        end
    case 'POL'
        number_of_decision_variables = 2;
        a = -pi; b = pi; %a = -5; b = 5; n = 3;
        for i = 1 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = a;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = b;
        end
    case 'KUR'
        number_of_decision_variables = 3;
        a = -5; b = 5;
        for i = 1 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = a;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = b;
        end
    case 'ZDT1'
        number_of_decision_variables = 30;
        for i = 1 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = 0;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = 1;
        end
    case 'ZDT2'
        number_of_decision_variables = 30;
        for i = 1 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = 0;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = 1;
        end
    case 'ZDT3'
        number_of_decision_variables = 30;
        for i = 1 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = 0;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = 1;
        end
    case 'ZDT4'
        number_of_decision_variables = 10;
        min_range_of_decesion_variable(1) = 0;
        max_range_of_decesion_variable(1) = 1;
        for i = 2 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = -0.5;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = 0.5;
        end
    case 'ZDT6'
        number_of_decision_variables = 10;
        for i = 1 : number_of_decision_variables
            % Obtain the minimum possible value for each decision variable
            min_range_of_decesion_variable(i) = 0;
            % Obtain the maximum possible value for each decision variable
            max_range_of_decesion_variable(i) = 1;
        end
    otherwise
        error('Not implementation function!');
end
%-----
hardCode = 0;
if (hardCode)
    g = sprintf('Input the number of objective: ');
    % Obtain the number of objective function
    number_of_objectives = input(g);
    if number_of_objectives < 2
        error('This is a multi-objective optimization function hence the minimum number of objectives is two');
    end
    g = sprintf('\nInput the number of decision variables: ');
    % Obtain the number of decision variables
    number_of_decision_variables = input(g);
    clc
    for i = 1 : number_of_decision_variables
        clc
        g = sprintf('\nInput the minimum value for decision variable %d : ', i);
        % Obtain the minimum possible value for each decision variable
        min_range_of_decesion_variable(i) = input(g);
        g = sprintf('\nInput the maximum value for decision variable %d : ', i);
        % Obtain the maximum possible value for each decision variable
        max_range_of_decesion_variable(i) = input(g);
        clc
    end
    g = sprintf('\n Now edit the function named "evaluate_objective" appropriately to match your needs.\n Make sure that the number of objective functions and decision variables match your numerical input. \n Make each objective function as a corresponding array element. \n After editing do not forget to save. \n Press "c" and enter to continue... ');
    % Prompt the user to edit the evaluate_objective function and wait until
    % 'c' is pressed.
    x = input(g, 's');
    if isempty(x)
        x = 'x';
    end
    while x ~= 'c'
        clc
        x = input(g, 's');
        if isempty(x)
            x = 'x';
        end
    end
end
