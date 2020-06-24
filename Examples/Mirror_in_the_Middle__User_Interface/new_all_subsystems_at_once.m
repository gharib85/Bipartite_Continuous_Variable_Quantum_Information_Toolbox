function new_all_subsystems_at_once(T, omega_m, omega_a, omega_b, alpha, beta, k, t0, tf, N)
%% Preamble

t = linspace(t0, tf, N);                 % time stamps where the logarithmic negativity will be evaluated

global information         
information = [];                        % Erase previous values and change numerical constants to be used throughout the program
change_information(T, omega_m, omega_a, omega_b, alpha, beta, k, t0, tf, N) 
          
%% Bipartition AB

change_bipartition_to('AB')              % Change current bipartition inder study to AB
                                
Neg_AB = logarithmic_negativity2(t);     % Evaluate the logarithmic negativity at each time                                

Entropy_AB = von_Neumann_Entropy2(t);    % Evaluate the Von Neumann Entropy at each time  


%% Bipartition AC

change_bipartition_to('AC')              % Change current bipartition inder study to AC
                            
Neg_AC = logarithmic_negativity2(t);     % Evaluate the Logarithmic Negativity at each time                             

Entropy_AC = von_Neumann_Entropy2(t);    % Evaluate the Von Neumann Entropy at each time


%% Bipartition BC

change_bipartition_to('BC')              % Change current bipartition inder study to BC
                     
Neg_BC = logarithmic_negativity2(t);     % Evaluate the logarithmic negativity at each time                              

Entropy_BC = von_Neumann_Entropy2(t);    % Evaluate the Von Neumann Entropy at each time

%% Plot everything
final_entanglement_plot(t, Neg_AB, Entropy_AB, Neg_AC, Entropy_AC, Neg_BC, Entropy_BC)


%% User Interface

global dialog_handle_all_subsystems_at_once_new
dialog_name = 'Current parameters used';
dialog_handle_all_subsystems_at_once_new = dialog('Position',[10 215 250 350],'Name',dialog_name, 'WindowStyle', 'normal');

string_with_information = sprintf('T = %.2e K\n omega_m: %.2e Hz\n omega_a: %.2e Hz\n omega_b: %.2e Hz\n alpha: %.2e \n beta: %.2e \n  k: %.2e \n \n t0: %.2e \n tf: %.2e \n N: %.2e', information.T, information.omega_m, information.omega_a, information.omega_b, information.alpha, information.beta, information.k, information.t0, information.tf, information.N);

annotation(dialog_handle_all_subsystems_at_once_new, 'textbox','String',string_with_information, 'FontSize',12,'units','pix', 'Position', [20 80 210 260]);    %,'Interpreter','Tex');

uicontrol('Parent',dialog_handle_all_subsystems_at_once_new,'Position',[80 20 100 25],'String','Change parameters','Callback','change_parameters_all_subsystems_at_once_new');

end