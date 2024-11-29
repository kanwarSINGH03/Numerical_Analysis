clear;
clc;


a = pi; 
b = 2;
dt = 0.01;
n = 1000; 

[mc_probability, exact_probability, error] = brownian_motion_escape(a, b, dt, n);

fprintf('Monte Carlo Probability of escape through the top: %f\n', mc_probability);
fprintf('Exact Probability: %f\n', exact_probability);
fprintf('Error: %f\n', error);


function [mc_probability, exact_probability, error] = brownian_motion_escape(a, b, dt, n)
    escapes = 0;
    
    for i = 1:n
        position = 0;
        while position > -b && position < a
            step = sqrt(dt) * randn();
            position = position + step;
        end
        if position >= a
            escapes = escapes + 1;
        end
    end
    
    mc_probability = escapes / n;
    
    exact_probability = b / (a + b);

    error = abs(mc_probability - exact_probability);
end

