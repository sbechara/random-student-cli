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

function [studentNumber] = addStudent (courseIdent, studentName)
  
  if nargin ~= 2
    error('This function requires exactly two inputs. See docs');
  end
  
  load(courseIdent)
  
  fprintf('\nAre you sure you want to add Student: %s\n\n',studentName);
  confirmation = input('Type yes to confirm: ','s');
  
  if confirmation ~= "yes" && confirmation ~= "Yes"
    error('Aborting adding student');
  else
    names = [names; studentName];
    calls(length(calls) + 1) = 0;
    numCorrect(length(numCorrect) + 1) = 0;
    save("-mat",saveFilePath,"blacklist","calls","names","numCorrect","saveFilePath")
  end
  
end
