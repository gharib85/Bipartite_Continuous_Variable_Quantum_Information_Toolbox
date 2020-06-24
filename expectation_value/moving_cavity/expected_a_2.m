function result = expected_a_2(t)

% \langle \hat{a}_2(t) \rangle

global information
alpha    = information.alpha;     % modulus of alpha squared
beta_2   = information.beta_2;   % coherent state number on system B (at t=0)
k_2      = information.k_2;      % k squared (k is the optomechanicl coupling)
omega_2 = information.omega_2;

result = beta_2*exp(-1i*omega_2*t) + k_2*abs2(alpha)*eta_2(t);

end