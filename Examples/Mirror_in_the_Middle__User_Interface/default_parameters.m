function [T, omega_m, omega_a, omega_b, alpha, beta, k, t0, tf, N] = default_parameters()

T = 1e-6;                                               % Mechanical Oscillator Temperature
omega_m = 1e+5;                                         % Mechanical Oscillator natural frequency
omega_a = 1e+15;                                        % Optical mode a natural frequency
omega_b = omega_a;                                      % Optical mode b natural frequency
beta  = 0.1;                                            % Coherent state number for optical mode b
alpha = 0.1;                                            % Coherent state number for optical mode a
k = 0.5;                                                % Optomechanical coupling
t0 = 0;                                                 % Initial time for the plot
tf = 18.8;                                              % Final time for the plot
N = 1e+3;                                               % Number of points

end