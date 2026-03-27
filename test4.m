%% Theory: SISO (Single-Input Single-Output) Systems
% A system takes one or more signals, performs an operation, and outputs new signals.
% SISO is the simplest type: exactly one signal goes in, and exactly one signal comes out.
% Example: A system that simply delays your input signal by 2 seconds: y(t) = x(t - 2).

% Step 1: Define the time vector.
t = 0:0.01:3;                % Create time vector 't' from 0 to 3, taking tiny steps of 0.01 seconds.

% Step 2: Define the input signal.
x = t .* cos(2*pi*t);        % Multiply the time array 't' with the cosine array element-by-element using '.*'.

% Step 3: Plot the original input signal to see what it looks like.
plot(t, x);                  % Draw the graph of the input signal x(t) against time t.
title('Input signal x(t)');  % Put a title text on top of the graph.

% Step 4: Plot the output signal.
% The system delays the signal by 2 seconds. Instead of rewriting the math,
% we can visually shift it by adding 2 to the time variable 't' inside the plot command.
plot(t+2, x);                % Draw the output y(t) = x(t-2) by shifting the plot.
title('Output signal y(t)'); % Label our new output graph.

%% Theory: MISO (Multiple-Input Single-Output) Systems
% These systems accept multiple input signals, mix them together based on a rule, 
% and produce just one single output. 
% Example mathematical rule: y(t) = x1(t) + x2(t) * x3(t).

% Step 1: Define the time vector for 0 to 4 seconds.
t = 0:0.01:4;                        % Create a time vector from 0 to 4 with 0.01 steps.

% Step 2: Create three separate input signals.
x1 = heaviside(t) - heaviside(t-3);  % Input 1 uses the heaviside (unit step) function to create a rectangular pulse.
x2 = t .* sin(t);                    % Input 2 is time multiplied by a sine wave.
x3 = t .* cos(t);                    % Input 3 is time multiplied by a cosine wave.

% Step 3: Apply the system's rule to combine them into one output.
y = x1 + x2 .* x3;                   % The system adds x1 to the element-wise product of x2 and x3.

% Step 4: Plot the final single output.
plot(t, y);                          % Draw the final combined mathematical result against time.
legend('Output y(t)');               % Add a legend to the graph to show what the line represents.

%% Theory: Linear and Nonlinear Systems
% A system is linear if it satisfies the "principle of superposition", which consists of:
% 1. Additivity: S{x1(t) + x2(t)} = S{x1(t)} + S{x2(t)}
% 2. Homogeneity (Scaling): S{a*x(t)} = a*S{x(t)}
% Combined golden rule: S{a1*x1(t) + a2*x2(t)} = a1*S{x1(t)} + a2*S{x2(t)}.
% We will test y(t) = 2x(t) (which is linear) and y(t) = x^2(t) (which is nonlinear).

% Step 1: Define the time and two different input signals.
t = -3:0.1:3;                                  % Define a time vector from -3 to 3.
x1 = heaviside(t+1) - heaviside(t-1);            % Create a rectangular pulse active from 0 to 1.
x2 = heaviside(t-2) - heaviside(t-4);            % Create a rectangular pulse active from 0 to 2.

% Step 2: Define our scaling numbers (constants).
a1 = 2;                                        % Set the first scaling constant to 2.
a2 = -31;                                        % Set the second scaling constant to 3.

% --- TESTING SYSTEM 1: y(t) = 2*x(t) ---
% Left side of the equation: Mix the inputs BEFORE they go into the system.
y_left = a1*x1 + a2*x2;                             % Pre-mix the inputs using the scaling factors.
y_left = 5 * z;                                % The system processes the mixed input by multiplying it by 2.

% Right side of the equation: Put signals through the system FIRST, and mix them AFTER.
z1 = 5 * x1;                                   % Calculate the system output for just x1.
z2 = 5 * x2;                                   % Calculate the system output for just x2.
y_right = a1*z1 + a2*z2;                       % Mix the individual outputs together.
% Note: If you plot y_left and y_right, they are EXACTLY the same. This proves the system is LINEAR.

% --- TESTING SYSTEM 2: y(t) = x^2(t) ---
% Left side: Mix inputs first, then apply the system rule (square the result).
z_new = a1*x1 + a2*x2;                         % Pre-mix the inputs using the scaling factors.
y_left_sq = z_new.^2;                          % The system squares the entire mixed input.

% Right side: Apply the system rule first, then mix them.
z1_sq = x1.^2;                                 % Calculate the system output for just x1 (squared).
z2_sq = x2.^2;                                 % Calculate the system output for just x2 (squared).
y_right_sq = a1*z1_sq + a2*z2_sq;              % Mix the squared individual outputs together.
% Note: If you plot y_left_sq and y_right_sq, they are completely different. This proves the system is NONLINEAR.
% Plot the linear vs nonlinear test results for visual comparison.

figure
subplot(2,1,1)
plot(t, y_left, 'b', t, y_right, 'r--', 'LineWidth', 1.2)
legend('y_{left} (mix then S)','y_{right} (S then mix)','Location','Best')
title('System 1: y(t)=2x(t) — Linear (Left vs Right)')
xlabel('t')
ylabel('Amplitude')
grid on

subplot(2,1,2)
plot(t, y_left_sq, 'b', t, y_right_sq, 'r--', 'LineWidth', 1.2)
legend('y_{left\_sq} (mix then S)','y_{right\_sq} (S then mix)','Location','Best')
title('System 2: y(t)=x^2(t) — Nonlinear (Left vs Right)')
xlabel('t')
ylabel('Amplitude')
grid on
%% Theory: Time-Variant Systems
% Time-Invariance asks: Does the system care what time it is?
% If an input x(t) gives output y(t), then a delayed input x(t - t0) MUST give a delayed output y(t - t0).
% If a system changes its behavior depending on *when* the input is applied, it is a Time-Variant system.
% Here we test the system y(t) = t * e^-t * x(t) using an input pulse delayed by 3 seconds.

% --- STEP 1: CALCULATE NORMAL OUTPUT AND SHIFT IT ---
t = -5:0.001:10;                               % Create time vector 't' from -5 to 10 taking very tiny steps.
xt = heaviside(t) - heaviside(t-5);            % Create our normal input signal x(t), a pulse from t=0 to t=5.
y = t .* exp(-t) .* xt;                        % Calculate normal output y(t) by multiplying input by 't' and 'e^-t'.
plot(t, y);                                    % Plot the normal output y(t).
ylim([-0.05 0.4]);                             % Set the y-axis limits so the graph is easy to read.
legend('y(t)');                                % Add a legend to label this line as the normal y(t).

figure                                         % Open a new blank figure window.
plot(t+3, y);                                  % Plot the SHIFTED output y(t-3) by adding +3 to 't'.
ylim([-0.05 0.4]);                             % Set the y-axis limits again.
legend('y(t-3)');                              % Label this shifted graph as y(t-3).

% --- STEP 2: SHIFT THE INPUT FIRST, THEN CALCULATE NEW OUTPUT ---
xt_shifted = heaviside(t-3) - heaviside(t-8);  % Create a NEW input signal shifted 3 seconds to the right: x(t-3).
y2 = t .* exp(-t) .* xt_shifted;               % Put the shifted input into the system rule to get the new output S[x(t-3)].

figure                                         % Open a new blank figure window.
plot(t, y2);                                   % Plot the new output to compare it.
ylim([-0.01 0.2]);                             % Set the y-axis limits.
legend('S[x(t-3)]');                           % Label this graph to show it is the system's response to the shifted input.
% CONCLUSION: Looking at the graphs, y(t-3) and S[x(t-3)] are completely different. The system is TIME-VARIANT.

%% Theory: Time-Invariant Systems
% Now let's test a system that is time-invariant. The system rule is y(t) = 1 - 2*x(t - 1).
% Our input signal is a cosine wave that turns on for 10 seconds: x(t) = cos(t)[u(t) - u(t - 10)].
% We will use a delay of 4 seconds for our test.

% --- STEP 1: CALCULATE NORMAL OUTPUT AND SHIFT IT ---
t = -5:0.01:20;                                % Define our time vector from -5 to 20 seconds.
% The system rule says to use x(t-1), so our input pulse shifts from (0 to 10) to become (1 to 11).
xt = heaviside(t-1) - heaviside(t-11);         % Define the active window of the input inside the system.
y = 1 - 2*cos(t-1) .* xt;                      % Calculate the normal output y(t) based on the system's rule.
plot(t, y);                                    % Plot the normal output y(t).
legend('y(t)');                                % Add a legend.

figure                                         % Open a new blank figure window.
plot(t+4, y);                                  % Plot the output shifted by 4 seconds to the right, y(t-4).
legend('y(t-4)');                              % Label this graph as y(t-4).

% --- STEP 2: SHIFT THE INPUT FIRST, THEN CALCULATE NEW OUTPUT ---
% The pulse originally turned on at 0 and off at 10. Now it turns on at 4 and off at 14.
xt_shifted_input = heaviside(t-4) - heaviside(t-14); % Define the active window for the shifted input.
x_delayed = cos(t-4) .* xt_shifted_input;      % Define the full delayed input signal x(t-4).

figure                                         % Open a new blank figure window.
% Because the plot command uses (t+1) and the math uses (1 - 2*x), it effectively calculates S[x(t-4)].
plot(t+1, 1 - 2*x_delayed);                    % Plot the system's response to the delayed input.

% Alternatively, we can calculate the final shifted system response y2 directly with math:
xt_final = heaviside(t-5) - heaviside(t-15);   % The pulse shifts one more second inside the system, becoming 5 to 15.
y2 = 1 - 2*cos(t-5) .* xt_final;               % Calculate the final new output manually.

figure                                         % Open a new blank figure window.
plot(t, y2);                                   % Plot the new output y2.
legend('S[x(t-4)]');                           % Label it as the system's response to the shifted input.
% CONCLUSION: Looking at the graphs, y(t-4) and S[x(t-4)] are exactly the same! The system is TIME-INVARIANT.
