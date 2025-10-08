------DDL Data definition language
-- synatx
-- create table <table_name>(
-- col1_name <data_type>,
-- col2_
)

Create table employees(
	emp_id int primary key,
	emp_name varchar(50),
	age int,
	department varchar(50),
	salary int,
	hire_date date
);

select * from employees;

--------------------------------------------------------------------------------------------------------


----DML (DATA MANIPULATION LANGUAGE)-------inserts data so it is called manipulation language

	-- synatx
	-- insert into <table_name> (col1_name,col2_name,col3_name,.....)
	-- values  (val_col1_1,val_col2_1,val_col3_1,...),
		       (val_col1_2,val_col2_2,val_col3_2,...);


insert into employees (emp_id,emp_name,age,department,salary,hire_date)
values (1, 'Alice', 30,'IT', 60000, '2023-05-10'),
       (2, 'Steve', 20, 'Finance', 10000, '2022-05-13'),
	   (3,'Bob',35,'IT',20000,'2022-05-11'),
		(4,'Charlie',28, 'Marketing',50000,'2022-06-01'),
		(5,'David',40,'HR',7000,'2022-06-15'),
		(6,'Eva',25,'Finance',12000,'2022-07-10'),
		(7,'Frank',32,'Marketing',45000,'2022-08-01'),
		(8,'Grace',22,'Marketing',45000,'2022-08-01'),
		(9,'Hank',29,'Sales',30000,'2022-08-15'),
		(10,'Ivy',33,'Sales',35000,'2022-09-01'),
		(11,'Abhi',35,'Games',55000,'2022-9-09');
		
-----------------------------------------------------------------------------------------------

------DQL----(Data Query Language)

 	---syntax
	---select * from <table_name>;
select * from employees;


----Query syntax of selected columns-----

select emp_id,emp_name from employees;


----using alias with AS--------

Select emp_id as employees_id,
		emp_name as employee_name
from employees;

---------Filtering data using where Clause--------

Select * from employees
where department='Marketing';

Select * from employees
where age=35;


-----filtering data using where clause for the multiple values------------------

Select * from employees
where department in ('Marketing','HR');

------using Between------

Select * from employees
where salary between 20000 and 50000;

select * from employees
where age between 30 and 40;

---------------------------------------------------
Select * from employees;

---Using Arithmetic expressions 
--Q: retrieve employees name,their monthly salary ,and a 10%bonus
select
  emp_name,
  salary,
  salary * 0.10 as bonus_amount
from employees;

--Q: retrieve employee ids, their age,monthly salary,and yearly salary
select
    emp_id,
	age,
	salary as monthly_salary,
	salary *12 as yearly_salary
from employees;

--Q: retrieve employees name, salary, total salary after 20% tax deduction.
select 
  emp_name,
  salary,
  salary * 0.20 as deduction,
  salary - (salary * 0.20) as net_salary
from employees;

--filtering the data using multiple conditions
--Q: retrive employees in 'IT'department with a salary greater than 20000

select * from employees;

select * from employees
where department = 'IT'
and salary > 20000;

--using or
--Q: retrive employees in 'HR'department or with salary lesser than 50000
select * from employees
where department ='HR'
or salary < 50000;

--using not
--Q; retrieve employees who do not work in 'HR'department
select *from employees
where not department = 'HR';

select *from employees
WHERE NOT DEPARTMENT IN ('HR','IT');

select *from employees
WHERE NOT DEPARTMENT IN ('HR');

--using like 

--'_%' after the letter - starting letter
--'%_%' start and end - anywhere in the word
--'%_' before - ending letter

--Q: retrieve employees whose name start with "A"
select * from employees 
where emp_name like 'A%';

--Q: retrieve employees whose name has "b"
select * from employees 
where emp_name like '%b%';

--Q: retrieve employees whose name end with "e"
select * from employees 
where emp_name like '%e';

--sorting data by order by

select * from employees order by emp_id asc;

select * from employees order by emp_id desc;

select * from employees order by department asc;

select * from employees order by hire_date desc;

select * from employees order by salary desc limit 5;

select * from employees order by salary desc limit 5 offset 3;

select * from employees order by salary desc fetch first 3 row only;

--sorting by multiple columns 

select * from employees
order by department asc, salary desc;

select * from employees
order by department asc, hire_Date desc;

----------------------------------------------------------------------------------------------
----department-----

create table department( 
  dep_id int primary key,
  dep_name varchar (50)
  );

select * from departments;

insert into departments (dep_id,dep_name)
values (1,'HR'),
        (2,'Finance'),
		(3,'IT'),
		(4,'Marketing'),
		(5,'Sales'),
		(6,'Operation'),
		(7,'LEGAL'),
		(8,'SUPPORT'),
		(9,'ENGINEERING'),
		(10,'RESEARCH');
----------------------------------------------------------------------
select * from employees e
inner join department d on d.dep_name = e.department

select * from employees
inner join department on department.dep_name = employees.department

---------------q. Retriew the name of the employess along with their dept_ids and department name
---include only employess who belong to a department
Select 
	e.emp_name,
	d.dep_id,
	e.department
	from employees e 
	inner join department d on d.dep_name = e.department


-----Left Join---

Select * from employees e
left join department d on d.dep_name = e.department

Select * from employees e
inner join department d on d.dep_name = e.department

Select * from employees
inner join department on department.dep_name = employees.department

---------------q. Retriew the name of the employess along with their dept_ids and department name
---include only employess who belong to a department
Select 
	e.emp_name,
	d.dep_id,
	e.department
	from employees e 
	inner join department d on d.dep_name = e.department


-----Left Join---

Select * from employees e
left join department d on d.dep_name = e.department

-----Right Join-------

Select * from employees e 
right join department d on d.dep_name = e.department

---Full Join-----

Select * from employees e 
Full join department d on d.dep_name = e.department

-------------------------------------------------------------------------------------------------------------------
writing query using all of the coulmns name 

Select 
	e.emp_id,
	e.emp_name,
	d.dep_id,
	e.department,
	e.salary,
	e.hire_date
from employees e
inner join department d on d.dep_name = e.department

---------------------------------------------------------------------------------------------

--Q/A : 
 1) Retrieve employee names and their monthly salary with column alias?

 select 
 emp_name as employees_name,
 salary as monthly_salary
 from employees;
-----------------------------------------------------------------------------------------------------
2) Retrieve employee names  and theier annual salary with an alias ?

select
emp_name as employees_name,
salary *12 as annual_salary
from employees;
-------------------------------------------------------------------------------------------------------------
3) Retrieve employee names,salaries,and a 20% bonus?

select
emp_name as employees_name,
salary,
salary *0.20 as bonus
from employees;
--------------------------------------------------------------------------------------------------------------
4) Retrieve employess in the 'HR'department or with a slary greater than 50000?

salary * employees 
where  department = "Hr"
and salary > 50000

-----------------------------------------------------------------------------------------------------------------
5) Retrieve employees who do not work in the 'HR'department?

select * from employees  
where not department = "HR";
-------------------------------------------------------------------------------------------------------------------
6) Retrieve employees whose name end with "e"?

select * from employees
where emp_name like '%e';
------------------------------------------------------------------------------------------------------------
7) Retrieve employees with a salary between 20000 and 50000?

 Select * from employees
where salary between 20000 and 50000;
-----------------------------------------------------------------------------------------------------------------

 Q & A : Joins 

1) write a query to retrieve the names of employees along with their department names.
include only employees who belong to a department?

Select 
	e.emp_name,
	e.department,
	from employees e 
	inner join department d on d.dep_name = e.department;
------------------------------------------------------------------------------------------------------------------
2) write a query to retrieve all employees and their department names.
include employees even if they do not belong to any department?

select * from employees e
left join department d on d.dep_name = e.department;
----------------------------------------------------------------------------------------------------------
3) write a query to retrieve all departments and the names of employees who work in those departments.
include departments even if they have no employees?

select
d.dep_name,
e.emp_name
from department d
left join employees e on d.dep_name = e.department;

 (or)
 
select
d.dep_name,
e.emp_name
from employees e
right join department d on d.dep_name = e.department;
------------------------------------------------------------------------------------------------------------------
4) write a query to retrieve all employees and all departments,
including employees without departments and departments without employees?

select
e.emp_id,
e.emp_name,
e.department,
e.salary,
e.hire_date,
d.dep_id,
d.dep_name
from employees e
full outer join department d on d.dep_name = e.department;
-----------------------------------------------------------------------------------------------------------------
-- Aggregation and grouping

select count(*) from employees;

select sum(salary) from employees;

select avg(salary) from employees;

select max(salary) from employees;

select min(salary) from employees;

--

select distinct department from employees;

select * from employees order by department,hire_date

select
   department,
   count(*)
from employees
group by department

--
select
   department,
   sum(salary) as total_salary
from employees
group by department

--
select
   department,
   hire_date,
   sum(salary) as total_salary
from employees
group by department, hire_date

--
select
   department,
   min(salary) as min_salary
from employees
group by department

--
select
   department,
   max(salary) as max_salary
from employees
group by department

--
select
   department,
   round (avg (age),1) as avg_age
from employees
group by department;

--- Combining Multiple Aggregate Function

--Q : write a query to retrive the count of employees, total salary,average salary,max and min salary,
--    and average age for each department?

select
  department,
  count (*) as employees,
  sum(salary) as total_salary,
  min(salary) as min_salary,
  max(salary) as max_salary,
  round (avg(salary),1) as avg_salary,
  round (avg (age),1) as avg_age
from employees
group by department;

------------------------------------------------------------------------------------------------------------------
--Having Clause

--Q: Retrrieve departments where total salary is > 40000?

select
  department,
  sum (salary) as total_salary 
from employees
group by department
having sum(salary) > 40000;
----------------------------------------------------------------------------------------------------------------
--Q:retrieve departments where there are more than 1 employees?

select
   department,
   count(emp_id)as total_employees
from employees
group by department
having count (emp_id)> 1
------------------------------------------------------------------------------------------------------------
--Q: Find departments where the average salary is greater than 30000?

select
  department,
  round (avg (salary),1) as avg_salary 
from employees
group by department
having avg(salary) > 30000;
-----------------------------------------------------------------------------------------------------------------
--Q: Find departments where the total salary is greater than 50000?

select
  department,
  sum (salary) as total_salary 
from employees
group by department
having sum(salary) > 50000;
------------------------------------------------------------------------------------------------------
--Q: Find departments where minimum salary is greater than 20000?

select
  department,
  min (salary) as min_salary 
from employees
group by department
having min(salary) > 20000;
-------------------------------------------------------------------------------------------------------------
--Q: Find departments where maximum salary is greater than 50000?

select
  department,
  max(salary) as max_salary 
from employees
group by department
having max(salary) > 50000;
-------------------------------------------------------------------------------------------------------------
--Q: Find departments where the average salary is greater than 30000 and number of employees is greater than 1?

select
   department,
   round (avg (salary),1) as avg_salary,
   count(*)as total_employees
from employees
group by department
having avg(salary) > 30000 and count (*)> 1

----------------------------------------------------------------------------------------------------------------

--Q: Find the departments and department IDs where the total salary is greater than 50000?

--select
--    col1,col2,col3,.......
-- from <table_A>
-- join <table_B>
-- where <condition>
-- group by <cols....>
-- having <condition>
-- order by <cols>
select
  e.department,
  d.dep_id,
  sum(e.salary)as total_salary
from employees e
inner join department d on d.dep_name = e.department
group by e.department,d.dep_id
having sum(e.salary) > 50000

---------------------------------------------------------------------------------------------------------------
--Q: Find departments and department IDs where the minimum salary is greater than 20000?

select
   e.department,
   d.dep_id,
   min(e.salary) as min_salary
from employees e
inner join department d on d.dep_name = e.department
group by e.department,d.dep_id
having min (e.salary) > 20000
order by min (e.salary);
------------------------------------------------------------------------------------------------------------------
--Sub queries
--USing subqueries in SQL[query inside a query]

select emp_id,emp_name from (
     select * from employees where department = 'IT'
);


--Where clause
--Select clause
--From clause
--Having clause

--Where clause
--Q: Find employees whose salary is greater than average salary?

select * from employees
where salary > (select avg (salary) from employees);

--Q: Find employees whose salary is greater than total salary of finance department?
select * from employees
where salary > (select sum (salary) as total_salary from employees where department = 'Finance');

---------------------------------------------------------------------------------------------------------------

--Select Clause
--Q: Retrieve employees name, salary,average salary and the difference between their salary and average salary?

select
  emp_name,
  salary,
  (select avg (salary) from employees) as avg_salary,
  salary - (select avg (salary) from employees) as salary_diff
from employees;
-----------------------------------------------------------------------------------------------------

-- From clause

select * from (
select
   department,
   round (avg (salary),1) as avg_salary,
   count(*)as total_employees
from employees
group by department
having avg(salary) > 30000 and count (*)> 1
)
where avg_salary >= 40000

--
select * from(
 select
  department,
  max(salary) as max_salary 
from employees
group by department
having max(salary) > 50000
)
where department = 'Games' 
-----------------------------------------------------------------------------------------------------------------
--1.write a query to count the number of employees in each department?

select
   department,
   count(*)
from employees
group by department;

--2. write a query to find the minimum and maximum salary in the sales department?
select 
  department,
  min(salary),
  max(salary)
from employees
group by department
having department = 'Sales'

--3. write a query to find the average salary spent per department for employees who are 25 years old or older?

select
  department,
  avg(salary)
from employees
where age >= 25
group by department

--4.write a query to retrieve departments where the total salary is grater than the average salary
-- across all the department?
--[Hint: sub queries - 1st find the total salary for each department
--                     2nd get the average salary of those departments 
--                     use the above in the having clause filter for total salary across departments]
 
 select
    department,
	sum(salary) as total_salary
from employees
group by department
having sum (salary)> (
   select avg(total_salary)from
     (select
       department,
       sum(salary)as total_salary
     from employees
      group by department)
)
--5) Write a query to retrieve departments where the total salary is greater than the
--   total salary of the ‘Finance’ department?

select * from employees
where salary > (select sum (salary) as total_salary from employees where department = 'Finance');

--6) Write a query to find the  department IDs where the total salary is between 40000 and 80000?

select 
  d.dep_id,
  sum(e.salary)as total_salary
from employees e
inner join department d on d.dep_name = e.department
group by d.dep_id
having sum(e.salary) between 40000 and 80000;
------------------------------------------------------------------------------------------------------------------

--DDL (Data definition language)

--CREATE - Creates a database objects (table,schema)

--ALTER - Modifies the database objects (column names,data types - table structure)

--Drop - Deleting a table 

--TRUNCATE - Removing the data inside a table

-------------------------------------------

--ALTER

--Altering a column name

--Syntax
--Alter table <table_name>
--Rename <col_name> TO <nem_col_name>;

select * from employees;

alter table employees
rename emp_age to age;

--Alter in a column data type

--Syntax
--ALTER TABLE <table_name>
--ALTER <col_name> TYPE <new_data_type>;

alter table employees
alter department type char(50);

-- Altering a table name 

--Syntax
--ALTER TABLE < table_name>
--RENAME TO <new_table_name>

alter table department
rename to departments;

----------------------------
-- DROP

--Syntax
--DROP TABLE <table_name>;

drop table department;

select * from employees;

drop table employee;

--------------------------------------

--TRUNCATE

--Syntax
--TRUNCATE TaBLE <table_name>;

select * from departments

Truncate table department;

----------------------------------------------------------------------
--DML (Data Manipulation Language)

--INSERT - Adds a new data into a table

--UPDATE - Modifies the existing data

--DELETE - Deleting a particular value

select * from employees;

select * from employees order by 1;

--UPDATE

--SYNTAX
--UPDATE <table_name>
--SET <col_name> = <updated_value>
--WHERE CONDITION

update employees
set salary = 20000
where emp_id = 5;

update employees
set department = 'Finance'
where emp_id = 8;

-- DELETE

--Syntax
--DELETE FROM <table_name>
--WHERE <condition>;

delete from employees
where department = 'Games';

------------------------------------------------------------------------------------------------------
select * from employees order by 1;

--TCL (Transaction Control Language)


BEGIN;

update employees
set salary = 30000
where emp_id = 2;

update employees
set salary = 50000
where emp_id = 3;

ROLLBACK;

COMMIT;

----------------------------------------------------------------------------

--SAVEPOINT : Sets a point to rollback to-

BEGIN;

update employees
set salary = 20000
where emp_id = 2;

SAVEPOINT one;

update employees
set salary = 30000
where emp_id = 3;

SAVEPOINT two;

update employees
set salary = 50000
where emp_id = 4;

SAVEPOINT three;

update employees
set salary = 80000
where emp_id = 5;

SAVEPOINT four;

rollback to two;

commit;

----------------------------------------------------------------------

--RELEASE SAVEPOINT

select * from employees order by 1;

BEGIN;

update employees
set salary = 30000
where emp_id = 2;

SAVEPOINT one;

update employees
set salary = 40000
where emp_id = 3;

SAVEPOINT two;

update employees
set salary = 60000
where emp_id = 4;

SAVEPOINT three;

update employees
set salary = 80000
where emp_id = 5;

SAVEPOINT four;

release savepoint two;

rollback to one;

commit;

--------------------------------------------

--EX : Transaction using INSERT

select * from employees order by 1;

Begin;

insert into employees (emp_id,emp_name,age,department,salary,hire_date)
values (11,'Robert',20,'Finance',50000,'2020-05-13');

savepoint one_record;

insert into employees (emp_id,emp_name,age,department,salary,hire_date)
values (12,'Tom',30,'HR',30000,'2022-05-13');

rollback to one_record;

commit;
	
--------------------------------------------------------------------------------------------------------------
select
  department,
  count(emp_id)



--Window Function : Performs a calculation across a set of table rows that are related to the
              --current row. unlike group group it does not collapse the rows.

--Ranking Functions
   --ROW_NUMBER
   --RANK
   --DENSE_RANK
   --NTILE

--Aggregate window functions
  --SUM
  --AVG
  --COUNT

--Value functions
  --LAG
  --LEAD
-----------------------------------------------
  --ROW_NUMBER

--Q: Highest paid employees in each department?
select * from(
select 
     *,
 row_number () over (partition by department order by salary desc) as row_num
from employees
)
where row_num = 1

select 
     * 
from employees
where department = 'Finance'
order by salary desc
limit 3;

--------------------------------------------------------------
--RANK

select
     *,
	 rank() over (partition by department order by salary desc) as row_num
from employees;

--DENSE_Rank

select
     *,
 dense_rank() over (partition by department order by salary desc) as row_num
from employees;

--NTILE

select
   *
   ,ntile(2) over (order by salary desc) as half_group
from employees;

-----------------
--Aggregate window functions

--Sum

select
     *
	 ,sum(salary) over (partition by department) as dep_total_salary
from employees;

--AVG

select
     *
	 ,avg(salary) over (partition by department) as dep_avg_salary
from employees;

--COUNT

select
     *
	 ,count(emp_id) over (partition by department) as emp_count
from employees;

--RUNNING TOTAL (Cumulative Sum)

select
     *
	 ,sum(salary) over (order by emp_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total
from employees;

--MAX
--Q: Show each employees salary along with the highest salary in their department?

select
    emp_name,
	department,
	salary,
	max (salary) over (partition by department) as max_dep_salary
from employees;

---------------------

--VALUE FUNCTIONS

--LAG

select
     emp_name,
	 hire_date,
	 salary,
	 lag(salary) over (order by hire_date) as prev_salary
from employees;

select
    emp_name,
	hire_date,
	lag(hire_date) over (order by hire_date) as prev_hire_date
from employees;

select
    emp_name,
	hire_date,
	lead(hire_date) over (order by hire_date) as next_hire_date
from employees;

-----------------------------------------------
--Q: Use Lag to see how salary changed from the previous employee in the department?

select
    emp_name,
	department,
	hire_date,
	salary,
	lag(salary) over (partition by department order by hire_date)as prev_emp_salary,
	salary - lag(salary) over (partition by department order by hire_date) as salary_diff_with_prev_emp 
from employees;

--Q: Use LEAD to compare salary with the next employee (by hire date) in the department?

select
    emp_name,
	department,
	hire_date,
	salary,
	lead(salary) over (partition by department order by hire_date) as next_emp,
	salary - lead(salary) over (partition by department order by hire_date) as salary_diff_with_next_emp
from employees;

-----------------------------------------------------------------------------------------------------------
Module 1: 

CREATE TABLE students (
     stu_id int primary key,
	 stu_name varchar(50),
	 age int,
	 course_id int,
	 marks int
);

select * from students;

insert into students (stu_id,stu_name,age,course_id,marks)
values (1,'Alice',20,1,88),
       (2,'Bob',22,2,76),
	   (3,'Charlie',21,1,91),
	   (4,'David',23,3,65),
	   (5,'Eva',20,2,84),
	   (6,'Frank',22,3,79),
	   (7,'Grace',21,1,92),
	   (8,'Hank',23,2,68),
	   (9,'Ivy',20,3,81),
	   (10,'Jack',22,1,87),
	   (11,'Steve',23,4,74),
	   (12,'Bob',20,5,69);

CREATE TABLE courses(
       course_id int primary key,
	   course_name varchar(50),
	   instructor varchar(50)
);

select * from courses;

insert into courses (course_id, course_name, instructor) 
VALUES (1, 'Mathematics', 'Dr. Smith'),
       (2, 'Physics', 'Dr. Johnson'),
       (3, 'Chemistry', 'Dr. Brown'),
       (7, 'sanskrit','Dr.Jatin');
	
	Q & A sessions
-- 1: Show each student's name and their marks increased by 5 (bonus marks).

select
   stu_name,
   marks + 5 as bonus_marks
 from students;
 
--2: Find all students whose names start with the letter 'B'?

select * from students
where stu_name like 'B%';

--3:Retrieve students whose names end with the letter 'e'.

select * from students
where stu_name like '%e';

--4:List of students who have scored more than 85 marks.

select
   stu_name,
   marks
from students
where marks >85;

--5: Find students aged exactly 22.

select
   stu_name,
   age
from students
where age = 22;

--6:Get students who are older than 21 and have scored less than 80.

select
  stu_name,
  age,
  marks
from students
where age > 21
or marks < 80;

--7:Find students who are either named 'Bob' or have marks greater than 90.

select
  stu_name,
  marks
from students
where stu_name = 'Bob'
or marks >90;

--8:Display all students sorted by age in ascending order and marks in descending order.

select
   stu_name,
   age,
   marks
from students
order by age asc,
marks desc;

--9:Find students whose marks plus 10 would exceed 90.

select
  stu_name,
  marks +10 as plus_10
from students
where marks +10 >90;

--10:Display student name, marks, and percentage (assuming marks are out of 120)

select
  stu_name,
  (marks * 100/120) as percentage
from students;
-----------------------------------------------------------------------------------------------------------
Module 2:

-- 1:Get student names along with their course names?

select
   s.stu_name,
   c.course_name
from students s
inner join courses c on s.course_id = c.course_id;

--2:List students and instructors for those enrolled in existing courses only.

select
  s.stu_name,
  c.instructor
from students s
inner join courses c on s.course_id = c.course_id;

--3:Show student name, marks, and course name for students who scored more than 80.

select
     s.stu_name,
	 s.marks,
	 c.course_name
from students s
inner join courses c on s.course_id = c.course_id
where s.marks > 80;

--4:List all students and their course names, even if the course is missing in the Courses table.

select
   s.stu_name,
   c.course_name
from students  s
left join courses c on s.course_id = c.course_id;

--5:List course names and student names; include courses with no students.

 select
    c.course_name,
	s.stu_name
from students s 
right join courses c on c.course_id = s.course_id;
----------------------------------------------------------------------------------------------------------------
Module 3: GROUPING

--1:List each student age and the total number of students of that age.

select
   age,
   count(*) as total_students
from students
group by age
order by age;

--2:Show the maximum and minimum marks scored in each course.

select
  c.course_name,
   min(s.marks) as min_marks,
   max(s.marks) as max_marks
from students s
inner join courses c on s.course_id = c.course_id
group by c.course_name;

--3:Count the number of students enrolled in each course.

select
  count(*) as total_students,
  c.course_name
from students s
inner join courses c on c.course_id = s.course_id
group by c.course_name;
  
--4:Find the average marks of students in each course.

select
   c.course_name,
   avg(s.marks) as avg_marks
from students s
inner join courses c on s.course_id = c.course_id
group by c.course_name;

--5:show course name and total marks scored by students in that course.

select
 c.course_name,
 sum(marks) as total_marks
from students s
inner join courses c on s.course_id = c.course_id
group by c.course_name;

--------------------------------------------------------------------------------------------------------

Module 4: Having

--1: Show course IDs where the average marks of students is greater than 80.

select
  course_id,
  avg(marks) as avg_marks
  from students
  group by course_id
  having avg (marks)>80;

--2: List student ages where more than 2 students share the same age.

select
  age
from students
group by age
having count (*)>2;

--3:show course names where total marks scored by students is less than 250.

select
  c.course_name,
  sum (s.marks) as total_marks
from students s
inner join courses c on s.course_id = c.course_id
group by c.course_name
having sum(s.marks) < 250;

--4:Find course IDs with a maximum mark greater than 90.

select
  course_id,
  max (marks) as max_marks
from students
group by course_id
having max(marks) >90;

--5:Show all ages where the average mark of students is below 75.

select
age,
avg (marks) as avg_marks
from students
group by age
having avg(marks)<75;

-------------------------------------------------------------------------------------------------------------
Module 5: Subquery

--1:Show students whose marks are above the average marks of all students.

select
   stu_name,
   marks
from students
where marks > (select avg (marks) from students)

--2:Find course IDs where the average marks is higher than the average of all students.

select
   course_id,
  round (avg(marks),2) as avg_marks
from students
group by course_id
having avg(marks) >(select round (avg (marks),2) from students)

--3:List all students who scored less than the average marks of all students.

select
  stu_name,
  marks
from students
where marks < (select avg (marks) from students)

-------------------------------------------------------------------------------------------------------------

Module 6:

--1:Rank students based on their marks?

select
   stu_name,
   marks,
   dense_rank() over (order by marks desc) as student_rank
from students;
   
--2:Assign row numbers to students within each course based on marks.

select *,
row_number() over (partition by course_id order by marks desc) as row_number
from students;



--3:Find average marks per course along with each student's marks.

select
  stu_name,
  marks,
  course_id,
  avg(marks) over (partition by course_id) as avg_marks
 from students;


--4:Find the top scorer in each course.

select * from 
 (
select
 stu_name,
 course_id,
 marks,
 rank() over (partition by course_id order by marks desc) as rank_in_course
 from students)
where rank_in_course = 1;

--5:Find the least scorer in each course?

select * from 
 (
select
 stu_name,
 course_id,
 marks,
 rank() over (partition by course_id order by marks asc) as rank_in_course
 from students)
where rank_in_course = 1;
-----------------------------------------------------------------------------------------------------------------
--DCL - Data Control Language

--Commands are used to control acces [like permissions] to data in database.

--Grant

--REVOKE

----------------------------------------------------------

--GRANT

--user can only view the data - but not modify it.

GRANT SELECT ON  employees TO demo_user;

--Allow all permissions to a particular user.
GRANT SELECT, INSERT,UPDATE,DELETE ON employees to demo_user;

-------------------------------------------------------------------------------

--REVOKE

--remove access from demo_user

REVOKE SELECT ON employees FROM demo_user;

--remove certain sets of commands.

REVOKE  UPDATE , DELETE ON employees FROM demo_user;




