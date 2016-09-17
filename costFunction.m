function J = costFunction(X, y, theta)
m = length(y); % number of training examples

% return
J = 0;  % cost

% Cost Calculation
J = (1 / (2 * m)) * sum(((X * theta) - y).^2);

end
