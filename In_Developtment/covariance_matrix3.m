function V = covariance_matrix3(a, b, c, a_dagger, b_dagger, c_dagger, a_a, a_a_dagger, a_dagger_a, a_dagger_a_dagger, b_b, b_b_dagger, b_dagger_b, b_dagger_b_dagger, c_c, c_c_dagger, c_dagger_c, c_dagger_c_dagger, a_b, a_b_dagger, a_dagger_b, a_dagger_b_dagger, a_c, a_c_dagger, a_dagger_c, a_dagger_c_dagger, b_c, b_c_dagger, b_dagger_c, b_dagger_c_dagger)



% Calculation of the covariance matrix V for a bipartite system

% This program was based on the paper:
% Symplectic invariants, entropic measures and correlations of Gaussian states
% Authors: Alessio Serafini, Fabrizio Illuminati and Silvio De Siena.
% arxiv: https://arxiv.org/abs/quant-ph/0307073

% There is a new section on Mirror Entanglement about Continuous Variable Systems !

% There are two ways we construct the covariance matrix:
% Given the quadrature phase operators for mode k:
%
% \hat{x}_k =   ( \hat{a}^\dagger_k + \hat{a}_k )
% \hat{p}_k = i*( \hat{a}^\dagger_k - \hat{a}_k )
% 
% We define the vector of operators: Y = (x_1, p_1, x_2, p_2, x_3, p_3)
% 
% V_{m, n} = 1/2 * \langle Y_m*Y_n + Y_n*Y_m \rangle -  \langle Y_m \rangle * \langle Y_n \ rangle
%
% A, B, C, D, E, F are 2 by 2 matrices, such that
%     |   A      D      E  |
%     |                    |
% V = |  D^T     B      F  | , where ^T is the transpose operation
%     |                    |
%     |  E^T    F^T     C  |

% Create a 2 by 2 matrix with all entries set to 1 % https://www.mathworks.com/help/matlab/ref/ones.html
A = zeros(2,2);                                                       
B = zeros(2,2);                                                       
C = zeros(2,2);
D = zeros(2,2);   
E = zeros(2,2);   
F = zeros(2,2);   
                                                    

% Calculation of matrix A (uncertainties of mode A)
A(1,1) = a_a + a_a_dagger + a_dagger_a + a_dagger_a_dagger - (a_dagger + a)^2;   
A(2,1) = 1i*( a_dagger_a_dagger - a_a ) - 1i*( a_dagger + a )*( a_dagger - a );

A(1,2) = A(2,1);
A(2,2) = -( a_a - a_a_dagger - a_dagger_a + a_dagger_a_dagger) + ( a_dagger - a )^2;


% Calculation of matrix B (uncertainties of mode B)
B(1,1) = b_b + b_b_dagger + b_dagger_b + b_dagger_b_dagger - (b_dagger + b)^2; 
B(2,1) = 1i*( b_dagger_b_dagger - b_b ) - 1i*( b_dagger + b )*( b_dagger - b );

B(1,2) = B(2,1);
B(2,2) = -( b_b - b_b_dagger - b_dagger_b + b_dagger_b_dagger) + ( b_dagger - b )^2;


% Calculation of matrix C (uncertainties of mode C)
C(1,1) = c_c + c_c_dagger + c_dagger_c + c_dagger_c_dagger - (c_dagger + c)^2; 
C(2,1) = 1i*( c_dagger_c_dagger - c_c ) - 1i*( c_dagger + c )*( c_dagger - c );

C(1,2) = C(2,1);
C(2,2) = -( c_c - c_c_dagger - c_dagger_c + c_dagger_c_dagger) + ( c_dagger - c )^2;


% Calculation of matrix D at current time (interaction modes AB)
D(1,1) = a_dagger_b_dagger  + a_dagger_b + a_b_dagger + a_b - (a_dagger + a)*(b_dagger + b);
D(2,1) = 1i*( a_dagger_b + a_dagger_b_dagger - a_b - a_b_dagger ) - 1i*(a_dagger - a)*(b_dagger + b);

D(1,2) = 1i*( a_b_dagger - a_b + a_dagger_b_dagger - a_dagger_b ) - 1i*(a_dagger + a)*(b_dagger - b);
D(2,2) = -( a_dagger_b_dagger - a_dagger_b - a_b_dagger + a_b ) + (a_dagger - a)*(b_dagger - b);


% Calculation of matrix E at current time (interaction modes AC)
E(1,1) = a_dagger_c_dagger  + a_dagger_c + a_c_dagger + a_c - (a_dagger + a)*(c_dagger + c);
E(2,1) = 1i*( a_dagger_c + a_dagger_c_dagger - a_c - a_c_dagger ) - 1i*(a_dagger - a)*(c_dagger + c);

E(1,2) = 1i*( a_c_dagger - a_c + a_dagger_c_dagger - a_dagger_c ) - 1i*(a_dagger + a)*(c_dagger - c);
E(2,2) = -( a_dagger_c_dagger - a_dagger_c - a_c_dagger + a_c ) + (a_dagger - a)*(c_dagger - c);


% Calculation of matrix F at current time (interaction modes BC)
F(1,1) = b_dagger_c_dagger  + b_dagger_c + b_c_dagger + b_c - (b_dagger + b)*(c_dagger + c);
F(2,1) = 1i*( b_dagger_c + b_dagger_c_dagger - b_c - b_c_dagger ) - 1i*(b_dagger - b)*(c_dagger + c);

F(1,2) = 1i*( b_c_dagger - b_c + b_dagger_c_dagger - b_dagger_c ) - 1i*(b_dagger + b)*(c_dagger - c);
F(2,2) = -( b_dagger_c_dagger - b_dagger_c - b_c_dagger + b_c ) + (b_dagger - b)*(c_dagger - c);


% Calculation of the covariance matrix for tripartite system
V = [A , D , E ; D.' , B , F;  E.' , F.' , C];                                                     
                                                                         % https://www.mathworks.com/help/matlab/ref/transpose.html                                                                      % https://www.mathworks.com/matlabcentral/answers/402620-creating-a-matrix-whose-entries-are-matrix

end