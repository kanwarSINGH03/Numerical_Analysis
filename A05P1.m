clear;
clc;

years = 1994:2003;
bbl_day = [67.052, 68.008, 69.803, 72.024, 73.400, 72.063, 74.669, 74.487, 74.065, 76.777];

% Convert years to a more manageable range for numerical stability
x = years - 1993;
y = bbl_day;

% Fit a degree 9 polynomial to the data
p = polyfit(x, y, 9);

%Points for the curve
x_fit = linspace(min(x), max(x)+16, 1000);
y_fit = polyval(p, x_fit);

figure;
plot(x, y, 'o', 'MarkerFaceColor', 'b');

plot(x_fit, y_fit, '-r');
xlabel('Year');
ylabel('Oil Production (Millions of barrels per day)');
title('Oil Production and Degree 9 Polynomial Fit');
legend('Original Data', 'Degree 9 Fit', 'Location', 'NorthWest');

year_2010 = 2010 - 1993; % Adjusted year for 2010
prod_2010 = polyval(p, year_2010);
fprintf('Estimated oil production for 2010: %.3f million barrels per day\n', prod_2010);


