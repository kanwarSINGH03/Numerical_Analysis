clear;
clc;

exact_volume = pi^2 / 2;

n = 1e5;
monte_carlo_volume = ball_volume(4, 1, n);

mc_error = abs(monte_carlo_volume - exact_volume);

fprintf('Monte Carlo approximation: %f\n', monte_carlo_volume);
fprintf('Error in Monte Carlo approximation: %f\n', mc_error);

hseq_dim1 = halton_seq(1:n, 2);
hseq_dim2 = halton_seq(1:n, 3);
hseq_dim3 = halton_seq(1:n, 5);
hseq_dim4 = halton_seq(1:n, 7);

qmc_count = 0;
for i = 1:n
    point = [hseq_dim1(i), hseq_dim2(i), hseq_dim3(i), hseq_dim4(i)] * 2 - 1;
    if norm(point) <= 1
        qmc_count = qmc_count + 1;
    end
end

qmc_volume = (2*1)^4 * (qmc_count / n);

qmc_error = abs(qmc_volume - exact_volume);

fprintf('Quasi-Monte Carlo approximation: %f\n', qmc_volume);
fprintf('Error in Quasi-Monte Carlo approximation: %f\n', qmc_error);

function v = ball_volume(dim, r, n)
    count = 0;
    for i = 1:n
        point = rand(1, dim) * (2*r) - r;
        if norm(point) <= r
            count = count + 1;
        end
    end
    v = (2*r)^dim * (count / n);
end

function hseq = halton_seq(index, base)
    hseq = zeros(size(index));
    for i = 1:length(index)
        n = index(i);
        f = 1;
        r = 0;
        while n > 0
            f = f / base;
            n = floor(n);
            r = r + f * mod(n, base);
            n = n / base;
        end
        hseq(i) = r;
    end
end

