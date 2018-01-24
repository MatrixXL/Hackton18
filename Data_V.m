%conn = mongo('localhost',27017,'RFID')
[data,str] = xlsread('..\EPC_Hashes.xlsx', 'A:E');
%csvread('neverDetected.csv');
str = str(:,1);
len = length(data);
ls = [];

%scatter3(data(:,1),data(:,2),data(:,3));

for i = 1:len
    ls = [ls,string(str(i))];
end

min =1000;
max =0;
%subplot(2,2,1);
strJS1 = fileread('Reader1-A1.json');
jsonG1 = jsondecode(strJS1);
[a,b]=drawGroup(data,ls,jsonG1);
title('Reader1- Antennen1');
if(a<min) min = a;
elseif(max<b) max = b;
end
 
hold on;
subplot(2,2,2);
strJS2 = fileread('Reader1-A2.json');
jsonG2 = jsondecode(strJS2);
[a,b] = drawGroup(data,ls,jsonG2);
title('Reader1- Antenne2');
if(a<min) min = a;
elseif(max<b) max = b;
end

hold on;
subplot(2,2,3);
strJS3 = fileread('Reader1-A3.json');
jsonG3 = jsondecode(strJS3);
[a, b] = drawGroup(data,ls,jsonG3);
title('Reader1- Antenne3');
if(a<min) min = a;
elseif(max<b) max = b;
end

hold on;
subplot(2,2,4);
strJS4 = fileread('Reader1-A4.json');
jsonG4 = jsondecode(strJS4);
[a, b] = drawGroup(data,ls,jsonG4);
title('Reader1- Antenne4');
if(a<min) min = a;
elseif(max<b) max = b;
end

%colorbar('Ticks',[min,max]);


%compareA(data,ls,jsonG4)
