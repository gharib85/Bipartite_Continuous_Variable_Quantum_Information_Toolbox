function result = expected_a_3_a_1(t)

% \langle \hat{a_3}(t) \hat{a_1} \rangle

global information
alpha = information.alpha;
alpha2 = information.alpha2;
beta2 = information.beta2;
r_a = information.r_a;
k = information.k;
k2 = information.k2;
nbar = information.nbar;

result = alpha.*A(t).*k.*eta(t).*exp( -1i*( r_a*t + B(t) ) ).*exp( -k2*eta_modulus_squared(t)*(nbar + 0.5) ).*( nbar + 1 + alpha2*exp(-2*1i*B(t)) - beta2*exp(2*1i*B(t)) );

end