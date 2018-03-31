function [CollapsedTickets] = CollapseTickets (ExpandedTickets)

%This Function will take a large set of matrix (n x n) represents tickets
%and convert them into column array that corresponds to how many tickets
%each student have (How many non-zero elements in each raw).
%
%----------
%
%Each ticket has the number of the raw it holds, which corresponds to the
%student number in the class roster.
%


NumOfTick = 0;
[ r , c ] = size(ExpandedTickets);


for i = 1:r
    for k = 1:c
    if ExpandedTickets(i,k) ~= 0 && NumOfTick <= c 
        
        NumOfTick = NumOfTick + 1;
        CollapsedTickets(i,1) = NumOfTick; 
    end
    end
    
NumOfTick = 0;

end


end