

clear;
clc;

x = [1960, 1970, 1990, 2000];
y = [3039585530, 3707475887, 5281653820, 6079603571];
x0 = 1980;
y0 = polyinterp(x, y, x0);

disp(["The estimated population in 1980 is " num2str(y0)]);


function y0 = polyinterp(x, y, x0)
    % Compute the coefficients of the interpolating polynomial
    coeffs = newtdd(x, y, length(x));
    
    % Evaluate the interpolating polynomial at x0
    y0 = nest(length(x)-1, coeffs, x0-x(1), x-x(1));
end

function coeffs = newtdd(x, y, n)
    % Newton's divided difference interpolation
    % Initialize divided difference table
    v = zeros(n, n);
    v(:,1) = y';
    
    for i = 2:n
        for j = 1:n+1-i
            v(j,i) = (v(j+1,i-1) - v(j,i-1)) / (x(j+i-1) - x(j));
        end
    end
    
    coeffs = v(1, :);
end

function y = nest(d, c, x, b)
    % Nested multiplication
    y = c(d+1);
    for i = d:-1:1
        y = y*(x - b(i)) + c(i);
    end
end
