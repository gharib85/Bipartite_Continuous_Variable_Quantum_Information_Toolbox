function result = expected_a_1_a_2(t)

% \langle \hat{a}_1(t)\hat{a}_2(t) \rangle

global information
alpha    = information.alpha;     % modulus of alpha squared
beta_1   = information.beta_1;   % coherent state number on system B (at t=0)
beta_2   = information.beta_2;   % coherent state number on system B (at t=0)
k_1      = information.k_1;      % k squared (k is the optomechanicl coupling)
k_2      = information.k_2;      % k squared (k is the optomechanicl coupling)
omega_1 = information.omega_1;
omega_2 = information.omega_2;

alpha_sq = abs2(alpha);
eta_1_t = eta_1(t);
eta_2_t = eta_2(t);

result = beta_1*beta_2*exp( -1i*(omega_1 + omega_2)*t ) + alpha_sq*k_2*beta_1*eta_2_t.*exp(-1i*omega_1*t) - alpha_sq*k_1*beta_2*eta_1_t.*exp(-1i*omega_2*t) - k_1*k_2*( alpha_sq + alpha_sq^2 )*eta_1_t.*eta_2_t;

end