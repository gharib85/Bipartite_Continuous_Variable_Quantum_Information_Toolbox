function change_subsystem_to(subsystem)

% Change the subsystem to be studied
% Default subsystems  labels: a_1, a_2, a_3
% User can change these labels through the routine: 'change_subsystem_label'

global all_susystems_names
global subsystem_name

if isempty(all_susystems_names)                            % Check if the subsystem were previously named
  all_susystems_names = {'a_1', 'a_2', 'a_3'};          % If not give them their default names!
end

if any(strcmp(all_susystems_names, subsystem))          % If the desired bipartition name exists
  subsystem_name = subsystem;                            % Change the current bipartition under study to it
else
  error("Subsystem not found! Maybe a typo or user has not changed the name of the subsystems the programs uses...")
end

end