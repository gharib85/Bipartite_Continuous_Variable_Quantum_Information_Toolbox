function [a, b, a_dagger, b_dagger, a_a, a_a_dagger, a_dagger_a, b_b, b_b_dagger, b_dagger_b, a_b, b_a, a_b_dagger, a_dagger_b, a_dagger_a_dagger, b_dagger_b_dagger, a_dagger_b_dagger] = calculate_expected_values2(t)

% Calculate every possible combination of expectation values of annihilation/creation operator 
% for a bipartition of the system under study

% For the moment, only systems with at most 3 bipartition are considered !
% The user can always separate a n-partite (n>3) as ceil(n/3) systems (folders)
% and each folder can be used to study 3 bipartitions !

global bipartition_name
global all_bipartitions_names

if strcmp(bipartition_name, all_bipartitions_names{1})
  
  a_a               = expected_a_1_a_1(t);
  a_dagger_a        = expected_a_1_dagger_a_1(t);
  a_a_dagger        = a_dagger_a + 1;
  a_dagger_a_dagger = conj(a_a);
  
  b_b               = expected_a_2_a_2(t);
  b_dagger_b        = expected_a_2_dagger_a_2(t);
  b_b_dagger        = b_dagger_b + 1;
  b_dagger_b_dagger = conj(b_b);
  
  a_b               = expected_a_1_a_2(t);
  b_a               = a_b;
  a_b_dagger        = expected_a_1_a_2_dagger(t);
  a_dagger_b        = conj(a_b_dagger);
  a_dagger_b_dagger = conj(b_a);
  
  a = expected_a_1(t);
  b = expected_a_2(t);
  a_dagger = conj(a);
  b_dagger = conj(b);
  
elseif strcmp(bipartition_name, all_bipartitions_names{2})
  
  a_a               = expected_a_1_a_1(t);
  a_dagger_a        = expected_a_1_dagger_a_1(t);
  a_a_dagger        = a_dagger_a + 1;
  a_dagger_a_dagger = conj(a_a);
  
  b_b               = expected_a_3_a_3(t);
  b_dagger_b        = expected_a_3_dagger_a_3(t);
  b_b_dagger        = b_dagger_b + 1;
  b_dagger_b_dagger = conj(b_b);
  
  a_b               = expected_a_1_a_3(t);
  b_a               = a_b;
  a_b_dagger        = expected_a_1_a_3_dagger(t);
  a_dagger_b        = conj(a_b_dagger);
  a_dagger_b_dagger = conj(b_a);
  
  a = expected_a_1(t);
  b = expected_a_3(t);
  a_dagger = conj(a);
  b_dagger = conj(b);
  
elseif strcmp(bipartition_name, all_bipartitions_names{3})
  
  a_a               = expected_a_2_a_2(t);
  a_dagger_a        = expected_a_2_dagger_a_2(t);
  a_a_dagger        = a_dagger_a + 1;
  a_dagger_a_dagger = conj(a_a);
  
  b_b               = expected_a_3_a_3(t);
  b_dagger_b        = expected_a_3_dagger_a_3(t);
  b_b_dagger        = b_dagger_b + 1;
  b_dagger_b_dagger = conj(b_b);
  
  a_b               = expected_a_2_a_3(t);
  b_a               = a_b;
  a_b_dagger        = expected_a_2_a_3_dagger(t);
  a_dagger_b        = conj(a_b_dagger);
  a_dagger_b_dagger = conj(b_a);
  
  a = expected_a_2(t);
  b = expected_a_3(t);
  a_dagger = conj(a);
  b_dagger = conj(b);
  
else
  msg = 'Wrong bipartition name provided ! Calculations ended...';
  error(msg)
end

end



