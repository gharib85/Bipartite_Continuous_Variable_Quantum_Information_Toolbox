function result = expected_a_1_a_2(t)

% \langle \hat{a_1}\hat{a_2}(t) \rangle

global information
alpha = information.alpha;
beta = information.beta;
r_a = information.r_a;
r_b = information.r_b;

result = exp( -1i*(r_a+r_b)*t )*alpha*beta;

end