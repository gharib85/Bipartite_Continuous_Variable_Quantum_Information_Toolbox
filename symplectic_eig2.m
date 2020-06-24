function [n_minus, n_plus] = symplectic_eig2(t)
% Calculation of the symplectic eigenvalues of the covariance matrix
% for a bipartite system
% 
% PARAMETERS:
%  t - times at which the von Neumann entropy will be evaluated
%
% MATHEMATICAL DESCRIPTION
% Calculation of the covariance matrix for a bipartite system 
% and its symplectic at each time
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
% For a bipartite system, its symplectic eigenvalues are:
% 
% \nu_plus  = sqrt(\delta/2 + sqrt(\delta^2 - 4det(V)/2)) and
% \nu_minus = sqrt(\delta/2 + sqrt(\delta^2 - 4det(V)/2))    ,
%
% where \delta = \det(A) + \det(B) + 2\det(C)


% Calculate all the necessary expected values at everytime
[a, b, a_dagger, b_dagger, a_a, a_a_dagger, a_dagger_a, b_b, b_b_dagger, b_dagger_b, a_b, b_a, a_b_dagger, a_dagger_b, a_dagger_a_dagger, b_dagger_b_dagger, a_dagger_b_dagger] = calculate_expected_values2(t);

% Allocate space in memory to save the value of the entropy at each time
n_minus = zeros(length(t),1);
n_plus  = zeros(length(t),1);

% Parallel loop to save time
parfor i=1:length(t)

% Calculate the covariance matrix for the bipartite subsystem at the current time
[V, A, B, C] = covariance_matrix2(a(i), b(i), a_dagger(i), b_dagger(i), a_a(i), a_a_dagger(i), a_dagger_a(i), b_b(i), b_b_dagger(i), b_dagger_b(i), a_b(i), b_a(i), a_b_dagger(i), a_dagger_b(i), a_dagger_a_dagger(i), b_dagger_b_dagger(i), a_dagger_b_dagger(i));

% Auxiliar variable
Delta = det(A) + det(B) + 2.0*det(C);                                    

% Smallest of the symplectic eigenvalues of the covariance matrix
n_minus(i) = sqrt( Delta/2.0 - sqrt( Delta^2 - 4.0*det(V) )/2.0 );                      

% Biggest of the symplectic eigenvalues of the covariance matrix
n_plus(i)  = sqrt( Delta/2.0 + sqrt( Delta^2 - 4.0*det(V) )/2.0 );

end

end