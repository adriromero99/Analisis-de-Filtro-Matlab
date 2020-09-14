clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];

s = tf('s');
syms t;

escalon_analitica = exp(-222.2.*t).*(1.011.*cos(222.1.*t)-0.99.*sin(222.1.*t)) - exp(-35500.*t).*(1.011.*cos(35583.67.*t)-1.009.*sin(35583.67.*t));
impulso_analitica = -exp(-222.2.*t).*(447.8.*cos(222.1.*t)+1.52.*sin(222.1.*t)) + exp(-35500.*t).*(447.8.*cos(35583.67.*t)+71467.6.*sin(35583.67.*t));
 
te = 0:0.00001:0.02;
ti = 0:0.0000001:0.0002;

ye = exp(-222.2.*te).*(1.011.*cos(222.1.*te)-0.99.*sin(222.1.*te)) -exp(-35500.*te).*(1.011.*cos(35583.67.*te)+1.009.*sin(35583.67.*te));
yi = -exp(-222.2.*ti).*(447.8.*cos(222.1.*ti)+1.52.*sin(222.1.*ti)) + exp(-35500.*ti).*(447.8.*cos(35583.67.*ti)+71467.6.*sin(35583.67.*ti));

H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14)

%Respuesta al impulso
[y,t] = impulse(H);


figure(1)
plot(t, y,'linewidth',3,'color',xcyan);
hold on;
plot(ti,yi, 'linewidth',1, 'color', 'r')
hold off;

title("Respuesta al impulso del sistema");
xlabel("Tiempo (s)");
ylabel("Tension (V)");
grid on
grid minor
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

%Respuesta al escalon
[y_step,t_step] = step(H);

figure(2)
plot(t_step, y_step,'linewidth',3,'color',xcyan);
hold on;
plot(te,ye, 'linewidth',1, 'color', 'r')
hold off;
title("Respuesta al escalon del sistema");
xlabel("Tiempo (s)");
ylabel("Tension (V)");
grid on
grid minor
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


%