function [a, b, c, a_dagger, b_dagger, c_dagger, a_a, a_a_dagger, a_dagger_a, a_dagger_a_dagger, b_b, b_b_dagger, b_dagger_b, b_dagger_b_dagger, c_c, c_c_dagger, c_dagger_c, c_dagger_c_dagger, a_b, a_b_dagger, a_dagger_b, a_dagger_b_dagger, a_c, a_c_dagger, a_dagger_c, a_dagger_c_dagger, b_c, b_c_dagger, b_dagger_c, b_dagger_c_dagger] = calculate_expected_values3(t)
global subsystem_name

if strcmp(subsystem_name, "ABC")
  
  a_a               = expected_a_a(t);
  a_a_dagger        = expected_a_a_dagger(t);
  a_dagger_a        = expected_a_dagger_a(t);
  a_dagger_a_dagger = conj(a_a);
  
  b_b               = expected_b_b(t);
  b_b_dagger        = expected_b_b_dagger(t);
  b_dagger_b        = expected_b_dagger_b(t);
  b_dagger_b_dagger = conj(b_b);
  
  c_c               = expected_c_c(t);
  c_c_dagger        = expected_c_c_dagger(t);
  c_dagger_c        = expected_c_dagger_c(t);
  c_dagger_c_dagger = conj(c_c);
  
  a_b               = expected_a_b(t);
  b_a               = expected_b_a(t);
  a_b_dagger        = expected_a_b_dagger(t);
  a_dagger_b        = expected_a_dagger_b(t);
  a_dagger_b_dagger = conj(b_a);
  
  a_c               = expected_a_c(t);
  c_a               = expected_c_a(t);
  a_c_dagger        = expected_a_c_dagger(t);
  a_dagger_c        = expected_a_dagger_c(t);
  a_dagger_c_dagger = conj(c_a);
  
  b_c               = expected_b_c(t);
  c_b               = expected_c_b(t);
  b_c_dagger        = expected_b_c_dagger(t);
  b_dagger_c        = expected_b_dagger_c(t);
  b_dagger_c_dagger = conj(c_b);
  
  a = expected_a(t);
  a_dagger = conj(a);
  
  b = expected_b(t);
  b_dagger = conj(b);
  
  c = expected_c(t);
  c_dagger = conj(c);
 
else
  msg = 'Wrong name of subsystem provided ! Calculations ended...';
  error(msg)
end

end
