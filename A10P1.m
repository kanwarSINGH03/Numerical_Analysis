clear;
clc;

m = 2^48;
a = 2^24 + 3;
b = 0;

u = zeros(1, 10002); 
u(1) = 1;

for i = 1:(length(u) - 1)
    u(i+1) = mod(a*u(i) + b, m);
end

u = u / m;

figure;
subplot(1, 2, 1);
plot3(u(1:end-2), u(2:end-1), u(3:end), '.');
title('Questionable RNG - 3D plot');
xlabel('u_i');
ylabel('u_{i+1}');
zlabel('u_{i+2}');
axis([0 1 0 1 0 1]);
grid on;

check = u(3:end) == mod(6*u(2:end-1) - 9*u(1:end-2), 1);

if all(check)
    disp('The relationship holds for all generated values.');
else
    disp('The relationship does not hold for some generated values.');
end
