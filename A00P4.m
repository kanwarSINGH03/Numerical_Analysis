clear;
clc;

%defining variables
P_outside = 1;%in atm
p = 1000; %density
g = 32.2; % acc due to gravity in ft/s^2
h = 7; %height

%conversion factors
ft_to_m = 0.3048;
yd_to_m = 0.9144;
atm_to_Pa = 1.013E5;

P_abs = p * (ft_to_m*g) * (yd_to_m*h) + (atm_to_Pa*P_outside);

disp(['P_abs is ' num2str(P_abs)]);


