create database Akshat_task1;

use akshat_task1;
-- Create emp_details table
CREATE TABLE emp_details (EMP_IDNO INT PRIMARY KEY,EMP_FNAME VARCHAR (45),EMP_LNAME VARCHAR(45),EMP_DEPT INT foreign key references emp_department(DEPT_CODE));

-- insert records in emp_details
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES 
   (127323, 'Michale', 'Robbin', 57),
   (526689, 'Carlos', 'Snares', 63),
   (843795, 'Enric', 'Dosio', 57),
   (328717, 'Jhon', 'Snares', 63),
   (444527, 'Joseph', 'Dosni', 47),
   (659831, 'Zanifer', 'Emily', 47),
   (847674, 'Kuleswar', 'Sitaraman', 57),
   (748681, 'Henrey', 'Gabriel', 47),
   (555935, 'Alex', 'Manuel', 57),
   (539569, 'George', 'Mardy', 27),
   (733843, 'Mario', 'Saule', 63),
   (631548, 'Alan', 'Snappy', 27),
   (839139, 'Maria', 'Foster', 57);

select * from emp_details;
drop table emp_details;
--create table emp_department

create table emp_department (DEPT_CODE INT PRIMARY KEY,DEP_NAME VARCHAR(45) , DEP_ALLOTMENT INT);

--INSERT RECORDS IN emp_department 
INSERT INTO emp_department (DEPT_CODE,DEP_NAME,DEP_ALLOTMENT)
VALUES
	(57,'IT',65000),
	(63,'Finance',15000),
	(47,'HR',240000),
	(27,'RD',55000),
	(89,'QC',75000);
SELECT * FROM emp_department;

--CREATE TABLE company_mast
CREATE TABLE company_mast (COM_ID INT PRIMARY KEY IDENTITY(11,1), COM_NAME VARCHAR(45));

--INSERT THE RECORDS IN company_mast
INSERT INTO company_mast 
VALUES 
	('Samusung'),
	('iBall'),
	('Epsion'),
	('Zebronics'),
	('Asus'),
	('frontech');

SELECT * FROM company_mast;

--CREATE TABLE item_mast
CREATE TABLE item_mast (PRO_ID INT PRIMARY KEY IDENTITY(101,1),PRO_NAME VARCHAR(45),PRO_PRICE INT,PRO_COM int foreign key references company_mast(com_id));

--INSERT THE RECORD IN item_mast
INSERT INTO item_mast (PRO_NAME, PRO_PRICE, PRO_COM)
VALUES 
    ('Mother Board', 3200, 15),
    ('Key Board', 450, 16),
    ('ZIP drive', 250, 14),
    ('Speaker', 550, 16),
    ('Monitor', 5000, 11),
    ('DVD drive', 900, 12),
    ('CD drive', 800, 12),
    ('Printer', 2600, 13),
    ('Refill cartridge', 350, 13),
    ('Mouse', 250, 12);

SELECT * FROM item_mast;

--CREATE TABLE salesman
CREATE TABLE salesman (salesman_id INT PRIMARY KEY ,name varchar(45),city varchar(30),commission float);

--insert the record in salesman
INSERT INTO salesman 
VALUES 
    (5001,'James Hoog', 'New York', 0.15),
    (5002,'Nail Knite', 'Paris', 0.13),
    (5005,'Pit Alex', 'London', 0.11),
    (5006,'Mc Lyon', 'Paris', 0.14),
    (5007,'Paul Adam', 'Rome', 0.13),
    (5003,'Lauson Hen', 'San Jose', 0.12);

select * from salesman;

--CREATE TABLE customer
CREATE TABLE customer (customer_id INT PRIMARY KEY,cust_name VARCHAR(30),city VARCHAR(20),grade SMALLINT,salesman_id  INT FOREIGN KEY REFERENCES salesman(salesman_id ));
exec sp_help customer ;

--INSERT THE RECORD IN customer
INSERT INTO customer 
VALUES 
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);

select * from customer;

--create table orders
CREATE TABLE orders (ord_no int primary key,purch_amt float ,ord_date date,customer_id int foreign key references customer (customer_id),salesman_id int foreign key references salesman(salesman_id));
exec sp_help orders;
--insert the records in orders
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES 
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);

---------------------------------------------- TASK - 1 ------------------------------------------------

-- Q - 1 Write a SQL statement to find the total purchase amount of all orders.
SELECT SUM(purch_amt) as TOTAL_PURCHASE_AMOUNT from orders;

-- Q - 2 Write a SQL statement to find the average purchase amount of all orders.
SELECT AVG(purch_amt) as AVERAGE_PURCHASE_AMOUNT from orders;

-- Q - 3 Write a SQL statement to find the number of salesmen currently listing for all of their customers
SELECT COUNT(DISTINCT customer_id),salesman_id from customer group by (salesman_id);

-- Q - 4 Write a SQL statement to know how many customer have listed their names.
select cust_name from customer;

-- Q - 5 Write a SQL statement find the number of customers who gets at least a gradation for his/her performance
select count(customer_id) AS NUMBER_OF_CUSTOMER  from customer where grade is not null;

-- Q - 6 Write a SQL statement to get the maximum purchase amount of all the orders
SELECT MAX(purch_amt) as MAX_AMOUNT_FROM_ALL_ORDERS from orders;

-- Q - 7 Write a SQL statement to get the minimum purchase amount of all the orders
SELECT MIN(purch_amt) as MIN_AMOUNT_FROM_ALL_ORDERS from orders;

-- Q - 8  Write a SQL statement which selects the highest grade for each of the cities of the customers.
SELECT MAX(grade),CITY FROM CUSTOMER GROUP BY (CITY);

-- Q - 9 Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount.
SELECT MAX(purch_amt),customer_id from orders group by customer_id;

-- Q - 10 Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID, order date and highest purchase amount. 
SELECT MAX(purch_amt) as [Highest purchase amount],ord_date,customer_id from orders group by customer_id,ord_date;

-- Q - 11 Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID.
select salesman_id , max(purch_amt) as [Highrst purchase amount] from orders where  ord_date = '2012-08-17' group by salesman_id ;

-- Q - 12 Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have highest purchase amount in a day is more than 2000.
select customer_id, max(purch_amt) as [Highest purchase amount],ord_date from orders group by customer_id,ord_date having max(purch_amt) >2000;

-- Q - 13  Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000
select customer_id, max(purch_amt) as [Highest purchase amount],ord_date from orders group by customer_id,ord_date having max(purch_amt) between 2000 and 6000;

-- Q -14 Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.
select customer_id, max(purch_amt) as [Highest purchase amount],ord_date from orders group by customer_id,ord_date having max(purch_amt) in (2000,3000,5760,6000);

-- Q - 15  Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007.
select customer_id, max(purch_amt) as [Highest purchase amount],ord_date from orders group by customer_id,ord_date having customer_id between 3002 AND 3007;

-- Q - 16 - Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range 3002 and 3007 and highest purchase amount is more than 1000.
select customer_id,max(purch_amt) from orders group by customer_id having  customer_id between 3002 and 3007 AND max(purch_amt) > 1000;
----or-------
select customer_id,max(purch_amt) from orders group by customer_id,purch_amt having  customer_id between 3002 and 3007 AND max(purch_amt) > 1000;
-- Q - 17 Write a SQL statement to find the highest purchase amount with their ID, for only those salesmen whose ID is within the range 5003 and 5008.
select max(purch_amt) as [Highest purchase amount],ord_no from orders group by customer_id,ord_no,salesman_id having salesman_id between 5003 AND 5008;

-- Q - 18 Write a SQL statement that counts all orders for a date August 17th, 2012.
select count(ord_no)as [Total All Order In This Date] from orders where ord_date = '2012-08-17';

-- Q - 19 Write a SQL statement that count the number of salesmen for whom a city is specified. Note that there may be spaces or no spaces in the city column if no city is specified.
select count(salesman_id) as [Total number of salesman in city] from salesman where city is not null and trim(city) != '' ;

-- Q - 20 Write a query that counts the number of salesmen with their order date and ID registering orders for each day.
select count(salesman_id) as [Total Salesman Id] ,ord_date,ord_no from orders  group by ord_date,ord_no;


-- Q -21 Write a SQL query to calculate the average price of all the products. 
select avg(pro_price),PRO_NAME from item_mast group by pro_name;

-- Q - 22 Write a SQL query to find the number of products with a price more than or equal to Rs.350.
select pro_name,PRO_PRICE from item_mast where pro_price >=350;

-- Q - 23 Write a SQL query to display the average price of each company's products, along with their code.
select avg(pro_price),PRO_COM from item_mast group by pro_com;

-- Q - 24 Write a query in SQL to find the sum of the allotment amount of all departments.
select sum(dep_allotment) as [Sum Of All Department] from emp_department;

-- Q - 25 Write a query in SQL to find the number of employees in each department along with the department code.
select count(emp_idno) as [Count Of Emp In Department],Emp_dept from emp_details group by emp_dept;