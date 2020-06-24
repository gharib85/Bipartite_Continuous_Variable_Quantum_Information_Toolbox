function result = expected_a_1_a_1(t)

% \langle \hat{a_1}^2(t) \rangle

global information
alpha   = information.alpha;   % modulus of alpha squared
beta_1   = information.beta_1;   % coherent state number on system B (at t=0)
omega_1 = information.omega_1;
k_1      = information.k_1;      % k squared (k is the optomechanicl coupling)

alpha_sq = abs2(alpha);
eta_1_t  = eta_1(t);

result = beta_1^2*exp(-2*1i*omega_1*t) - 2*k_1*alpha_sq*beta_1*eta_1_t.*exp(-1i*omega_1*t) + k_1^2*(alpha_sq + alpha_sq^2)*eta_1_t.^2;

end