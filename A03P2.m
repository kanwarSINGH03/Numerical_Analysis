clear;
clc;

A1 = [1 2; 3 4];
A2 = [1 3; 2 2];
A3 = [3 -4; -5 2];
% Matrix (a) from Exercise 1
[L1, U1] = naiveLU(A1);
disp('L for matrix (a) from Exercise 1:');
disp(L1);
disp('U for matrix (a) from Exercise 1:');
disp(U1);

% Matrix (b) from Exercise 1
[L2, U2] = naiveLU(A2);
disp('L for matrix (b) from Exercise 1:');
disp(L2);
disp('U for matrix (b) from Exercise 1:');
disp(U2);

% Matrix (c) from Exercise 1
[L3, U3] = naiveLU(A3);
disp('L for matrix (c) from Exercise 1:');
disp(L3);
disp('U for matrix (c) from Exercise 1:');
disp(U3);

A4 = [3 1 2; 6 3 4; 3 1 5];
A5 = [4 2 0; 4 4 2; 2 2 3];
A6 = [1 -1 1 2; 0 2 1 0; 1 3 4 4; 0 2 1 -1];

% Matrix (a) from Exercise 2
[L4, U4] = naiveLU(A4);
disp('L for matrix (a) from Exercise 2:');
disp(L4);
disp('U for matrix (a) from Exercise 2:');
disp(U4);

% Matrix (b) from Exercise 2
[L5, U5] = naiveLU(A5);
disp('L for matrix (b) from Exercise 2:');
disp(L5);
disp('U for matrix (b) from Exercise 2:');
disp(U5);

% Matrix (c) from Exercise 2
[L6, U6] = naiveLU(A6);
disp('L for matrix (c) from Exercise 2:');
disp(L6);
disp('U for matrix (c) from Exercise 2:');
disp(U6);

function [L, U] = naiveLU(A)
    [m, n] = size(A);
    if m ~= n
        error('Matrix must be square');
    end
    
    L = eye(n); % Initialize L as the identity matrix
    U = A;      % Copy of A that will be transformed into U
    
    % Perform LU factorization without pivoting
    for k = 1:n-1
        if abs(U(k,k)) < eps % Check for zero pivot
            error('Zero pivot encountered');
        end
        
        for i = k+1:n
            L(i,k) = U(i,k)/U(k,k);
            U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
        end
    end
    
    % Check the factorization by multiplying L and U
    if max(max(abs(A - L*U))) > 1e-10
        error('LU factorization check failed');
    end
end

