
xcyan = (1/255)*[0,153,153];
dblue = (1/255)*[0,0,51];

t = linspace(0,0.0002);
%IMPULSO
y = exp(-35544.0*t).* ( cos(35544.0*t).*(447.4) + sin(35544.0*t).*(71554) ) +  exp(-222.2*t).* ( cos(222.1*t).*(-447.4) + sin(222.1*t).*(-2.462) );

figure(1)
plot(t, y,'linewidth',2,'color',xcyan);
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


%ESCALON
t_step = linspace(0,0.02);
y_step = exp(-35544.0*t_step) .* (- cos(35544.0*t_step) *(1.0128) - sin(35544.0*t_step) .*(1.001) ) + exp(-222.2*t_step) .* ( cos(222.1*t_step) .* (1.0128) - sin(222.1*t_step) * (1.001));

figure(2)
plot(t_step, y_step,'linewidth',2,'color',xcyan);
title("Respuesta al escalon del sistema");
xlabel("Tiempo (s)");
ylabel("Tension (V)");
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