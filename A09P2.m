clear;
clc;

lorenz_trajectory_symbols


function lorenz_trajectory_symbols

    s = 10; r = 28; b = 8/3;
    h = 0.001; 
    t_final = 20; 
    delta = 1e-5; 

    Y0 = [5, 5, 5];
    Y0_perturbed = Y0 + [delta, 0, 0]; 

    [T, Y] = lorenz_rk4(s, r, b, Y0, t_final, h);
    [~, Y_perturbed] = lorenz_rk4(s, r, b, Y0_perturbed, t_final, h);

    symbols = Y(:,1) > 0;
    symbols_perturbed = Y_perturbed(:,1) > 0;

    agreement = find(symbols == symbols_perturbed);
    
    agreement_time_units = numel(agreement) * h;
    
    fprintf('The symbol sequences of the two trajectories agree for %.4f time units.\n', agreement_time_units);
end

function [T, Y] = lorenz_rk4(s, r, b, Y0, t_final, h)
    lorenz_eqns = @(t, Y) [-s*(Y(1)-Y(2)); r*Y(1)-Y(2)-Y(1)*Y(3); Y(1)*Y(2)-b*Y(3)];
    
    steps = ceil(t_final / h);
    
    T = 0:h:t_final;
    Y = zeros(length(T), 3);
    Y(1,:) = Y0;
    
    % Perform the RK4 integration
    for i = 1:(length(T) - 1)
        k1 = lorenz_eqns(T(i), Y(i,:));
        k2 = lorenz_eqns(T(i) + 0.5 * h, Y(i,:) + 0.5 * h * k1');
        k3 = lorenz_eqns(T(i) + 0.5 * h, Y(i,:) + 0.5 * h * k2');
        k4 = lorenz_eqns(T(i) + h, Y(i,:) + h * k3');
        Y(i+1,:) = Y(i,:) + (h/6) * (k1 + 2*k2 + 2*k3 + k4)';
    end
end


