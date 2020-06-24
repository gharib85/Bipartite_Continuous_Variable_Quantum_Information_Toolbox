function result = expected_a_1_a_1(t)

% \langle \hat{a_1}^2(t) \rangle
% Expected value of anihilation operator squared at time t

global information
alpha = information.alpha;
alpha2 = information.alpha2;
r_a = information.r_a;
beta2 = information.beta2;
k2 = information.k2;
nbar = information.nbar;

result = alpha^2.*exp(-2*1i*r_a*t).*exp(-4*1i*B(t)).*exp( -alpha2*(1-exp(-4*1i*B(t))) ).*exp( -beta2*(1-exp(4*1i*B(t))) ).*exp(-k2*xi_modulus_squared(t)*(4.0*nbar+2));

end