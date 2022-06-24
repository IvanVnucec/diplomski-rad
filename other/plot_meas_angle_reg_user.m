clear all;
close all;

% load and prepare ang vel meas
meas = csvread('measurements/angle_regulation_input.csv');

meas = meas(1240:end,:,:);

angle_ref = meas(:,1);
angle = meas(:,2);
cntrl = meas(:,3);

% create time vector
t = 0:(length(angle_ref)-1);
t = t ./ 10.0; % convert to seconds
t = t';

a = [angle_ref, angle];

% plot
font_size_title = 15;
font_size = 12;
time_step_size = 10;
y1_lim = [-180 180];
y2_lim = [-2000 2000];
y1_step_size = 20;
y2_step_size = 500;

hf = figure();
[hax, h1, h2] = plotyy(t, a, t, cntrl);
xlabel("Vrijeme [s]");
ylabel(hax(1), "Eulerov kut oko z-osi [stupnjevi]");
ylabel(hax(2), "Izlaz iz regulatora (DC) [%]");
title("Odziv sustava na promjenu referentnog Eulerovog kuta", "fontsize", font_size_title);
set(hax(1), "fontsize", font_size)
set(hax(2), "fontsize", font_size)
set(h1, "linewidth", 2)
set(h2, "linewidth", 1)
ylim(hax(1), y1_lim)
ylim(hax(2), y2_lim)
legend('Referentni Eulerov kut', 'Izmjeren Eulerov kut', 'Izlaz regulatora')
grid
xbounds = xlim();
set(hax, 'xtick', xbounds(1):time_step_size:xbounds(2))
ybounds1 = ylim(hax(1));
set(hax(1), 'ytick', ybounds1(1):y1_step_size:ybounds1(2))
ybounds2 = ylim(hax(2));
set(hax(2), 'ytick', ybounds2(1):y2_step_size:ybounds2(2))

% printing to png
print(hf, "angle_reg_user.png", '-dpng');
