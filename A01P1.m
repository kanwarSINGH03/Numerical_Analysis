clear;
clc;

% Define the value of x
x = 1.00001;

% Create a vector of coefficients for P(x) = 1 + x + x^2 + ... + x^50
coeff_vector = ones(1, 51);

% Evaluate P(x) using the nest function
P_x = nest(50, coeff_vector, x);

% Evaluate Q(x) = (x^51 - 1) / (x - 1)
Q_x = (x^51 - 1) / (x - 1);

% Calculate the error
error = abs(P_x - Q_x);

fprintf('P(%.5f) = %f\n', x, P_x);
fprintf('Q(%.5f) = %f\n', x, Q_x);
fprintf('Error = %e\n', error);

%Function: Nested multiplication
%Evaluates polynomial from nested form using Horner's method
%Input: degree d of polynomial,
% array of d+1 coefficients (constant term first),
% x-coordinate x at which to evaluate, and
% array of d base points b, if needed
%Output: value y of polynomial at x
function y=nest(d,c,x)
y=c(d+1);
for i=d:-1:1
y = y.*x+c(i);
end
end
