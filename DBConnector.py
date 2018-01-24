from pymongo import MongoClient
import pymongo
import pickle
import numpy as np

class DBConnector:
    _client = None
    _db = None
    _reader = None

    def __init__(self, host='localhost', port=27017):
        self._client = MongoClient(host, port)
        self._db = self._client['RFID']

    def __del__(self):
        self.close()

    def close(self):
        self._reader = None
        self._db = None
        self._client.close()
        self._client = None

    def selectReader(self, collection):
        if self._db == None:
            return

        self._reader = self._db[collection]

    def find(self, condi, proj=None):
        if (proj == None):
            return self._reader.find(condi)

        return self._reader.find(condi, proj)

    def distinct(self, field):
        return self._read.distinct(field)

    def getDistinctMeasurementIDs(self):
        return list(self._reader.distinct('measurement_uuid'))
        
    def getTagsGroupedByAnt(self, measurement_list):
        groups = [[],[],[],[]]
        for m in measurement_list:
            a = list(self._reader.find({"measurement_uuid":m},{"data.AntennaPort":1, "data.EPC":1}))
            groups[a[0]["data"]["AntennaPort"] & 0x3].append([d["data"]["EPC"] for d in a])

        return groups

    def getRSSOfTagsByMeasurement(self, measurement_list):
        data = []
        for m in measurement_list:
            a = list(self._reader.find({"measurement_uuid":m},{"data.RSSI":1, "data.EPC":1}))
            data.append(a)

        return data

db  = DBConnector()
db.selectReader("raw_data_192.168.0.69")
measure = db.getDistinctMeasurementIDs()

g = db.getRSSOfTagsByMeasurement(measure[:100])
with open("outfile", 'wb') as f:
pickle.dump(g, f)
