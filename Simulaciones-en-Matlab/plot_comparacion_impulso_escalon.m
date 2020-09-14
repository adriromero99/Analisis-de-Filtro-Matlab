clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];
s = tf('s'); 

H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14);
 
%rta al impulso:

[y,t] = impulse(H);
[y_step,t_step] = step(H);
y_step = 2e4 * y_step;
figure(1)
plot(t, y,'linewidth',2,'color',xcyan);
hold on;
plot(t_step, y_step,'linewidth',2,'color', 'r');
title("Comparacion entre respuestas impulso - escalon");
xlabel("Tiempo (s)");
ylabel("Tension (V)");
grid on
grid minor


axis([0, 2e-4, -0.5e4, 2.5e4])
ax = gca;
set(gca, 'color', dblue);
set(gcf, 'color', dblue);
ax.Title.Color = 'white';
ax.XLabel.Color = 'white';
ax.YLabel.Color = 'white';
ax.XColor = 'white';
ax.YColor = 'white';
ax.GridAlpha = 0.5;
ax.GridColor = 'white';
ax.MinorGridColor = 'white';
ax.MinorGridAlpha = 0.5;

hold off;


