
kilometres = input('Enter kilometres');
% Define cost rates
rate1 = 0.50; % Cost per km for first 100 km
rate2 = 0.30; % Cost per km for next 200 km
rate3 = 0.20; % Cost per km for km above 300

% Calculate cost
if kilometres <= 100
    totalCost = kilometres * rate1;
elseif kilometres <= 300
    totalCost = 100 * rate1 + (kilometres - 100) * rate2;
else
    totalCost = 100 * rate1 + 200 * rate2 + (kilometres - 300) * rate3;
end

disp(['Total Cost is ' num2str(totalCost)]);