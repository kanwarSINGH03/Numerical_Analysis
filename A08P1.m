clear;
clc;

dy = @(t, y) sin(y);

tSpan = [0, 4];

y0_a = 0; 
y0_b = 100;

% Step sizes
h = 0.1 * 2.^(-[0:5]);

errors_a = zeros(length(h), 1);
errors_b = zeros(length(h), 1);

for k = 1:length(h)
    % Time vector for kth step size
    t = 0:h(k):4;
    
    % Euler's method approximation
    [t_a, y_a] = eulersMethod(dy, tSpan, y0_a, h(k));
    [t_b, y_b] = eulersMethod(dy, tSpan, y0_b, h(k));
    if k == 1 || k == 6
        figure;
        plot(t_a, y_a, '-o', t_b, y_b, '-*');
        title(['Euler''s Method Approximation with h = ', num2str(h(k))]);
        xlabel('Time t');
        ylabel('y(t)');
        legend('y0 = 0', 'y0 = 100');
    end
end

% Log-log plot of the error at t = 4 as a function of h
% figure;
% loglog(h, errors_a, '-o', h, errors_b, '-*');
% title('Log-log plot of the Error at t = 4');
% xlabel('Step size h');
% ylabel('Error at t = 4');
% legend('Error with y0 = 0', 'Error with y0 = 100');

function [t, y] = eulersMethod(dy, tSpan, y0, h)
    t = tSpan(1):h:tSpan(2);
    y = zeros(1, length(t));
    y(1) = y0;
    for i = 1:(length(t)-1)
        y(i+1) = y(i) + h * dy(t(i), y(i));
    end
end
