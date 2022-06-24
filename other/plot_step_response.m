clear all;
close all;

% load and prepare ang vel meas
meas = csvread('step_response/step_response.csv');
wz = meas(:,3);
wz = -wz;
wz = wz ./ 1000.0; % to rad/s

% create time vector
t = 0:(length(wz)-1);
t = t ./ 10.0; % convert to seconds
t = t';


% create duty cycle vector
a1 = 0;
t1 = 62;
dc = zeros(t1, 1) + a1;

a2 = 50;
t2 = 332;
dc = [dc; zeros(t2-t1-1, 1) + a2];

a3 = 0;
t3 = 596;
dc = [dc; zeros(t3-t2-1, 1) + a3];

a4 = 50;
t4 = 855;
dc = [dc; zeros(t4-t3-1, 1) + a4];

dc = [dc; zeros(length(wz) - length(dc), 1)];

% plot
font_size_title = 15;
font_size = 12;
time_step_size = 10;
y1_lim = [-10 100];
y2_lim = [-0.5 3.1];
y1_step_size = 10;
y2_step_size = 0.5;

hf = figure();
[hax, h1, h2] = plotyy(t, dc, t, wz);
xlabel("Vrijeme [s]");
ylabel(hax(1), "Duty cycle zamašnjaka [%]");
ylabel(hax(2), "Kutna brzina oko z-osi [rad/s]");
title("Odziv sustava na Step pobudu", "fontsize", font_size_title);
set(hax(1), "fontsize", font_size)
set(hax(2), "fontsize", font_size)
set(h1, "linewidth", 2)
set(h2, "linewidth", 1)
ylim(hax(1), y1_lim)
ylim(hax(2), y2_lim)
grid
xbounds = xlim();
set(hax, 'xtick', xbounds(1):time_step_size:xbounds(2))
ybounds1 = ylim(hax(1));
set(hax(1), 'ytick', ybounds1(1):y1_step_size:ybounds1(2))
ybounds2 = ylim(hax(2));
set(hax(2), 'ytick', ybounds2(1):y2_step_size:ybounds2(2))


% printing to pdf
print(hf, "step_response.png", '-dpng');
