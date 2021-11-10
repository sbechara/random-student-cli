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
% Last modified: 9-Nov-2021

function callStudent (courseIdent)
% callStudent() is a function that allows instructors to track participation
%
% It is reccomended to call this function from a terminal running octave-cli
% For more detailed documentation, please see README.md in root folder
%
% Inputs:
%   courseIdent - a string that cooresponds to the .mat file with data
%   table. The data table MUST be named courseStats (if you used the
%   initializer program is will be)
%
% Copyright (C) 2018 Samuel Bechara

if nargin ~= 1
    error('This function requires exactly 1 input. See Docs');
end

load(courseIdent) % must contain table named courseStats

% Select a random student
rStudent = randi(length(courseStats.Names));
willCall = false;

while willCall == false
    % Make sure everyone gets called on
    if courseStats.NumCalls(rStudent) == max(courseStats.NumCalls) && ...
            max(courseStats.NumCalls) - min(courseStats.NumCalls) >=2
        rStudent = randi(length(courseStats.Names));
        % if you aren't here more than 2 times you are out
    elseif courseStats.NumCalls(rStudent) > 2 && courseStats.NumWrong > 2
        rStudent = randi(length(courseStats.Names));
    else
        willCall = true;
    end
end

% "Call" on student
fprintf('\n-----------------------------------------------------------')
fprintf('\nTime to Shine! %s\n',string(courseStats.Names(rStudent)));
fprintf('-----------------------------------------------------------\n\n')

% are they PRESENT as in paying attention
present = input('Is student "here"? 0-No 1-Yes 2-Skip ---->  ');

if present ~= 0 && present ~= 1
    fprintf('\n');
    disp('Skipping...');
    fprintf('\n');
else
    courseStats.NumCalls(rStudent) = courseStats.NumCalls(rStudent) + 1;
end

if present == 1
    courseStats.NumCorrect(rStudent) = courseStats.NumCorrect(rStudent) + 1;
    fprintf('\n-----------------------------------------------------------')
    fprintf('\nNice Work! %s\n',string(courseStats.Names(rStudent)));
    fprintf('You have been called on %i times and have been present %i times\n',courseStats.NumCalls(rStudent),courseStats.NumCorrect(rStudent))
    fprintf('-----------------------------------------------------------\n\n')
end

save(courseIdent)

end
