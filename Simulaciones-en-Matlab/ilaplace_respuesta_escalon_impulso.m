
clear all; 
close all;
clc; 

syms s 
H = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14);

respuesta_impulso = ilaplace(H);
respuesta_impulso = vpa(respuesta_impulso, 4)

respuesta_escalon = ilaplace(H/s);
respuesta_escalon = vpa(respuesta_escalon,4)
