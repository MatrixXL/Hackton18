from pymongo import MongoClient
client = MongoClient()
import pickle
import json

db = client['RFID']
collection = db['raw_data_192.168.0.69']
tag_list = list(collection.distinct('data.EPC'))
print("hello")
