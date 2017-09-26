function [ error_gradient ] = Evaluate_Error_Gradient( signal_const, noise_power )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This script inputs a signal constellation and evaluates the GRADIENT OF 
% THE ERROR EXPRESSION WITH RESPECT TO THE SIGNAL POINTS. The mathematical 
% form of the error gradient can be found in the resport. We select a 
% signal point at random and add noise, which is a gaussian variable with
% 0 mean and noise_power as the variance ((noise_power)^(1/2) as the 
% standard deviation). We then see if the answer still lies in the decision
% region of the same point or not. In case yes, we add its contribution to
% the error vector. The error is then renormalized by total number of times
% the particular signal point was selected. We select large number of
% iterations for the same so that the estimates match to the theoretical
% expression closely.
%
% Use a large number of iterations
iter = 10^4;
%
const_size = size(signal_const);
n = const_size(1);
dim = const_size(2);
noise_dev = (noise_power)^(1/2);
error_gradient = zeros(n, dim);
%
for iterations = 1:iter
    % Select a random input signal uniformly
    index = randi([1, n]);
    input_signal = signal_const(index, :);
    %
    % Consider Gaussian noise to be added
    for i = 1:dim
        noise(1, i) = normrnd(0, noise_dev);
    end
    %
    % Consider output
    output_signal = input_signal + noise;
    %
    % Check if the output can be uniquely decided to come from an input using
    % ML substitution. For this, check the nearest signal index.
    ML_estimate_list = Calculate_Nearest_Signal_Index(signal_const, output_signal);
    size_list = size(ML_estimate_list);
    if size_list(1, 1) == 1 && size_list(1, 2) == 1 && ML_estimate_list(1) == index
        error_gradient(index, :) = error_gradient(index, :) + noise;
    end
end
%
% Return the gradient of error matrix, with normalization for keeping
% entries from blowing up!
error_gradient = error_gradient/iter;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%