#SELECT * FROM working_data.emp;


#-------------------CTE with window function---------------------------------

-- with emp_more_than_3_in_dept as ( select row_number() over(partition by deptno) emp);

-- with row_count_data as (select *,row_number() over(partition by deptno) as row_count from emp order by deptno,row_count )
-- select *,last_value(row_count) over(partition by deptno 
-- rows between unbounded preceding and unbounded following) as max_count from row_count_data;


with total_count as (select distinct(deptno),
count(empno) over (partition by deptno) as count
from emp)
select * from emp natural inner join total_count where total_count.count>3;

#-----------------------SQL Constrain Function---------------------------

-- 1.NOT NULL	--->It ensures that a column does not accept NULL values.  

-- Example :-	
-- 	CREATE TABLE students (
-- 	student_ID int NOT NULL,
-- 	student_Name varchar(255) NOT NULL,
-- 	class_name varchar(255) NOT NULL,
-- 	Age int
-- 	);

-- 2.CHECK	   ---->It ensures that a column accepts values within the specified range of values.
-- When CHECK constraint is applied to a column, 
-- it ensures that the column will not accept data values outside the specified range. 
-- The CHECK constraint can also be mentioned to ensure that data meets a specified condition like less than,
-- equal to, not, etc.
-- Example :-	
-- 	CREATE TABLE students (
-- 	student_ID int NOT NULL,
-- 	student_Name varchar(255) NOT NULL,
-- 	class_name varchar(255) NOT NULL,
-- 	Age int
-- 	CHECK(Age in ("","",""))
-- 	);



-- 3.UNIQUE   ----->It ensures that a column does not accept duplicate values.

-- Example :- 
-- 	CREATE TABLE students (
-- 	student_ID int UNIQUE,
-- 	student_Name varchar(255) NOT NULL,
-- 	class_name varchar(255) NOT NULL,
-- 	Age int
-- 	);


-- 4.PRIMARY KEY ----->It uniquely identifies a row in the table. It is a combination of NOT NULL and UNIQUE constraints.
-- Example :-
-- 	CREATE TABLE Students(
-- 	Student_ID int NOT NULL,
-- 	Student_Name varchar(255) NOT NULL,
-- 	Class_Name varchar(255),
-- 	Age int,
-- 	PRIMARY KEY (Student_ID)
-- 	);

-- 5.FOREIGN KEY ----->It is like a primary key constraint only. But it uniquely identifies a row in another table.

-- Example :-
-- 	CREATE TABLE Students(
-- 	Student_ID int NOT NULL,
-- 	Student_Name varchar(255) NOT NULL,
-- 	Class_Name varchar(255),
-- 	Age int,
-- 	PRIMARY KEY (Student_ID)             
-- 	FOREIGN KEY (Class_Name) References classes(Class_Name)
-- 	);


-- 6.DEFAULT   ------>	It ensures that the column sets a default value for empty records.
-- Example:-
-- 	CREATE TABLE Students(
-- 	Student_ID int NOT NULL,
-- 	Student_Name varchar(255) NOT NULL,
-- 	Class_Name varchar(255) DEFAULT 'IV'
-- 	);


#---------------------------------sql indexing-------------------------------------------
-- Indexes are used to find rows with specific column values quickly. Without an index, 
-- MySQL must begin with the first row and then read through the entire table to find the relevant rows.
--  The larger the table, the more this costs.
--  
-- 1. Table scan (When index is not there)-does the linear search each and every record.
-- 2. Indexes unique scan.
-- 3. Index range scan.
--  
-- 1. Default index (non-clustered index ): Btree
--  
--    create index index_name on table(columns).

explain select * from worker;

create index demo on worker(Department);
SHOW INDEX FROM worker;

--    
-- The non-clustered index and table data are both stored in different places. 
-- It is not able to sort (ordering) the table data. 
-- The non-clustered indexing is the same as a book where the content is written in one place, a
-- nd the index is at a different place. 
-- SQL allows a table to store one or more than one non-clustered index. 
-- The non-clustered indexing improves the performance of 
-- the queries which uses keys without assigning primary key.
--    
-- Following are the essential characteristics of a non-clustered index:

-- 	It stores only key values.
-- 	It allows accessing secondary data that has pointers to the physical rows.
-- 	It helps in the operation of an index scan and seeks.
-- 	A table can contain one or more than one non-clustered index.
-- 	The non-clustered index row stores the value of a non-clustered key and row locator.
-- 	   
--  
-- 2. Unique Index :

--    create unique index index_name on emp(sal);

-- 3. Composite index:

--    create index index_name on table(columns1,column2,column3).


-- 4.A PRIMARY KEY (clustered index)is also an index – 
-- it’s frequently used together with fields having an AUTO_INCREMENT attribute. 
-- This type of index does not accept NULL values and once set, 
-- the values in the column which has a PRIMARY KEY cannot be changed.

-- Following are the essential characteristics of a clustered index:

-- 	It enables us to store data and indexes together.
-- 	It stores data in only one way based on the key values.
-- 	Key lookup.
-- 	It support index scan and index seek data operations.
-- 	Clustered index always use one or more column for creating an index.
-- 	The indexes other than PRIMARY indexes (clustered indexes) called a non-clustered index(secondary indexes).


--  # to check the  indexes
--  # SHOW INDEX FROM customers;

-- 5. Descending:  available only 8+ versionof MySQL,

-- It is supportive when a user run queries to find out the most newly added data, 
-- such as you may want to view the six newest posts or the five most current comments on all the posts

-- 		CREATE INDEX index_name
-- 		   ON table_name(index_column_1 DESC)


-- 		1. CREATE INDEX index_name
-- 		   ON table_name(index_column_1 DESC);
-- 		or
-- 		2. CREATE TABLE table_name(   
-- 		   column_1 INT, 
-- 		   column_2 INT,   
-- 		   INDEX asc_index_1 (column_1 ASC, column_2 ASC),   
-- 		   INDEX desc_index_1 (column_1 DESC, column_2 DESC));
-- 		or
-- 		3. ALTER TABLE table_name ADD INDEX(column_1 DESC, column_2 ASC);

-- 6. Full-Text :
-- 		This type of index is implemented for full-text searches as the name itself implies it. 
-- 		Occasionally, suppose you need to find the blob of text which includes a certain word or combination of words.

-- 		CREATE FULLTEXT INDEX Indexname ON Tablename(indexcolumn1, indexcolumn2, …);
-- 		OR,
-- 		CREATE TABLE Tablename (column1 TEXT, FULLTEXT(column1));
-- 		OR,
-- 		ALTER TABLE Tablename ADD FULLTEXT(column1, column2);
		
# CREATE FULLTEXT INDEX text_data ON worker()

-- explain select * from worker;

-- create index demo on worker(Department);
-- SHOW INDEX FROM worker;

# SQl optimization steps:-

-- 1. Use index for search pr create index for commonly used columns in where condition.

-- 2. Use numeric feilds to store numeric value instead of character datatypes.

-- 3. Replace union with union all where we dont have duplicate results.

-- 4. Minimum use of distinct keyword (its take more time to excecute).

-- 5. dont use select * from table_name.

-- 6.Dont use <> , != as index will not be used for that and full table scan will perfomed.

-- 7.Use  exists()
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

-- always close the connection.

