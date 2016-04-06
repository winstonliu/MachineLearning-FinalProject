function [min_param_vals, max_kfold_score] = optSVM( T )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    minfn = @(z) SVMGauss(T, exp(z(1)), exp(z(2)));
    
    fprintf('Running optimization...');
    tic
    options = optimset('TolX', 5e-4, 'TolFun', 5e-4);
    x0 = [randi(1000,1), randi(10,1)];
    [min_param_vals, max_kfold_score] = fminsearch(minfn, x0, options);
    toc
end

