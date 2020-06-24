function change_parameters_mirror_entanglement()

global information
global dialog_handle_mirror_entanglement
global figure_handle_mirror_entanglement

prompt = {'\omega_a [Hz]', '\omega_1 [Hz]', '\omega_2 [Hz]', '\alpha', '\beta_1','\beta_2', 'k_1', 'k_2', 't_0 [1/\omega_1]', 't_f [1/\omega_1]', 'N'};
dlg_title = 'Change of parameters';
dims = [1, 18];
default_input = {num2str(information.omega_a), num2str(information.omega_1), num2str(information.omega_2), num2str(information.alpha), num2str(information.beta_1), num2str(information.beta_2), num2str(information.k_1), num2str(information.k_2), num2str(information.t0), num2str(information.tf), num2str(information.N)};
options.Interpreter='tex';
user_input = inputdlg(prompt, dlg_title, dims, default_input, options);

if ~isempty(user_input)
  omega_a = str2double(user_input(1));     % Optical mode A natural frequency
  omega_1 = str2double(user_input(2));     % Mechanical mode B1 natural frequency
  omega_2 = str2double(user_input(3));     % Mechanical mode B2 natural frequency
  alpha   = str2double(user_input(4));     % Coherent state number for optical mode A
  beta_1  = str2double(user_input(5));     % Coherent state number for mechanical mode B_1
  beta_2  = str2double(user_input(6));     % Coherent state number for mechanical mode B_2
  k_1     = str2double(user_input(7));     % Dimensionless optomechanical coupling between modes A and B1
  k_2     = str2double(user_input(8));     % Dimensionless optomechanical coupling between modes A and B2
  t0      = str2double(user_input(9));    % Initial time for the plot
  tf      = str2double(user_input(10));    % Final time for the plot
  N       = str2double(user_input(11));    % Number of points    
  
  delete(dialog_handle_mirror_entanglement)
  clf(figure_handle_mirror_entanglement)
  
  mirror_entanglement_internal(omega_a, omega_1, omega_2, alpha, beta_1, beta_2, k_1, k_2, t0, tf, N)
end

end

