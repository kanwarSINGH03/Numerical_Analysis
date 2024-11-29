

% Prompt the user for a non-negative integer
n = input('Enter a non-negative integer: ');

% Check if the input is non-negative and an integer
if n < 0 || mod(n, 1) ~= 0
    disp('Error: Please enter a non-negative integer.');
else
    % Initialize the factorial result
    factorialResult = 1;
    
    % Compute the factorial using a for loop
    for i = 1:n
        factorialResult = factorialResult * i;
    end
    
    % Display the result
    fprintf('The factorial of %d is %d.\n', n, factorialResult);
end
