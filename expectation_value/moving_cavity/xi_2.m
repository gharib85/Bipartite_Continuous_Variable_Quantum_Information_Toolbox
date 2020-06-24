function result = xi_2(t)

global information
omega_2 = information.omega_2;

result = exp(1i*omega_2*t) - 1;

end