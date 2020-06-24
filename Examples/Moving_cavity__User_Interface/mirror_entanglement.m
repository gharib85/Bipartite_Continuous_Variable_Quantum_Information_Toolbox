%% Define default parameters
omega_a = 1e+15;                         % Mechanical Oscillator natural frequency
omega_1 = 1e+5;                          % Optical mode a natural frequency
omega_2 = omega_1;                       % Optical mode b natural frequency

alpha   = 0.1;                           % Coherent state number for optical mode A
beta_1  = 5;%0.1;                           % Coherent state number for mechanical mode B_1
beta_2  = beta_1;                        % Coherent state number for mechanical mode B_2

k_1     = 0.5;                           % Optomechanical coupling between modes A and B1
k_2     = k_1;                           % Optomechanical coupling between modes A and B2

t0      = 0;                             % Initial time for the plot
tf      = 18.8;                          % Final time for the plot
N       = 1e+4; 


%% Use correct expected values

change_system_to("moving_cavity")        % Move to desired system (Hamiltonian + Initial state)

change_subsystem_label(["B1", "B2", "A"])% Change name for the subsystems 
% (the user does not have to do this, but it does make using the program easier !

change_bipartition_to("B1B2")              % Move to desired bipartition


%% Call routine that actually calculates everything and calls the UI
mirror_entanglement_internal(omega_a, omega_1, omega_2, alpha, beta_1, beta_2, k_1, k_2, t0, tf, N);

