function mirror_entanglement_internal(omega_a, omega_1, omega_2, alpha, beta_1, beta_2, k_1, k_2, t0, tf, N)
%% Initialize global variable for the User Interface

global information                       % Global variable for numerical constants to be used throughout the program
information = [];                        % Clean the golbal variable from the previous run

information.omega_a = omega_a;           % Optical mode A natural frequency
information.omega_1 = omega_1;           % Mechanical mode B1 natural frequency
information.omega_2 = omega_2;           % Mechanical mode B2 natural frequency
information.alpha   = alpha;             % Coherent state number for optical mode A
information.beta_1  = beta_1;            % Coherent state number for mechanical mode B_1
information.beta_2  = beta_2;            % Coherent state number for mechanical mode B_2
information.k_1     = k_1;               % Dimensionless optomechanical coupling between modes A and B1
information.k_2     = k_2;               % Dimensionless optomechanical coupling between modes A and B2
information.t0      = t0;                % Initial time for the plot
information.tf      = tf;                % Final time for the plot
information.N       = N;                 % Number of points


%% Calculation 
global t Log_Negativity Entropy      

scaled_time = true;
if scaled_time
  x_label = 't [1/omega_1]';
  t = linspace(t0, tf, N);               % Time stamps where the logarithmic negativity will be evaluated
  information.omega_a = information.omega_a/omega_1;
  information.omega_1 = information.omega_1/omega_1;
  information.omega_2 = information.omega_2/omega_1;
else
  x_label = 't [s]';
  t = linspace(t0/omega_1, tf/omega_1, N);   % Time stamps where the logarithmic negativity will be evaluated
end

Log_Negativity = logarithmic_negativity2(t); % Evaluate the logarithmic negativity at each time 

Entropy = von_Neumann_Entropy2(t);        % Evaluate the von Neuman entropy at each time 

razao = imag(Entropy)./real(Entropy);
max_entropy = max(abs(Entropy(2:end)));  % valor maximo que a entropia alcancou
idx = razao > 1e-2;                      % indice booleano dos casos que deu ruim
if ~isempty(Entropy(idx))
  if abs(Entropy(idx)) < 1e-2*max_entropy  % se nos casos que deu ruim a entropia for quase nula,
    dummy_variable = 2;                      % não tem problema, é só lixo de erro numérico
  else
    disp("Entropia complexa! Parte imaginária não desprezável !!!")                         % mas se o valor da entropia é considerável, temos problemas !
  end
end

%% Plot

global figure_handle_mirror_entanglement
figure_handle_mirror_entanglement = figure(7);
figure_handle_mirror_entanglement.Name = 'Mirror Entanglement';

yyaxis left
plot_entanglement = plot(t, Log_Negativity, 'b', 'LineWidth', 1);
minimum = 0.9*min(Log_Negativity);
maximum = 1.01*max(Log_Negativity);
ylim([minimum, maximum])
xlim([t(1), t(end)])

yyaxis right
plot_entropy = plot(t, real(Entropy), 'r', 'LineWidth', 1);
minimum = 0.9*min( real(Entropy) );
maximum = 1.1*max( real(Entropy) );
ylim([minimum, maximum])
xlim([t(1), t(end)])
xlabel(x_label)

ax = gca;
legend(ax, [plot_entanglement, plot_entropy], {'$\mathcal{E}_{B_1B_2}(t)$', '$S_{B_1B_2}(t)$'},'Fontsize',20,'interpreter','latex')

information.omega_a = information.omega_a*omega_1;
information.omega_1 = information.omega_1*omega_1;
information.omega_2 = information.omega_2*omega_1;

%% User Interface

global dialog_handle_mirror_entanglement
                 
dialog_name = 'Current parameters used'; 
dialog_handle_mirror_entanglement = dialog('Position',[10 215 250 350],'Name',dialog_name, 'WindowStyle', 'normal');

string_with_information = sprintf(' \\omega_a = %.2e Hz\n \\omega_1 = %.2e Hz\n \\omega_2 = %.2e Hz\n \\alpha = %.2e \n \\beta_1 = %.2e \n \\beta_2 = %.2e \n k_1 = %.2e \n k_2 = %.2e \n t_0: %.2e [1/\\omega_1] \n t_f: %.2e [1/\\omega_1] \n N: %.2e', information.omega_a, information.omega_1, information.omega_2, information.alpha, information.beta_1, information.beta_2, information.k_1, information.k_2, information.t0, information.tf, information.N);

annotation(dialog_handle_mirror_entanglement, 'textbox','String',string_with_information, 'FontSize',12,'units','pix', 'Position', [20 40 210 300]);    %,'Interpreter','Tex');

uicontrol('Parent',dialog_handle_mirror_entanglement,'Position',[80 10 100 25],'String','Change parameters','Callback','change_parameters_mirror_entanglement');

end
