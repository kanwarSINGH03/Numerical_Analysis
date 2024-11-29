clear;
clc;
format long;
error_magnification_and_condition([100, 200, 300, 400, 500]);

function error_magnification_and_condition(ns)
    for n = ns
        % Create matrix A with given entries Aij = |i - j| + 1
        A = zeros(n,n);
        for i = 1:n
            for j = 1:n
                A(i,j) = abs(i - j) + 1;
            end
        end
       
        x = ones(n,1);
        % Compute b = Ax
        b = A * x;
        xc = A\b; % Using Matlab's backslash command
        
        % Calculate the infinity norm of the forward error
        forward_error = norm(x - xc, Inf);
        
        % Calculate the error magnification factor
        error_magnification_factor = forward_error / norm(x, Inf);
        
        % Calculate the condition number of A
        cond_A = cond(A, Inf);
        
        disp(['For n = ', num2str(n)]);
        disp(['Infinity norm of the forward error: ', num2str(forward_error)]);
        disp(['Error magnification factor: ', num2str(error_magnification_factor)]);
        disp(['Condition number of A: ', num2str(cond_A)]);
    end
end

