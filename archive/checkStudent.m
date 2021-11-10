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

function [numCalls,numCorrect,percentage] = checkStudent (courseIdent, studentNum)
  % checkStudent() is a function that allows instructors to track participation
  %
  % It is reccomended to call this function from a terminal running octave-cli
  % For more detailed documentation, please see README.md in root folder
  %
  % Inputs:
  %   courseIdent - a string that cooresponds to the .mat file with data
  %   studentNum - the number that I assign to the student
  %
  % Outputs (optional):
  %   numCalls - the number of times that student has been called
  %   numCorrect - the number of times that student has been present
  %   percentage - the percentage of time that studnet has been present
  %
  % Copyright (C) 2018 Samuel Bechara
  if nargin ~= 2
    error('This function requires exactly two inputs. See docs');
  end
  
  load(courseIdent)
  
  fprintf('\nStudent number %i is: %s\n\n',studentNum,names{studentNum});
  fprintf('----------------- STATS -----------------\n');
  fprintf('%s has been called %i times\n',names{studentNum},calls(studentNum));
  fprintf('%s has been "here" %i%% of the time\n\n',names{studentNum},numCorrect(studentNum)/calls(studentNum)*100);
  
  numCalls = calls(studentNum);
  numCorrect = numCorrect(studentNum);
  percentage = numCorrect/numCalls*100;
  
  clear all

end
