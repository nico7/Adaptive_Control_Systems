figure;
for iterations = 1:2
    interval = 0.01; % Sampling period ...essentially
    max = 20;        % Maximum number of "seconds"

    t = 0:interval:max;   % An array of points from 0 to 20 in intervals of "interval" seconds
    d = 0;          % Noise signal (0 for part a of the HW)
    y = 1 + 0.5 * sin(0.5) * sin(t); 
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
    out = [0];

    for i = 2:length(m)         % starting at i = 2 (like time = t1)
        f = sin(t(i-1));        % these are the measurable regressors
        e = (m(i-1) * f) - y(i-1);  % Measure the error between the previous prediction and the
        % Previous output
        m(i) = m(i-1) - (g * e * f);    % Update the parameter estimate
        out = [out, f*m(i)];        % Save the new parameter predictions in an arraw
    end

    plot(m);
    hold on;
    plot(1 + 0.5*sin(0.5*t), 'LineStyle','--');
    xlabel("Estimated value of m");
    ylabel("t");
    legend("low gain", "high gain", "actual value");
   


end

%% This section is the same as the previous one, but with the exception that the  d = sin(20*t);
figure;
for iterations = 1:2
    interval = 0.01; % Sampling period ...essentially
    max = 20;        % Maximum number of "seconds"

    t = 0:interval:max;   % An array of points from 0 to 20 in intervals of "interval" seconds
    d = 0.5 * sin(20*t);          % Noise signal (0 for part a of the HW)
    y = 1 + 0.5 * sin(0.5) * sin(t); 
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
    out = [0];

    for i = 2:length(m)         % starting at i = 2 (like time = t1)
        f = sin(t(i-1));        % these are the measurable regressors
        e = (m(i-1) * f) - y(i-1);  % Measure the error between the previous prediction and the
        % Previous output
        m(i) = m(i-1) - (g * e * f);    % Update the parameter estimate
        out = [out, f*m(i)];        % Save the new parameter predictions in an arraw
    end

    plot(m);
    plot(1 + 0.5*sin(0.5*t), 'LineStyle','--');
    xlabel("Estimated value of m");
    ylabel("t");
    legend("low gain", "high gain", "actual value");
    hold on;


end