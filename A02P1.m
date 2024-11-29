
clear;
clc;

g = @(x) cos(x)^2;

% Initial guess (x0)
x0 = 0.5; 

% Number of iteration steps (k)
k = 1000; 

% Call the fixed-point iteration function
xc = fpi(g, x0, k);


% Display the result
disp(['Approximate solution: ' num2str(xc)]);

%Program 1.2 Fixed-Point Iteration
%Computes approximate solution of g(x)=x
%Input: function handle g, starting guess x0,
%       number of iteration steps k
%Output: Approximate solution xc
function xc=fpi(g, x0, k)
x(1)=x0;
for i=1:k
  x(i+1)=g(x(i));
end
xc=x(k+1);
end