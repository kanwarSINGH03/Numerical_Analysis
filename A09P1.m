
clear; 
clc;

inter = [0, 100]; 
n = 10000; 

ic1_a = [2, 0.2, 2, -0.2];
ic2_a = [0, 0, 0, 0];
ic3_a = [-2, -0.2, -2, 0.2];



orbit_three_body(inter, ic1_a, ic2_a, ic3_a, n, 5);

ic1_b = [2, 0.20001, 2, -0.2]; 

orbit_three_body(inter, ic1_b, ic2_a, ic3_a, n, 5);

function orbit_three_body(inter, ic1, ic2, ic3, n, p)
h = (inter(2) - inter(1)) / n;
y = zeros(n+1, 12); 
t = linspace(inter(1), inter(2), n+1);
y(1, :) = [ic1, ic2, ic3];

for i = 1:n
    y(i+1, :) = eulerstep_three_body(t(i), y(i, :), h);
end

% Plotting
figure;
plot(y(:, 1), y(:, 3), 'r-', y(:, 5), y(:, 7), 'b-', y(:, 9), y(:, 11), 'g-');
xlabel('X position');
ylabel('Y position');
title('Three-Body Problem Trajectories');
legend('Body 1', 'Body 2', 'Body 3');
axis equal;

end

function y = eulerstep_three_body(t, x, h)
% Euler step for three-body dynamics
y = x + h * ydot_three_body(t, x);
end

function z = ydot_three_body(t, x)
% Derivative function for the three-body problem
% Masses
m1 = 0.3; m2 = 0.03; m3 = 0.03;
G = 1; % Gravitational constant

% Extract positions and velocities
x1 = x(1); y1 = x(3); 
vx1 = x(2); vy1 = x(4);

x2 = x(5); y2 = x(7); 
vx2 = x(6); vy2 = x(8);

x3 = x(9); y3 = x(11); 
vx3 = x(10); vy3 = x(12);

% Distances
r12 = sqrt((x2 - x1)^2 + (y2 - y1)^2);
r13 = sqrt((x3 - x1)^2 + (y3 - y1)^2);
r23 = sqrt((x3 - x2)^2 + (y3 - y2)^2);

% Accelerations due to gravitational attraction
ax1 = G * m2 * (x2 - x1) / r12^3 + G * m3 * (x3 - x1) / r13^3;
ay1 = G * m2 * (y2 - y1) / r12^3 + G * m3 * (y3 - y1) / r13^3;

ax2 = G * m1 * (x1 - x2) / r12^3 + G * m3 * (x3 - x2) / r23^3;
ay2 = G * m1 * (y1 - y2) / r12^3 + G * m3 * (y3 - y2) / r23^3;

ax3 = G * m1 * (x1 - x3) / r13^3 + G * m2 * (x2 - x3) / r23^3;
ay3 = G * m1 * (y1 - y3) / r13^3 + G * m2 * (y2 - y3) / r23^3;

% Assembling the derivative vector
z = [vx1, ax1, vy1, ay1, vx2, ax2, vy2, ay2, vx3, ax3, vy3, ay3];
end
