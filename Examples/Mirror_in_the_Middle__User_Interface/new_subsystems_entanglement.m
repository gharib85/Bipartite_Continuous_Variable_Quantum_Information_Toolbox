
% Change to correct system
change_system_to("mirror_in_the_middle")

% Rename the subsystems (and bipartitions) for easier human redability
change_subsystem_label(["A", "B", "C"])

% Default parameters
[T, omega_m, omega_a, omega_b, alpha, beta, k, t0, tf, N] = default_parameters();

% Plot logarithmic negativity and entropy for all bipartitions and create an user interface to change any parameters
new_all_subsystems_at_once(T, omega_m, omega_a, omega_b, alpha, beta, k, t0, tf, N);

