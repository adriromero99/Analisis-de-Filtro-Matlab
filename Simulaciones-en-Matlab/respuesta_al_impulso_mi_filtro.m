
clear all; 
close all;
clc; 

xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];




C1 = 820e-9
C2 = 6.8e-9
R1 = 10e3
R2 = 12e3
R3 = 330e3
Rparalelo = (R1*R2)/(R1+R2)

C3 = 10e-9
C4 = 1.5e-9
R4 = 3.9e3
R5 = 6.8e3
R6 = 10e3 
Rparalelox = (R4*R5)/(R4+R5)

syms s;
H1 = -s*(1/(R1*C2)) / (s^2 + s*(C1+C2)/(C2*C1*R3) + 1/(Rparalelo*R3*C1*C2) );
H2 = -s*(1/(R4*C4)) / (s^2 + s*(C3+C4)/(C4*C3*R6) + 1/(Rparalelox*R6*C3*C4) );
H = vpa(simplify(H1*H2),7)


s = tf('s'); 
H1 = -s*(1/(R1*C2)) / (s^2 + s*(C1+C2)/(C2*C1*R3) + 1/(Rparalelo*R3*C1*C2) )


H2 = -s*(1/(R4*C4)) / (s^2 + s*(C3+C4)/(C4*C3*R6) + 1/(Rparalelox*R6*C3*C4) )

bode(H2)

%rta al impulso:
%{
[y,t] = impulse(H);
figure(1)
plot(t, y,'linewidth',2,'color',xcyan);
title("Respuesta al impulso del filtro con componentes normalizados");
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

figure(2)
plot(t_step, y_step,'linewidth',2,'color',xcyan);
title("Respuesta al escalon del filtro con componentes normalizados");
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
%}