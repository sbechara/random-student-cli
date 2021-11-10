clear
clc

load mech105

aryehMax = 30;

fileID = fopen("graderAssign.txt","w");

fprintf(fileID,"Aryeh's Students\n");
fprintf(fileID,"-----------------\n");

for i = 1:aryehMax
    fprintf(fileID,"%s\n",names{i});
end

stopNum = floor((length(names) - aryehMax)/2);

fprintf(fileID,"\nJustin's Students\n");
fprintf(fileID,"-----------------\n");

for i = aryehMax+1:aryehMax+stopNum
    fprintf(fileID,"%s\n",names{i});
end

fprintf(fileID,"\nNates's Students\n");

fprintf(fileID,"-----------------\n");

for i = aryehMax+stopNum+1:length(names)
    fprintf(fileID,"%s\n",names{i});
end
