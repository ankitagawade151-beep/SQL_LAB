create database bookstore_db;
use bookstore_db;

create table customers(
customer_id int,
fuul_name varchar(200),
email varchar(200),
phone int,
city varchar(200),
created_date date);

alter table customers rename column fuul_name to full_name;
select * from customers;

create table books(
book_id int,
title varchar(200),
author varchar(200),
category varchar(200),
price float,
stock_qty int);

select * from books;

create table orders(
order_id int,
customer_id int,
order_date date,
status varchar(200));

select * from orders;

create table order_items(
order_item_id int,
order_id int,
book_id int,
quantity int);

select * from order_items ;

alter table customers add column country varchar(200);
alter table order_items add column discount float;
alter table customers modify phone varchar(15);
alter table books rename column stock_qty to stock_quantity;

alter table customers add constraint primary key(customer_id);
alter table books add constraint primary key(book_id);
alter table orders add constraint primary key(order_id);
alter table order_items add constraint primary key(order_item_id);

alter table orders add constraint foreign key(customer_id) references customers(customer_id);
alter table order_items add constraint foreign key(order_id) references orders(order_id);
alter table order_items add constraint foreign key(book_id) references books(book_id);

alter table customers add constraint unique(email);

alter table customers modify full_name varchar(200) not null;
alter table books modify title varchar(200) not null;
alter table books modify price float not null;
alter table orders modify order_date date not null;

alter table books add constraint check (price>0);
alter table order_items add constraint check (quantity>0);
alter table books add constraint check(stock_quantity>0);

alter table orders modify status varchar(200) default"pending";
alter table customers modify column created_date date default(current_date);

insert into customers (customer_id, full_name, email) values (1,"Rahul Sharma","rahul@gmail.com");
insert into customers (customer_id, full_name, email) values (2,"Rahul Patil","rahul2@gmail.com");

insert into books (book_id,title,author,category,price,stock_quantity) values (1,"python basics","Rahul","programing",100,10);

insert into orders (order_id,customer_id,order_date,status) values (101,999, current_time ,"pending");

insert into customers (customer_id, full_name, email) values (3, null, "test@mail.com");
INSERT INTO customers (customer_id, full_name, email) VALUES (4, 'Amit Patil', 'test@mail.com');

INSERT INTO customers
(customer_id, full_name, email, phone, city, created_date, country) VALUES
(5, 'Kiran Patil', 'kiran.patil@gmail.com', '9876543210', 'Mumbai', CURRENT_DATE, 'India'),
(6, 'Sneha More', 'sneha.more@gmail.com', '9876543211', 'Pune', CURRENT_DATE, 'India'),
(7, 'Amit Jadhav', 'amit.jadhav@gmail.com', '9876543212', 'Nashik', CURRENT_DATE, 'India'),
(8, 'Pooja Shinde', 'pooja.shinde@gmail.com', '9876543213', 'Nagpur', CURRENT_DATE, 'India'),
(9, 'Rohan Pawar', 'rohan.pawar@gmail.com', '9876543214', 'Kolhapur', CURRENT_DATE, 'India');

INSERT INTO books (book_id, title, author, category, price, stock_quantity) VALUES 
(2, 'Java Programming', 'James Gosling', 'Technology', 499.00, 25),
(3, 'Python Basics', 'Guido van Rossum', 'Technology', 399.50, 40),
(4, 'Data Structures', 'Chetan Bhagat', 'Education', 299.00, 15),
(5, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 450.00, 30),
(6, 'Atomic Habits', 'James Clear', 'Self-Help', 525.00, 50),
(7, 'The Alchemist', 'Paulo Coelho', 'Fiction', 350.00, 20),
(8, 'Clean Code', 'Robert Martin', 'Technology', 799.00, 10),
(9, 'Wings of Fire', 'A. P. J. Abdul Kalam', 'Biography', 299.00, 60),
(10, 'The Power of Habit', 'Charles Duhigg', 'Self-Help', 475.00, 25),
(11, 'Introduction to Algorithms', 'Thomas Cormen', 'Education', 999.00, 8);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES 
(102, 1, CURRENT_DATE, 'Pending'),
(103, 2, CURRENT_DATE, 'Completed'),
(104, 5, CURRENT_DATE, 'Processing'),
(105, 6, CURRENT_DATE, 'Cancelled'),
(106, 7, CURRENT_DATE, 'Pending'),
(107, 8, CURRENT_DATE, 'Completed');

INSERT INTO order_items (order_item_id, order_id, book_id, quantity, discount) VALUES 
(1, 102, 2, 2, 10.0),
(2, 103, 3, 1, 5.0),
(3, 104, 4, 3, 15.0),
(4, 105, 5, 1, 0.0),
(5, 106, 6, 2, 20.0),
(6, 107, 7, 4, 25.0),
(7, 102, 8, 1, 10.0),
(8, 103, 9, 3, 12.5),
(9, 104, 10, 2, 0.0),
(10, 105, 11, 1, 15.0);

update books set price =price*1.01 where category="programming";
update orders set status="shipped" where order_id=106;
update customers set city="nagpur" where customer_id=2;
