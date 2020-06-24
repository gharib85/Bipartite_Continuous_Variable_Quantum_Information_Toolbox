function change_system_to(new_folder_name)
% Change the system (Hamiltonian + initial state that changes the exected values) to be studied
%
% Continuous Variable systems can be described only through their second moments, thus one only
% needs its first and second order expectation values that should be save under .m file in 'expectation_value/'
% 
% Default systems/folders: mirror_in_the_middle ; moving_cavity

global system_name

current_script = mfilename('fullpath');     % Get current path to this file
current_folder = current_script(1:end-17);  % Remove this file name (this variable now holds the folder path where tis scipt exists!)

full_new_folder_name = fullfile(current_folder,'expectation_value', new_folder_name);
%full_new_folder_name = strcat(a,'/expectation_value/', new_folder_name)

if exist(full_new_folder_name, 'dir')       % Check if the desired folder with the system's expectation values exists

  old_folder_name = fullfile(current_folder, 'expectation_value', system_name);
  
  if isonpath(old_folder_name)              % If the previous name corresponds to a directory in the path
    rmpath(old_folder_name)                 % Remove it from the path
  end
  
  system_name = new_folder_name;            % Change the name of the directory with the subsystems for this Hamiltonian
  addpath(full_new_folder_name)             % Add the correct directory to the path
  
else
  error("Folder with expectation values does not exist! Ending program...")
end

end



