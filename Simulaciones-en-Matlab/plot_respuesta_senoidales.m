clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];
s = tf('s'); 

H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14);


w0 = 3973.965;
f0 = w0/(2*pi);

syms t;

rta_f0 = exp(-35500*t)*(0.1*cos(35583.67*t) + 2.5e-3 * sin(35583.67*t) )- exp(-222.2*t)*(0.1*cos(222.1*t)+ 2.5e-3 * sin(222.1*t))+sin(w0*t);
t = 0::0.01;
y = sin(x);
plot(x,y)

% genero senales
[sin_f0,t_f0] = gensig("SIN" , 1/f0 , 5*10/f0); 



figure(1)
hold on
[y_sin_f0,t_sin_f0] = lsim(H,sin_f0,t_f0);
plot(t_sin_f0,y_sin_f0, 'linewidth',3)

xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a senoidal en frecuencia: f0 = 632.47hZ")
axis([0, 0.01, -1.5, 1.5])
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


hold off

w0 = 314;
f0 = w0/(2*pi);

[sin_f0_10,t_f0_10] = gensig("SIN" , 1/f0 , 50/f0); 

%respuesta senoidal 2 en frecuencia w = 314
figure(2)
hold on
[y_sin_f0_10,t_sin_f0_10] = lsim(H,sin_f0_10,t_f0_10); 
plot(t_sin_f0_10,y_sin_f0_10, 'linewidth',3)

xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a senoidal en frecuencia: f0 = 314/2*pi = 50Hz")
axis([0, 0.08, -1.5, 1.5])
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


hold off

w0 = 100;
f0 = w0/(2*pi);

[sin_10f0,t_10f0] = gensig("SIN" , 1/(f0) , 5/f0); 
%respuesta senoidal 3
figure(3)
hold on
[y_sin_10f0,t_sin_10f0] = lsim(H,sin_10f0,t_10f0); 
plot(t_sin_10f0,y_sin_10f0, 'linewidth',3)

xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a senoidal en frecuencia: f0 = 100/2pi = 15.91Hz ")
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


hold off



