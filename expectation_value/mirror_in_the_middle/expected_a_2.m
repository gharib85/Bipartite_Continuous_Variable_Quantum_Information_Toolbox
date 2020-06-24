function result = expected_a_2(t)

% \langle \hat{a_2}(t) \rangle

global information
beta = information.beta;     % coherent state number on system B (at t=0)
alpha2 = information.alpha2; % modulus of alpha squared
beta2 = information.beta2;   % modulus of beta squared
r_b = information.r_b;       % omega_b / omega_m
k2 = information.k2;         % k squared (k is the optomechanicl coupling)
nbar = information.nbar;     % occupation number of thermal state

result = beta.*exp( -1i*(r_b*t+B(t)) ).*exp( -alpha2*(1-exp(2*1i*B(t))) ).*exp( -beta2*(1-exp(-2*1i*B(t))) ).*exp( -k2*xi_modulus_squared(t)*(nbar+1.0/2.0) );

end