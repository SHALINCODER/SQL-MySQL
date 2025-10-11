create database if not exists learning;
use learning;

drop table students;
create table students(
id int primary key auto_increment,
name varchar(50) not null,
age int check(age>5),
email varchar(50) unique,
city varchar(50) default "Unknown");

insert into students( name, age, email, city)
values( "SHALIN", 22, "shalinsunil1@gmail.com", "Chennai"),
("DANUSH", 23, "danush@gmail.com", "Coimbatore"),
("SHARON", 23, "sharon@gmail.com", default);
SELECT * FROM students;

select name, city from students;

select * from students
where city = "chennai";

update students
set city = "Delhi"
where id = 3;

update students
set age = age + 1
where name = "SHALIN";

delete from students
where name = "DANUSH";

delete from students
where id = 6;

select * from students
where age > 20;

select * from students
where age != 23;

INSERT INTO students (name, age, email, city) VALUES
("ARUN", 19, "arun@gmail.com", "Bangalore"),
("PRIYA", 25, "priya@yahoo.com", "Chennai"),
("RAHUL", 21, "rahul@gmail.com", "Delhi"),
("MEENA", 27, "meena@gmail.com", "Mumbai"),
("VIKRAM", 23, "vikram@gmail.com", "Delhi"),
("ANITA", 24, "anita@gmail.com", "Chennai");

select * from students
where city = "chennai" and age > 20;

select * from students
where city in ("Delhi", "Chennai");

select * from students
where name like "S%";

select * from students
where email like "%@gmail.com";

select * from students
where age between 21 and 25;

select * from students
where city = "Chennai" or city = "Delhi";



select * from students;
insert into students
values(10, "ARON", 23, NULL, "Chennai");

select * from students
where email is null;

select * from students;

select count(name) from students;

select min(age) from students;

select max(age) from students;
select avg(age) from students;



select city, count(city) from students
group by city;

select city, count(city) from students
group by city
having count(city) > 2;

select * from students
order by age desc;

select * from students
order by age
limit 3;

select * from students
order by name asc
limit 5;

select name as StudentName, city as Location
from students;

select city, count(city) as TotalStudents
from students group by city;



select * from students
where age = ( select min(age) from students );

select * from students
where age = ( select max(age) from students );



select * from students
where age > ( select avg(age) from students );

select name, age,
case
	when age<21 then "young"
    when age between 21 and 25 then "adult"
    else "senior"
end as category
from students;

select name,
case
	when city = "chennai" then "Local"
    else "Non-Local"
end as Status
from students;



create table courses(
course_id int primary key auto_increment,
student_id int,
course_name varchar(50),
foreign key (student_id) references students(id));


INSERT INTO courses (student_id, course_name) VALUES
(1, 'Mathematics'),
(1, 'Physics'),
(3, 'History'),
(4, 'Computer Science'),
(5, 'Chemistry');

select * from students s
inner join courses c
on s.id = c.student_id;

select * from students s
left join courses c
on s.id = c.student_id;

select * from students s
right join courses c
on s.id = c.student_id;

select * from students s
inner join courses c
on s.id = c.student_id;

select * from students s
left join courses c 
on s.id = c.student_id
where  c.student_id is null;

SELECT s.name AS student_name, COUNT(c.course_id) AS total_courses
FROM students s
LEFT JOIN courses c
ON s.id = c.student_id
GROUP BY s.id, s.name;

SELECT c.course_name, s.name AS student_name, s.age
FROM courses c
INNER JOIN students s
ON c.student_id = s.id
WHERE s.age > 22;

