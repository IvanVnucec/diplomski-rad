clear all;
close all;

% load and prepare ang vel meas
meas = csvread('measurements/ang_vel_regulation_input.csv');

meas = meas(170:1300,:,:);

wz_ref = meas(:,1);
wz_ref = wz_ref ./ 1000.0; % to rad/s

wz = meas(:,2);
wz = wz ./ 1000.0; % to rad/s

cntrl = meas(:,3);

% create time vector
t = 1:length(wz_ref);
t = t ./ 10.0; % convert to seconds
t = t';

w = [wz_ref, wz];

% plot
font_size_title = 15;
font_size = 12;

hf = figure();
[hax, h1, h2] = plotyy(t, w, t, cntrl);
xlabel("Vrijeme [s]");
ylabel(hax(1), "Kutna brzina oko z-osi [rad/s]");
ylabel(hax(2), "Izlaz iz regulatora (DC) [%]");
title("Odziv sustava na promjenu referentne kutne brzine", "fontsize", font_size_title);
set(hax(1), "fontsize", font_size)
set(hax(2), "fontsize", font_size)
set(h1, "linewidth", 2)
set(h2, "linewidth", 1)
ylim(hax(1), [-1.1 1.1])
ylim(hax(2), [-100 100])
legend('Referentna kutna brzina', 'Izmjerena kutna brzina', 'Izlaz regulatora')

% printing to pdf
print(hf, "ang_vel_reg_user.png", '-dpng');
