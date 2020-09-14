
clear all; 
close all;
clc; 


pkg load control
pkg load symbolic

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];

s = tf('s');
 
H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14)

%Respuesta al impulso
[y,t] = impulse(H);


figure(1)
plot(t, y,'linewidth',2,'color',xcyan);
title("Respuesta al impulso del sistema");
xlabel("Tiempo (s)");
ylabel("Tension (V)");
grid on
grid minor

%Respuesta al escalon
[y_step,t_step] = step(H);

figure(2)
plot(t_step, y_step,'linewidth',2,'color',xcyan);
title("Respuesta al escalon del sistema");
xlabel("Tiempo (s)");
ylabel("Tension (V)");
grid on
grid minor

%