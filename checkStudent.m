function checkStudent(courseIdent,studentName)
%checkStudent() A function to check the stats for an individual student
%   Inputs:
%       courseIdent - a string that matches the name of the .mat file
%       (without the extension). Example: 'm103f21s1'
%       studentName - a string that matches the name of the student in the
%       courseStats table. Example: 'Davis, Will'
load(courseIdent)
totalCalls = sum(courseStats.NumCalls(studentName));
totalPresent = sum(courseStats.NumCorrect(studentName));
totalWrong = sum(courseStats.NumWrong(studentName));
totalSkipped = sum(courseStats.NumSkipped(studentName));
t = table(totalCalls,totalPresent,totalWrong,totalSkipped);
fprintf('\n')
disp(t)
end