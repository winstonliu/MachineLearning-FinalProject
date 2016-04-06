function gen_prediction( myModel, test_images )
%gen_prediction Summary of this function goes here
%   Detailed explanation goes here
    n = 1253;

    p_out = predict(myModel, test_images.');
    myzeros = zeros(1, 835);
    t = [p_out.' myzeros].';
    printout = [[1:n].' t];
    csvwrite('predictions.csv', printout);

end

