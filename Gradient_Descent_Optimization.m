function [ signal_const_subopt ] = Gradient_Descent_Optimization(n, dim, avg_const_power, noise_power, method)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This script generates a suboptimal candidate for a signal constellation
% of given characteristics, based on gradient descent approach.
%
% Initialize the signal constellation, either 'manual' or 'random' way and plot
% Plot assumes that there are only two dimensions!
signal_const = Initialize_Signal_Constellation(n, dim, method, avg_const_power);
initial_const_profile = Calculate_Signal_Const_Distances(signal_const);
% 
if dim ==2
    figure;
    plot(signal_const(:, 1), signal_const(:, 2), 'bo');
end
%
% Decide the weightage of error gradient in the gradient descent and number
% of steps to follow for convergence.
% It is totally empirical, convergence can also be defined based separately
alpha = 0.01;
iter = 1000;
%
% Run gradient descent
for iterations = 1:iter
    % Subtract gradient of the error
    disp(['Iteration = ', num2str(iterations)]);
    error = Evaluate_Error_Gradient(signal_const, noise_power);
    signal_const = signal_const + alpha*error;
    % Re-normalized
    curr_power = Calculate_Signal_Const_Power(signal_const);
    signal_const = (avg_const_power/curr_power)^(1/2)*signal_const;
    % Print the constellation
    print_const = signal_const
end
%
% This is the suboptimal constellation!!
signal_const_subopt = signal_const;
final_const_profile = Calculate_Signal_Const_Distances(signal_const_subopt);
if dim == 2
    figure;
    plot(signal_const_subopt(:, 1), signal_const_subopt(:, 2), 'bo');
end
%
% Print the distance profiles of the initilization and the suboptimal
% constellation
disp('The initialized constellation has the distance matrix--');
disp(initial_const_profile);
disp('The suboptimal constellation has the distance matrix--');
disp(final_const_profile);
%
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
