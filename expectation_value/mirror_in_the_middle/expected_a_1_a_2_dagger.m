function result = expected_a_1_a_2_dagger(t)

% \langle \hat{a_1}\hat{a_2}^\dagger(t) \rangle

global information
alpha = information.alpha;
alpha2 = information.alpha2;
beta2 = information.beta2;
conj_beta = information.conj_beta;
r_a = information.r_a;
r_b = information.r_b;
k2 = information.k2;
nbar = information.nbar;

result = alpha*conj_beta*exp( +1i*(r_b-r_a)*t ).*exp( -alpha2*(1-exp(-4*1i*B(t))) ).*exp( -beta2*(1-exp(4*1i*B(t))) ).*exp(-2*k2*xi_modulus_squared(t)).*exp(-4.0*nbar*k2*xi_modulus_squared(t));

end