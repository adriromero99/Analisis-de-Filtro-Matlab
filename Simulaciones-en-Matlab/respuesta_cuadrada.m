
clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];

s = tf('s');
 
H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14)

Hpasabajos = (2.51e9)/(s^2+ 7.12e4*s + 2.51e9);    
Hpasaltos = (s^2)/(s^2 +s*448.83 + 99461.4);

Hcreado = Hpasabajos * Hpasaltos;

%%

w0 = 3973.965;
f0 = w0/(2*pi);
%%% Respuesta a la cuadrada
% Defino una cuadrada de periodo 1/f0 y dura 10 periodos
[cuad,t] = gensig("SQUARE" , 1/f0 , 20/f0); 
%Ahora busco la respuesta al filtro con esto:
figure(4)
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',3,'color',xcyan)
[y_cuad_creado, t_cuad_creado] = lsim(Hcreado, cuad, t);
hold on
plot(t_cuad_creado, y_cuad_creado, 'linewidth',1,'color','r')
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada f0")
grid on
grid minor
hold off

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


%%
% Defino una cuadrada de periodo 10/f0 y dura 5 periodos TIENE MAS PERIODO,
% MENOS FRECUENCIA
[cuad,t] = gensig("SQUARE" , 10/f0 , 30/f0); 
%Ahora busco la respuesta al filtro con esto:
figure(5)
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',3,'color',xcyan)
[y_cuad_creado, t_cuad_creado] = lsim(Hcreado, cuad, t);
hold on
plot(t_cuad_creado, y_cuad_creado, 'linewidth',1,'color','r')
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada f0/10")
grid on
grid minor
hold off

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



%%
% Defino una cuadrada de periodo 10f0 y dura 5 periodos
[cuad,t] = gensig("SQUARE" , 1/(10*f0) , 10/(10*f0)); 
%Ahora busco la respuesta al filtro con esto:
figure(6)
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',3,'color',xcyan)
[y_cuad_creado, t_cuad_creado] = lsim(Hcreado, cuad, t);
hold on
plot(t_cuad_creado, y_cuad_creado, 'linewidth',1,'color','r')
%plot(t,cuad,'color','r')
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada 10f0")
grid on
grid minor
hold off

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