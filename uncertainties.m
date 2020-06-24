function [Delta_X, Delta_P, X, P] = uncertainties(t)
% Calculation of the quadrature uncertaintites of a subsystem
%
% PARAMETERS:
%  t - times at which the quadrature uncertainties will be evaluated
%
% MATHEMATICAL DESCRIPTION
% The quadratures (\hat{X}, \hat{P}) are defined as:
% 
% \hat{X} =   \hat{a]^\dagger + \hat{a}
% \hat{P} = i(\hat{a]^\dagger - \hat{a})
%
% The uncertainty (\Delta(\hat{O}) of an operator \hat{O} is defined such that:
%
% ( \Delta(\hat{O}) )^2 = \langle \hat{O}^2 \rangle - \langle \hat{O} \rangle^2

[a, a_dagger, a_a, a_a_dagger, a_dagger_a, a_dagger_a_dagger] = calculate_expected_values1(t);

X =      a_dagger + a;
P = 1i*( a_dagger - a );

X_squared =    a_a + a_a_dagger + a_dagger_a + a_dagger_a_dagger;
P_squared = -( a_a - a_a_dagger - a_dagger_a + a_dagger_a_dagger);

Delta_X = sqrt( X_squared - X.^2 );

Delta_P = sqrt( P_squared - P.^2 );

end

% global subsystem_name
% figure_quadratures = figure(6);
% figure_quadratures.Name = "Quadratures for mode " + subsystem_name;
% 
% % Calculate expected value of the position (up to a scaling factor)
% ax1 = subplot(2,2,1);
% plot(ax1, t,X, 'b')
% title('Mirror Position as function of time')
% xlim([t0 tf]);
% 
% % Calculate uncertainty in position of the mirror in the thermal state
% ax2 = subplot(2,2,2);
% plot(ax2, t,Delta_X,'b');
% title('Mirror Uncertainty in Position as function of time')
% xlim([t0 tf]);
% 
% % Calculate expected value of the momentum (up to a scaling factor)
% ax3 = subplot(2,2,3);
% plot(ax3, t,P, 'r')
% title('Mirror Momentum as function of time')
% xlim([t0 tf]);
% 
% %  Calculate uncertainty in momentum of the mirror in the thermal state
% ax4 = subplot(2,2,4);
% plot(ax4, t,Delta_P,'r');
% title('Mirror Uncertainty in Momentum as function of time')
% xlim([t0 tf]);