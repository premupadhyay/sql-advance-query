#---------- Date Data Types----------------
# 1.timestamp
# 2.Date
# 3.Datetime
# 4.year


# ---------------Date functions----------------------------
select now();
select current_timestamp();
select localtimestamp();
select sysdate();

select Date("2022-11-25 21:46:17");
select month("2022-11-25 21:46:17");
select Day("2022-11-25 21:46:17");
select week("2022-11-25 21:46:17");
select year("2022-11-25 21:46:17");
select hour("2022-11-25 21:46:17");
select minute("2022-11-25 21:46:17");
select second("2022-11-25 21:46:17");
select microsecond("2022-11-25 21:46:17");
select dayname("2022-11-25 21:46:17");
select dayofweek("2022-11-25 21:46:17");
select dayofyear("2022-11-25 21:46:17");
select dayofmonth("2022-11-25 21:46:17");

select adddate("2022-11-25",interval 5 day);
select adddate("2022-11-25",interval 10 day);
select adddate("2022-11-25",interval -7 day);
select adddate("2022-11-25 21:46:17",interval -4 hour);
select adddate("2022-11-25 21:46:17",interval 10 hour);
select adddate("2022-11-25 21:46:17",interval 2 month);
select curdate();
select current_date();
select current_time();
select curtime();
select datediff("2022-11-25","2022-11-15");
select datediff("2022-11-25","2022-10-15");
select date_format("2022-11-25","%M %d %Y");
select date_format("2022-11-25","%W %M %e %Y");
select date_sub("2022-11-25",interval 5 day);
select extract(month from "2022-11-25");
select extract(day from "2022-11-25");
select extract(year from "2022-11-25");
select maketime(11,35,4);
select makedate(2017,3);


#-------------------------------------Operators---------------------------------------------------
# Arithmetic ---->  +,-,*,/,%
# Logical    ---->  and , or , not
# Conditional ---> < ,> ,<= ,>=,==,!=
# comparision ---> like,in,between

select * from worker limit 2;

select worker_id,joining_date from worker;

select * from worker;

# To change columns temporary basis

select worker_id ID ,first_name NAME from worker;

# Q1. Increase the salary of vipul by 1000.

# Q2. Find all the details of worker who name is Vivek and deparment is Admin.

# Q3. Show the worker name who salary greater than 200000 and less than 90000.


#-------------------------------------------------------------------------------
CREATE TABLE emp (
  empno decimal(4,0) NOT NULL,
  ename varchar(10) default NULL,
  job varchar(9) default NULL,
  mgr decimal(4,0) default NULL,
  hiredate date default NULL,
  sal decimal(7,2) default NULL,
  comm decimal(7,2) default NULL,
  deptno decimal(2,0) default NULL
);
INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

select * from emp;

#4. Find the details of emp whose sal not raning from 1600 to 5000;
SELECT * 
FROM emp
WHERE sal not between 1600 and 5000;

select * from emp where sal <1600 or sal>5000;

#5 WAQ to check if we have James or miller emp and get all the details.
select * from emp where ename in ('JAMES','MILLER');

# Like operators also know as wild card operators.
# pattern matching
#  % ---> when we have to substitute more than on char we use %.
# _   ---->    when we have to substitute one char we use 

select * from emp where ename like "A%";

select * from emp where ename like "%N";

#Q1.  WAQ to check N should be in middle of the ename.
select * from emp where ename like "%_N_%";

#Q2.  WAQ to check ename starting with A and ending with N.
select * from emp where ename like "A%N";

#Q3. WAQ to find the name having length 5.
select ename from emp where length(ename)=5;
SELECT *
FROM emp
WHERE ename LIKE "_____";

#Q4.  WAQ to find emp who salary starting with 1.
select ename from emp where sal like '1%';

#------------------------------Aggregate functions-------------------------------
# sum()
# count()
# avg()
# min()
# max()

# Find the avg salary of all the emp.
SELECT AVG(sal)
FROM emp;

# Find the number of emp working in comp.
SELECT COUNT(*)
FROM emp;


# Find the lowest salary of emp.

SELECT MIN(sal)
FROM emp;

# Find the max salay of emp.

SELECT MIN(sal)
FROM emp;

#  Display the sum of salary for 30 department.
SELECT SUM(sal)
FROM emp
WHERE deptno = 30;

# -------------------Group by--------------------------------
select job,deptno,max(sal) from emp group by deptno,job;

#Q1.  find out the total no of emp working in particular job.

SELECT job, COUNT(*)
FROM emp
GROUP BY job;

#Q2. find the min salary of each job.

select job ,min(sal) from emp group by job order by sal;

#Q3. find the total salary of each job.

select job, sum(sal) from emp group by job;

select job ,min(sal) from emp group by job order by sal desc limit 2;


# Find the maximum salary of job where emp working are more than 3.

select max(sal), job from emp group by job having count(ename)>3;









