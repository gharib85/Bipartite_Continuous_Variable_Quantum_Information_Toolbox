function result = negativity2(t)

% Calculate all the necessary expected values at everytime
[a, b, a_dagger, b_dagger, a_a, a_a_dagger, a_dagger_a, b_b, b_b_dagger, b_dagger_b, a_b, b_a, a_b_dagger, a_dagger_b, a_dagger_a_dagger, b_dagger_b_dagger, a_dagger_b_dagger] = calculate_expected_values2(t);

% Allocate space in memory to save the value of the logarithmic entropy at each time
Neg = zeros(length(t),1);

% Parallel loop to save time
parfor i=1:length(t)
  
  % Calculate the covariance matrix for the bipartite subsystem at the current time
  [V, A, B, C] = covariance_matrix2(a(i), b(i), a_dagger(i), b_dagger(i), a_a(i), a_a_dagger(i), a_dagger_a(i), b_b(i), b_b_dagger(i), b_dagger_b(i), a_b(i), b_a(i), a_b_dagger(i), a_dagger_b(i), a_dagger_a_dagger(i), b_dagger_b_dagger(i), a_dagger_b_dagger(i));
  
  % Auxiliar variable
  sigma = det(A) + det(B) - 2.0*det(C);
  
  % Smallest of the symplectic eigenvalues of the partially transposed covariance matrix
  nu_tilde_minus = sqrt( sigma/2.0 - sqrt( sigma^2 - 4.0*det(V) )/2.0 );
  
  % Biggest of the symplectic eigenvalues of the partially transposed covariance matrix
  nu_tilde_plus  = sqrt( sigma/2.0 + sqrt( sigma^2 - 4.0*det(V) )/2.0 );
  
  % Manually perform a maximum to save computational time (calculation of a sqrt can take too much time and deal with residual numeric imaginary parts)
  if nu_tilde_minus >= 0.5 && nu_tilde_plus >= 0.5
    Neg_at_t = 0.0;
  else
    if nu_tilde_minus < 0.5
      a_minus = (1/nu_tilde_minus - 2);
    else
      a_minus = 1.0;
    end
    
    if nu_tilde_plus < 0.5
      a_plus = (1/nu_tilde_minus - 2);
    else
      a_plus = 1.0;
    end
    
    % Calculate the negativity at each time
    Neg_at_t = 0.5*a_minus*a_plus;
  end
  
  Neg(i) = Neg_at_t;
  
end

result = Neg;

end


