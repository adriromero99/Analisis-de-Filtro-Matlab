s = tf('s');   
Hpasabajos = (2.51e9)/(s^2+ 7.12e4*s + 2.51e9)    
Hpasaltos = (s^2)/(s^2 +s*448.83 + 99461.4)
H = Hpasabajos*Hpasaltos
bode(Hpasaltos*Hpasabajos)