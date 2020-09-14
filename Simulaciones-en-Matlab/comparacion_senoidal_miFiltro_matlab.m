clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];
s = tf('s'); 

H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14);
Hpasabajos = (2.51e9)/(s^2+ 7.12e4*s + 2.51e9);    
Hpasaltos = (s^2)/(s^2 +s*448.83 + 99461.4);

Hcreado = Hpasabajos * Hpasaltos;

Data_f0 = readmatrix('RespuestaASenoidalf_0TXT.txt');
Data_15Hz = readmatrix('RespuestaASenoidal15HzTXT.txt');
Data_f0_10 = readmatrix('RespuestaASenoidalf_0_10TXT.txt');

w0 = 3973.965;
f0 = w0/(2*pi);

% genero senales
[sin_f0,t_f0] = gensig("SIN" , 1/f0 , 5*10/f0); 



figure(1)
hold on
[y_sin_f0,t_sin_f0] = lsim(H,sin_f0,t_f0);
plot(t_sin_f0,y_sin_f0, 'linewidth',4, 'color', xcyan)
[y_sen_creado, t_sen_creado] = lsim(Hcreado, sin_f0, t_f0);
plot(t_sen_creado, y_sen_creado, 'linewidth',2,'color','r')
plot(Data_f0(:,1), Data_f0(:,2), 'linewidth',0.2,'color', 'g' )

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

%50 HZ
w0 = 314;
f0 = w0/(2*pi);

[sin_f0_10,t_f0_10] = gensig("SIN" , 1/f0 , 50/f0); 

%respuesta senoidal 2 en frecuencia w = 314
figure(2)
hold on
[y_sin_f0_10,t_sin_f0_10] = lsim(H,sin_f0_10,t_f0_10); 
plot(t_sin_f0_10,y_sin_f0_10, 'linewidth',4,'color', xcyan)
[y_sen_creado, t_sen_creado] = lsim(Hcreado, sin_f0_10, t_f0_10);
plot(t_sen_creado, y_sen_creado, 'linewidth',2,'color','r')
plot(Data_f0_10(:,1), Data_f0_10(:,2), 'linewidth',0.2,'color', 'g' )

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
plot(t_sin_10f0,y_sin_10f0, 'linewidth',4,'color', xcyan)
[y_sen_creado, t_sen_creado] = lsim(Hcreado, sin_10f0, t_10f0);
plot(t_sen_creado, y_sen_creado, 'linewidth',2,'color','r')
plot(Data_15Hz(:,1), Data_15Hz(:,2), 'linewidth',0.2,'color', 'g' )
axis([0, 0.35, -1, 1])

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



