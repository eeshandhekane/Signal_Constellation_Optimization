function [ signal_const_power ] = Calculate_Signal_Const_Power( signal_const )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This script calculates the average power of a signal constellation.
% All the constellation points are assumed to be equally likely.
%
const_size = size(signal_const);
n = const_size(1);
dim = const_size(2);
%
% Evaluate power
signal_const_power = 0;
for i = 1:n
    signal_power = 0;
    for j = 1:dim
        signal_power = (signal_const(i, j))^2 + signal_power;
    end
    signal_const_power = signal_const_power + signal_power;
end
%
% Average out for expected power
signal_const_power = signal_const_power/n;
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

