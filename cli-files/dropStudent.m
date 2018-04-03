% Copyright (C) 2018 Samuel Bechara
% 
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.

% Author: Samuel Bechara <sbechara@sbechara-ThinkPad-T440s>
% Created: 2018-01-04

function [confirmation] = dropStudent (courseIdent, studentNum)
  % dropStudent() removes the student number from the courseIdent mat file_in_loadpath
  % NOTE: This function does not actually remove the student, 
  % it just adds thier number to the blacklist array in the .mat file so they 
  % will not be called in the future
  %
  % Inputs:
  %   courseIdent - a string that cooresponds to the .mat file with data
  %   studentNum - the number that I assign to the student
  %
  % Outputs (optional):
  %   confirmation - logical 0 or 1 if student was dropped
  %
  
  if nargin ~= 2
    error('This function requires exactly two inputs. See docs');
  end
  
  load(courseIdent);
  
  fprintf('\nAre you sure you want to remove Student number %i: %s\n\n',studentNum,names{studentNum});
  confirmation = input('Type yes to confirm: ','s');
  
  if confirmation ~= "yes" && confirmation ~= "Yes"
    error('Aborting dropping student');
  else
    blacklist = [blacklist studentNum];
    save("-mat",saveFilePath,"blacklist","calls","names","numCorrect","saveFilePath");
  end

end
