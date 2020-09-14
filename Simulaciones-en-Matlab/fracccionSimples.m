
clear all;  
close all;
clc; 

syms s;
w0 = 3973.93

Vin = w0/(s^2 + w0^2)
H  = (s^2 * 2.527e9) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14);

vpa(partfrac(H*Vin, s, 'FactorMode','real'),5)