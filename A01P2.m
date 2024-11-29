clear;
clc;

a = -12345678987654321;
b = 123;
result = a + sqrt(a^2 + b^2);

% Now round the result to four significant digits
result_rounded = round(result, 4, 'significant');

result_alternate = -b^2/(a-sqrt(a^2 + b^2));

result_alternate_round = round(result_alternate, 4, 'significant');

disp(num2str(result_rounded));

disp(num2str(result_alternate_round));

