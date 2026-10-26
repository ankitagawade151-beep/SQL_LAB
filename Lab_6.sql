use demo;
. -- Display customer Table
select * from Customer;

2. --  Display all customer FirstName in uppercase.
select first_name,upper(first_name) as new_name from Customer;

3 -- . Display all customer FirstName in lowercase.d
select first_name,lower(first_name) as l_s from Customer;

4. -- Find the total number of characters in each customer FirstName
select first_name,length(first_name) as lengthofname from Customer;

5. -- Display only the first three characters of customer FirstName .
select first_name,left(first_name,3)from Customer;

6. -- Combine customer's FirstName with LastName.
select concat(first_name," ",Last_name) as combine from Customer;

-- TRIM
select first_name,TRIM(first_name) as trim_name from Customer;
select upper(" hello"),length(" hello"),trim(" hello"),length(trim( "hello"));
-- RIGHT
 select first_name,RIGHT(first_name,3)from Customer;
 
 -- MID
 select first_name,mid(first_name,2)from Customer;
 
 -- ROUND()
 SELECT ROUND(15.5),CEIL(15.5),FLOOR(15.5),ABS(15.5),MOD(15,5);
 
 
 -- 1. Display customer Table
 SELECT * FROM Customer;
 
-- 2. Display the current system date
select current_date();

-- 3. Display the current system date and time.
select now();

4. -- Display the Birth of year
select year(DateofBirth)from Customer;

5. -- Display the Birth month
select month(DateofBirth) from Customer;

6. -- Calculate the number of days since BirthDate
select DateofBirth,datediff(curdate(),DateofBirth) from Customer;

7. -- Find the latest birth date.
select  max(DateofBirth)from Customer;

8. -- Find the earliest birth date
select min(DateofBirth) from Customer;


1. -- Categorize customers as Adult or Young based on their birth year
 select year(DateofBirth),case
 when year(DateofBirth)>1998 then "Young"
  when year(DateofBirth)<=1998 then "adult" 
  end as type from Customer;
  
2. -- Display 'Not Available' if a phone number is NULL
 select ifnull(phone,"not available")from Customer;
 
3. --  Compare two customer names
 select first_name, nullif(first_name,"priya") from Customer;
 
4. -- Calculate the total balance maintained across all customer accounts.
 select sum(Balance) from account;
 
5. -- Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
 select avg(Balance) from account;
 
6. -- Identify the highest balance maintained in any customer account.
 select max(Balance)from account;
 
7. -- Identify the lowest balance maintained in any customer account
  select min(Balance)from account;
  
8. -- Determine the total number of customer accounts available in the system.
select count(distinct(AccountID)) from account;

9. -- The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.
 select Accounttype,sum(Balance)from account
 group by Accounttype;
 
10. -- The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
select Accounttype,sum(Balance) from account
group by Accounttype
having sum(Balance)>25000;