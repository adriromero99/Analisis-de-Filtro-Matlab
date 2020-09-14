
clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];
s = tf('s'); 

type RespuestaAlEscalonTXT.txt;
escalon = readmatrix('RespuestaAlEscalonTXT.txt');
t_escalon = escalon(:,1);
y_escalon = escalon(:,2);

Hpasabajos = (2.51e9)/(s^2+ 7.12e4*s + 2.51e9);    
Hpasaltos = (s^2)/(s^2 +s*448.83 + 99461.4);

Hcreado = Hpasabajos * Hpasaltos;

H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14);
 
%rta al impulso:

[y,t] = impulse(H);
[y_conseguido, t_conseguido] = impulse(Hcreado);
figure(1)
plot(t, y,'linewidth',3,'color',xcyan);
hold on;
plot(t_conseguido, y_conseguido,'linewidth',1,'color','r');
hold off;
title("Respuesta al impulso del sistema");
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

% Respuesta al escalon
[y_step,t_step] = step(H);
[y_stepConseguido, t_stepConseguido] = step(Hcreado);

figure(2)
plot(t_step, y_step,'linewidth',5,'color',xcyan);
hold on;
plot(t_stepConseguido, y_stepConseguido,'linewidth',1,'color','r')
plot(t_escalon, y_escalon, 'linewidth',0.5,'color','g')
title("Respuesta al escalon del sistema");
xlabel("Tiempo (s)");
ylabel("Tension (V)");
grid on
grid minor

axis([0, 0.02, -0.4, 1])
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