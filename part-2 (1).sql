create database if not exists xyz;
use xyz;


create table employee ( 
id int auto_increment primary key,
name varchar(20),
salary double);

insert into employee(name, salary) values( "ADAM", 25000 ), ( "BOB" , 30000), ("CASEY", 40000);
select * from employee; 


drop table temp1;

create table temp1(
id int,
name varchar(20),
age int default 18,
city varchar(20),
primary key(id, name));

drop table temp;

create table temp (
temp_id int,
foreign  key ( temp_id ) references temp1(id));

create table city(
id int primary key,
city varchar(20),
age int,
constraint age_check check ( age>=18 and city="Delhi" ));

create table newTab(
age int check ( age >= 18 ));

create table students(
rollno int primary key,
name varchar(20),
marks int not null,
grade varchar(1),
city varchar(20));

insert into students values
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

select * from students;
select city from students;
select distinct city from students;


select * from students
where marks > 80;

select * from students
where city = "Mumbai";

select * from students
where marks > 80 and city = "Mumbai";
select * from students
where marks+10 > 100; 

select * from students
where marks = 93; 

select * from students where marks > 90 and city = "Mumbai";
select * from students where marks > 90 or city = "Mumbai";

select * from students where marks between 80 and 90;
select * from students where city in ("Mumbai", "Delhi");

select * from students where city not in ("Mumbai", "Delhi");



select * from students limit 3;
select * from students where marks > 80 limit 3;

select * from students
order by city asc;

select * from students
order by marks desc
limit 3;

select avg(marks) 
from students;

select max(marks) 
from students;

select count(*) 
from students;

select min(marks)
from students;

select sum(marks)
from students;



select * from students
where marks > (select avg(marks) from students);

select city
from students;


select city, count(name)
from students
group by city;

select city, name, count(name)
from students
group by city, name;


select city, avg(marks)
from students
group by city
order by avg(marks) asc;

-- Create table
create table customers (
    customer_id int primary key,
    customer varchar(50),
    mode varchar(20),
    city varchar(30)
);

-- Insert records
insert into customers (customer_id, customer, mode, city) values
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');

select mode, count(customer)
from customers
group by mode;

select city, count(name)
from students
group by city
having max(marks) > 90;

update students
set grade = "O"
where grade = "A";


select * from students;
update students set marks  = marks + 1;

delete from students
where marks < 33;

select * from students;

-- Department table
CREATE TABLE dept (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
drop table dept;

insert into dept
values
(101, "english"),
(102, "IT");

select * from dept;
-- Teacher table
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
drop table teacher;
INSERT INTO teacher
VALUES
(101, 'Adam', 101),
(102, 'Eve', 102);

update dept
set id = 103
where id = 102;

select * from teacher;




select * from students;

alter table students
add column age int default 18;

alter table students
drop column age;

alter table students
rename to studentt;

alter table studentt
rename to students;


alter table students
change column age age_check varchar(50) not null;


alter table students
change column age_check age int not null;

alter table students
modify age varchar(20);

truncate table city;



alter table employee
change column name full_name varchar(20);

select * from students;

delete from students
where marks < 90;

alter table students
drop column grade;


-- Create student table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert data into student table
INSERT INTO student (student_id, name) VALUES
(101, 'adam'),
(102, 'bob'),
(103, 'casey');


-- Create course table
CREATE TABLE course (
    student_id INT,
    course VARCHAR(50),
    PRIMARY KEY (student_id, course)   -- to allow multiple students same course
);

-- Insert data into course table
INSERT INTO course (student_id, course) VALUES
(102, 'english'),
(105, 'math'),
(103, 'science'),
(107, 'computer science');


select * from student
inner join course 
on student.student_id = course.student_id;

select c.student_id, name, course from student s
inner join course c
on s.student_id = c.student_id;

select * from student
left join course
on student.student_id = course.student_id;

select * from student
right join course
on student.student_id = course.student_id;

select * from student
left join course
on student.student_id = course.student_id
union
select * from student
right join course
on student.student_id = course.student_id;



select * from student
left join course
on student.student_id = course.student_id
where course.student_id is null;

select * from student
right join course
on student.student_id = course.student_id
where student.student_id is null;

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO Employees (id, name, manager_id) VALUES
(101, 'adam', 103),
(102, 'bob', 104),
(103, 'casey', NULL),
(104, 'donald', 103);

Select a.name as manager_name, b.name from employees as a
join employees as b
on a.id = b.manager_id;

select * from student
union 
select * from course;

select * from student
union all
select * from course;

use xyz;
select * from student;


-- Create table
CREATE TABLE studentss (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

-- Insert values
INSERT INTO studentss (rollno, name, marks) VALUES
(101, 'anil', 78),
(102, 'bhumika', 93),
(103, 'chetan', 85),
(104, 'dhruv', 96),
(105, 'emanuel', 92),
(106, 'farah', 82);

-- Add new column
ALTER TABLE studentss
ADD city VARCHAR(50);

-- Update values
UPDATE studentss SET city = 'Pune'   WHERE rollno = 101;
UPDATE studentss SET city = 'Mumbai' WHERE rollno = 102;
UPDATE studentss SET city = 'Mumbai' WHERE rollno = 103;
UPDATE studentss SET city = 'Delhi'  WHERE rollno = 104;
UPDATE studentss SET city = 'Delhi'  WHERE rollno = 105;
UPDATE studentss SET city = 'Delhi'  WHERE rollno = 106;

select * from studentss
where marks > ( select avg(marks) from studentss );

select name from studentss where rollno in (select rollno from studentss
where rollno % 2 = 0);

select * from studentss;
select max(marks) from(
select * from studentss
where city = "Delhi") as delhi_students;

select ( select max(marks) from studentss), name
from studentss;


create view view1 as
select rollno, name, marks from studentss;

select * from view1;

use functions;

DELIMITER $$

CREATE PROCEDURE get_customer()
BEGIN
    SELECT * FROM departments;
END $$

DELIMITER ;

CALL get_customer();

drop procedure get_customer;

use functions;
drop procedure customers;
delimiter $$
create procedure customers(in id int)
begin
	select * from departments 
    where department_id = id;
end $$
delimiter ;

call customers(30);

drop procedure get_departments;
use functions;
delimiter $$
create procedure get_departments(in id int, name varchar(20))
begin
	select * from departments
    where department_id = id and department_name = name;
end $$
delimiter ;

select * from departments;

call get_departments(10, 'HR');
call get_departments(30, 'IT');
use functions;

delimiter $$
create procedure get_sum(in id int, out p_sum int)
begin
	select sum(salary) into p_sum from employee;

end $$
delimiter ;
select * from employee;

set @emp_sum = 0;
call get_sum(1, @emp_sum);

select @emp_sum;


drop function get_max_sal;

delimiter $$
create function get_max_sal() returns varchar(50)
deterministic no sql reads sql data
begin
	declare v_max int;
    declare v_name varchar(50);
    
    select max(salary) into v_max from employee;
    select name into v_name from employee
    where salary = v_max
    limit 1;
	return v_name;
end $$
delimiter ;

select * from employee;
select get_max_sal();


select empid, name, salary, sum(salary) over(order by empid) as sum_salary from employee;

select empid, name, salary, sum(salary) over(partition by department) as sum_salary from employee;

select empid, name, salary, row_number() over(order by salary) as row_no from employee;

select empid, name, salary, row_number() over(partition by department) as row_no from employee;

select empid, name, salary, rank() over(order by salary) as rank_sal from employee;

select empid, name, salary, dense_rank() over(order by salary desc) as rank_sal from employee;

select empid, name, salary, lag(salary) over() as lag_salary from employee;

select *, lead(salary) over() as lead_salary from employee;

select *, salary - lead(salary) over(order by salary desc) as diff_salary from employee;

select *, salary - lag(salary) over(order by salary desc) as diff_salary from employee;

