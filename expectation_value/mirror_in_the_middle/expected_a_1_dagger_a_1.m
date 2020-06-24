function result = expected_a_1_dagger_a_1(t)

% \langle \hat{a_1}^\dagger(t)\hat{a_1} \rangle

global information
alpha2(1:length(t)) = information.alpha2;

result = alpha2;

end