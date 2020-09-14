clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];
s = tf('s'); 

H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14);

w0 = 3973.965;
f0 = w0/(2*pi);

%%% Respuesta a la cuadrada 1
[cuad,t] = gensig("SQUARE" , 1/f0 , 10/f0); 
figure(4)
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',2,'color',xcyan)
hold on
plot(t,cuad, 'color','r')
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada f0 = 632.47hZ")
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


%cuadrada 2
[cuad,t] = gensig("SQUARE" , 10/f0 , 20/f0); 
figure(5)
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',2,'color',xcyan)
hold on
plot(t,cuad,'color','r')
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada f0/10 = 63.247hZ")
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


%cuadrada 3
[cuad,t] = gensig("SQUARE" , 1/(10*f0) , 20/(10*f0)); 
figure(6)
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',2,'color',xcyan)
hold on
plot(t,cuad,'color','r')
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada 10*f0 = 6324.7hZ")
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
