clear;
clc;


f = @(x) exp(x) + sin(x) - 4;

% Initial guesses (x0 and x1)
x0 = 1; 
x1 = 2; 

% Tolerance for convergence
tol = 1e-8;

% Maximum number of iterations
max_iter = 100;

% Call the Secant method function
xc = secant(f, x0, x1, tol, max_iter);

disp(['Approximate solution: ' num2str(xc)]);

function xc = secant(f, x0, x1, tol, max_iter)
    for i = 1:max_iter
        f_x0 = f(x0);
        f_x1 = f(x1);
        x2 = x1 - f_x1 * (x1 - x0) / (f_x1 - f_x0);

        if abs(x2 - x1) < tol
            xc = x2;
            return;
        end

        x0 = x1;
        x1 = x2;
    end
    xc = x1; % Return the last value if max_iter is reached
end