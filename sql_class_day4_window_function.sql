
#--------------------ROW_NUMBER Window Function--------------------------
select * from students;
# with over()
select student_name,dept_name,marks,
row_number() over(order by marks) as row_num from students;

# With over and PARTITION
select student_name,dept_name,marks,
row_number() over(partition by dept_name order by marks) as row_num from students;


#----------------rank() window function-----------------

select student_name,dept_name,marks,
rank() over(order by marks) as row_num from students;

select student_name,dept_name,marks,
rank() over(partition by dept_name order by marks) as row_num from students;

#----------------dense_rank() window function-----------------

select student_name,dept_name,marks,
dense_rank() over(order by marks) as row_num from students;

select student_name,dept_name,marks,
dense_rank() over(partition by dept_name order by marks) as row_num from students;

#-----------------------nth_value--------------------------

select student_name,dept_name,marks,
nth_value(student_name,1) over(order by marks) as row_num from students;

select student_name,dept_name,marks,
nth_value(student_name,3) over(partition by dept_name order by marks) as row_num from students;

#-----------------------ntile--------------------------
select student_name,dept_name,marks,
ntile(5) over(order by marks) as row_num from students;

select student_name,dept_name,marks,
ntile(5) over( partition by dept_name order by marks) as row_num from students;

#---------------------first_value/last_value-------------------------------
select student_name,dept_name,marks,
first_value(marks) over(order by marks) as row_num from students;


# default rows between unbounded preceding and current row

select student_name,dept_name,marks,
last_value(student_name) over(order by marks 
rows between unbounded preceding and unbounded following) as row_num from students;

#---------------------PERCENT_RANK-------------------------------
select student_name,dept_name,marks,
PERCENT_RANK() over(order by marks) as row_num from students;

# row_number-1/total_row-1;  8-1/11-1 --> 7/10 -->0.7


# ------------------lag() and lead()--------------------------
select * from students;

select student_name,dept_name,marks,
lag(marks) over(order by marks) as row_num from students;

select student_name,dept_name,marks,
lead(marks) over(order by marks) as row_num from students;

