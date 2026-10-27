use demo;
select * from transactions;

select TransactionType,Amount,row_number() over() from transactions;

select TransactionType,Amount,row_number() over(order by Amount) from transactions;

select TransactionType,Amount,row_number() over(order by Amount desc) from transactions;

select TransactionType,Amount,row_number() over(partition by TransactionType order by Amount) from transactions;

select  TransactionDate,Amount,TransactionType,
lag(Amount) over(order by TransactionDate),
lag(Amount)over(partition by TransactionType order by TransactionDate)
from transactions;

select  TransactionDate,Amount,TransactionType,
lag(Amount)over(partition by TransactionType order by TransactionDate)
from transactions;

-- LEAD
select  TransactionDate,Amount,TransactionType,
LEAD(Amount)over(partition by TransactionType order by TransactionDate)
from transactions;

CREATE TABLE school(
name varchar (100),
marks int);
select * from school;

insert into school  value ("a",78),("b",79),("c",60),("d",79),("e",69),("f",79);

-- rank
select name,marks,rank() over(order by marks desc) from school;

-- dense_rank
select name,marks,dense_rank() over(order by marks desc) from school;

-- combine
select name,marks,row_number()over(order by marks desc),
rank()over(order by marks desc),
dense_rank()over(order by marks desc)
 from school;
 
 -- lab7
 select * from loans;
-- TASK 1
select Loan_ID,Loan_Amount,row_number() over(order by Loan_Amount desc) from loans;

-- TASK 2
select Loan_ID,Loan_Amount, RANK() over(order by Loan_Amount) from loans;

-- TASK 3
select Loan_ID,Loan_Amount, DENSE_RANK() over(order by Loan_Amount desc) from loans;

-- TASK 4
select Loan_ID,c_id,Loan_Amount,row_number() over( partition by c_id order by Loan_Amount desc) from loans;

-- task5
select Loan_ID,c_id,Loan_Amount,sum(Loan_Amount) over(order by Loan_Amount desc)  as "running total" from loans;

-- task 6
select Loan_ID,c_id,Loan_Amount,lag(Loan_Amount) over(order by Loan_Amount desc)  as " previous_Loan_Amount" from loans;

-- task 7
select Loan_ID,c_id,Loan_Amount,lead(Loan_Amount) over(order by Loan_Amount desc)  as " next_Loan_Amount" from loans;

