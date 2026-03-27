% 1. Variables, Vectors, and Matrices
%% Basic Variables and Vectors
theta = 45;                     % Create a variable named theta and set its value to 45
x = 'hello';                    % Store a string (text) in a variable using single quotes
a = [1 2 3 4 5];                % Create a horizontal row vector with numbers 1 through 5
length(a);                      % Find and return the total number of elements in vector 'a'
a(3);                           % Extract the 3rd element from vector 'a'
x = 1:2:11;                     % Create a vector starting at 1, jumping by 2, until 11
b = [1; 2; 3; 4];               % Create a vertical column vector using semicolons
a_col = a';                     % Convert a row vector to a column vector using the transpose operator (')
a_add = a + a;                  % Add two vectors of the same size together
a_mult = a .* a;                % Multiply two vectors element-by-element using the dot operator (.*)
a_pow = a .^ 2;                 % Square every element in the vector individually using (.^)

%% Matrices
A = [1 2 3; 4 5 6; 7 8 9];      % Create a 3x3 matrix, using semicolons to start new rows
A(3, 2);                        % Extract the specific number located in the 3rd row, 2nd column
A(2, :);                        % Extract all elements in the entire 2nd row using the colon wildcard
A_inv = inv(A);                 % Calculate the inverse of the square matrix A
A_det = det(A);                 % Calculate the determinant of the matrix A
M_ones = ones(2,3);             % Create a 2x3 matrix filled entirely with 1s
M_zeros = zeros(1,4);           % Create a 1x4 row vector filled entirely with 0s
M_eye = eye(3);                 % Create a 3x3 identity matrix (1s on the diagonal, 0s elsewhere)
M_rand = rand(3);               % Create a 3x3 matrix filled with random decimal numbers

%% 2. Plotting (2D Plots, Subplots, Fast Plots, Stem)
%% 2D Plotting and Subplots
clc; clear all;                 % Clear the command window and delete all workspace variables
x = linspace(0, 2*pi, 100);     % Create an array of 100 evenly spaced points between 0 and 2*pi
y1 = sin(x);                    % Calculate the sine of every value in vector x
y2 = cos(x);                    % Calculate the cosine of every value in vector x
figure;                         % Open a new blank figure window for plotting
subplot(1,2,1);                 % Divide the figure window into 1 row, 2 columns, and select the 1st area
plot(x, y1);                    % Plot the sine wave (y1) against x in the selected subplot
title('sin(x)');                % Add a title to the first subplot
subplot(1,2,2);                 % Select the 2nd area of the divided figure window
plot(x, y2);                    % Plot the cosine wave (y2) against x in the second subplot
title('cos(x)');                % Add a title to the second subplot

%% Fast Plotting (fplot)
figure;                         % Open another new figure window
fplot(@(x) exp(-x).*sin(2*x), [0 5]); % Plot the function directly without manually creating x and y vectors
title('Fast Plot using fplot'); % Add a title to the graph
xlabel('x');                    % Label the horizontal x-axis
ylabel('f(x)');                 % Label the vertical y-axis

%% Discrete-Time Plotting (Stem)
n = 0:10;                       % Create a discrete sequence of integers from 0 to 10
f = (0.8).^n;                   % Calculate an exponential sequence decreasing over time
figure;                         % Open a new figure window
stem(n, f);                     % Create a discrete sequence plot (lines with circles at the top)
title('Discrete-Time Signal');  % Add a title to the stem plot
xlabel('n');                    % Label the horizontal axis as discrete time index 'n'
ylabel('Amplitude');            % Label the vertical axis as 'Amplitude'

%% Piecewise Functions
t1 = 0:0.01:2;                  % Define the first time interval from 0 to 2 with a small step
f1 = t1.^2;                     % Define the function rule (squared) for the first interval
t2 = 2:0.01:4;                  % Define the second time interval from 2 to 4
f2 = 4 + (t2-2);                % Define the function rule (linear) for the second interval
t = [t1 t2];                    % Concatenate (glue) both time vectors together into one long vector
f = [f1 f2];                    % Concatenate both function result vectors together
figure;                         % Open a new figure window
plot(t, f);                     % Plot the fully combined piecewise function
title('Piecewise Function');    % Add a title to the graph
xlabel('t');                    % Label the horizontal time axis
ylabel('f(t)');                 % Label the vertical function axis

%% 3. Logical Operators and Control Flow
%% Logical Operators
clc; clear all;                 % Clear screen and variables
a = 10;                         % Assign the value 10 to variable a
b = 5;                          % Assign the value 5 to variable b
result1 = a > b;                % Check if a is greater than b (returns 1 for True)
result2 = a <= b;               % Check if a is less than or equal to b (returns 0 for False)
result3 = a == 10;              % Check if a is exactly equal to 10 (returns 1)
result4 = a ~= b;               % Check if a is NOT equal to b (returns 1)
disp([ result1 result2 result3 result4]); % Display all true/false results in an array

%% Checking Matrices
A = [];                         % Create an entirely empty matrix
checkEmpty = isempty(A);        % Ask MATLAB if matrix A is empty
B = [1 2 NaN 4];                % Create a vector containing a 'Not-a-Number' (NaN) element
checkNaN = isnan(B);            % Find the exact locations of NaN values in the vector
C = [1 2 Inf 5];                % Create a vector containing an Infinity (Inf) element
checkInf = isinf(C);            % Find the exact locations of infinite values in the vector

%% Control Flow (If, Switch, Loops)
score = 82;                     % Define a variable named score
if score >= 90                  % Condition 1: Check if score is 90 or above
    grade = 'A';                % Assign grade A if condition 1 is true
elseif score >= 70              % Condition 2: Check if score is 70 or above
    grade = 'B';                % Assign grade B if condition 2 is true
else                            % Fallback: If no previous conditions are met
    grade = 'C';                % Assign grade C
end                             % End the if-else block

day = 'Friday';                 % Define a variable containing a day of the week
switch day                      % Start a switch statement to check the value of 'day'
    case 'Monday'               % If the day is exactly 'Monday'
        msg = 'Start of week';  % Store this message
    case 'Friday'               % If the day is exactly 'Friday'
        msg = 'Weekend is near';% Store this message
    otherwise                   % If it doesn't match any specific cases
        msg = 'Regular day';    % Store a default message
end                             % End the switch block

count = 1;                      % Initialize a counter variable starting at 1
while count <= 5                % Keep repeating the loop as long as count is 5 or less
    disp(['Count: ' num2str(count)]); % Print the word 'Count:' followed by the number
    count = count + 1;          % Increase the counter by 1 to prevent an infinite loop
end                             % End the while loop

for i = 1:10                    % Create a loop that iterates from 1 to 10
    if i == 3                   % Check if the loop index is exactly 3
        continue;               % Skip the rest of this specific cycle and jump to the next one
    end                         % End the if condition
    if i == 8                   % Check if the loop index is exactly 8
        break;                  % Stop and exit the entire loop permanently
    end                         % End the if condition
    disp(['Loop value: ' num2str(i)]); % Print the current loop number
end                             % End the for loop

%% 4. Custom Functions and Symbolic Calculus
%% Custom Function Structure
% function [sum_result, product_result] = oper1(MatrixA, MatrixB) % Define a function taking 2 inputs
%     sum_result = MatrixA + MatrixB;                             % Calculate the element-wise sum
%     product_result = MatrixA * MatrixB;                         % Calculate the matrix multiplication
% end                                                             % End the function definition

%% Symbolic Calculus
syms x                          % Declare 'x' as an unknown symbolic mathematical variable
f = x^2 + 3*x + 1;              % Define a symbolic algebraic equation
df = diff(f);                   % Calculate the mathematical derivative of the function
F_indef = int(f, x);            % Calculate the indefinite integral of the function
F_def = int(f, x, 0, 2);        % Calculate the definite integral between limits 0 and 2
roots = solve(f, x);            % Find the roots of the equation by solving f(x) = 0
value_at_2 = subs(f, x, 2);     % Substitute the actual number 2 into the symbolic 'x' variable

%% 5. Continuous-Time Signals

%% Sinusoidal Signals : T = 2pi/Omega ;  A * cos(omega*t + thita)
A = 3;                          % Define the amplitude of the wave as 3
omega = 3*pi;                   % Define the angular frequency as 3*pi radians/second
thita = pi/3;                   % Define the phase shift as pi/3
T = 2*pi/omega;                 % Calculate the fundamental period of the wave
t = 0:0.01:4*T;                 % Create a fine continuous-time vector covering 4 full periods
x = A * cos(omega*t + thita);   % Generate the sinusoidal signal mathematically
plot(t, x)                      % Plot the generated sinusoidal signal

%% Exponential Signals x(t) = Ae^{bt}. 
t = -2:0.1:5;                   % Define the time interval from -2 to 5
x = 3 * exp(0.4*t);             % Generate an ascending (growing) exponential signal
y = 2 * exp(-0.9*t);            % Generate a descending (decaying) exponential signal
plot(t, x, t, y, ':');          % Plot the growing signal solid, and the decaying signal dotted
legend('x(t)', 'y(t)')          % Display a legend to differentiate the two lines

%% Complex Exponential Signals : Ae^{j*Omega*t + theta} = A(cos(Omega*t + theta) + j*sin(Omega*t + theta)). 
% Let's plot the real and imaginary parts of y(t) = 2*exp(j*pi*t + pi/3).
t = 0:0.1:2;                    % Define the time vector for a single period
y_re = real(2*exp(1j*pi*t + pi/3)); % Extract only the real mathematical component of the complex signal
y_im = imag(2*exp(1j*pi*t + pi/3)); % Extract only the imaginary mathematical component of the complex signal
plot(t, y_re, t, y_im, '.');    % Plot both the real and imaginary parts using dots

%% Special Functions (Step, Impulse, Ramp, Rectangular)
t = -5:0.1:10;                  % Define a standard time interval for the next functions
u = heaviside(t);               % Generate a continuous unit step function (0 before t=0, 1 after)
plot(t, u);                     % Plot the unit step function
ylim([-0.3 1.3]);               % Set vertical limits slightly beyond 0 and 1 for better visibility
figure
d = dirac(t);                   % Generate a Dirac delta (impulse) function (shoots to infinity at t=0)
plot(t, d);                     % Plot the impulse function
figure
r = t .* heaviside(t);          % Generate a ramp function by multiplying time element-wise by the step function
plot(t, r);                     % Plot the linear ramp function
figure
s = rectpuls(t, 4);             % Generate a rectangular block pulse with a total width of 4 seconds
plot(t, s);                     % Plot the rectangular pulse

%% 6. Discrete-Time Sequences & Signal Properties

%% Discrete Unit Impulse Sequence
n = -3:3;                       % Define a discrete integer time vector
d = (n == 0);                   % Create an impulse that equals 1 ONLY when index n is exactly 0
figure;                         % Open a new figure window
stem(n, d);                     % Plot the discrete impulse using the stem command

%% Discrete Unit Step Sequence (Shifted)
n = -3:5;                       % Define a discrete integer time vector
n0 = 2;                         % Set the specific shift/delay point to n=2
u = ((n - n0) >= 0);            % Create a step sequence that returns 1 for all indices n >= 2
stem(n, u);                     % Plot the shifted discrete step sequence

%% Discrete Real Exponential Sequence
n = -3:5;                       % Define discrete time vector
a1 = 0.8;                       % Define the descending ratio (absolute value < 1)
x1 = a1.^n;                     % Apply the power element-by-element to create the sequence
stem(n, x1);                    % Plot the descending exponential sequence

%% Discrete complex exponential sequence x[n] = exp(j*0.8*n).
n = -10:10; % Time vector from -10 to 10.
w = 0.8; % The angular frequency is 0.8.

% Here is the signal definition using Euler's formula representation.
x = exp(1j * w * n);

% We use the real() function to extract and plot only the real part of the signal
stem(n, real(x));

% NOTE: You can also use stem(n, imag(x)) for the imaginary part,
% stem(n, abs(x)) for the magnitude, and stem(n, angle(x)) for the angle.


%% Sampling and the Nyquist Theorem
t = 0:0.01:10;                  % Create a fine vector to simulate a "continuous" analog signal
x = cos(7*t);                   % Define the original high-resolution analog signal
Ts1 = pi/7;                     % Choose a valid sampling interval satisfying Nyquist rules
ts1 = 0:Ts1:10;                 % Create a valid discrete sampling time vector
xs1 = cos(7*ts1);               % Extract the good samples from the signal
Ts2 = pi/4;                     % Choose an invalid, overly large sampling interval (fails Nyquist)
ts2 = 0:Ts2:10;                 % Create a bad discrete sampling time vector
xs2 = cos(7*ts2);               % Extract the bad/corrupted samples
plot(t, x, ts1, xs1, ':o', ts2, xs2, ':+') % Plot the continuous wave, the good samples (circles), and bad samples (crosses)

%% Checking Signal Periodicity
t = 1:5;                        % Define a small test time interval
x = sin(t);                     % Create the original test signal
T = 2*pi;                       % Define the known mathematical period of a sine wave
for k = 1:10                    % Loop to shift the signal exactly 10 times
    xk(k,:) = sin(t + k*T);     % Calculate the shifted signal and save it in a new matrix row
end                             % End the loop (all rows will turn out identically)

%% Constructing Complex Periodic Signals (repmat)
t = 0:0.1:10;                   % Define the time interval for a single period
x = t .* exp(-t);               % Create a custom, weirdly shaped signal for that one period
xp = repmat(x, 1, 8);           % Replicate the signal shape vector to make it repeat 8 times in a row
tp = linspace(0, 80, length(xp)); % Generate a new long time vector to match the 8 combined periods
plot(tp, xp);                   % Plot the artificially constructed repeating signal

%% Causal vs Non-Causal Signals
t1 = 0:0.1:5;                   % Define a strictly positive time vector (starts at 0)
x1 = t1 .* exp(-t1);            % Generate a causal signal
plot(t1, x1);                   % Plot it (it only exists in positive time)

t2 = -1:0.1:5;                  % Define a time vector that includes negative numbers
x2 = t2 .* exp(-t2);            % Generate a non-causal signal
plot(t2, x2);                   % Plot it (it exists before t=0)

%% Extracting Even and Odd Components
n = -5:5;                       % Define a discrete time vector covering positive and negative space
u = (n >= 0);                   % Create the original unit step sequence
u_n = (n <= 0);                 % Create the time-reversed (flipped) version of the unit step sequence
ue = 1/2 * (u + u_n);           % Mathematically compute the symmetrical "Even" part of the signal
stem(n, ue);                    % Plot the perfectly mirrored Even component
uo = 1/2 * (u - u_n);           % Mathematically compute the inverted "Odd" part of the signal
stem(n, uo);                    % Plot the inverted Odd component
stem(n, uo+ue);                 % Prove that adding the Even and Odd parts restores the exact original signal

%% 1. Time Reversal
% Let's plot an original signal and its time-reversed (reflected) version.
t = -1:0.1:3;           % Define the standard time vector from -1 to 3 with a step of 0.1.
x = t .* exp(-t);       % Define the original continuous-time signal x(t).
figure                  % Open a new blank figure window for plotting.
% To plot the reflected version, x(-t), we simply use -t in the plot command!
plot(t,x, -t, x);       % Plot the original signal x(t) and the time-reversed signal x(-t) together.
legend('x(t)','x(-t)'); % Add a legend to easily differentiate between the two signals.

%% 2. Time Scaling
t = -1:0.1:3;           % Define the original time interval vector.
x = t .* exp(-t);       % Define the original continuous-time signal x(t).

% Let's COMPRESS the signal by a factor of 2.
a_comp = 2;             % Set the compression factor 'a' to 2 (since a > 1, it causes compression).
figure                  % Open a new figure window for the compressed signal plot.
plot((1/a_comp)*t, x);  % Plot the compressed signal by multiplying the time vector by 1/a.
legend('x(2t)');        % Add a legend to label the compressed signal.

% Let's EXPAND the signal by a factor of 2.
a_exp = 0.5;            % Set the expansion factor 'a' to 0.5 (since 0 < a < 1, it causes expansion).
figure                  % Open another new figure window for the expanded signal plot.
plot((1/a_exp)*t, x);   % Plot the expanded signal by multiplying the time vector by 1/a.
legend('x(0.5t)');      % Add a legend to label the expanded signal.

%% 3. Time Shifting
t = -1:0.1:3;               % Define the original time interval vector.
x = t .* exp(-t);           % Define the original continuous-time signal.

% Let's shift the signal 2 units to the right (delay).
t0_right = 2;               % Set the right-shift (delay) value to 2 units.
figure                      % Open a new figure window.
plot(t,x, t + t0_right, x); % Plot the original signal and the right-shifted signal by adding t0 to the time vector.
legend('x(t)','x(t-2)');    % Add a legend to label both the original and delayed signals.

% Let's shift the signal 3 units to the left (advance).
t0_left = -3;               % Set the left-shift (advance) value to -3 units.
figure                      % Open a new figure window.
plot(t,x, t + t0_left, x);  % Plot the original signal and the left-shifted signal by adding the negative t0.
legend('x(t)','x(t+3)');    % Add a legend to label both the original and advanced signals.
