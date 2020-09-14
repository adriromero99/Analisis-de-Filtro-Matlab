
clear all; 
close all;
clc; 


pkg load control
pkg load symbolic

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];

s = tf('s');
 
H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14)

w0 = 3973.965;
f0 = w0/(2*pi);

%%
%%% Respuesta a senoidales

% genero senales
[sin_f0_10,t_f0_10] = gensig("SIN" , 100/f0 , 5*10/f0); 
[sin_10f0,t_10f0] = gensig("SIN" , 1/(10*f0) , 5*10/f0); 
[sin_f0,t_f0] = gensig("SIN" , 1/f0 , 5*10/f0); 

figure(7)
hold on
%genero respuestas a las senales
[y_sin_f0_10,t_sin_f0_10] = lsim(H,sin_f0_10,t_f0_10); 
%[y_sin_10f0,t_sin_10f0] = lsim(H,sin_10f0,t_10f0); 
%[y_sin_f0,t_sin_f0] = lsim(H,sin_f0,t_f0); 
% plots
plot(t_sin_f0_10,y_sin_f0_10, 'linewidth',2)
%plot(t_sin_10f0,y_sin_10f0, 'linewidth',2)
%plot(t_sin_f0,y_sin_f0, 'linewidth',2)

xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a senoidales")
legend(["f0"])
grid on
grid minor

hold off