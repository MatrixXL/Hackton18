from DBConnector import DBConnector

db = DBConnector()
db.selectReader("temp_1_1_0")
a = list(db.find({}))
feature_matrix = []
for tag in a:
    feature = {}
    for measure in tag["obs_by"][:1000]:
        feature.update({measure["measurement_uuid"]:measure["RSSI"]/100})
    feature_matrix.append(feature)

from sklearn.feature_extraction import DictVectorizer
v = DictVectorizer(sparse=True)
x = v.fit_transform(feature_matrix)

from sklearn.cluster import DBSCAN
dbscan = DBSCAN(eps=10, min_samples=2).fit(x)

labels = dbscan.labels_

result = []
print(len(labels))
for i in range(len(labels)):
    result.append([a[i]["_id"], labels[i]])

print(result)

