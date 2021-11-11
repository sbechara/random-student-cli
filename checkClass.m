function checkClass(courseIdent)
%checkClass() A function to check the stats for a section
%   Inputs:
%       courseIdent - a string that matches the name of the .mat file
%       (without the extension). Example: 'm103f21s1'

load(courseIdent)
totalCalls = sum(courseStats.NumCalls);
totalPresent = sum(courseStats.NumCorrect);
totalWrong = sum(courseStats.NumWrong);
totalSkipped = sum(courseStats.NumSkipped);
t = table(totalCalls,totalPresent,totalWrong,totalSkipped);
fprintf('\n')
disp(t)
end