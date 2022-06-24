clear all;
close all;

% load and prepare ang vel meas
meas = csvread('measurements/angle_regulation_input.csv');

meas = meas(1240:end,:,:);

angle_ref = meas(:,1);
angle = meas(:,2);
cntrl = meas(:,3);

% create time vector
t = 1:length(angle_ref);
t = t ./ 10.0; % convert to seconds
t = t';

a = [angle_ref, angle];

% plot
font_size_title = 15;
font_size = 12;

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
ylim(hax(1), [-180 180])
ylim(hax(2), [-1800 1800])
legend('Referentni Eulerov kut', 'Izmjeren Eulerov kut', 'Izlaz regulatora')

% printing to png
print(hf, "angle_reg_user.png", '-dpng');
