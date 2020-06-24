function result = expected_a_3_a_2(t)

% \langle \hat{s_3}(t) \hat{a_2} \rangle

global information
beta = information.beta;
alpha2 = information.alpha2;
beta2 = information.beta2;
r_b = information.r_b;
k = information.k;
k2 = information.k2;
nbar = information.nbar;

result = -beta.*Beautiful_B(t).*k.*eta(t).*exp( -1i*( r_b*t + B(t) ) ).*exp( -k2*eta_modulus_squared(t)*(nbar + 0.5) ).*( nbar + 1 + beta2*exp(-2*1i*B(t)) - alpha2*exp(2*1i*B(t)) );

end