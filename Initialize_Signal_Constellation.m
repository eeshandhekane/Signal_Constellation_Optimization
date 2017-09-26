function [ signal_const ] = Initialize_Signal_Constellation(n, dim, a, P)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Initialize a randomly selected signal constellation with n points.
% The average power constraint must be satisfied. i.e. E[X^2] = P.
% a = 'manual' implies that the constellation will be manually initiated.
% a = 'random' implies that the constellation will be randomly initiated.
% dim denotes the number of dimensions and is generally taken to be 2.
%
% For a = 'random', intialize and normalize the constellation.
% For a = 'manual', accept a signal constellation and normalize it to P power.
if strcmp(a,'random')
    signal_const_unnorm = rand(n, dim);
elseif strcmp(a, 'manual')
    signal_const_unnorm = input('Enter the signal constellation of n points and dim dimenstions as [n x d] matrix: ');
else 
    disp(['Invalid option entered. Use either ''random'' or ''manual''.']);
    return;
end
const_power = Calculate_Signal_Const_Power(signal_const_unnorm);
disp(['The Power of the Randomly Generated Signal Constellation is: ', num2str(const_power)]);
norm_factor = (P/const_power)^(1/2);
signal_const = norm_factor* signal_const_unnorm; 
signal_const_power = Calculate_Signal_Const_Power(signal_const);
disp(['The Power of the Normalized Signal Constellation is: ', num2str(signal_const_power)]);  
disp(['Normalized Signal Constellation:'])
disp(signal_const);
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%