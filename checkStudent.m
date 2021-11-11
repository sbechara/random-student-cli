function checkStudent(courseIdent,studentName)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
load(courseIdent)
totalCalls = sum(courseStats.NumCalls(studentName));
totalPresent = sum(courseStats.NumCorrect(studentName));
totalWrong = sum(courseStats.NumWrong(studentName));
totalSkipped = sum(courseStats.NumSkipped(studentName));
t = table(totalCalls,totalPresent,totalWrong,totalSkipped);
fprintf('\n')
disp(t)
end