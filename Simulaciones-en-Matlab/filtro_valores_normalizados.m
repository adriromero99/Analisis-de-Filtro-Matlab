clear all; 
close all;
clc; 

s = tf('s');

C1 = 820e-9
C2 = 6.8e-9
R1 = 10e3
R2 = 12e3
R3 = 330e3
Rparalelo = (R1*R2)/(R1+R2)

H1 = -s*(1/(R1*C2)) / (s^2 + (C1+C2)/(C2*C1*R3)*s + 1/(Rparalelo*R3*C1*C2) )


C3 = 10e-9
C4 = 1.5e-9
R4 = 3.9e3
R5 = 6.8e3
R6 = 10.0e3 %PREGUNTAR SI ES POSIBLE UTILIZAR 10.5 PORQUE EL PEAK RESPONSE SE ALEJA MUCHO
Rparalelox = (R4*R5)/(R4+R5)


H2 = -s*(1/(R4*C4)) / (s^2 + (C3+C4)/(C4*C3*R6)*s + 1/(Rparalelox*R6*C3*C4) )


H = H1*H2

bode(H)



Wa= sqrt(1/(Rparalelo*R3*C1*C2) )
Wb= sqrt(1/(Rparalelox*R6*C3*C4) )
Wcorte = sqrt(Wa*Wb)




