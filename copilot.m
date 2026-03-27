% Part (a): Plot an approximation of the Dirac delta δ(t-2) without built-in delta
t = linspace(-1,5,2000);
% Approximate delta as a narrow Gaussian centered at 2
sigma = 0.01;
delta_approx = (1/(sigma*sqrt(2*pi))) * exp(-(t-2).^2/(2*sigma^2));
figure;
subplot(2,1,1);
plot(t, delta_approx, 'k', 'LineWidth', 1.2);
xlim([1.8 2.2]);
xlabel('t'); ylabel('\delta(t-2)');
title('Approximate \delta(t-2) (Gaussian approximation)');
grid on;

% Part (b): Using built-in stem to represent an ideal impulse at t=2
t_stem = -1:0.1:5;
impulse = zeros(size(t_stem));
[~, idx] = min(abs(t_stem-2));
impulse(idx) = 1; % unit impulse amplitude
subplot(2,1,2);
stem(t_stem, impulse, 'filled', 'MarkerSize', 4);
xlim([1.8 2.2]);
xlabel('t'); ylabel('\delta(t-2)');
title('Ideal impulse \delta(t-2) (discrete representation using stem)');
grid on;