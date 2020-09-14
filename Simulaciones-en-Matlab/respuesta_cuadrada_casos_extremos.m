clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];
s = tf('s'); 

H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14);



w0 = 3973.965;
f0 = w0/(2*pi);

%cuadrada frecuencia muy baja



[cuad,t] = gensig("SQUARE" , 1000/f0 , 2000/f0); 
figure(5)
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',1,'color',xcyan)
hold on
plot(t,cuad,'linewidth', 1,'color','r')
axis([0, 3.5, -6e-3, 6e-3])
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada f0/1000")
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


%cuadrada frecuencia muy alta y comparacion con step
[y_step,t_step] = step(H);



[cuad,t] = gensig("SQUARE" , 1/(1000*f0) , 17000/(1000*f0)); 
figure(6)
[y_cuad,t_cuad] = lsim(H,cuad,t); 
plot(t_cuad,y_cuad, 'linewidth',2.5,'color',xcyan)
hold on
plot(t_step, y_step,'linewidth',1,'color','r');
xlabel("Tiempo [s]")
ylabel("Tension [V]")
title("Respuesta a la cuadrada 1000*f0")
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
