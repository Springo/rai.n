function p = predict(Theta1, Theta2, Theta3, Theta4, X)
m = size(X, 1);
num_labels = size(Theta4, 1);

p = zeros(size(X, 1), 1);

X = [ones(m, 1) X];
layer2 = sigmoid(X * Theta1.');
layer2 = [ones(size(layer2, 1), 1) layer2];
layer3 = sigmoid(layer2 * Theta2.');
layer3 = [ones(size(layer3, 1), 1) layer3];
layer4 = sigmoid(layer3 * Theta3.');
layer4 = [ones(size(layer4, 1), 1) layer4];
layer5 = sigmoid(layer4 * Theta4.');
[val, p] = max(layer5, [], 2);

end