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
% Author: Samuel Bechara
% Created: 2018-01-04
% Last modified: 29-Jul-2022
% By: Jacob Beauchamp

rng shuffle; %Matlab uses a seed to generate random numbers to produce
%pseudorandom numbers. By inserting this line we are able to produce a
%random seed to prevent the same student being called on reboot.

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
    elseif courseStats.NumCalls(rStudent) > 2 && courseStats.NumWrong(rStudent) > 2
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
fprintf('\n')

if present ~= 0 & present ~= 1 | isempty(present)
    fprintf('\n----------------')
    fprintf('\n Skipping...\n')
    fprintf('----------------\n\n')
    courseStats.NumSkipped(rStudent) = courseStats.NumSkipped(rStudent)+1;
else
    courseStats.NumCalls(rStudent) = courseStats.NumCalls(rStudent) + 1;
end

if present == 1
    courseStats.NumCorrect(rStudent) = courseStats.NumCorrect(rStudent) + 1;
    fprintf('\n-----------------------------------------------------------')
    fprintf('\nNice Work! %s\n',string(courseStats.Names(rStudent)));
    fprintf('You have been called on %i times and have been present %i times\n',courseStats.NumCalls(rStudent),courseStats.NumCorrect(rStudent))
    fprintf('-----------------------------------------------------------\n\n')
    disp(courseStats(rStudent,2:end))
elseif present == 0
    fprintf('\n----------------')
    fprintf('\n Bummer man... \n')
    fprintf('----------------\n\n')
    courseStats.NumWrong(rStudent) = courseStats.NumWrong(rStudent) + 1;
end

save(courseIdent,'courseStats')

end
