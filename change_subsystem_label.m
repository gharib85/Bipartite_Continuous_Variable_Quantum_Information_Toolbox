function change_subsystem_label(labels, display_names)

% Change the label the program uses to describe each subsystems and bipartitions (pair of subsystems!)
% Also display the name change for the user to keep track (can be enabled through a second parameter)

global all_susystems_names
global all_bipartitions_names

all_susystems_names = cellstr(labels);
all_bipartitions_names = {};
N = length(all_susystems_names);
idx = 0;

if N == 1
  all_bipartitions_names = strcat(all_susystems_names{1}, all_susystems_names{1});
else
  
  for i=1:N-1
    for j=i+1:N
      idx = idx + 1;
      all_bipartitions_names{idx} = strcat(all_susystems_names{i}, all_susystems_names{j});
    end
  end
  
end


if nargin > 1 && display_names
  
  disp("Subsystems names changed:")
  for i=1:N-1
    txt = sprintf("a_%d -> %s ; ", i, all_susystems_names{i});
    fprintf(txt)
  end
  if N > 1
    disp("a_" + N + " -> " + all_susystems_names{N})
  else
    disp("a_" + N + " -> " + all_susystems_names)
  end
  
  
  fprintf("\nBipartitions names:\n")
  for i=1:idx-1
    txt = sprintf("%s ; ", all_bipartitions_names{i});
    fprintf(txt)
  end
  if idx > 1
    disp(all_bipartitions_names{idx})
  else
    disp(all_bipartitions_names)
  end
  
end

end


