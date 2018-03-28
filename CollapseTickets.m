function [CollapsedTickets] = CollapseTickets (ExpandedTickets)

NumOfTick = 0;
[ r , c ] = size(ExpandedTickets);


for i = 1:r
    for k = 1:c
    if ExpandedTickets(i,k) ~= 0 && NumOfTick <= c %Why I had to switch r and c not i and k?
        
        NumOfTick = NumOfTick + 1;
        CollapsedTickets(i,1) = NumOfTick; 
    end
    end
    
NumOfTick = 0;

end


end