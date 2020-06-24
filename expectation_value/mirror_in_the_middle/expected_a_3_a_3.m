function result = expected_a_3_a_3(t)

% \langle \hat{a_3}(t)^2 \rangle

global information
alpha2 = information.alpha2;
beta2 = information.beta2;
k2 = information.k2;

eta_squared = (eta(t)).^2;

result = ( alpha2 + beta2 + (alpha2 - beta2)^2 )*k2*eta_squared;

end