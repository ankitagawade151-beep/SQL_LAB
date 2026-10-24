create database xyz;
use xyz;
CREATE TABLE t1 (
  TransactionID   INT PRIMARY KEY,
  CustomerName    VARCHAR(50),
  City            VARCHAR(30),
  TransactionType VARCHAR(20),
  Amount          INT,
  Mode            VARCHAR(10),
  TransactionDate DATE,
  Remarks         VARCHAR(20)
);

INSERT INTO t1 VALUES
(1,  'Amit Sharma',    'Pune',      'Deposit',    15000, 'UPI',  '2026-01-05', 'Salary'),
(2,  'Priya Patil',    'Mumbai',    'Withdrawal',  3000, 'Cash', '2026-01-12', NULL),
(3,  'Rahul Verma',    'Delhi',     'Transfer',    8500, 'NEFT', '2026-01-18', 'Rent'),
(4,  'Sneha Kulkarni', 'Pune',      'Deposit',     4500, 'Card', '2026-02-02', NULL),
(5,  'Arjun Singh',    'Nagpur',    'Withdrawal', 12000, 'Cash', '2026-02-09', 'ATM'),
(6,  'Neha Joshi',     'Mumbai',    'Deposit',    25000, 'NEFT', '2026-02-15', 'Bonus'),
(7,  'Vikram Rao',     'Hyderabad', 'Transfer',    6000, 'UPI',  '2026-03-01', NULL),
(8,  'Anjali Desai',   'Pune',      'Withdrawal',  1500, 'Card', '2026-03-07', 'Shopping'),
(9,  'Rohan Mehta',    'Delhi',     'Deposit',     9800, 'UPI',  '2026-03-14', NULL),
(10, 'Kavita Nair',    'Kochi',     'Transfer',    2200, 'NEFT', '2026-03-21', 'Gift'),
(11, 'Sanjay Kapoor',  'Mumbai',    'Withdrawal',  7500, 'Cash', '2026-04-03', 'Rent'),
(12, 'Pooja Sharma',   'Nagpur',    'Deposit',    18000, 'Card', '2026-04-10', 'Salary'),
(13, 'Aakash Gupta',   'Pune',      'Transfer',    5000, 'UPI',  '2026-04-18', NULL),
(14, 'Meera Iyer',     'Chennai',   'Deposit',     3500, 'NEFT', '2026-05-02', 'Refund'),
(15, 'Aditya Bhosale', 'Pune',      'Deposit',    30000, 'UPI',  '2026-05-09', 'Bonus');



--q1
SELECT CustomerName AS c_name,city from t1
where city="pune";

--q2
SELECT * FROM t1
where TransactionType="withdrawal" and mode="cash";

--q3
SELECT * FROM t1
where mode="upi" and amount>=1000
order by Amount
limit 1 offset 4;

where mode="upi" and amount>=1000
order by Amount desc
limit 1 ;

--q4
select TransactionType,max(Amount) from t1
group by TransactionType
order by max(Amount) desc
limit 1;


select * from t1 where CustomerName like "a%";

select * from t1 where CustomerName like "%e";
select * from t1 where CustomerName like "%a%";
select * from t1 where mode like "u_i";
select * from t1 where mode like "___";
select * from t1 where CustomerName regexp "^A";
select * from t1 where CustomerName regexp "a$";
select * from t1 where mode regexp "UPI";
select * from t1 where mode regexp "UPI|CASH";


--1. Show all Deposit transactions.
select * from t1
where Transactiontype="Deposit";

--2. Show TransactionID, CustomerName and Amount for transactions above 10000.
select  TransactionID, CustomerName,Amount 
from t1
where Amount >10000;

--3. Show all transactions made in Pune.
select *from t1
where city="pune";

--4.  Show Deposits with an amount above 10000.
select * from t1
where TransactionType="DEPOSIT"
AND Amount>10000;

--5.  Show Withdrawals made in Cash.
select * from t1
where TransactionType="withdrawal" and mode="Cash";

--6. Show transactions from Mumbai or Delhi
select * from t1 where City regexp "Mumbai|Delhi";

--7. Write the same query as Q6
select * from t1 where City regexp "Mumbai|Delhi";

--8. Show transactions that were not made through UPI.
select * from t1 where not mode ="UPI";

--9. Show transactions with an amount between 5000 and 10000.
select * from t1 where amount between 5000 and 10000;

--10. Show transactions from cities other than Pune, Mumbai and Delhi
select * from where City regexp "Pune|Mumbai|Delhi";

--11.  Show transactions made in March 2026.
select * from 

--12. Show customers whose name starts with A.
select * from t1 where 'A%';

--13.  Show customers whose name ends with a.
select * from t1 where '%a';

--14. Show customers whose second letter is a.
select * from t1 where '_a%';

15. Show customers whose name contains sh.
select * from t1 where CustomerName like'%sh%';

--16.  Show customers whose name does not start with A.
select * from t1 where CustomerName not like 'a%';

--17.  Show transactions where Remarks is empty (NULL).
select * from t1 where Remarks is null;

--18. Use REGEXP to show customers whose name starts with A or P.
select * from t1 where  CustomerName regexp '^A|P';

--19. Use REGEXP to show customers whose name ends with a or i.
select * from t1 where  CustomerName regexp '$a|i';

--20. Show Deposits or Transfers above 5000 that were made through UPI or NEFT.
select * from t1
where TransactionType in ("Deposit","Transfer") and mode in ("UPI","NEFT");