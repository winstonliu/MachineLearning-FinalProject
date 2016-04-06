load labeled_images.mat;
load public_test_images.mat;

test_images = public_test_images;

% Reshape into vectors
ntr = size(tr_images, 3);
ntest = size(test_images, 3);
h = size(tr_images,1);
w = size(tr_images,2);
tr_images = double(reshape(tr_images, [h*w, ntr]));
test_images = double(reshape(test_images, [h*w, ntest]));

X = tr_images';
Y = tr_labels;

train_tem = templateSVM('Standardize', 1, ...
                        'KernelFunction', 'polynomial', ...
                        'PolynomialOrder', 4);

% Run multiclass svm fitting
CVMdl = fitcecoc(X,Y, 'Learners', train_tem, 'CrossVal', 'on', ...
                'Coding', 'binarycomplete');

%% Caculate loss
loss_val = kfoldLoss(CVMdl);
fprintf('KFold Loss: %0.4f\n', loss_val);

% Make predictions
out_predict = kfoldPredict(CVMdl);

% Calculate precision
num_correct = sum(tr_labels == out_predict);
num_total = size(tr_labels,1);
fprintf('Precision: %0.4f\n', (num_correct/num_total));
