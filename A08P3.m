clear;
clc;

pend([0 10], [pi 0], 200, 0.1);

function pend(inter, ic, n, d)
    h = (inter(2) - inter(1)) / n;  
    y = zeros(n+1, 2);              
    y(1, :) = ic;                   
    t = inter(1):h:inter(2);        

    figure; 
    axes; 
    xlim([-1.2 1.2]);
    ylim([-1.2 1.2]);
    axis square;  
    xlabel('x');
    ylabel('y');
    
    hold on;
    bob = plot(0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    rod = plot([0, 0], [0, -1], 'b-', 'LineWidth', 2);
    
    for k = 1:n
        y(k + 1, :) = trapstep(t(k), y(k, :), h, d);
        xbob = sin(y(k + 1, 1));
        ybob = -cos(y(k + 1, 1));
        set(rod, 'xdata', [0, xbob], 'ydata', [0, ybob]);
        set(bob, 'xdata', xbob, 'ydata', ybob);
        drawnow;
        pause(h);
    end
end

function y = trapstep(t, x, h, d)

    z1 = ydot(t, x, d);
    g = x + h * z1;
    z2 = ydot(t + h, g, d);
    y = x + h * (z1 + z2) / 2;
end

function z = ydot(t, y, d)
    g = 9.81; length = 1;  
    z = zeros(1,2);
    z(1) = y(2);
    z(2) = -(g / length) * sin(y(1)) - d * y(2);  
end
