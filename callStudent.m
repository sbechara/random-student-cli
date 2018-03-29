function callstudent( courseIdent )
%callstudent calls a student randomly using a probability mass
%function thats adapts each time a student is called and changes their 
%probability of being called again depending if they are present or not
%Inputs
% courseIdent - class name specified in set up of class
  if nargin < 1 || nargin > 1 %anything other than one input not allowed
      error('One input bro!')
  end
load('mech105.mat')%load previous probability sets
[~,n] = size(names); %determines amount of names
population = (1:n); %sets array of students
sample_size = 1; %amount of students randomly choosen

rStudent = randsample(population, sample_size, true, probability); %magic fn
if ismember(rStudent,blacklist) %check for student on blacklist
      while ismember(rStudent,blacklist) %if blacklister then skip
        rStudent = randsample(population, sample_size, true, probability);%run function again
        %for another student
      end
end
disp(names(rStudent)) %display student choosen
present = input('Is student "here"? 0-No 1-Yes ---->  '); %is student here
if present ~= 0 && present ~= 1
      fprintf('\n');
      disp('Skipping...'); %skip if anything else pressed
      fprintf('\n');
else
   calls(rStudent) = calls(rStudent) + 1; %add calls of student
end
if present == 1 
    probability(rStudent) = probability(rStudent) - .25; %if here lower probability by .25
    numCorrect(rStudent) = numCorrect(rStudent) + 1;%add a correct question
elseif present == 0
    probability(rStudent) = probability(rStudent) + .25;%if not here then raise
    %probability by .25
end
M = min(probability);
if M <= 2*eps(1)
    probability = 10*(probability)
end

%disp(probability); %just to see how probability works
    save('mech105.mat','blacklist','calls','names','numCorrect','probability')
end

