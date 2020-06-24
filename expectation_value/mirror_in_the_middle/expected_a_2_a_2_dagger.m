function result = expected_a_2_a_2_dagger(t)

% \langle \hat{a_2}\hat{a_2}^\dagger(t) \rangle

global information
beta2(1:length(t)) = information.beta2;

result = beta2 + 1;

end