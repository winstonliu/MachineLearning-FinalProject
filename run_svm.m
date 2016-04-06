load_images;

tic
train_tem = templateSVM('Standardize', 1, ...
                        'KernelFunction', 'polynomial', ...
                        'PolynomialOrder', 4);

% Run multiclass svm fitting
fprintf('Starting run...');
Mdl = fitcecoc(X,Y, 'Learners', train_tem, 'Coding', 'onevsone');
loss_val = resubLoss(Mdl);
fprintf('Loss: %0.4f\n', loss_val);
toc

%% Crossval
% tic
% fprintf('Starting cross validation...');
% CVMdl = crossval(Mdl, 'KFold', 5);
% toc
%% Caculate loss
% loss_val = kfoldLoss(CVMdl);
% fprintf('KFold Loss: %0.4f\n', loss_val);

% Make predictions
% out_predict = kfoldPredict(CVMdl);

% Calculate precision
% num_correct = sum(tr_labels == out_predict);
% num_total = size(tr_labels,1);
% fprintf('Precision: %0.4f\n', (num_correct/num_total));
