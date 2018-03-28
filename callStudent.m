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

function callStudent (courseIdent)
  % callStudent() is a function that allows instructors to track participation
  %
  % It is reccomended to call this function from a terminal running octave-cli
  % For more detailed documentation, please see README.md in root folder
  %
  % Inputs:
  %   courseIdent - a string that cooresponds to the .mat file with data
  %
  % Copyright (C) 2018 Samuel Bechara
  
  if nargin ~= 1
    error('This function requires exactly 1 input. See Docs');
  end
  
  
  load('mech200.mat')
  % .mat file should contain 4 vectors (n - number of students)
  %   names - nx1 vector
  %   calls - nx1 vector
  %   numCorrect - nx1 vector
  %   blacklist - a vector containing a list of studentNums that have dropped
  
  % Select a random student
  
  [ExpandedTickets] = ExpandTickets (ColpTick); %Expand colapsed tickets stored in ColpTick.
  
  rStudent = ExpandedTickets(randi(numel(ExpandedTickets))); %Pick student


  if ismember(rStudent,blacklist)
      while ismember(rStudent,blacklist)
        rStudent = ExpandedTickets(randi(numel(ExpandedTickets)));
      end
  else rStudent == 0 %If the ticket selected is 0, pick another one.
       rStudent = ExpandedTickets(randi(numel(ExpandedTickets)));
  end

  % "Call" on student
  fprintf('\nStudent number %i is: %s\n\n',rStudent,names{rStudent});

  present = input('Is student "here"? 0-No 1-Yes ---->  ');

  if present ~= 0 && present ~= 1
      fprintf('\n');
      disp('Skipping...');
      fprintf('\n');
  elseif present == 0
      calls(rStudent) = calls(rStudent) + 1;
      ColpTick (rStudent,1) = ColpTick (rStudent,1) + 2; %Add two tickets for absent student.
  else
      calls(rStudent) = calls(rStudent) + 1;
  
  end

  if present == 1
      
      numCorrect(rStudent) = numCorrect(rStudent) + 1;
      ColpTick = ColpTick + 1; %Add ticket to everyone
      ColpTick (rStudent,1) = ColpTick (rStudent,1) - 1; %Substract the extra tick from the called student.

  end
  
ExpandedTickets = ExpandTickets (ColpTick);
CollapseTickets (ExpandedTickets);
  
  
saveFilePath = '/Users/abdullahalameri/Documents/MATLAB/mech200.mat';
  save("-mat",saveFilePath,"blacklist","calls","names","numCorrect","ColpTick","saveFilePath")
end
