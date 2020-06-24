function result = Von_Neuman_Entropy3(t)

% Calculate all the necessary expected values at everytime
[a, b, c, a_dagger, b_dagger, c_dagger, a_a, a_a_dagger, a_dagger_a, a_dagger_a_dagger, b_b, b_b_dagger, b_dagger_b, b_dagger_b_dagger, c_c, c_c_dagger, c_dagger_c, c_dagger_c_dagger, a_b, a_b_dagger, a_dagger_b, a_dagger_b_dagger, a_c, a_c_dagger, a_dagger_c, a_dagger_c_dagger, b_c, b_c_dagger, b_dagger_c, b_dagger_c_dagger] = calculate_expected_values3(t);

% Allocate space in memory to save the value of the entropy at each time
Neuman_entropy = zeros(length(t),1);

% Parallel loop to save time
for i=1:length(t)

% Calculate the covariance matrix for the tripartite system at the current time
V = covariance_matrix3(a(i), b(i), c(i), a_dagger(i), b_dagger(i), c_dagger(i), a_a(i), a_a_dagger(i), a_dagger_a(i), a_dagger_a_dagger(i), b_b(i), b_b_dagger(i), b_dagger_b(i), b_dagger_b_dagger(i), c_c(i), c_c_dagger(i), c_dagger_c(i), c_dagger_c_dagger(i), a_b(i), a_b_dagger(i), a_dagger_b(i), a_dagger_b_dagger(i), a_c(i), a_c_dagger(i), a_dagger_c(i), a_dagger_c_dagger(i), b_c(i), b_c_dagger(i), b_dagger_c(i), b_dagger_c_dagger(i));

% Symplctic eigenvalues of the Covariance Matrix
nu = symplectic_eigenvalues(V) + 1e-15;
                             % fugir de erros numpericos
% Calculate the entropy at the current time
Neuman_entropy(i) = sum( func( nu ) );

if isnan(Neuman_entropy(i))
disp("problemas")
end

% Return the entropies
result = Neuman_entropy;

end


