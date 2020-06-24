function nu = symplectic_eigenvalues(V)

omega = [0, 1; -1, 0];

% Symplectic matrix
Omega = kron(eye(3),omega);

% Calculations of every eigenvalue of this matrix
lambda = eig( 1i*Omega*V );

% We are only interested in the absolute values of these eigenvalues
nu = abs(lambda);

% There are repeted absolute values, which we don't want, lets get rid of them
nu = sort(nu);              % sort the eigenvalues in increasing order
nu = [nu(1), nu(3), nu(5)]; % There are repeted modulus of eigenvalues, so lets not use them (they were arranged by the previous line!)

end