create table studs(
id int,
name varchar(200));

select * from studs;

insert into studs(id,name) value(101,"abc");

insert into studs value(102,"xyz");

insert into studs(id) value(101);

insert into studs value(102,"a"),(103,"b"),(104,"c");

insert into studs(id) value(1),(2),(3),(4);

update studs set name ="xyz" Where id=1;

select * from studs;

update studs set name ="a" Where id=3;

update studs set id =104 Where name ="abc";

delete from studs where id=101;

delete from studs where id=102;

truncate table studs;

drop table stud;






create database students;

use students;

create table stu(
student_id int,
student_name varchar(50),
city varchar(30),
course varchar(40),
marks int);

select * from learners;

insert into stu(student_id,studenr_name,city,course,marks) value(101,"Asha","pune","Data_Analytics",78),(102,"Ravi","Mumbai","Data_science",35),
(103,"Meena","Chennai","Data_Analytics",88),(104,"Karan","Delhi","Exel",29),(105,"Sara","Pune","Data_Science",91);

alter table stu drop column city;

alter table stu rename column marks to score;

alter table stu modify score float;

rename table stu to learners;

insert into learners value(106,"Vikram","Exel",67);

alter table learners add column city varchar(50);

update learners set city ="Pune" where student_id=101;
update learners set city ="Mumbai" where student_id=102;
update learners set city ="Chennai" where student_id=103;
update learners set city ="Delhi" where student_id=104;
update learners set city ="Pune" where student_id=105;
update learners set city ="Nagpur" where student_id=106;

update learners set city ="Hyderabad" where student_id=103;

delete from learners where score<40;

truncate table learners;

drop table learners;
  
