function result = B(t)

% Mathematical function B(t)

global information
k2 = information.k2;

result = -(k2).*(t - sin(t));

end