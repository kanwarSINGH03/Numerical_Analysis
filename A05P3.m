clear;
clc;
% Data points for part (b)
x_b = [-1, 0, 3, 4, 5];
y_b = [3, 5, 1, 1, 1];

coeff_b = splinecoeff(x_b, y_b);

% Plot 
splineplot(x_b, y_b, coeff_b);

function coeff = splinecoeff(x, y)
    n = length(x); % Number of data points
    dx = diff(x); % Differences in x
    dy = diff(y) ./ dx; % Differences in y divided by differences in x

    % Initialize the matrix A and the vector r
    A = zeros(n, n);
    r = zeros(n, 1);

    % Set interior rows of A and r (tridiagonal part of A)
    for i = 2:n-1
        A(i, i-1:i+1) = [dx(i-1), 2*(dx(i-1) + dx(i)), dx(i)];
        r(i) = 3*(dy(i) - dy(i-1));
    end

    % Not-a-knot conditions
    A(1, 1:3) = [dx(2), -(dx(1) + dx(2)), dx(1)];
    A(n, n-2:n) = [dx(n-2), -(dx(n-2) + dx(n-1)), dx(n-1)];

    % Solve the system A*c = r for c
    c = A\r;

    % Calculate b and d
    b = dy - dx.*(2*c(1:end-1) + c(2:end))/3;
    d = (c(2:end) - c(1:end-1)) ./ (3*dx);

    % Output coefficients
    coeff = zeros(n-1, 3); % Each row will have [b, c, d] for each interval
    for i = 1:n-1
        coeff(i, :) = [b(i), c(i), d(i)];
    end
end

function splineplot(x, y, coeff)
    n = length(x); % Number of data points
    xx = linspace(min(x), max(x), 1000); % Fine grid for plotting
    yy = zeros(size(xx));

    for i = 1:n-1
        % Indices for the current interval in xx
        idx = xx >= x(i) & xx <= x(i+1);

        % Calculate spline value for this interval
        dx = xx(idx) - x(i);
        yy(idx) = y(i) + coeff(i,1)*dx + coeff(i,2)*dx.^2 + coeff(i,3)*dx.^3;
    end

    % Plot the spline
    plot(x, y, 'bo', 'MarkerFaceColor', 'b'); hold on; % Original data points
    plot(xx, yy, 'r-', 'LineWidth', 1.5); % Spline
    hold off;
    title('Not-a-Knot Cubic Spline Interpolation');
    xlabel('x');
    ylabel('y');
    legend('Data Points', 'Spline', 'Location', 'Best');
end


