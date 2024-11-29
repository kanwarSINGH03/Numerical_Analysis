clear;
clc;

% Given data
years = [1960; 1970; 1990; 2000];
populations = [3039585530; 3707475887; 5281653820; 6079603571];
X = years;
Y = log(populations);

p = polyfit(X, Y, 1);
b = p(1);
ln_a = p(2);

a = exp(ln_a);

year_1980 = 1980;
pop_1980_est = a * exp(b * year_1980);

% Actual population for 1980
actual_pop_1980 = 4452584592;

% Calculate estimation error
error_1980 = abs(pop_1980_est - actual_pop_1980);

% Display results
fprintf('The estimated population for 1980 is approximately %.0f.\n', pop_1980_est);
fprintf('The actual population for 1980 was %d.\n', actual_pop_1980);
fprintf('The estimation error for 1980 is %.0f.\n', error_1980);
