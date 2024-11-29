clear;
clc;
for n = [10, 20]
    x_even = linspace(-1, 1, n+1); 
    y_even = exp(abs(x_even));
    % Chebyshev points
    x_cheb = chebyshevNodes(n, -1, 1);
    y_cheb = exp(abs(x_cheb));
    % Calculate coefficients without adjusting n inside newtdd
    c_even = newtdd(x_even, y_even, n+1);
    c_cheb = newtdd(x_cheb, y_cheb, n+1); 
    % Plotting and error 
    x_plot = -1:0.01:1;
    y_actual = exp(abs(x_plot));
    y_even_poly = arrayfun(@(x) nest(n, c_even, x, x_even), x_plot);
    y_cheb_poly = arrayfun(@(x) nest(n, c_cheb, x, x_cheb), x_plot);
    
    figure;
    subplot(2,1,1);
    plot(x_plot, y_actual, 'k-', x_plot, y_even_poly, 'r--', x_plot, y_cheb_poly, 'b-.');
    title(sprintf('Interpolation with n = %d', n));
    legend('Actual', 'Evenly Spaced', 'Chebyshev', 'Location', 'best');
    
    %Empirical interpolation errors
    error_even = abs(y_actual - y_even_poly);
    error_cheb = abs(y_actual - y_cheb_poly);
    
    subplot(2,1,2);
    plot(x_plot, error_even, 'r--', x_plot, error_cheb, 'b-.');
    title(sprintf('Interpolation Error with n = %d', n));
    legend('Error Evenly Spaced', 'Error Chebyshev', 'Location', 'best');
end

function coeffs = newtdd(x, y, n)
    % Adjusted newtdd function, assuming n is now correctly the number of points
    v = zeros(n, n);
    v(:,1) = y(:); % Ensure y is a column vector
    
    for i = 2:n
        for j = 1:n-i
            v(j,i) = (v(j+1,i-1) - v(j,i-1)) / (x(j+i-1) - x(j));
        end
    end
    
    coeffs = v(1, :);
end


% Function to generate Chebyshev base points
function nodes = chebyshevNodes(n, a, b)
    k = 0:n;
    nodes = cos((2*k+1)*pi/(2*n+2));
    nodes = 0.5*(b-a)*nodes + 0.5*(b+a);
end

function y = nest(d, c, x, b)
    % Nested multiplication
    y = c(d+1);
    for i = d:-1:1
        y = y*(x - b(i)) + c(i);
    end
end
