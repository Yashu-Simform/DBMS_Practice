from pymongo import MongoClient
from connection import MongoInst
import pprint

mongoinst = MongoInst()

client = MongoClient(mongoinst.getUrl())

db = client['store']

products = db.products

# print(products.find({}))


pprint.pprint(db.list_collection_names())
# pprint.pprint(products.find_one({"name": "Orange"}))
pprint.pprint(products.find({}))