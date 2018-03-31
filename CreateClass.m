blacklist = [0];
%blacklist=(num2cell(blacklist))
calls = [0;0;0;0;0];
%calls = (calls)%
names = ['A';'B';'C';'D';'E'];
names= (num2cell(names))
numCorrect = [0;0;0;0;0];
%numCorrect = (num2cell(numCorrect))
%looprun = [2] ;
%Tickets = repmat(names,1,2);
ColpTick = [1;1;1;1;1]

save('mech105.mat','blacklist','calls','names','numCorrect','ColpTick')