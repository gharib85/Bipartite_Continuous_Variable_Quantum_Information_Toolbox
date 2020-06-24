function result = expected_a_3(t)

% \langle \hat{a_3}(t) \rangle

global information
alpha2 = information.alpha2;
beta2 = information.beta2;
k = information.k;

result = k*(alpha2 - beta2)*eta(t);

end