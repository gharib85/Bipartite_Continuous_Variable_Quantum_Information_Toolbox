function change_bipartition_to(bipartition)

% Change the bipartition to be studied

% Default subsystems  labels: a_1, a_2, a_3
% Default bipartition labels: a_1a_1, a_1a_2, a_2a_3

% User can change these labels through the routine: 'change_subsystem_label'

global bipartition_name
global all_bipartitions_names

if isempty(all_bipartitions_names)                            % Check if the bipartition were previously named
  all_bipartitions_names = {'a_1a_1', 'a_1a_2', 'a_2a_3'}; % If not give them their default names!
end

if any(strcmp(all_bipartitions_names, bipartition))           % If the desired bipartition name exists
  bipartition_name = bipartition;                             % Change the current bipartition under study to it
else
  error("Bipartition not found! Maybe a typo or user has not changed the name of the subsystems the programs uses...")
end



end