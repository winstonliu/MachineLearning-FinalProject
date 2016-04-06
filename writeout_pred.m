function writeout_pred( prediction )
%writeout_pred Summary of this function goes here
%   Detailed explanation goes here
    n = 1253;

    myzeros = zeros(1, 835);
    t = [prediction.' myzeros].';
    printout = [[1:n].' t];
    csvwrite('predictions.csv', printout);
end

