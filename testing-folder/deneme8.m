clc
clear all

dt = 0.001;
t  = -5:dt:25;   % wide enough to see x(t/5) (needs up to 25)

% Define x(t) with its valid interval 0..5 (else 0)
x = @(tt) (tt.*cos(2*pi*tt)) .* (tt>=0 & tt<=5);

% a) original
figure; plot(t, x(t));

% b) time-reversed
figure; plot(t, x(-t));

% c) time-scaled
figure; plot(t, x(t/5));

% d) x(1+3t)
figure; plot(t, x(1+3*t));

% e) x(-1-3t)
figure; plot(t, x(-1-3*t));