function result=eta_2(t)

global information
omega_2 = information.omega_2;

result = 1 - exp(-1i*omega_2*t);

end