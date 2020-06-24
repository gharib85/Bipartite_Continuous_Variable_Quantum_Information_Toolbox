function result = B_2(t)

% Mathematical function B(t)

global information
k_2 = information.k_2;
omega_2 = information.omega_2;

result = -k_2^2*( omega_2*t - sin(omega_2*t) );

end