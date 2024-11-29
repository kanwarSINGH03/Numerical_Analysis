clear;
clc;

f = @(x) x.^(-1);
f_double_prime_true = @(x) 2.*x.^(-3);

true_value = f_double_prime_true(1);

% h values
h_values = [0.1, 0.01, 0.001];

errors = zeros(size(h_values));

for i = 1:length(h_values)
    h = h_values(i);
    approximation = (f(1+h) - 2*f(1) + f(1-h)) / h^2;
    errors(i) = abs(approximation - true_value);
end

for i = 1:length(h_values)
    fprintf('h = %f: Approximation = %f, True Value = %f, Error = %f\n', ...
            h_values(i), (f(1+h_values(i)) - 2*f(1) + f(1-h_values(i))) / h_values(i)^2, ...
            true_value, errors(i));
end
