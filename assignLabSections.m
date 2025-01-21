function assignLabSections(xlsFileName, labLocations, maxLabSize)
% assignLabSections() assigns students from an Excel file to lab sections
% based on the number of lab locations provided.
%
% Inputs:
%   xlsFileName - a string pointing to an Excel file with student names.
%   The file MUST have "Names" in the A1 cell and all the rest of the names
%   in the A column beneath it.
%
%   labLocations - a cell array of strings containing the names of lab
%   locations. The number of locations determines the number of lab sections.
%   e.g. {'Titan','Viking','AVC146'}
%
%   maxLabSize (optional) - a scalar specifying the maximum number of students
%   allowed in a single lab. If this input is provided and the number of students
%   exceeds what can be accommodated by the specified lab locations, a warning
%   will be displayed.
%
% Outputs:
%   A table is displayed with student names and their assigned lab sections.
%   The table is saved as an Excel file with the same name as the xls file
%   with '_labAssignments.xlsx' appended on the end.

% Read the student names from the Excel file
labAss = readtable(xlsFileName);

% Ensure the Excel file contains a "Names" column
if ~ismember('Names', labAss.Properties.VariableNames)
    error('The Excel file must contain a column named "Names".');
end

% Get the number of students and lab sections
numStudents = height(labAss);
numLabs = length(labLocations);

if numLabs == 0
    error('The labLocations input must contain at least one lab location.');
end

% Check if maxLabSize is provided and validate
if nargin < 3
    maxLabSize = Inf; % Default to no maximum lab size
elseif maxLabSize <= 0 || ~isscalar(maxLabSize)
    error('maxLabSize must be a positive scalar.');
end

% Check if the number of students exceeds the maximum lab capacity
if numStudents > maxLabSize * numLabs
    warning(['The maximum lab size has been exceeded. ', ...
             'Some labs will contain more students than the specified limit.']);
end

% Distribute students as equally as possible across lab sections
labAssignments = repmat(1:numLabs, 1, ceil(numStudents / numLabs));
labAssignments = labAssignments(1:numStudents); % Trim to the number of students
labAssignments = labLocations(labAssignments(randperm(numStudents))); % Shuffle and map to lab names

% Add the lab assignments to the table
labAss.LabAssignment = labAssignments';

% Create the output Excel file name by concatenating "labAssignments"
outputFileName = strcat(erase(xlsFileName, '.xls'), '_labAssignments.xlsx');

% Write the table to an Excel file
writetable(labAss, outputFileName);

% Display the table
disp(labAss);

% Calculate and display lab enrollment totals
labTotals = groupcounts(labAss.LabAssignment);
labSummary = table(unique(labAss.LabAssignment), labTotals, 'VariableNames', {'Lab', 'Enrollment'});

% Display the enrollment totals
disp("Lab Enrollment Totals:");
disp(labSummary);

fprintf("\n---------------------------\nFunction Successfully Run\nCheck Working Directory for .xlsx File\n---------------------------\n");
end
