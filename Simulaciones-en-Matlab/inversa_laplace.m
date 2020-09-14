
clear all; 
close all;
clc; 


pkg load control
pkg load symbolic

syms s;
H = (s^2) /(s^4 + s^3 * 7.153e4 + s^2 * 2.558e9 + s * 1.13e12 + 2.494e14)

H1 = s^2/ 

ilaplace(H)