%% 1-Theory: Continuous-Time Convolution (Steps 1 to 4)
% The impulse response h(t) describes how a system reacts to a quick tap (Dirac delta).
% If you know h(t), you can calculate the output y(t) for ANY input x(t) using convolution:
% y(t) = x(t) * h(t). Mathematically, this is an integral: integral of x(tau) * h(t - tau) d(tau).
% To do this visually, we follow steps: change the variable to tau, reflect h(tau), 
% shift it by 't', and slide it across x(tau) to find overlapping areas.
% Here, h(t) = 1 - t (for 0 to 1) and x(t) = 1 (for 0 to 2).

%% Step 1: Changing the Variable (Plotting in the tau-axis)
clc; clear all;                    % Clear the command window and all workspace variables.
% --- Defining the Input Signal x(tau) ---
tx1 = -2:.1:0;                     % Define the first time interval (before signal starts).
tx2 = 0:.1:2;                      % Define the second time interval (where signal is active).
tx3 = 2:.1:4;                      % Define the third time interval (after signal ends).
tx = [tx1 tx2 tx3];                % Concatenate these intervals to make the full tau time axis.
x1 = zeros(size(tx1));             % The input signal is 0 in the first interval.
x2 = ones(size(tx2));              % The input signal is 1 in the second interval.
x3 = zeros(size(tx3));             % The input signal is 0 in the third interval.
x = [x1 x2 x3];                    % Concatenate these parts to create the full input signal x.

% --- Defining the Impulse Response h(tau) ---
th1 = -2:.1:0;                     % Time interval before the impulse response starts.
th2 = 0:.1:1;                      % Time interval where the impulse response is active (0 to 1).
th3 = 1:.1:4;                      % Time interval after the impulse response ends.
th = [th1 th2 th3];                % Combine to make the full tau axis for h.
h1 = zeros(size(th1));             % h is 0 in the first interval.
h2 = 1 - th2;                      % h is defined by the mathematical equation '1 - tau' here.
h3 = zeros(size(th3));             % h is 0 in the third interval.
h = [h1 h2 h3];                    % Combine to create the full impulse response h.

figure                             % Open a new blank figure window.
% --- Plotting Both Signals ---
plot(tx, x, th, h, ':*')           % Plot x as a solid line, and h as a dotted line with asterisks.
ylim([-.1 1.1])                    % Set the y-axis boundaries to make the graph look neat.
legend('x(\tau)', 'h(\tau)')       % Add a legend using Greek letters (\tau).
grid                               % Turn on the grid lines for the graph.

%% Step 2: Reflection
figure                             % Open a new figure window.
plot(tx, x, -th, h, ':*')          % Put a minus sign in front of 'th' to reflect the h signal horizontally!
legend('x(\tau)', 'h(-\tau)')      % Update the legend to show the reflected signal.
ylim([-.1 1.1])                    % Keep the y-axis boundaries consistent.

%% Step 3: Shifting
t = -2;                            % Let's test a time shift where t is -2.
figure                             % Open a new figure window.
plot(tx, x, -th+t, h, ':*')        % Add the constant '+t' to the reflected time axis to shift the signal.
ylim([-.1 1.1])                    % Keep the y-axis boundaries consistent.
legend('x(\tau)', 'h(t-\tau)')     % Update the legend to show the shifted signal.

%% Step 4: Sliding (Partial Overlap Example)
t = 0.5;                           % Set time to 0.5 to look at the "Partial Overlap" stage.
figure                             % Open a new figure window.
plot(tx, x, -th+t, h, ':*')        % Plot the shifted signal at t = 0.5.
ylim([-.1 1.1])                    % Set the y-axis boundaries.
legend('x(\tau)', 'h(t-\tau)')     % Add the legend.
% The following code highlights the overlapped area using the 'area' command.
tau = 0:.1:t;                      % Define the specific tau region where the two signals overlap.
a = tau + 1 - t;                   % Define the equation representing the height of the overlapping section.
hold on; area(tau, a); hold off;   % Use 'area' to fill in the overlapping region on the graph with color.

%% 2- Theory: Continuous-Time Convolution (Step 5 & Plotting)
% After visualizing how the signals slide over each other, we calculate the exact area 
% of the overlapping regions using integrals. MATLAB's 'int' command performs this calculus.
% We calculate the integrals for all three stages: entry (partial overlap), 
% complete overlap, and exit. Then, we plot the resulting mathematical equations together.

%% Step 5: Integration
syms t tau                         % Tell MATLAB that 't' and 'tau' are symbolic math variables, not arrays.
f = 1 - t + tau;                   % Define the function to integrate: h(t-tau) which simplifies to 1 - (t - tau).

% Integrating the entry stage (partial overlap from 0 to t)
y = int(f, tau, 0, t)              % Calculate the integral. MATLAB outputs: t - t^2/2.

% Integrating the complete overlap stage (from t-1 to t)
y = int(f, tau, t-1, t)            % Calculate the integral for the middle stage.
simplify(y)                        % Clean up the mathematical equation. MATLAB outputs the constant: 1/2.

% Integrating the exit stage (from t-1 to 2)
y = int(f, tau, t-1, 2)            % Calculate the integral for the final stage. MATLAB outputs the final equation.

%% Plotting the Final Output y(t)
t1 = 0:.1:1;                       % Create the time vector for the entry stage.
t2 = 1:.1:2;                       % Create the time vector for the complete overlap stage.
t3 = 2:.1:3;                       % Create the time vector for the exit stage.

y1 = t1 - (t1.^2)/2;               % Apply the math equation we found for stage 1.
y2 = 0.5*ones(size(t2));           % Apply the math equation (0.5 constant) for stage 2 to its time array.
y3 = 0.5*((3 - t3).^2);            % Apply the math equation we found for stage 3.

figure                             % Open a new figure window.
% Plot all the pieces together using different styles (solid, dots, colons) to see the transitions clearly.
plot(t1, y1, t2, y2, '.', t3, y3, ':') 
ylim([0 0.6])                      % Set the y-axis boundaries.
title('Output signal y(t)');       % Give the final graph a title.

%% 3- Theory: The 'conv' Command
% MATLAB has a built-in shortcut called 'conv' to calculate convolution automatically.
% However, you must follow 4 strict rules:
% 1. Both signals must share the exact same master time interval.
% 2. Piecewise signal time definitions must NOT overlap at their connection points.
% 3. You MUST multiply the result by your time step size to simulate the integral correctly.
% 4. The output signal's length will be length(x) + length(h) - 1, meaning its time duration is doubled.

% --- PREPARING THE SIGNALS ---
step = 0.01;                       % Define a very tiny time step to fake a smooth, continuous-time signal.
t = 0:step:2;                      % Rule 1: Define the master time interval from 0 to 2 for both signals.
x = ones(size(t));                 % The input signal x(t) is just '1' everywhere in this master interval.

t1 = 0:step:1;                     % Define the first time chunk for h(t), from 0 to 1.
t2 = 1+step:step:2;                % Rule 2: Start the second chunk slightly AFTER 1 so the time arrays don't overlap.
h1 = 1 - t1;                       % Calculate the math equation for h(t) in the first active chunk.
h2 = zeros(size(t2));              % Set h(t) to completely zero in the second chunk.
h = [h1 h2];                       % Glue h1 and h2 together horizontally to make the full impulse response.

% --- CALCULATING CONVOLUTION ---
y = conv(x,h) * step;              % Rule 3: Calculate convolution using 'conv' and multiply by 'step' size.

% Let's verify the lengths in the command window:
length(y)                          % MATLAB answers: 401
length(x)                          % MATLAB answers: 201
length(h)                          % MATLAB answers: 201
% Rule 4: length(y) = 201 + 201 - 1 = 401.

% --- PLOTTING THE OUTPUT ---
ty = 0:step:4;                     % Rule 4: Create a new time axis for the output that is twice as long (0 to 4).
figure                             % Open a new figure window.
plot(ty, y);                       % Plot the final automatically calculated system output y(t).
% Note: The order matters inside conv() if you are tracking variable sizes, but y = conv(x,h) is standard.

%% 4-Theory: Deconvolution
% Deconvolution is the reverse of convolution. If you know the input signal x(t) 
% and the final output signal y(t), you can reverse-engineer the system to find 
% its impulse response h(t). MATLAB uses the 'deconv' command for this.

% --- DECONVOLUTION ---
% Because we multiplied by 'step' during the 'conv' operation, we must do the exact 
% opposite here to undo it, which is multiplying by (1/step) or dividing by 'step'.
hh = deconv(y,x) * (1/step);       % Find the recovered impulse response and save it as 'hh'.

figure                             % Open a new figure window.
plot(t, hh)                        % Plot the recovered impulse response against the original time vector.
ylim([-.1 1.1]);                   % Fix the y-axis boundaries so it matches our very first graph.
legend('impulse response h(t)')    % Add a legend to prove we successfully recovered original h(t).