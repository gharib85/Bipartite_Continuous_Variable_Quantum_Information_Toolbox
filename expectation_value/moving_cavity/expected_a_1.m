function result = expected_a_1(t)

% \langle \hat{a}_1(t) \rangle

global information
alpha    = information.alpha;     % modulus of alpha squared
beta_1   = information.beta_1;   % coherent state number on system B (at t=0)
k_1      = information.k_1;      % k squared (k is the optomechanicl coupling)
omega_1 = information.omega_1;

alpha_sq = abs2(alpha);
eta_1_t = eta_1(t);

result = beta_1*exp(-1i*omega_1*t) - k_1*alpha_sq*eta_1_t;

end