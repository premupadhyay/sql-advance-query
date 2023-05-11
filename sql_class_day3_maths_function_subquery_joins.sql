
/*------------------------------------Int data types--------------------------------------

         (Bytes)	(Signed/Unsigned)	(Signed/Unsigned)
TINYINT	     1	     -128	              127

SMALLINT	 2	    -32768	             32767

MEDIUMINT	 3	   -8388608	             8388607

INT	         4	   -2147483648	       2147483647

BIGINT	     8	-9223372036854775808	9223372036854775807 */

/*---------------------------MySQL Numeric Functions------------------------------------------

	Function	                  Description

	ABS	                    Returns the absolute value of a number

	AVG	                    Returns the average value of an expression

	CEIL	                Returns the smallest integer value that is >= to a number

	COUNT	                Returns the number of records returned by a select query

	DIV	                    Used for integer division

	FLOOR	                Returns the largest integer value that is <= to a number

	GREATEST	            Returns the greatest value of the list of arguments

	LEAST	                Returns the smallest value of the list of arguments

	LOG	                    Returns the natural logarithm of a number, or the logarithm of a number to a specified base

	MOD	                    Returns the remainder of a number divided by another number

	PI	                    Returns the value of PI

	POWER	                Returns the value of a number raised to the power of another number

	RAND	                Returns a random number #FLOOR(RAND()*(10-5+1)+5)

	ROUND	                Rounds a number to a specified number of decimal places

	SQRT	                Returns the square root of a number

	SUM	                    Calculates the sum of a set of values

	TRUNCATE	            Truncates a number to the specified number of decimal places */
    
select abs(-10.324);
select avg(sal) from emp;
select min(sal) from emp;
select max(sal) from emp;
select sum(sal) from emp;
select count(sal) from emp;

select CEIL(54.1);
select floor(54.99);
select GREATEST(34,56,67,7,4);

select LEAST(34,56,67,7,4);

select log(10);

select mod(5,2);

select PI();

select power(4,2);

select pow(5,2);

select floor(rand()*(10-5)+5);

select sqrt(64);

select round(34.5516,2);

select truncate(34.5596,2);

select 11 div 3;

#----------------------------------Sub query--------------------------------
# Sub is also nested query (inner query).

select * from emp where sal=(select max(sal) from emp);

# 2nd highest salary of emp.

select * from emp where sal=(select max(sal) from emp where sal < (select max(sal) from emp));

select * from emp where sal = (select sal from emp order by sal desc limit 1,1);

# 3nd highest salary of emp.
select * from emp where sal = (select sal from emp order by sal desc limit 3,1);

select * from emp where sal = (select max(sal) from emp where sal < (select max(sal) from emp where sal < (select max(sal) from emp)));

select * from emp;

# Find the details of emp whoes joining after ward.

SELECT *
FROM emp
WHERE hiredate > (select hiredate from emp WHERE ename='WARD');


# Find the details of emp whos salary is greater than clark.

select * from emp where sal > (select sal from emp where ename='CLARK');

select * from dept;

# Display all the details of emp who depart location in New york.

SELECT *
FROM emp
WHERE deptno = (SELECT deptno from dept where loc='NEW YORK');

select *  from emp where deptno = (select deptno from dept where loc="New york");

# Display all the details of emp who depart number not in dept table.

SELECT *
FROM emp
WHERE deptno NOT IN (SELECT deptno from dept);

# Find the details of emp who salary is greater than the avg sal of emp.
SELECT *
FROM emp
WHERE sal > (select AVG(sal) FROM emp);

select * from emp;

select * from dept;

select min(salary),max(salary),avg(salary) from (select ename,sal as salary from emp) as e1 ;

# WAP find out all the even number of emp id and find avg of sal and sum of sal.

select avg(sal), sum(sal) from (select sal from emp where mod(empno,2)=0) as e1;

# --------------------------------Joins-----------------------------------------------------
# join are use to combine the table.
# There should be a common column between both the table.

# left join
# right join 
# inner join 
# full join  (union)
# cross join 
# Natural join

# Left join :- it all will return all the from left side and only common data from side right.

select * from emp e1 left join dept d1 on e1.deptno=d1.deptno; 


# right join :- it all will return all the from right side and only common data from side left.

select * from emp e1 right join dept d1 on e1.deptno=d1.deptno; 

# inner join :- only common data in both the table;

select * from emp e1 inner join dept d1 on e1.deptno=d1.deptno; 

# outer join :- it will return all the data from right and left table.

select * from emp e1 JOIN dept d1 on e1.deptno=d1.deptno;  # inner join.


select * from emp e1 left join dept d1 on e1.deptno=d1.deptno

union

select * from emp e1 right join dept d1 on e1.deptno=d1.deptno; 

# cross join 

select * from emp cross join dept;

# Natural join  :- Only common data will display and it will eleminate one common column.

select * from emp natural join dept;


# Display the details of emp who deptno in dept table.

select * from emp e inner join dept d on e.deptno = d.deptno;
# 

























