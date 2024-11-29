clear;
clc;

    % Initial plot setup
    figure;
    plot([-1 1],[0,0],'k',[0 0],[-1 1],'k'); hold on;
    t = 0:.02:1;

    % Predefined points and control points
    x = [-1; -1; 1; 1];
    y = [0; 2; 2; 0];

    % Plot initial spline with control points
    plot([x(1) x(2)], [y(1) y(2)], 'r:', x(2), y(2), 'rs');
    plot([x(3) x(4)], [y(3) y(4)], 'r:', x(3), y(3), 'rs');
    plot(x(1), y(1), 'bo', x(4), y(4), 'bo');

    % Calculate and plot the initial spline
    bx = 3*(x(2)-x(1)); by = 3*(y(2)-y(1));
    cx = 3*(x(3)-x(2))-bx; cy = 3*(y(3)-y(2))-by;
    dx = x(4)-x(1)-bx-cx; dy = y(4)-y(1)-by-cy;
    xp = x(1) + t.*(bx + t.*(cx + t.*dx));
    yp = y(1) + t.*(by + t.*(cy + t.*dy));
    plot(xp, yp, 'b');

    % Loop for additional user input to extend or modify the curve
    while true
        [xnew, ynew] = ginput(3);  % get three new mouse clicks
        if length(xnew) < 3
            break;  % if fewer than 3 points, exit loop
        end
        x = [x(4); xnew];  % update points, keeping the last as first
        y = [y(4); ynew];
        
        % Plot new control points and line segments
        plot([x(1) x(2)], [y(1) y(2)], 'r:', x(2), y(2), 'rs');
        plot([x(3) x(4)], [y(3) y(4)], 'r:', x(3), y(3), 'rs');
        plot(x(1), y(1), 'bo', x(4), y(4), 'bo');
        
        % Calculate and plot new spline segment
        bx = 3*(x(2)-x(1)); by = 3*(y(2)-y(1));
        cx = 3*(x(3)-x(2))-bx; cy = 3*(y(3)-y(2))-by;
        dx = x(4)-x(1)-bx-cx; dy = y(4)-y(1)-by-cy;
        xp = x(1) + t.*(bx + t.*(cx + t.*dx));
        yp = y(1) + t.*(by + t.*(cy + t.*dy));
        plot(xp, yp, 'b');
    end

    hold off;

