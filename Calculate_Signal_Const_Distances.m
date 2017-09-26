function [ dist_matrix ] = Calculate_Signal_Const_Distances( signal_const )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% This script generates the intersignal distance matrix, which gives a good
% idea of the geometry of the constellation.
%
const_size = size(signal_const);
n = const_size(1, 1);
dim = const_size(1, 2);
%
% Initialize distance matrix of [n x n] size
dist_matrix = zeros(n, n);
%
% For each pair, calculate the distance and fill the matrix
for i = 1:n
    for j = i+1:n
        signal1 = signal_const(i, :);
        signal2 = signal_const(j, :);
        diff = signal1 - signal2;
        dist = 0;
        for k = 1:dim
            dist = dist + (diff(1, k))^2;
        end
        dist = dist^(1/2);
        dist_matrix(i, j) = dist;
        dist_matrix(j, i) = dist;
    end
end
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
