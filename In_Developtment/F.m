function result = F(X)
% Auxiliar routine
% MATHEMATICAL DESCRIPTION
% F(x) = max[0, -log(x)]

result = zeros(size(X));

for i=1:length(X)
  x = X(i);
  
  if x < 1
    result(i) = -log(x);
  else
    result(i) = 0;
  end
  
end

end