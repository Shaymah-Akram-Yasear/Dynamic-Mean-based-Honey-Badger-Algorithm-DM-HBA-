% main.m - Example of using DM-HBA
clear; clc; close all;

% Define objective function (e.g., Sphere)
objf = @(x, ~) sum(x.^2);  % Simple sphere function

% Set options
options.objf = objf;
options.nVar = 30;
options.lb = -100;
options.ub = 100;
options.popSize = 30;
options.MaxGen = 500;
options.lambda = 0.2;
options.CEC_fun_no = 0;  % Not used in this example

% Run DM-HBA
[best_score, best_sol, conv] = DM_HBA(options);

% Display results
fprintf('Best fitness: %.6e\n', best_score);
plot(conv);
xlabel('Iteration');
ylabel('Best Fitness');
title('Convergence Curve - DM-HBA');
grid on;