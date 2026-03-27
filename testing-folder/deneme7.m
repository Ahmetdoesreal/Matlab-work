clc; clear; close all

t = -5:0.01:5;

% x(t) = t*e^{-t}  for 0<=t<=5, else 0
x = zeros(size(t));
idx = (t>=0 & t<=5);
x(idx) = t(idx).*exp(-t(idx));
%% 

% x(-t): nonzero on -5<=t<=0, and equals (-t)*e^{t}
x_n = zeros(size(t));
idxn = (t>=-5 & t<=0);
x_n(idxn) = (-t(idxn)).*exp(t(idxn));

% even/odd
xe = (x + x_n)/2;
xo = (x - x_n)/2;

% plots
figure; plot(t,x);   title('x(t)'); grid on
figure; plot(t,x_n); title('x(-t)'); grid on
figure; plot(t,xe);  title('Even part'); grid on
figure; plot(t,xo);  title('Odd part'); grid on
figure; plot(t,xe+xo); title('xe + xo (should equal x)'); grid on