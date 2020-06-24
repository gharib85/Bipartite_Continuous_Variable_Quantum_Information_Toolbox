function [a, a_dagger, a_a, a_a_dagger, a_dagger_a, a_dagger_a_dagger] = calculate_expected_values1(t)

% Calculate the expectation values of annihilation/creation operator for the subsystem under study

global subsystem_name
global all_susystems_names

if strcmp(subsystem_name, all_susystems_names{1})
  
  a = expected_a_1(t);
  a_dagger = conj(a);
  
  a_a               = expected_a_1_a_1(t);
  a_dagger_a        = expected_a_1_dagger_a_1(t);
  a_a_dagger        = a_dagger_a + 1;
  a_dagger_a_dagger = conj(a_a);
  

elseif strcmp(subsystem_name, all_susystems_names{2})
  
  a = expected_a_2(t);
  a_dagger = conj(a);
  
  a_a               = expected_a_2_a_2(t);
  a_dagger_a        = expected_a_2_dagger_a_2(t);
  a_a_dagger        = a_dagger_a + 1;
  a_dagger_a_dagger = conj(a_a);
  
elseif strcmp(subsystem_name, all_susystems_names{3})
  
  a = expected_a_3(t);
  a_dagger = conj(a);
  
  a_a               = expected_a_3_a_3(t);
  a_dagger_a        = expected_a_3_dagger_a_3(t);
  a_a_dagger        = a_dagger_a + 1;
  a_dagger_a_dagger = conj(a_a);
  
else
  msg = 'Wrong subsystem name provided ! Calculations ended...';
  error(msg)
end

end



