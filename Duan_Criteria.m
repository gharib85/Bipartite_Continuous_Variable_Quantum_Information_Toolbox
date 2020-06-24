function Duan = Duan_Criteria(t, method_name)
% Calculation of the LHS of the Duan criteria for a bipartite system
%
% PARAMETERS:
% t                 - times at which the logarithmic negativity will be evaluated
% method (optional) - string with the name of the method use for calculation
%
% MATHEMATICAL DESCRIPTION
% Calculation of the LHS of the Duan criteria for a bipartite system
% 
% Given the quadratures (\hat{X}_j, \hat{P}_j) of the j-th subsystem of a bipartite system:
% 
% \hat{X}_j =   \hat{a]_j^\dagger + \hat{a}_j  and
% \hat{P}_j = i(\hat{a]_j^\dagger - \hat{a}_j)    ,
% 
% the Duan criteria says that if a state is separable, then D > 1, where: 
%
% D = 1/2 { [\Delta(x_1 + x_2)]^2 + [\Delta(p_1 - p_2)]^2 } ,
%
% where ( \Delta(\hat{O}) )^2 = \langle \hat{O}^2 \rangle - \langle \hat{O} \rangle^2
% is the variance of a operator \hat{0}.
% 
% 
% In the "quadratures" method, the Duan criteria (D) is evaluated 
% by direct substitution of the creation/annihilation (a_j/a^\dagger_j) operators' 
% expectation values at the definition of D
% 
% In the "covariance_matrices" method, the Duan criteria (D) is evaluated
% by use of the covariance matrix for a bipartite subsystem defined as
%  
%      |  A      C  |
%  V = |            | , 
%      |  C^T    B  |
%
% where A, B, C are 2 by 2 matrices and C^T is the transpose of matrix C.
% The Duan criteria at a time t is then a function of the elements of the
% covariance matrix:
%
% D =  V(1,1) + V(2,2) + V(3,3) + V(4,4) )/4.0 + ( V(1,3) - V(2,4) )/2.0

if nargin < 1
  msg = "You need to specify the times for which you want to see the Duan Criteria! Please, pass it as an argument...";
  error(msg)
elseif nargin < 2
  method_name = "quadratures";
end

% Calculate all the necessary expected values at everytime
[a, b, a_dagger, b_dagger, a_a, a_a_dagger, a_dagger_a, b_b, b_b_dagger, b_dagger_b, a_b, b_a, a_b_dagger, a_dagger_b, a_dagger_a_dagger, b_dagger_b_dagger, a_dagger_b_dagger] = calculate_expected_values2(t);

% Allocate space in memory to save the value of the logarithmic entropy at each time
Duan = zeros(length(t),1);

if strcmp(method_name, "covariance_matrices")
  
  % Parallel loop to save time
  parfor i=1:length(t)
    
    % Calculate the covariance matrix for the bipartite subsystem at the current time
    V = covariance_matrix2(a(i), b(i), a_dagger(i), b_dagger(i), a_a(i), a_a_dagger(i), a_dagger_a(i), b_b(i), b_b_dagger(i), b_dagger_b(i), a_b(i), b_a(i), a_b_dagger(i), a_dagger_b(i), a_dagger_a_dagger(i), b_dagger_b_dagger(i), a_dagger_b_dagger(i));
    
    Duan(i) = ( V(1,1) + V(2,2) + V(3,3) + V(4,4) )/4.0 + ( V(1,3) - V(2,4) )/2.0;
    
  end
  
elseif strcmp(method_name, "quadratures")
  
  delta_x1_plus_x2 = (1/sqrt(2))*(a_dagger+a+b_dagger+b);
  
  delta_x1_plus_x2_sq = 1/2*(a_dagger_a_dagger + a_a+2.*a_dagger_a+2.*(a_dagger_b_dagger+a_dagger_b+a_b_dagger+a_b) + b_dagger_b_dagger + b_b +2.*b_dagger_b) + 1;
  
  delta_p1_minus_p2 = 1i/sqrt(2)*( (a_dagger-a) - (b_dagger-b) );
  
  delta_p1_minus_p2_sq = -1/2*(a_dagger_a_dagger + a_a-2.*a_dagger_a-2.*(a_dagger_b_dagger-a_dagger_b-a_b_dagger+a_b) + b_dagger_b_dagger + b_b -2.*b_dagger_b) + 1;
  
  delta_pos = delta_x1_plus_x2_sq - delta_x1_plus_x2.^2;
  
  delta_mom = delta_p1_minus_p2_sq - delta_p1_minus_p2.^2;
  
  Duan = (1/2).*(delta_pos+delta_mom);
  Duan  = Duan';
else
  error("Wrong method name for the Duran criteria calculation!")
end


end




% figure_handle = 5;
% f = figure(figure_handle);
% f.Name = 'Duan vs Logarithmic Negativity';
% yyaxis left
% plot(t, duan)
% minimum = 0.99*min(duan);
% maximum = 1.01*max(duan);
% ylim([minimum, maximum])
% xlim([t(1), t(end)])
% yline(1.0, 'k--', 'LineWidth', 1);
%
% Neg = logarithmic_negativity2(t);
%
% yyaxis right
% plot(t, Neg, 'r', 'LineWidth', 1)
% minimum = 0.9*min(Neg);
% maximum = 1.1*max(Neg);
% ylim([minimum, maximum])
% xlim([t(1), t(end)])

