function final_entanglement_plot(t, Neg_AB, Entropy_AB, Neg_AC, Entropy_AC, Neg_BC, Entropy_BC)

% Plots all logarithmic negativities and entropies in a single window

global figure_handle_all_subsystems_at_once_new
global information

max_entropy_AC = max( real(Entropy_AC) );
max_entropy_BC = max( real(Entropy_BC) );
top_entropy = 1.1*max([max_entropy_AC, max_entropy_BC, 1e-10]);

max_negativity_AB = max( real(Neg_AB) )*1.1 + 1e-10;
max_entropy_AB = max( real(Entropy_AB) )*1.1;

max_negativity_AC = max( real(Neg_AC) );
max_negativity_BC = max( real(Neg_BC) );
top_negativity = 1.1*max([max_negativity_AC, max_negativity_BC, 1e-10]);

if top_negativity == 0
  top_negativity = max_negativity_AC;
end

k = information.k;

if k>= 1
  tau = 2.0*pi;
else
  tau = pi/k^2;
end

N = floor(t(end)/tau);

x_ticks  = [];
x_labels = {};

x_ticks(end+1) = 0;
x_labels{end+1} = '0';

x_ticks(end+1) = tau/2;
x_labels{end+1} = '0.5\tau';
x_ticks(end+1) = tau;
x_labels{end+1} = '\tau';
for i=3:2*N
  x_ticks(end+1) = i*tau/2;
  
  if mod(i,2) == 0 
    x_labels{end+1} = strcat(num2str(i/2), '\tau');%convertCharsToStrings(strcat('$$',num2str(i), '\tau$$'));
  else
    x_labels{end+1} = strcat(num2str(i/2), '\tau');
  end
end

figure_handle_all_subsystems_at_once_new = figure(42);
figure_handle_all_subsystems_at_once_new.Units = 'normalized';
figure_handle_all_subsystems_at_once_new.OuterPosition = [0.1 0 0.9 1];  

negativity_color = [1,0,0];
entropy_color = [0,0,1];

negativity_specs = 'b-';
entropy_specs = 'r-';

linewidth = 2;
x_fontsize = 20;

ax_AB = subplot(3,1,1);
%xlabel(ax_AB, '$\omega_m \, t$','interpreter','latex','Fontsize',20)
xlim(ax_AB, [t(1), t(end)])
if N > 0
    xticks(ax_AB, x_ticks)
    xticklabels(ax_AB, x_labels)
    set(ax_AB,'XAxisLocation','top')
end
set(ax_AB,'fontsize',x_fontsize)
yyaxis left
N_AB = plot(ax_AB, t, real(Neg_AB), negativity_specs, 'LineWidth',linewidth);
ylim([0, max_negativity_AB])
hold on

yyaxis right
S_AB = plot(ax_AB, t, real(Entropy_AB), entropy_specs, 'LineWidth',linewidth);
ylim([0, max_entropy_AB])
legend(ax_AB, [N_AB, S_AB], {'$\mathcal{E}_{AB}(t)$', '$S_{AB}(t)$'},'Fontsize',20,'interpreter','latex')
for i=1:2*N
  xline(ax_AB, i*tau/2, 'k:','LineWidth',linewidth,'HandleVisibility','off'); %, 'N*2*pi');
  
end
set(ax_AB,'defaultAxesColorOrder',[negativity_color; entropy_color]);



ax_AC = subplot(3,1,2);
%xlabel(ax_AC, '$\omega_m \, t$','interpreter','latex','Fontsize',20)
xlim(ax_AC, [t(1), t(end)])
if N > 0
    xticks(ax_AC, [])
    xticklabels(ax_AC, [])
end
set(ax_AC,'fontsize',x_fontsize)
yyaxis left
N_AC = plot(ax_AC, t, real(Neg_AC), negativity_specs, 'LineWidth',linewidth);
ylim([0, top_negativity])
left_ax_AC = ax_AC.YAxis(1);
left_ax_AC.Exponent = 0;
hold on

yyaxis right
S_AC = plot(ax_AC, t, real(Entropy_AC), entropy_specs, 'LineWidth',linewidth);
ylim([0, top_entropy])
legend(ax_AC, [N_AC, S_AC], {'$\mathcal{E}_{AC}(t)$', '$S_{AC}(t)$'},'Fontsize',20,'interpreter','latex')
for i=1:2*N
  xline(ax_AC, i*tau/2, 'k:','LineWidth',linewidth,'HandleVisibility','off'); %, 'N*2*pi');
end
set(ax_AC,'defaultAxesColorOrder',[negativity_color; entropy_color]);



ax_BC = subplot(3,1,3);
xlabel(ax_BC, '$t$','interpreter','latex','Fontsize',20)
xlim(ax_BC, [t(1), t(end)])
if false %N > 0
    omega_m = information.omega_m;
    xticks(ax_BC, x_ticks)
    xticklabels(ax_BC, x_ticks/omega_m)
    x_axis = ax_BC.XAxis;
    x_axis.Exponent = floor( log10(x_ticks(end)/omega_m) );
end
set(ax_BC,'fontsize',x_fontsize)
yyaxis left
N_BC = plot(ax_BC, t, real(Neg_BC), negativity_specs, 'LineWidth',linewidth);
ylim([0, top_negativity])
left_ax_BC = ax_BC.YAxis(1);
left_ax_BC.Exponent = 0;
hold on

yyaxis right
S_BC = plot(ax_BC, t, real(Entropy_BC), entropy_specs, 'LineWidth',linewidth);
ylim([0, top_entropy])
legend(ax_BC, [N_BC, S_BC], {'$\mathcal{E}_{BC}(t)$', '$S_{BC}(t)$'},'Fontsize',20,'interpreter','latex')
for i=1:2*N
  xline(ax_BC, i*tau/2, 'k:','LineWidth',linewidth,'HandleVisibility','off'); %, 'N*2*pi');
end
set(ax_BC,'defaultAxesColorOrder',[negativity_color; entropy_color]);

end


% if N > 0
%   omega_m = information.omega_m;
%   xticks(ax_BC, x_ticks)
%   
%   x_label = {};
%   x_axis = ax_BC.XAxis;
%   
%   
%   for i=1:2*N
%     x = x_ticks(i)/omega_m;
%     if x == 0
%       x_label{end+1} = '0';
%     else
%       
%       e = floor( log10(x) );
%       x_label{end+1} = x; %sprintf('%d \\cdot 10^%d',, e);
%     end
%   end
%   
%   
%   xticklabels(ax_BC, x_label)
%   x_axis.Exponent = e;
%   %xtickformat('%.2f')
%   
% end

