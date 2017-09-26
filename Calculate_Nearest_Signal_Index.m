function [ index_list ] = Calculate_Nearest_Signal_Index( signal_const, point )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This script inputs a point and a signal_const and outputs the index of
% the nearest signal to the point.
% The point is assumed to have the same dimension as that of each of the signal.
%
const_size = size(signal_const);
n = const_size(1);
dim = const_size(2);
%
% Evaluate the nearest signal index
index_list = [];
for i = 1:n
    dist_square = 0;
    for j = 1:dim
        dist_square = dist_square + (signal_const(i, j)-point(1, j))^2;
    end
    dist_square_list(i) = dist_square;
end
%
% Find all indices with minimum distance
dist_square_min = min(dist_square_list);
for i = 1:n
    if dist_square_list(1, i) == dist_square_min
        index_list = [index_list, i];
    end
end
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
