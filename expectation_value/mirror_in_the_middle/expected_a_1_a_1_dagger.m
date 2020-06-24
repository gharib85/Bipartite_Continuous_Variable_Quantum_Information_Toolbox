function result = expected_a_1_a_1_dagger(t)

% \langle \hat{a_1}\hat{a_1}^\dagger(t) \rangle

global information
alpha2(1:length(t)) = information.alpha2;

result = alpha2 + 1;

end