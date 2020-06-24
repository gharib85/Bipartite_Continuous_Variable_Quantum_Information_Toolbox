function result = expected_a_2_dagger_a_2(t)

% \langle \hat{a_2}^\dagger\hat{a_2}(t) \rangle

global information
beta2(1:length(t)) = information.beta2;

result = beta2;

end