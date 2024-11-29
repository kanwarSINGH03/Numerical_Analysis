clear;
clc;

matrix_a = [4, 3, 1; -5, -3, 0; 3, 2, 1];
matrix_d = [11, 4, -2; -10, 0, 5; 4, 1, 2];

eigenvalues_a = qr_algorithm(matrix_a);
eigenvalues_d = qr_algorithm(matrix_d);

disp('Eigenvalues for matrix (a):');
disp(eigenvalues_a);

disp('Eigenvalues for matrix (d):');
disp(eigenvalues_d);


function eigenvalues = qr_algorithm(A, max_iterations)
    if nargin < 2
        max_iterations = 1000;
    end
    
    Ak = A;
    n = size(A, 1);
    
    for i = 1:max_iterations
        [Q, R] = qr(Ak);
        Ak = R * Q;    
    end
    
    eigenvalues = diag(Ak);
end

