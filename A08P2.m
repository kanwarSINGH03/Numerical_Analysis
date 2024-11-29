clear;
clc;

% Define the differential equation
dy = @(t, y) sin(y);

% Time span
tSpan = [0, 4];

% Initial conditions
y0 = [0, 100]; % Two initial conditions in a vector

% Step sizes
hValues = 0.1 * 2.^(-[0:5]);

% Preallocate for efficiency
errors = zeros(length(hValues), length(y0));

% Loop over each h value
for k = 1:length(hValues)
    h = hValues(k);
    
    % Loop over each initial condition
    for j = 1:length(y0)
        % Initialize
        t = 0:h:4;
        y = zeros(size(t));
        y(1) = y0(j);
        
        % Trapezoid Method
        for i = 1:(length(t)-1)
            % Predictor step
            yp = y(i) + h*dy(t(i), y(i));
            % Corrector step
            y(i+1) = y(i) + (h/2)*(dy(t(i), y(i)) + dy(t(i+1), yp));
        end
        
        % Assuming exactSolution is a function that computes the exact solution
        % exact = exactSolution(t, y0(j));
        
        % Compute error at t=4 (placeholder, replace exact with actual exact values)
        % errors(k, j) = abs(y(end) - exact(end));
        
        % Plot for k = 0 and k = 5
        if k == 1 || k == 6
            figure;
            plot(t, y); %, t, exact, '--');
            title(['Approximation with h = ', num2str(h), ', y0 = ', num2str(y0(j))]);
            xlabel('Time t');
            ylabel('y(t)');
            legend('Trapezoid Approximation'); %, 'Exact Solution');
            grid on;
        end
    end
end

% Log-log plot of the error at t=4 as a function of h (Placeholder)
% figure;
% loglog(hValues, errors(:, 1), 'o-', hValues, errors(:, 2), '*-');
% title('Log-log plot of the Error at t = 4');
% xlabel('Step size h');
% ylabel('Error at t = 4');
% legend('y0 = 0', 'y0 = 100');
% grid on;

% Placeholder for exactSolution function (Define or replace with actual function)
% function y = exactSolution(t, y0)
%     % Define the exact solution here
%     y = t; % Placeholder
% end
