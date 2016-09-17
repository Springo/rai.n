function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
% Gradient Descent Algorithm
%   X: features
%   y: labels
%   theta: parameters updated each iteration
%   alpha: learning rate
%   num_iters: number of iterations

m = length(y); % number of training examples
J_history = zeros(num_iters, 1);    % cost per iteration

for iter = 1:num_iters
    theta = theta - (alpha / m) .* X.' * ((X * theta) - y);
    J_history(iter) = costFunction(X, y, theta);

end

end
