function result = xi_1(t)

global information
omega_1 = information.omega_1;

result = exp(1i*omega_1*t) - 1;

end