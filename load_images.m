load labeled_images.mat;
load public_test_images.mat;

test_images = public_test_images;

% Reshape into vectors
ntr = size(tr_images, 3);
ntest = size(test_images, 3);
h = size(tr_images,1);
w = size(tr_images,2);
tr_images_res = double(reshape(tr_images, [h*w, ntr]));
test_images = double(reshape(test_images, [h*w, ntest]));

X = tr_images_res.';
Y = tr_labels;
T = [X.'; Y.'];