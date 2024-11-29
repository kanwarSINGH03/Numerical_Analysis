clear;
clc;

n = 100; % Example size, change to your specific problem size
tol = 1e-6; % Tolerance for convergence
max_iter = 10000; % Maximum number of iterations
[a, b] = sparsesetup(n); % Use the sparsesetup function to create the matrix a and vector b

% Solve using Gauss-Seidel method
x = gauss_seidel(a, b, tol, max_iter);

% After solving, you can check the backward error if needed
backward_error = norm(a*x - b, inf);
fprintf('Backward error: %e\n', backward_error);


% Program 2.1 Sparse matrix setup
% Input: n = size of system
% Outputs: sparse matrix a, r.h.s. b
function [a,b] = sparsesetup(n)
    e = ones(n,1); n2=n/2;
    a = spdiags([-e 3*e -e],-1:1,n,n);
    c=spdiags([e/2],0,n,n);c=fliplr(c);a=a+c;
    a(n2+1,n2) = -1; a(n2,n2+1) = -1;    % Fix up 2 entries
    b=zeros(n,1);                        % Entries of r.h.s. b
    b(1)=2.5;b(n)=2.5;b(2:n-1)=1.5;b(n2:n2+1)=1;
end

function x = gauss_seidel(a, b, tol, max_iter)
    n = length(b); % Number of equations
    x = zeros(n, 1); % Initial guess for the solution
    for iter = 1:max_iter
        x_old = x; % Store old solution
        for i = 1:n
            sum = b(i);
            for j = 1:n
                if j ~= i
                    sum = sum - a(i, j) * x(j);
                end
            end
            x(i) = sum / a(i, i);
        end
        % Check for convergence
        if norm(x - x_old, inf) < tol
            fprintf('Converged in %d iterations\n', iter);
            return;
        end
    end
    fprintf('Did not converge within the maximum number of iterations\n');
end

