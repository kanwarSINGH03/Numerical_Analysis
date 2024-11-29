clear;
clc
%Question 1

% System (a)
A_1a = [2 -3; 5 -6];
b_1a = [2; 8];
x_1a = naiveGaussian(A_1a, b_1a);

% System (b)
A_1b = [1 2; 2 3];
b_1b = [-1; 1];
x_1b = naiveGaussian(A_1b, b_1b);

% System (c)
A_1c = [-1 1; 3 4];
b_1c = [2; 15];
x_1c = naiveGaussian(A_1c, b_1c);

%Question 2

% System (a)
A_2a = [2 -2 -1; 4 1 -2; -2 1 -1];
b_2a = [-2; 1; -3];
x_2a = naiveGaussian(A_2a, b_2a);

% System (b)
A_2b = [1 2 -1; 0 3 1; 2 -1 1];
b_2b = [2; 4; 2];
x_2b = naiveGaussian(A_2b, b_2b);

% System (c)
A_2c = [2 1 -4; 1 -1 1; -1 3 -2];
b_2c = [-7; -2; 6];
x_2c = naiveGaussian(A_2c, b_2c);

% Display the solutions
disp('Solution for system 1(a):');
disp(x_1a);
disp('Solution for system 1(b):');
disp(x_1b);
disp('Solution for system 1(c):');
disp(x_1c);

% Display the solutions
disp('Solution for system 2(a):');
disp(x_2a);
disp('Solution for system 2(b):');
disp(x_2b);
disp('Solution for system 2(c):');
disp(x_2c);


function x = naiveGaussian(A, b)
    n = size(A, 1);
    
    % Elimination step
    for j = 1:n-1
        if abs(A(j,j)) < eps
            error('Zero pivot encountered');
        end
        for i = j+1:n
            mult = A(i,j)/A(j,j);
            A(i,j:n) = A(i,j:n) - mult*A(j,j:n);
            b(i) = b(i) - mult*b(j);
        end
    end
    
    % Back-substitution step
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (b(i) - A(i,i+1:n)*x(i+1:n)) / A(i,i);
    end
end