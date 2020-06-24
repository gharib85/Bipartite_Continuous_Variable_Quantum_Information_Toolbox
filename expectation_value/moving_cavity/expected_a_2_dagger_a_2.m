function result = expected_a_2_dagger_a_2(t)

% \langle \hat{a}_2(t)^\dagger\hat{a}_2(t) \rangle

global information
alpha   = information.alpha;     % modulus of alpha squared
beta_2   = information.beta_2;   % coherent state number on system B (at t=0)
k_2      = information.k_2;      % k squared (k is the optomechanicl coupling)

alpha_sq = abs2(alpha);
xi_2_t  = xi_2(t);
eta_2_t = eta_2(t);

result = abs2(beta_2) + k_2*alpha_sq*( beta_2*conj(xi_2_t) + conj(beta_2)*xi_2_t )  + k_2^2*( alpha_sq + alpha_sq^2 )*abs2(eta_2_t);

end