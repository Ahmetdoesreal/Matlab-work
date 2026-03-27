clc
clear

t = -5:0.001:10;
eps = 0.05;
d = zeros(size(t));
d(abs(t-2) < eps/2) = 1/eps;

plot(t,d,'LineWidth',1.5)
grid on
xlabel('t')
ylabel('\delta_\epsilon(t-2)')
title('Rectangular Approximation of Dirac Delta without built-in function')