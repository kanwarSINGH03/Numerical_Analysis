clear;
clc;

% System (a)
A_a = [1 1; 2 1; 1 2; 0 3];
b_a = [3; 5; 5; 5];

[Q_a, R_a] = qr(A_a,0);
x_a = R_a \ (Q_a' * b_a);

error_a = norm(A_a * x_a - b_a, 2);

disp('System (a):');
disp('Least squares solution:');
disp(x_a);
disp('2-norm error:');
disp(error_a);

% System (b)
A_b = [1 2 2; 2 -1 2; 3 1 1; 1 1 -1];
b_b = [10; 5; 10; 3];

[Q_b, R_b] = qr(A_b,0);
x_b = R_b \ (Q_b' * b_b);

error_b = norm(A_b * x_b - b_b, 2);

disp('System (b):');
disp('Least squares solution:');
disp(x_b);
disp('2-norm error:');
disp(error_b);
