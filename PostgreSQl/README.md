#   DBMS

## ACID property:
-   It maintains the reliability of database.
-   The general principle is if one change fails, whole transaction should be failed. It keeps the database same as it is before the changes fail.
-   ACID   -   Atomicity, Consistency, Isolation, Durability

## Keys
-   Keys are used to identify the record uniquely.
-   Types of Keys:
    -   Super Key - Any set of columns or a single column which can identify the records uniquely
    -   Candidate Key - A set of Minimal columns or a single column which can identify the records uniquely 
    -   Primary Key - A set of column or a single column choosen for a relation to identify the records uniquely
    -   Alternate Key - Any key other than Primary key in Candidate key is considered as Alternate key
    -   Composite Key - A type of Primary Key where two or more attributes are used to identify the records uniquely

## Functional Dependency
-   Any attribute which is dependent on other attribute for its identification forms a functional dependency.
-   Y is dependent on X for its identification. Functional Dependency Set : {X->Y}  X determines Y


## Clouser
-   A set of attributes which can be determined using a particular attribute from the Functional Dependency Set

##  Prime and Non Prime attributes
-   Prime Attributes:
    -   Attributes which are used to form a candidate key are Prime Attributes

-   Non-Prime Attributes:
    -   Attributes which are not used to form a candidate key are Non-Prime Attributes.


##  Normalization
####   1NF
    -   Every attribute must be single valued
    -   Each attribute must have a unique name
    -   Every attribute set must be of uniform type that means each value in column should be of same type

####    2NF
-   Database should be in 1NF
-   No partial dependency should be there
-   Partial Dependency:
    -   No non-prime attribute can be derived from any subset of candidate key
    -   Each non-prime attribute must depend on the candidate key set as whole

####    3NF
-   Database must be in 2NF
-   No transitive dependency should be there
-   Transitive Dependecy:
    -   There should not be any case where non-prime attribute is deriving a non-prime attribute
    -   Left Hand Side must be super key (candidate key is a subset of superkey) if not then Right Hand Side must be prime key
    -   Non-Prime -> Non-Prime  | x Not Allowed

####    Boys Codd Normal Form (BCNF)
-   Database should be in 3NF
-   Left Hand Side must be Super key for the given set of functional Dependency

####    4NF
-   Database should be in BCNF
-   No multivalued dependency is allowed

####    5NF
-   Database should be in 4NF
-   Lossless decomposition should be there


##  Denormalization
-   It is opposite to normalization, here we combine multiple tables or add redundency to the table.
-   Here we compromise with the redundency in tables and optimize the time taken by JOIN operation for refering to multiple tables.


##  Indexing
-   A data structure which stores key-value pair for search key and the reference pointer to memory address
-   Provides fast access to the data
-   Two types of indexing:
    -   Sparse Indexing:
        -   Stores a reference for the blocks of data where the reference pointer points to the starting record of the block
        -   Data is considered to be multiple blocks of (say) n records, the search key is compared and the closest key in the index table is used to get the reference pointer of the block and then the sequential search is performed to get the required search key record.  
        -   Thus requires a less memory as reference pointer for each search key is not stored in the index table

    -   Dense Indexing:
        -   Stores a reference pointer for all the search keys in to a index table
        -   Thus it provides a faster access as no sequential search is envolved
        -   As reference pointer is stored for every search key it consumes a lot of memory.

    
-   Hash File Organisation
    -   Cluster Indexing
        -   Similar records are grouped together into a file and these records are ordered. 
        -   These similar records grouped together to form a cluster and a reference pointer is provided to this cluster in to index table.
        -   There may be a case where non primary keys are used together to identify records uniquely which works as search key in index table.

    -   Primary Indexing
        -   A type of clustering indexing where primary keys are used as search keys in index table.
        -   The records are stored based on sorted order of primary keys.
    
    -   Non Cluster or Secondary Indexing
        -   e.g.    content table in a book where a page number is defined for all the contents 

    -   Multilevel Indexing
        -   Various index tables are formed which forms a tree like structure where actual reference locations of the records are at leaves.
        -   There is one root index table which contains reference pointers to different index tables or pages for various relations and at last we have the actual reference pointers for our records.

-   PGAdmin:
    -   Double quotes: Used to indicate identifiers specifically
    -   Single Quotes: Used to represent the textual values


### Functions and Procedures
-   Functions: Can return the result
-   Procedures: Cannot return the result


### Procedures:
-   The body of the procerdures must need to be encapsulated within some delimeters like '$$'.
-   This delimeter allows to use the single quotes inside the string literal.
-   Thus it is used to define the body of the procedures which may include the single quotes.