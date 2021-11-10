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

function initializeRandomStudent (xlsFileName, courseIdent)
  % initializeRandomStudent() is meant to be run once at the beginning of each
  % semester to generate the vectors and .mat files necessary for the
  % randomStudent functions to work
  %
  % PLEASE SEE DOCS FOR ADDITIONAL INFORMATION
  %
  % Inputs:
  %   csvFileName - a string that points to semicolon delimited csv file
  %   courseIdent - user chooses a name to identify course by. Will be .mat file used in all future calls to functions.
  %                 i.e.) mech105
  % initialize blacklist to 0 since no one drops before classes start
  % Author: Samuel Bechara <sbechara@sbechara-ThinkPad-T440s>
  % Created: 2018-01-05
  % Last Edited: 2018-01-16
  
  blacklist = [0]; 
  
  % Need to fix doesn't work with MATLAB for some reason
  %names = textread(csvFileName,'%s','delimiter',';');
  data = readtable(xlsFileName);
  names = data.Names;
  calls = zeros(length(names),1);
  numCorrect = calls;
  
  currentDirectory = pwd;
  saveFilePath = strcat(currentDirectory,"/",courseIdent,".mat");
  
  % only save the necessary workspace variables
  save(saveFilePath,'blacklist','names','calls','numCorrect','saveFilePath');
  
  fprintf("\nNote the save path is %s\n",saveFilePath);

end
