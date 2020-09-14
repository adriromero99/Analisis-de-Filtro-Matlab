
pkg load control
pkg load symbolic

clear all; 
close all;
clc; 

syms s
format long

polinomio =[1, 7.153e4, 2.558e9 , 1.13e12 ,2.494e14]
roots(polinomio)

polyval(polinomio, -3.554274191997564e+04 + 3.553893821079614e+04i)
polyval(polinomio, -2.222580800243902e+02 + 2.220871300663768e+02i)
