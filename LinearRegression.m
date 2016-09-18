clear;
close all;
clc

%% Load Data

fprintf('Loading data ...\n');
X = load('train_features_x.txt');
y = load('train_labels_y.txt');
Xpred = load('input_features_x.txt');
[m numfeat] = size(X);
[mpred numpredfeat] = size(Xpred);

%% Preprocess Data

[X mu sigma] = featureNormalize(X); % normalize features
[Xpred mupred sigmapred] = featureNormalize(Xpred); % normalize features
X = [ones(m,1) X]; % add intercept to training set
Xpred = [ones(mpred,1) Xpred]; % add intercept to prediction set
numfeat = numfeat + 1;

%% Training

fprintf('Running gradient descent ...\n');

alpha = 0.05;
num_iters = 400;

theta = zeros(numfeat, 1);
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

%% Predicting

theta

f = fopen('output_labels_y.txt', 'w');
results = Xpred * theta;
fprintf(f,'%f\n',results);
fclose(f);
