function onPath = isonpath(Folder)
% Checks if the folder exists on the MATLAB path
% Code adapted from: https://www.mathworks.com/matlabcentral/answers/86740-how-can-i-determine-if-a-directory-is-on-the-matlab-path-programmatically
% 
% PARAMETERS
%   Folder - name of the folder



pathCell = regexp(path, pathsep, 'split');

if ispc  % Windows is not case-sensitive
  onPath = any(strcmpi(Folder, pathCell));
else
  onPath = any(strcmp(Folder, pathCell));
end

end