function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

% Reshape nn_params back into Theta matrix
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):(hidden_layer_size * (input_layer_size + 1)) + (hidden_layer_size * (hidden_layer_size + 1))), ...
                 hidden_layer_size, (hidden_layer_size + 1));
             
Theta3 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))) + (hidden_layer_size * (hidden_layer_size + 1)):(hidden_layer_size * (input_layer_size + 1)) + 2 * (hidden_layer_size * (hidden_layer_size + 1))), ...
                 hidden_layer_size, (hidden_layer_size + 1));

Theta4 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))) + 2 * (hidden_layer_size * (hidden_layer_size + 1)):end), ...
                 num_labels, (hidden_layer_size + 1));

% initialize variables
m = size(X, 1);
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
Theta3_grad = zeros(size(Theta3));
Theta4_grad = zeros(size(Theta4));

%prediction
newy = zeros(m, num_labels);
h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
h3 = sigmoid([ones(m, 1) h2] * Theta3');
h4 = sigmoid([ones(m, 1) h3] * Theta4');
for i = 1:m
    newy(i, y(i)) = 1;
end

% calculate cost
J = (-1/m) * sum(sum(newy .* log(h4) + (ones(size(newy)) - newy) .* log(ones(size(h4)) - h4))) + (lambda / (2 * m)) * (sum(sum(Theta1(:,2:size(Theta1, 2)).^2)) + sum(sum(Theta2(:,2:size(Theta2, 2)).^2)) + sum(sum(Theta3(:,2:size(Theta3, 2)).^2)) + sum(sum(Theta4(:,2:size(Theta4, 2)).^2)));

% forward and backpropagation
bigdelta1 = zeros(size(Theta1));
bigdelta2 = zeros(size(Theta2));
bigdelta3 = zeros(size(Theta3));
bigdelta4 = zeros(size(Theta4));
for t = 1:m
    a1 = X(t,:).';
    a1 = [1; a1];
    z2 = Theta1 * a1;
    a2 = sigmoid(z2);
    a2 = [1; a2];
    z3 = Theta2 * a2;
    a3 = sigmoid(z3);
    a3 = [1; a3];
    z4 = Theta3 * a3;
    a4 = sigmoid(z4);
    a4 = [1; a4];
    z5 = Theta4 * a4;
    a5 = sigmoid(z5);
    delta5 = a5 - newy(t,:).';
    delta4 = (Theta4.' * delta5) .* sigmoidGradient([1; z4]);
    delta3 = (Theta3.' * delta4(2:end)) .* sigmoidGradient([1; z3]);
    delta2 = (Theta2.' * delta3(2:end)) .* sigmoidGradient([1; z2]);
    bigdelta4 = bigdelta4 + delta5 * a4.';
    bigdelta3 = bigdelta3 + delta4(2:end) * a3.';
    bigdelta2 = bigdelta2 + delta3(2:end) * a2.';
    bigdelta1 = bigdelta1 + delta2(2:end) * a1.';
end
Theta4_grad(:,1) = (1/m) * bigdelta4(:,1);
Theta4_grad(:,2:end) = (1/m) * bigdelta4(:,2:end) + (lambda / m) * Theta4(:,2:end);
Theta3_grad(:,1) = (1/m) * bigdelta3(:,1);
Theta3_grad(:,2:end) = (1/m) * bigdelta3(:,2:end) + (lambda / m) * Theta3(:,2:end);
Theta2_grad(:,1) = (1/m) * bigdelta2(:,1);
Theta2_grad(:,2:end) = (1/m) * bigdelta2(:,2:end) + (lambda / m) * Theta2(:,2:end);
Theta1_grad(:,1) = (1/m) * bigdelta1(:,1);
Theta1_grad(:,2:end) = (1/m) * bigdelta1(:,2:end) + (lambda / m) * Theta1(:,2:end);

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:) ; Theta3_grad(:) ; Theta4_grad(:)];

end
