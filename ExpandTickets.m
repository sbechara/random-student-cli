function [ExpandedTickets] = ExpandTickets (CollapsedTickets)
%
% This function will expand collapsed tickets vector, it will do the
% oppisit of CollapseTickets function.
%

r = length(CollapsedTickets);
c = max(CollapsedTickets);

ExpandedTickets = zeros (r,c);

for i = 1:r
    for k = 1:CollapsedTickets(i)
        
        ExpandedTickets(i,k) = i;
        
    end
    
end

end