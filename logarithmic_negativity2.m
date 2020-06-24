function result = logarithmic_negativity2(t)
% Calculation of the logarithmic negativity for a bipartite system
%
% PARAMETERS:
%       t - times at which the logarithmic negativity will be evaluated
%
% MATHEMATICAL DESCRIPTION
% The covariance matrix for a bipartite subsystem is of the form:
%  
%      |  A      C  |
%  V = |            | , 
%      |  C^T    B  |
%
% where A, B, C are 2 by 2 matrices and C^T is the transpose of matrix C.
% See covariance_matrix2.m for more deatils on the calculation.
% 
% For a bipartite system, the logarithmic negativity (E_{N}) is a function of the
% smallest of the symplectic eigenvalues of the partially transposed covariance matrix (\tilde{\nu}_{minus}): 
% 
% E_{N} = max[0,-log( \tilde{\nu}_{minus} )]
%
% where \tilde{\nu}_{minus} = \sqrt( \sigma/2.0 - \sqrt( \sigma^2 - 4.0*\det(V) )/2.0 ) ,
% and   \sigma = \det(A) + \det(B) - 2\det(C) 

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

% Square of the smallest of the symplectic eigenvalues of the partially transposed covariance matrix
ni = sigma/2.0 - sqrt( sigma^2 - 4.0*det(V) )/2.0 ;                      

% Manually perform a maximum to save computational time (calculation of a sqrt can take too much time and deal with residual numeric imaginary parts)
if ni < 0.0
  Neg_at_t = 0.0;
else
  % Smallest of the symplectic eigenvalues of the partially transposed covariance matrix
  ni = sqrt( real(ni) );                   % I am using the REAL PART, I have to make sure that this is fine instead of : ni = sqrt(ni);
  
  % Calculate the logarithmic negativity at each time
  Neg_at_t = max([0, -log(ni)]);
end

Neg(i) = Neg_at_t;

end

result = Neg;

end


