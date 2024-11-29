clear;
clc;

matrices = {
    [10, -12, -6; 5, -5, -4; -1, 0, 3], 
    [-14, 20, 10; -19, 27, 12; 23, -32, -13], 
    [8, -8, -4; 12, -15, -7; -18, 26, 12], 
    [12, -4, -2; 19, -19, -10; -35, 52, 27]
};
shifts = [5, 4, 1, 8];

num_simulations = 100;
for i = 1:length(matrices)
    [eigenvector, eigenvalue] = inverse_power_iteration(matrices{i}, num_simulations, shifts(i));
    fprintf('Matrix (%c):\n', 'a' + i - 1);
    fprintf('Estimated Eigenvector:\n');
    disp(eigenvector);
    fprintf('Estimated Eigenvalue:\n');
    disp(eigenvalue);
    fprintf('\n');
end

function [eigenvector, eigenvalue] = inverse_power_iteration(A, num_simulations, mu)
    n = size(A, 1);
    
    B = A - mu * eye(n);
    
    b_k = rand(n, 1);
    
    for i = 1:num_simulations
        b_k1 = B \ b_k;
        
        b_k = b_k1 / norm(b_k1);
    end

    eigenvalue = (b_k' * A * b_k) / (b_k' * b_k) + mu;
    eigenvector = b_k;
end

