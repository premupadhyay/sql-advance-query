CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(1, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(2, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(3, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(4, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(5, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(6, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(7, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(8, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
select * from Worker;
# Alter table table_name Add columns_name columns-defination

Alter table worker add age int(15);

Alter table worker modify column department varchar(20);

Describe worker;

Alter table worker modify column worker_id varchar(20);

select * from worker;

Alter table worker modify column worker_id int(20);

select * from worker;

-- update table_name set columns1=values1 where condition;--

# Q1 update the sal for emp having id 3 by 500

update worker set sal=sal+500 where work_id=3;

## Q2 Update the sal for wokrer having sal between 200000 to 500000 by 1000

update Worker set salary=salary+1000 where 200000<salary<500000;

# # Delete the worker having sal less than 200000

# delete from table_name where conditions

# DELETE FROM worker WHERE SALARY < 200000;

select ASCII("a");


/*

	Function	                  Description

	ASCII	               Returns the ASCII value for the specific character
    
# select ASCII("A");
    
	CHAR_LENGTH	           Returns the length of a string (in characters)
    
# select CHAR_LENGTH ("string")
    

	CHARACTER_LENGTH	   Returns the length of a string (in characters)
    
#  select CHARACTER_LENGTH ("string")
    

	CONCAT	               Adds two or more expressions together
    
    select concat(col1,col2);
    
    select concat(col1,"+",col2,col3,col4,col5)
    
    

	CONCAT_WS	           Adds two or more expressions together with a separator
    
    select CONCAT_WS("-",col1,col2)
    

	FIELD	               Returns the index position of a value in a list of values
    
    select field("q","s","q","q","l")
    

	FIND_IN_SET	           Returns the position of a string within a list of strings
    
    select field("q","s","q","l")
    

	FORMAT	               Formats a number to a format like "#,###,###.##", rounded to a specified number of decimal places
    
    #select format(250.5647,2);

	INSERT	               Inserts a string within a string at the specified position and for a certain number of characters
    
    # select insert("python is good",1,6,Java)

	INSTR	               Returns the position of the first occurrence of a string in another string
    
    select INSTR("python is good","python")

	LCASE	               Converts a string to lower-case
    
    select lcase("PYTHON is GOOD");

	LEFT	               Extracts a number of characters from a string (starting from left)
    
    select left("python is good",4);

	LENGTH	               Returns the length of a string (in bytes)
    
    select length("python is good");

	LOCATE	               Returns the position of the first occurrence of a substring in a string
    
    select locate("is","python is good");

	LOWER	               Converts a string to lower-case
    
    select lower("Python")

	LPAD	               Left-pads a string with another string, to a certain length
    
    select lpad("python is good",20,"WWW");

	LTRIM	               Removes leading spaces from a string
    select ltrim("pythn is good   ");

	MID	                   Extracts a substring from a string (starting at any position)

	POSITION	           Returns the position of the first occurrence of a substring in a string

	REPEAT	               Repeats a string as many times as specified

	REPLACE	               Replaces all occurrences of a substring within a string, with a new substring

	REVERSE	               Reverses a string and returns the result

	RIGHT	               Extracts a number of characters from a string (starting from right)

	RPAD	               Right-pads a string with another string, to a certain length

	RTRIM	               Removes trailing spaces from a string

	SPACE	               Returns a string of the specified number of space characters

	STRCMP	               Compares two strings
    
    select strcmp("python","python");

	SUBSTR	               Extracts a substring from a string (starting at any position)
    
    select substr("python is good",3,5);  # start with 3 and taking till 5 char

	SUBSTRING	           Extracts a substring from a string (starting at any position)

	SUBSTRING_INDEX	       Returns a substring of a string before a specified number of delimiter occurs

	TRIM	               Removes leading and trailing spaces from a string

	UCASE	               Converts a string to upper-case

	UPPER	               Converts a string to upper-case  */
    
    

select field("q","s","q","l");

select FIND_IN_SET("q","s,q,l");

select format(250.5547,1);

select insert("python is good",1,6,"Java");

select INSTR("python is good","python");

select INSTR("python is good","o");

select lcase("PYTHON is GOOD");

select locate("o","python is good",8);

select lpad("python is good",20,"WWW");

select rpad("python is good",20,"WWW");


select ucase("python os good");

select upper("python os good");

select ltrim("pythn is good   ");

select rtrim("  pythn is good   ");

select trim("  pythn is good      ");

select substr("python is good",3,5);

select substring("python is good",3,5);

select substr("python is good",3,10);

select SUBSTRING_INDEX("python is good"," ",-3);

select REPLACE("python is good","python","java");

select REPLACE("python is good","is","are");

select reverse ("python is good");

select space(10); 

select mid("python is good",5,3);

select repeat("python  ",3);

