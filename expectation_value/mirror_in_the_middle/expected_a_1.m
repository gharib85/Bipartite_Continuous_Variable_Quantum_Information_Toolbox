function result = expected_a_1(t)

% \langle \hat{a_1}(t) \rangle

global information
alpha = information.alpha;
alpha2 = information.alpha2; % modulus of alpha squared
r_a = information.r_a;
beta2 = information.beta2;   % modulus of beta squared
k2 = information.k2;         % k squared (real number, so it doesn't matter !)
nbar = information.nbar;

result = alpha.*exp( -1i*(r_a*t+B(t)) ).*exp( -alpha2*(1-exp(-2*1i*B(t))) ).*exp( -beta2*(1-exp(2*1i*B(t))) ).*exp( -k2*xi_modulus_squared(t)*(nbar+1.0/2.0) );

end