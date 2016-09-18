clear;
close all;
clc

%% Set up Network Size

input_layer_size  = 11;  
hidden_layer_size = 25;   
num_labels = 4;          

%% Load Data

fprintf('Loading data ...\n');
X = load('nn_train_features_x.txt');
y = load('nn_train_labels_y.txt');
Xpred = load('nn_input_features_x.txt');
[m numfeat] = size(X);
[mpred numpredfeat] = size(Xpred);

%% Initialize Parameters

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, hidden_layer_size);
initial_Theta3 = randInitializeWeights(hidden_layer_size, hidden_layer_size);
initial_Theta4 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:) ; initial_Theta3(:) ; initial_Theta4(:)];

%% Training Neural Network

fprintf('\nTraining Neural Network... \n')

options = optimset('MaxIter', 50);
lambda = 1;
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):(hidden_layer_size * (input_layer_size + 1)) + (hidden_layer_size * (hidden_layer_size + 1))), ...
                 hidden_layer_size, (hidden_layer_size + 1));
             
Theta3 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))) + (hidden_layer_size * (hidden_layer_size + 1)):(hidden_layer_size * (input_layer_size + 1)) + 2 * (hidden_layer_size * (hidden_layer_size + 1))), ...
                 hidden_layer_size, (hidden_layer_size + 1));

Theta4 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))) + 2 * (hidden_layer_size * (hidden_layer_size + 1)):end), ...
                 num_labels, (hidden_layer_size + 1));

%% Predictions

f = fopen('nn_output_labels_y.txt', 'w');
pred = predict(Theta1, Theta2, Theta3, Theta4, Xpred);
fprintf(f,'%d\n',pred);
fclose(f);