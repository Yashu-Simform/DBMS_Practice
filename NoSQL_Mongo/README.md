#   NoSQL - MongoDB
-   NoSQL - Not Only SQL
-   Any database which does not uses the relational table,rows and columns format to store the data are NoSQL dbs.
-   An opensource Non Relational Database - MongoDB
-   Provides high availability of data and high performance for data operations.


##  Types of NoSQL dbs:
-   Generally dbs are categorized in 4 ways based on their type of storage.
    -   Document storage
    -   Key-Value pair storage
    -   Column oriented dbs
    -   Graph storage

##  Terminlogies
-   Clusters:   A set of nodes(machines) where data is stored where one is primary and others are secondary nodes.
-   Documents:  Records in MongoDB are called Documents.
-   Collection: A set of documents is known as collection.
-   Database:   A set of collections is known as database.

### MongoDB Query API
-   Two ways:
    -   CRUD Operations
    -   Aggregation Pipeline

### Command to create or change specific database:
-   'use' command creates a new database if not existing. 
```
use database_name
```


### Command to create a collection in database:
In MongoDB a collection is not actually created until content is added to it.
-   1. Using Database method:
```
db.createCollection('name_of_collection')
```

-   2.  Without using database method:
```
db.name_of_collection.insertOne(doc)
```
This will create a collection with the used name if does not exist and insert the document


##  CRUD Operations:
I have created database named: store.
And I have created one collection named products in database store.

-   Apply command to access the collections in database "store": 
```
use store
```


### Create Operations:
-   Insert a single document
```
db.products.insertOne({name:"Orange", price: 60})
```

-   Insert multiple documents at once:
```
db.products.insertMany(
    [
        {
            name: "Apple",
            price: 65
        },
        {
            name: "Watermelon",
            price: 80
        },
        {
            name: "Mango",
            price: 120
        }
    ]
)
```
Here an array of objects is provided into the insertMany() method.


### Read Operation:
-   find() method is used to read documents. 
-   find() method resemble to SELECT in SQL.
-   It takes two params:
```
db.products.find({filter attributes}, {projections})
```

-   In {projections} either specify true fields or specify false fields, specification of both will results into error. (true: field to show, false: field not to show) where _id is exception.

-   Read all the documents:
```
db.products.find()

OR

db.products.find({})
```


-   Read specific documents only:
```
db.products.find({name: "Orange"})
```
This will read all documents with name Orange.


-   Record with specific projection - it returns the documents with the specified fields or attributes only (_id will by default set to true, hence it will be shown until explicitly defined false)
```
db.products.find({}, {_id:false, name: true (or 1)})   ->  Returns all the documents with the name field only
```


```
db.products.find({name:"Apple"}, {price:true})  ->  Returns the document having name "Apple" and with fields: _id and price
```


```
db.products.find({}, {_id:false, taste:true})  ->  If the specified field is not present in the document then it returns the empty documnet as {}
```


-   Similarly you can find only one or first document satisfing the criteria using `findOne()` method
```
db.products.findOne({name: "Mango"}, {_id:false, price:true})
```

### Update Operation:
-   Can update the document using updateOne() and updateMany() methods

-   Updating a single document:
```
    db.products.updateOne({name: "Apple"}, {$set:{price: 80}})
```
This will update price to 80 for first document having name field set to "Apple".


-   Insert a document if not found using `upsert` option in these methods
```
db.products.updateOne({name: "grapes"}, {$set:{name: "grapes", price: 40}}, {upsert:true})
```


-   Update all documents
```
db.products.updateMany({}, {$set:{category: "Fruit"}})  ->  These will add field name category and set its value to Fruit in all documents
```

### Delete Operation
-   To delete a specific document from the collection use deleteOne() or deleteMany() methods
```
    db.products.deleteOne({}) ->  Delete the first document
    db.products.deleteMany({})  ->  Delete all the documents
```

-   Delete specific documents
```
    db.products.deleteOne({name:"Watermelon"})  ->  Delete a document having name specified as "Watermelon"
```


### Query-Operators
-   Operators like: $sum, $add, $max, $multiply

### Aggregates:
-   It is used to work with grouped data.
-   It aggregates the documents and allow to perform certain operations on this aggregation.
-   Provide to define a aggregation pipeline having one or multiple satges within it.

```
    
```


### Indexing
#### What is indexing?
-   Indexing is basically a mapped reference stored in seperate data structure like B-tree in order to efficiently retrive or search data.
-   Its like map [key: Value]   <->   [Search_Field: Indexed_Reference]
-   It sorts the documents based on specified field and option(ascending or descending).
-   Here, searching is done with the time complexity of about O(log2n) by implementing the data structures like B-Tree, etc.


#### When to use Indexing?
-   When the collection is small.
-   When documents are not frequently inserted or updated.
-   When read-to-write operation ratio is high.
-   When searching is the primary objective of the collection.


#### Different ways to implement indexing with keys.
-   Single Index:   Implementd on a single search Key
-   Coumpound Index:    Implemented on a combination of more than one search keys.
-   Multi-key Index:    Implemented on a array field or a string.
-   Text Index: Form a dictonary for unique words and indexed it for multiple documents as we do in NLP. Like google search.
    -   Mongodb uses Apache Lucance as text search engine.




##  Relational (SQL) vs Non-Relational (NoSQL)
-   Scalability:
    -   SQL:    Scalling will cost more as db grows. Thus, bad at scalling.
    -   NoSQL:  Provides Horizontal Scalling which can handle large dbs with comparatively low cost as it uses CLOUD.

-   Storage Structure of dbs:
    -   SQL:    Structure of dbs are defined priorly and it is very difficult to change the whole structure afterwards.
    -   NoSQL:  Flexible in case of structur of dbs, no need to define structure priorly.

-   Relationships:
    -   SQL:    Enables us to maintain relationships between data
    -   NoSQL:  Does not provide relationship between data

-   Retrival:
    -   SQL:    Queries may take much time to get executed when a large volume of data is joined. Thus fetching time can be larger.
    -   NoSQL:  Efficient for handling large volume of data and simple queries.

