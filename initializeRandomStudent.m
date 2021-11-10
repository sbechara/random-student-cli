function [courseIdent] = initializeRandomStudent (xlsFileName)
% initializeRandomStudent() is meant to be run once at the beginning of each
% semester to generate the vectors and .mat files necessary for the
% randomStudent functions to work
%
% PLEASE SEE DOCS FOR ADDITIONAL INFORMATION
%
% Inputs:
%   xlsFileName - a string that points to an xls file with the names of
%   all the students in the section. Note: the name of the xlsFileName
%   will become the name of the course.
% Created: 2018-01-05
% Last Edited: 9-Nov-2021,2018-01-16

courseIdent = readtable(xlsFileName);
courseIdent.NumCalls = zeros(length(courseIdent.Names),1);
courseIdent.NumCorrect = courseIdent.NumCalls;
courseIdent.NumWrong = courseIdent.NumCalls;
courseIdent.Properties.RowNames = courseIdent.Names;

% only save the necessary workspace variables
save(xlsFileName,'-mat');

fprintf("\n -------\n Success \n -------\n");

end
