from count_set import Set
import pickle
import MyAlgo
import json


with open("outfile1","rb") as f:
	l = pickle.load(f)

#l = [[1,2,3],[2,3,4],[4,5,6]]
l = MyAlgo.findGroups(l[3])
elements = list()
group = 1
for s in l:
	#print(s._elements)
	#print(s._count)
	data={}

	data["group"] = group
	data["count"] = s._count
	data["Id"] = list(s._elements)

	elements.append(data)
	group += 1


json_string = json.dumps(elements)
print(json_string)
with open('Reader1-A.json', 'w') as outfile:
	json.dump(elements, outfile)



#[
#    {"group":"1","count":"19","Id":["57e4f8","ca3e169b9"]},
#    {"group":"2","count":"3","Id":["57e4f8sdsd","ca3e169sdsdb9"]}
#]