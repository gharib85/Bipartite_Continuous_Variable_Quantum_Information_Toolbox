function [V, A, B, C] = covariance_matrix2(a, b, a_dagger, b_dagger, a_a, a_a_dagger, a_dagger_a, b_b, b_b_dagger, b_dagger_b, a_b, b_a, a_b_dagger, a_dagger_b, a_dagger_a_dagger, b_dagger_b_dagger, a_dagger_b_dagger)
% Calculation of the covariance matrix V for a bipartite system
%
% PARAMETERS:
%       t - times at which the logarithmic negativity will be evaluated
%
% MATHEMATICAL DESCRIPTION
% Construction of the covariance matrix (V):
% Given the quadrature phase operators for mode k:
%
% \hat{x}_k =   ( \hat{a}^\dagger_k + \hat{a}_k )
% \hat{p}_k = i*( \hat{a}^\dagger_k - \hat{a}_k )
%
% We define the vector of operators: Y = (x_1, p_1, x_2, p_2)
% 
% V_{m, n} = 1/2 * \langle Y_m*Y_n + Y_n*Y_m \rangle -  \langle Y_m \rangle * \langle Y_n \ rangle
%
% A, B, C are 2 by 2 matrices, such that
%     |  A      C  |
% V = |            | , where C^T is the transpose of matrix C
%     |  C^T    B  |

% Create a 2 by 2 matrix with all entries set to 1 % https://www.mathworks.com/help/matlab/ref/ones.html
A = zeros(2,2);                                                       

% Create a 2 by 2 matrix with all entries set to 1
B = zeros(2,2);                                                       

% Create a 2 by 2 matrix with all entries set to 1
C = zeros(2,2);                                                       

% Calculation of matrix A at current time
A(1,1) = a_a + a_a_dagger + a_dagger_a + a_dagger_a_dagger - (a_dagger + a)^2;   
A(2,1) = 1i*( a_dagger_a_dagger - a_a ) - 1i*( a_dagger + a )*( a_dagger - a );

A(1,2) = A(2,1);
A(2,2) = -( a_a - a_a_dagger - a_dagger_a + a_dagger_a_dagger) + ( a_dagger - a )^2;


% Calculation of matrix B at current time
B(1,1) = b_b + b_b_dagger + b_dagger_b + b_dagger_b_dagger - (b_dagger + b)^2; 
B(2,1) = 1i*( b_dagger_b_dagger - b_b ) - 1i*( b_dagger + b )*( b_dagger - b );

B(1,2) = B(2,1);
B(2,2) = -( b_b - b_b_dagger - b_dagger_b + b_dagger_b_dagger) + ( b_dagger - b )^2;


% Calculation of matrix C at current time
C(1,1) = a_dagger_b_dagger  + a_dagger_b + a_b_dagger + a_b - (a_dagger + a)*(b_dagger + b);
C(2,1) = 1i*( a_dagger_b + a_dagger_b_dagger - a_b - a_b_dagger ) - 1i*(a_dagger - a)*(b_dagger + b);

C(1,2) = 1i*( a_b_dagger - a_b + a_dagger_b_dagger - a_dagger_b ) - 1i*(a_dagger + a)*(b_dagger - b);
C(2,2) = -( a_dagger_b_dagger - a_dagger_b - a_b_dagger + a_b ) + (a_dagger - a)*(b_dagger - b);


% Calculation of the covariance matrix at current time
V = [A, C ; C.', B];                                                     
                                                                         % https://www.mathworks.com/help/matlab/ref/transpose.html
                                                                         % https://www.mathworks.com/matlabcentral/answers/402620-creating-a-matrix-whose-entries-are-matrix

end