function result = expected_a_1_dagger_a_1(t)

% \langle \hat{a}_1(t)^\dagger\hat{a}_1(t) \rangle

global information
alpha   = information.alpha;    % modulus of alpha squared
beta_1  = information.beta_1;   % coherent state number on system B (at t=0)
k_1     = information.k_1;      % k squared (k is the optomechanicl coupling)

alpha_sq = abs2(alpha);
xi_1_t  = xi_1(t);
eta_1_t = eta_1(t);

result = abs2(beta_1) - k_1*alpha_sq*( beta_1*conj(xi_1_t) + conj(beta_1)*xi_1_t )  + k_1^2*( alpha_sq + alpha_sq^2 )*abs2(eta_1_t);

end