clear;
close all;
clc

%% Load Data
fprintf('Loading data ...\n');
X = load('train_features_x.txt');
y = load('train_labels_y.txt');

%% Preprocess Data
X = [ones(y,1) X]; % add intercept
[m numfeat] = size(X);

%% Training

fprintf('Running gradient descent ...\n');

alpha = 0.01;
num_iters = 400;

theta = zeros(numfeat, 1);
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

%% Predicting
