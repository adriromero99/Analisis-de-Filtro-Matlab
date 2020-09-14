
clear all; 
close all;
clc; 


w0=50262.33
Q=0.7

C1= 4.7e-9

RparaleloIdeal = Q/(w0 * C1)
R1= 4.7e3
R2= 8.2e3
RparaleloLogrado = (R1 * R2)/(R1 + R2)

C2ideal= 1/(w0^2 * R1 * R2 * C1)
C2logrado = 2.2e-9 

s = tf('s')
Hpasabajos =  ( (1/(R1*R2*C1*C2logrado))*(1) )/ (s^2 + s*1/((RparaleloLogrado)*C1)+ (1/(R1*R2*C1*C2logrado)) ) 
bode(Hpasabajos)

%{
w0=314.19
Q=0.7

C1= 12e-9
C2= 68e-9

Cparalelo = (C1*C2)/(C1+C2);

R2= Q/(w0 * Cparalelo)
R1= 1/(w0 * Q *(C1+C2))

R2logrado = 220e3
R1logrado = 56e3

s = tf('s')
Hpasaaltos =   (s^2)/ (s^2 + s*1/((Cparalelo)*R2)+ (1/(R1logrado*R2logrado*C1*C2)) ) 
bode(Hpasaaltos)

%}