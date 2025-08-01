INITIAL_ERROR = sqrt(2);

figure;
for iterations = 1:2
    interval = 0.01; % Sampling period ...essentially
    max = 20;        % Maximum number of "seconds"

    t = 0:interval:max;   % An array of points from 0 to 20 in intervals of "interval" seconds
    mass = 2;          % Mass
    d = 0;          % Noise signal
    y = mass * sin(t); % Part a of the homework says u = mw(t) + d(t), but I'm used to thinking
    % in terms of y and x, so I use these symbols to make sense
    % of what's going on and how to do this

    if(iterations == 1)
        g = 0.01;      % Gain value
    else
        g = 1;
    end


    m = zeros(1, max/interval); % technically, this is the unknown parameter
    % this is the mass estimate, this is an array that
    % starts with all 0's, but gets updated

    if(iterations == 1)
        error1 = [INITIAL_ERROR];   % Using an arbitrary number for the first error
    else
        error2 = [INITIAL_ERROR];
    end
    for i = 2:length(m)         % starting at i = 2 (like time = t1)
        f = sin(t(i-1));        % these are the measurable regressors
        e = (m(i-1) * f) - y(i-1);  % Measure the error between the previous prediction and the
        % Previous output
        m(i) = m(i-1) - (g * e * f);    % Update the parameter estimate

        if(iterations == 1)
            error1 = [error1, e];
        else
            error2 = [error2, e];
        end
    end

    plot(m);
    hold on;
end

title("Finding m when u = mw(t)");
xlabel("Estimated value of m");
ylabel("t");
legend("low gain", "high gain");


figure;
plot(error1);
hold on;
plot(error2);
xlabel("t");
ylabel("error");
title("Error vs time");
legend("low gain error", "high gain error");

figure;
plot(error1.^2);
hold on;
plot(error2.^2);
xlabel("t");
ylabel("error^2");
title("Squared error vs time");
legend("low gain error", "high gain error");

%% This section is the same as the previous one, but with the exception that the  d = sin(20*t);
figure;
for iterations = 1:2
    interval = 0.01; % Sampling period ...essentially
    max = 20;        % Maximum number of "seconds"

    t = 0:interval:max;   % An array of points from 0 to 20 in intervals of "interval" seconds
    mass = 2;          % Mass
    d = 0.5 * sin(20*t);          % Noise signal (0 for part a of the HW)
    y = mass * sin(t) + d; % Part a of the homework says u = mw(t) + d(t), but I'm used to thinking
    % in terms of y and x, so I use these symbols to make sense
    % of what's going on and how to do this

    if(iterations == 1)
        g = 0.01;      % Gain value
    else
        g = 1;
    end


    m = zeros(1, max/interval); % technically, this is the unknown parameter
    % this is the mass estimate, this is an array that
    % starts with all 0's, but gets updated
    if(iterations == 1)
        error1 = [INITIAL_ERROR];   % Using an arbitrary number for the first error
    else
        error2 = [INITIAL_ERROR];
    end

    for i = 2:length(m)         % starting at i = 2 (like time = t1)
        f = sin(t(i-1));        % these are the measurable regressors
        e = (m(i-1) * f) - y(i-1);  % Measure the error between the previous prediction and the
        % Previous output
        m(i) = m(i-1) - (g * e * f);    % Update the parameter estimate
        if(iterations == 1)
            error1 = [error1, e];
        else
            error2 = [error2, e];
        end

    end

    plot(m);

    hold on;


end

xlabel("Estimated value of m");
ylabel("t");
legend("low gain", "high gain")