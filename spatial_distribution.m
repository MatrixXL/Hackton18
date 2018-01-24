%conn = mongo('localhost',27017,'RFID')
[data,str] = xlsread('EPC_Hashes.xlsx', 'A:E');
str = str(:,1);
%scatter3(data(:,2),data(:,3),data(:,4))
len = length(data);
ls = []
for i = 1:len
    ls = [ls,string(str(i))];
end
strJS = fileread('Reader1-A1.json');
jsonG = jsondecode(strJS);
drawGroup(data,ls,jsonG);