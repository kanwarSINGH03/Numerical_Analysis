%A

% Data
P = [0.59; 0.80; 0.95; 0.45; 0.79; 0.99; 0.90; 0.65; 0.79; 0.69; 0.79; 0.49; 1.09; 0.95; 0.79; 0.65; 0.45; 0.60; 0.89; 0.79; 0.99; 0.85];
S = [3980; 2200; 1850; 6100; 2100; 1700; 2000; 4200; 2440; 3300; 2300; 6000; 1190; 1960; 2760; 4330; 6960; 4160; 1990; 2860; 1920; 2160];

% Least Squares Fit
A = [ones(size(P)), P]; % Design matrix
coeffs = A\S; % Solving normal equations for c1 and c2
c1 = coeffs(1);
c2 = coeffs(2);

% Plotting
figure;
scatter(P, S, 'filled');
hold on;
P_fit = linspace(min(P), max(P), 100);
S_fit = c1 + c2*P_fit;
plot(P_fit, S_fit, '-r');
xlabel('Price ($)');
ylabel('Sales per Week');
title('Demand Curve: Sales vs. Price');
legend('Actual Sales', 'Least Squares Fit', 'Location', 'Best');

% Calculate RMSE
S_pred = c1 + c2*P;
RMSE = sqrt(mean((S - S_pred).^2));
disp(['Root Mean Square Error: ', num2str(RMSE)]);

% Part (b)

% Define the Profit Function as a function of P
Profit = @(P) (c1 + c2*P) .* (P - 0.23);

% Find the selling price to maximize profit
[P_optimal, Profit_max] = fminbnd(@(P) -Profit(P), 0, 2); 
P_optimal = -P_optimal; 

disp(['Optimal Selling Price: $', num2str(P_optimal)]);
disp(['Maximum Profit per City per Week: $', num2str(-Profit_max)]);
