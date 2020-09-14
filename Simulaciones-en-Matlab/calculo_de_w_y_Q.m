
pkg load control
pkg load symbolic

clear all; 
close all;
clc; 

syms s
format long

raiz1 = -3.554274191997564e+04 + 3.553893821079614e+04i
raiz2 = -3.554274191997564e+04 - 3.553893821079614e+04i
raiz3 = -2.222580800243902e+02 + 2.220871300663768e+02i
raiz4 = -2.222580800243902e+02 - 2.220871300663768e+02i


%Podemos calcular W y Q descomponiendo el denominador en polinomios de grado 2
%PolinomioA: s^2 + s * Wa/Qa + Wa^2 = s^2 - s *(raiz1+raiz2) + raiz1*raiz2
%PolinomioB: s^2 + s * Wb/Qb + Wb^2 = s^2 - s *(raiz3+raiz4) + raiz3*raiz4

Wa = sqrt(raiz1 * raiz2)
Wb = sqrt(raiz3 * raiz4)
Qa = -Wa/(raiz1 + raiz2)
Qb = -Wb/(raiz3 + raiz4)
 
