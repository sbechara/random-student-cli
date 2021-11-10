function checkClass(courseIdent)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load(courseIdent)
totalCalls = sum(courseStats.NumCalls);
totalPresent = sum(courseStats.NumCorrect);
totalWrong = sum(courseStats.NumWrong);
totalSkipped = sum(courseStats.NumSkipped);
t = table(totalCalls,totalPresent,totalWrong,totalSkipped);
fprintf('\n')
disp(t)
end