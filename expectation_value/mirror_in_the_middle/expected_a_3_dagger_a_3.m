function result = expected_a_3_dagger_a_3(t)

% \langle \hat{a_3}(t)^\dagger \hat{a_3}(t) \rangle 

global information
alpha2 = information.alpha2;
beta2 = information.beta2;
k2 = information.k2;
nbar = information.nbar;

result = nbar + k2*( alpha2 + beta2 + (alpha2 - beta2)^2 )*eta_modulus_squared(t);

end