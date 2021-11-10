function initializeRandomStudent (xlsFileName)
% initializeRandomStudent() is meant to be run once at the beginning of each
% semester to generate the vectors and .mat files necessary for the
% randomStudent functions to work
%
% NOTE: Your .mat file will have the same name as your xls file (think of
% it as just the extension is what is being changed)
%
% Inputs:
%   xlsFileName - a string that points to an xls file with the names of
%   all the students in the section. Note: the name of the xlsFileName
%   will become the name of the course.
% Created: 2018-01-05
% Last Edited: 9-Nov-2021,2018-01-16

% Create table and initialize values
courseStats = readtable(xlsFileName);
courseStats.NumCalls = zeros(length(courseStats.Names),1);
courseStats.NumCorrect = courseStats.NumCalls;
courseStats.NumWrong = courseStats.NumCalls;
courseStats.NumSkipped = courseStats.NumCalls;
courseStats.Properties.RowNames = courseStats.Names;

% Swap extensions
s = strcat(xlsFileName);
s = erase(s,'.xls');

% only save the necessary workspace variables
save(s,"courseStats");

fprintf("\n ---------------------------\n Function Successfully Run \n Check Working Directory \n ---------------------------\n");

end
