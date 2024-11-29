clear;
clc;


dydt = @(t, y) 1 + y.^2;
y0_values = [0, 1];
tspan = [0, 1];

y_exact = zeros(length(y0_values), 1);

for i = 1:length(y0_values)
    [~, Y] = ode45(dydt, tspan, y0_values(i));
    y_exact(i) = Y(end);
end

h_values = logspace(-4, -1, 20); 
errors = zeros(length(h_values), length(y0_values));


for j = 1:length(y0_values)
    for i = 1:length(h_values)
        [~, Y] = rk4(dydt, tspan, y0_values(j), h_values(i));
        errors(i, j) = abs(Y(end) - y_exact(j));
    end
end


figure;
loglog(h_values, errors, 'LineWidth', 2);
xlabel('Step size h');
ylabel('Global error at t=1');
legend(arrayfun(@(y0) sprintf('y0 = %g', y0), y0_values, 'UniformOutput', false), 'Location', 'NorthEast');
title('Global error of RK4 method at t=1 as a function of h');
grid on;


function [T, Y] = rk4(f, tspan, y0, h)
    % Implementation of the RK4 method
    T = tspan(1):h:tspan(2);
    if T(end) < tspan(2)
        T = [T, tspan(2)];
    end
    Y = zeros(1, length(T));
    Y(1) = y0;
    for i = 1:(length(T)-1)
        ti = T(i);
        yi = Y(i);
        k1 = f(ti, yi);
        k2 = f(ti + 0.5*h, yi + 0.5*h*k1);
        k3 = f(ti + 0.5*h, yi + 0.5*h*k2);
        k4 = f(ti + h, yi + h*k3);
        Y(i+1) = yi + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    Y = Y(end);  % Return only the final value for global error computation
end
