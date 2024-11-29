clear;
clc;

% Differential equation
dydt = @(y) 1 + y^2;

exact_solution_y0_0 = @(t) tan(t);
exact_solution_y0_1 = @(t) tan(t + pi/4);

t0 = 0; t_end = 1;
step_sizes = [0.1, 0.05];
y0_values = [0, 1];

figure;
hold on;

for y0 = y0_values
    % Exact solution plot
    t_fine = t0:0.001:t_end;
    if y0 == 0
        y_exact = exact_solution_y0_0(t_fine);
    else
        y_exact = exact_solution_y0_1(t_fine);
    end
    plot(t_fine, y_exact, 'DisplayName', sprintf('Exact y(0)=%d', y0));

    % Loop over step sizes
    for h = step_sizes
        t_values = t0:h:t_end;
        y_approx = euler_method(dydt, y0, t0, t_end, h);
        plot(t_values, y_approx, 'o-', 'DisplayName', sprintf('Euler y(0)=%d, h=%.2f', y0, h));
    end
end

xlabel('t');
ylabel('y(t)');
title('Euler’s Method Approximation vs. Exact Solution');
legend('Location', 'best');
grid on;
hold off;


% Euler's method function
function y_values = euler_method(dydt, y0, t0, t_end, h)
    t_values = t0:h:t_end;
    y_values = zeros(size(t_values));
    y_values(1) = y0;
    for i = 1:(length(t_values) - 1)
        y_values(i + 1) = y_values(i) + h * dydt(y_values(i));
    end
end



