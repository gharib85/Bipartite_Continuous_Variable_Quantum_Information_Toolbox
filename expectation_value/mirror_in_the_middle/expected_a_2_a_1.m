function result = expected_a_2_a_1(t)

% \langle \hat{a_2}\hat{a_1}(t) \rangle

global information
alpha = information.alpha;
beta = information.beta;
r_a = information.r_a;
r_b = information.r_b;

result = exp( -1i*(r_a+r_b)*t )*beta*alpha;

end