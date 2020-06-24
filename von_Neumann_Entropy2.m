function result = von_Neumann_Entropy2(t)
% Calculation of the von Neumann entropy for a bipartite system
%
% PARAMETERS:
%  t - times at which the von Neumann entropy will be evaluated
%
% MATHEMATICAL DESCRIPTION
%  Calculation of the von Neumann entropy for a bipartite system
%
% The covariance matrix for a bipartite subsystem is of the form:
%  
%      |  A      C  |
%  V = |            | , 
%      |  C^T    B  |
%
% where A, B, C are 2 by 2 matrices and C^T is the transpose of matrix C.
% See covariance_matrix2.m for more deatils on the calculation.
% 
% For a bipartite system, the von Neumann entropy (S{N}) is a 
% function of the symplectic eigenvalues of the covariance matrix 
% (\nu_{minus} and \nu_{plus}): 
%
% S{N} = f(\nu_plus) + f(\nu_minus)
%
% where f(x) = [(x+1)/2]*log((x+1)/2) - [(x-1)/2]*log((x-1)/2) , 
% \nu_plus  = sqrt(\delta/2 + sqrt(\delta^2 - 4det(V)/2))    and
% \nu_minus = sqrt(\delta/2 + sqrt(\delta^2 - 4det(V)/2))      ,
% 
% where \Delta = det(A) + det(B) + 2det(C)

% Calculate all the necessary expected values at everytime
[a, b, a_dagger, b_dagger, a_a, a_a_dagger, a_dagger_a, b_b, b_b_dagger, b_dagger_b, a_b, b_a, a_b_dagger, a_dagger_b, a_dagger_a_dagger, b_dagger_b_dagger, a_dagger_b_dagger] = calculate_expected_values2(t);

% Allocate space in memory to save the value of the entropy at each time
Neuman_entropy = zeros(length(t),1);

% Parallel loop to save time
parfor i=1:length(t)

% Calculate the covariance matrix for the bipartite subsystem at the current time
[V, A, B, C] = covariance_matrix2(a(i), b(i), a_dagger(i), b_dagger(i), a_a(i), a_a_dagger(i), a_dagger_a(i), b_b(i), b_b_dagger(i), b_dagger_b(i), a_b(i), b_a(i), a_b_dagger(i), a_dagger_b(i), a_dagger_a_dagger(i), b_dagger_b_dagger(i), a_dagger_b_dagger(i));

% Auxiliar variable
Delta = det(A) + det(B) + 2.0*det(C);                                    

% Smallest of the symplectic eigenvalues of the partially transposed covariance matrix
n_minus = sqrt( Delta/2.0 - sqrt( Delta^2 - 4.0*det(V) )/2.0 );                      

% Biggest of the symplectic eigenvalues of the partially transposed covariance matrix
n_plus  = sqrt( Delta/2.0 + sqrt( Delta^2 - 4.0*det(V) )/2.0 );

% Calculate the entropy at the current time
Neuman_entropy(i) = func(n_plus) + func(n_minus);

end

% Return the entropies
result = Neuman_entropy;

end


