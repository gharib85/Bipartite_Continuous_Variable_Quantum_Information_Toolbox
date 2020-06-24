function result = B_1(t)

% Mathematical function B(t)

global information
k_1 = information.k_1;
omega_1 = information.omega_1;

result = -k_1^2*( omega_1*t - sin(omega_1*t) );

end