clear;
clc;

minimal_standard_rng_volume_approximation;

function minimal_standard_rng_volume_approximation
    a = 16807;
    m = 2^31 - 1;
    x = 1; 

    N = 1e6;
    points = zeros(N, 3);
    for i = 1:N
        x = mod(a * x, m);
        points(i, 1) = x / m;
        x = mod(a * x, m);
        points(i, 2) = x / m;
        x = mod(a * x, m);
        points(i, 3) = x / m;
    end

    radius = 0.04;
    center = [1/3, 1/3, 1/2];

    count_inside = sum(sum((points - center).^2, 2) <= radius^2);

    volume_approx = count_inside / N;
    actual_volume = (4/3) * pi * radius^3;
    
    fprintf('Actual volume of the sphere: %f\n', actual_volume);
    fprintf('Monte Carlo approximation: %f\n', volume_approx);
    fprintf('Error: %f\n', abs(volume_approx - actual_volume));
end



