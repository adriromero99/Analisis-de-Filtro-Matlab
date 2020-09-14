
clear all;  
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];

s = tf('s');
 
H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14)

type RespuestaACuadradaf_0TXT.txt;
type RespuestaACuadrada10f_0TXT.txt;
type RespuestaACuadradaf_0_10TXT.txt;

Data_f0 = readmatrix('RespuestaACuadradaf_0TXT.txt');
Data_10f0 = readmatrix('RespuestaACuadrada10f_0TXT.txt');
Data_f0_10 = readmatrix('RespuestaACuadradaf_0_10TXT.txt');

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
hold on
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',3,'color',xcyan)
[y_cuad_creado, t_cuad_creado] = lsim(Hcreado, cuad, t);
plot(t_cuad_creado, y_cuad_creado, 'linewidth',1,'color','r')
plot(Data_f0(:,1), Data_f0(:,2), 'linewidth',0.2,'color', 'g' )
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
hold on
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',5,'color',xcyan)
[y_cuad_creado, t_cuad_creado] = lsim(Hcreado, cuad, t);
t_Sh = t_cuad_creado;
y_Sh = y_cuad_creado;

plot(t_cuad_creado, y_cuad_creado, 'linewidth',2,'color','r')
plot(t_Sh, y_Sh, 'linewidth',0.2,'color','g')
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada f0/10")
grid on
grid minor
axis([0, 0.03, -1.5, 1.5])

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

%%
% Defino una cuadrada de periodo 10f0 y dura 5 periodos
[cuad,t] = gensig("SQUARE" , 1/(10*f0) , 10/(10*f0)); 
%Ahora busco la respuesta al filtro con esto:
figure(6)
hold on
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',3,'color',xcyan)
[y_cuad_creado, t_cuad_creado] = lsim(Hcreado, cuad, t);

plot(Data_10f0(:,1), Data_10f0(:,2), 'linewidth',0.2,'color', 'g' )
plot(t_cuad_creado, y_cuad_creado, 'linewidth',1,'color','r')

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