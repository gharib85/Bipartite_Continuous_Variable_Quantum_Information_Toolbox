function [X, P] = quadratures(t)
% Calculation of the expectation values for the quadratures of a subsystem
%
% PARAMETERS:
%  t - times at which the quadrature uncertainties will be evaluated
%
% MATHEMATICAL DESCRIPTION
% The quadratures of a system (\hat{X}, \hat{P}) are defined as:
% 
% \hat{X} =   \hat{a]^\dagger + \hat{a}
% \hat{P} = i(\hat{a]^\dagger - \hat{a})

[a, a_dagger] = calculate_expected_values1(t);

X = a + a_dagger;

P = 1i*( a_dagger - a );

end

% if nargin < 1
%   msg = "You need to specify the times for which you want to see the quadratures! Please, pass it as an argument...";
%   error(msg)
% end

% global subsystem_name
% figure_quadratures = figure(1);
% figure_quadratures.Name = "Quadratures for mode " + subsystem_name;
% 
% Plot X
% ax1 = subplot(2,2,1);
% plot(ax1, t,X, 'r')
% title('Mirror Position as function of time')
% xlim([t0 tf]);
% 
% Plot P
% ax3 = subplot(2,2,3);
% plot(ax3, t,P, 'r')
% title('Mirror Momentum as function of time')
% xlim([t0 tf]);

