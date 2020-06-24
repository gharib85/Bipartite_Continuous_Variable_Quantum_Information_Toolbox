function result=eta_1(t)

global information
omega_1 = information.omega_1;

result = 1 - exp(-1i*omega_1*t);

end