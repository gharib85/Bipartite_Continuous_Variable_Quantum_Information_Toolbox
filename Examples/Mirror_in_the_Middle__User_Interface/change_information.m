function change_information(T, omega_m, omega_a, omega_b, alpha, beta, k, t0, tf, N)

if nargin < 1
  [T, omega_m, omega_a, omega_b, alpha, beta, k, t0, tf, N] = default_parameters();
end

% Universal constants
k_B = 1.381e-23;    % J/K                   % Boltzman's Constant ( https://en.wikipedia.org/wiki/Boltzmann_constant )
hbar = 1.055e-34;   % J*s                   % Reduced Planck's Constant ( https://en.wikipedia.org/wiki/Planck_constant )

global information
information = [];

information.T = T;                                                  % Mechanical Oscillator Temperature
information.omega_m = omega_m;                                      % Mechanical Oscillator natural frequency
information.omega_a = omega_a;                                      % Optical mode a natural frequency
information.omega_b = omega_b;                                      % Optical mode b natural frequency
information.beta  = beta;                                           % Coherent state number for optical mode b
information.alpha = alpha;                                          % Coherent state number for optical mode a
information.k = k;                                                  % ? Optomechanical coupling ?
information.t0 = t0;                                                % Initial time for the plot
information.tf = tf;                                                % Final time for the plot
information.N = N;                                                  % Number of points


% Auxiliar variables that are functions of the actual parameters !
information.nbar = 1/( exp(hbar*information.omega_m/(k_B*information.T)) - 1 ); % Average phonon number for the mechanical oscillator
information.conj_alpha = conj(information.alpha);                    % Complex conjugate of alpha
information.conj_beta = conj(information.beta);                      % Complex conjugate of beta
information.alpha2 = abs(information.alpha)^2;                       % Modulus squared of alpha
information.beta2 = abs(information.beta)^2;                         % Modulus squared of beta
information.r_a = (information.omega_a)/(information.omega_m);       % Mathematical constant
information.r_b = (information.omega_b)/(information.omega_m);       % Mathematical constant
information.k2 = information.k^2;                                    % Mathematical constant


% Paper do Uros fala de 16,42, 96 kHz pro G => k = G/omega_m ~

end
