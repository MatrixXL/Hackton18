function [min, max]= drawGroup(data,ls,jsonG)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%outputArg1 = inputArg1;
%outputArg2 = inputArg2;
n = length(jsonG);
max = 0;
min = 1; 
for i = 1:n
   IdSet = jsonG(i).Id;
   % find the in this group how many Tags are there.
   m = length(IdSet);
   if(isempty(IdSet))
     continue;
   end
   count = jsonG(i).count;
   if(count>max) max = count;
   elseif(count<min) min = count;
   end
   R = rand();
   G =rand();
   B = rand();
   for j = 1:m
     Tag = IdSet(j);
     inx = find(ls==Tag);
     if(~isempty(inx))
        d = data(inx,2:4);
        scatter3(d(1),d(2),d(3),count*0.008,[R,G,B],'filled');
      end
   end
   hold on;
   pause(0.01);
  
       end
 end

