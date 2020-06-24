function nu_tilde = symplectic_eigenvalues_of_the_partially_transposed_matrix_of(V)

Z = diag([1,-1]);

I_A = eye(3); % number of subsystems N = 3

T_B = kron(eye(3), Z);

I_a_osum_T_B = DirectSum(I_A, T_B);

V_tilde = I_a_osum_T_B*V*I_a_osum_T_B;

nu_tilde = symplectic_eigenvalues(V_tilde);

end