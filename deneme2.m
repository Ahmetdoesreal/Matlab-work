%%
%first
%%
clc
clear all
t=-5:0.1:10
x1 = heaviside(t+1) - heaviside(t-1);            % Create a rectangular pulse active from 0 to 1.
x2 = heaviside(t-2) - heaviside(t-4);            % Create a rectangular pulse active from 0 to 2.

a1 = 2;                                        % Set the first scaling constant to 2.
a2 = 3;                                        % Set the second scaling constant to 3.

z = a1*x1 + a2*x2;                             % Pre-mix the inputs using the scaling factors.
y_left = 5 * z;                                % The system processes the mixed input by multiplying it by 2.

z1 = 5* x1;                                   % Calculate the system output for just x1.
z2 = 5 * x2;                                   % Calculate the system output for just x2.
y_right = a1*z1 + a2*z2;                       % Mix the individual outputs together.
hold on
plot(t,y_left,'b')
plot(t,y_right,'r--')
figure

y_left=exp(z)
z1=exp(x1)
z2=exp(x2)
y_right =a1*z1+a2*z2
hold on
plot(t,y_right,'b')
plot(t,y_left,'r--')

%%
%second
%%
clc
clear all



size([5;6;7;8]',2)

%%
%third
%%
clc
clear all

x=linspace(0,2*pi,10)