function change_parameters_all_subsystems_at_once_new()

global information
global dialog_handle_all_subsystems_at_once_new
global figure_handle_all_subsystems_at_once_new

prompt = {'T (K)', 'omega_m (Hz)', 'omega_a (Hz)', 'omega_b (Hz)', 'alpha','beta', 'k', 't0', 'tf', 'N'};
dlg_title = 'Change of parameters';
dims = [1, 12];
default_input = {num2str(information.T), num2str(information.omega_m), num2str(information.omega_a), num2str(information.omega_b), num2str(information.alpha),num2str(information.beta),num2str(information.k), num2str(information.t0), num2str(information.tf), num2str(information.N)};

user_input = inputdlg(prompt, dlg_title, dims, default_input);

if ~isempty(user_input)
  T       = str2double(user_input(1));
  omega_m = str2double(user_input(2));
  omega_a = str2double(user_input(3));
  omega_b = str2double(user_input(4));
  alpha   = str2double(user_input(5));
  beta    = str2double(user_input(6));
  k       = str2double(user_input(7));
  t0      = str2double(user_input(8));
  tf      = str2double(user_input(9));
  N       = str2double(user_input(10));
  
  delete(dialog_handle_all_subsystems_at_once_new)
  clf(figure_handle_all_subsystems_at_once_new)
  
  new_all_subsystems_at_once(T, omega_m, omega_a, omega_b, alpha, beta, k, t0, tf, N);
end

%clf(negativity_handle)

end

