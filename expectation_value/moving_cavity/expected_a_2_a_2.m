function result = expected_a_2_a_2(t)

% \langle \hat{a_2}^2(t) \rangle

global information
alpha   = information.alpha;   % modulus of alpha squared
beta_2   = information.beta_2;   % coherent state number on system B (at t=0)
omega_2 = information.omega_2;
k_2      = information.k_2;      % k squared (k is the optomechanicl coupling)

alpha_sq = abs2(alpha);
eta_2_t  = eta_2(t);

result = beta_2^2*exp(-2*1i*omega_2*t) + 2*k_2*alpha_sq*beta_2*eta_2_t.*exp(-1i*omega_2*t) + k_2^2*(alpha_sq + alpha_sq^2)*eta_2_t.^2;

end