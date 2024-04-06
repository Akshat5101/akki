--This is 1st
select name from sys.databases;

use akshat;

select * from sys.objects where type='U';
select * from customer;
--see All Procedures or vie or function.
select * from sys.procedures;
select * from sys.views;

truncate table customer;

insert into customer (id,name,age) values (1,'Akshat',23);

insert into customer (id,name,age) values (2,'Bhavy',25);

Alter table customer Alter age set check (age>18);

update  customer set age=24 where name='AKSHAT';

Alter table customer Add check (age >18);

insert into customer (id,name,age) values (3,'Akshay',19);

select name , age from customer where id=1;

select * from customer order by Age desc;

select id,name,age from customer where name like 'a%'; 

select id,name,age from customer where name like '%t'; 

select id,name,age from customer where name like 'a____%t';

select id,name,age from customer where id IN(1,3);

select id,name,age from customer where id Between 1 and 3;

select avg(age) from customer ;

SELECT
    CASE
        WHEN age > 18 THEN 'Age is above 18'
        WHEN age = 18 THEN 'Age is 18'
        ELSE 'Age is below 18'
    END AS age_category
FROM 
    customer;



create procedure SelectAllUser as select id,name,age from customer go;

exec SelectAllUser;





--- this is 2nd
use akshat;

Create table orders (
o_id int primary key,
price int,
id int  foreign key references customer(id)
);

select * from orders;
select * from customer;
use Akshat;
insert into orders values (1,100,1);

update customer set city = 'surat' where city is null;

ALTER TABLE orders
ADD PRIMARY KEY (o_id);
drop table orders;
select * from orders;

insert into orders values (2,200,2);
select * from orders;

ALTER TABLE orders ADD qty int ;

update  orders set qty=10 where qty is null;

select * from orders;

select * from customer where id = (select id from orders where o_id=1);



select * from customer where id in (select id from orders);
--inner join
select c.id , c.name,c.age,c.city ,o.qty,o.price from customer as c inner join orders as o on c.id = o.id ;
-- join
select c.id , c.name,c.age,c.city ,o.qty,o.price from customer as c join orders as o on c.id = o.id ;
--left join
select c.id , c.name,c.age,c.city ,o.qty,o.price from customer as c left join orders as o on c.id = o.id ;
--right join
select c.id , c.name,c.age,c.city ,o.qty,o.price from customer as c right join orders as o on c.id = o.id ;
--full join
select c.id , c.name,c.age,c.city ,o.qty,o.price from customer as c full join orders as o  on c.id = o.id;
--self join
select c1.name ,c2.name from customer as c1 ,customer as c2 where c1.age = c1.age and c1.city = c2.city;

create procedure cus_ord as
select c.id , c.name,c.age,c.city ,o.qty,o.price from customer as c right join orders as o on c.id = o.id;

exec cus_ord;




-- select all customer procedure
create procedure selectallcustomer as
select * from customer 


exec selectallcustomer;

--select all orders by procedure selectallorders
create procedure selectallorders as
select * from orders 


exec selectallorders;
drop procedure selectallorders;
--select customer by id
CREATE PROCEDURE selectallcustomerid 
    @id INT 
AS
    SELECT * FROM customer WHERE id = @id;
GO

exec selectallcustomerid @id = 1;

--selectcustomer view for select all records from customer
create view selectcustomer as 
select * from customer;


select * from selectcustomer;

--update city by id
update customer set city='Banglore' where id=3;

--group by with having
select count(id), city from customer group by(city) having count(id)>1;

select * from customer where id > 0 order by id desc;

select * from customer where id in (1,2,3,5);

select * from customer where  exists (select id from orders);


--between 1 to 10 id
select * from customer where id between 1 and 10;


--name start with a to f
SELECT * FROM Customer
WHERE name LIKE '[a-f]%';

select * from customer;


--copy one table data into another new table and created
select id,name into supplier from customer;

select * from supplier;

--display those records whose age is greater than average age
select * from customer where age > (select avg(age) from customer);

--select and shown a number of customer in all city by group by
select count(id) as id  , city from customer group by city;

--city in ahmedabad and surat
select * from customer where city in('ahmedabad','surat');

select * from selectcustomer;
exec SelectAllUser;
exec selectallcustomerid @id = 1;
exec selectallorders;


select * from supplier;
alter table supplier add gmail varchar(45);

exec sp_help supplier;

select * from supplier;

update supplier set gmail = 'shahbhavy@gmail.com' where id in (5);

alter table supplier alter column gmail varchar(45);

alter table supplier add address varchar(45);

update supplier set address = 'Raipur' where address is null;

ALTER TABLE supplier
ADD UNIQUE (id);
ALTER TABLE SUPPLIER DROP COLUMN ADDRESS;
alter table supplier add cid int;
exec sp_help supplier;
alter table supplier add foreign key(cid) references customer(id);
ALTER TABLE SUPPLIER ADD  ADDRESS VARCHAR(45);
EXEC SP_HELP customer;

ALTER TABLE SUPPLIER ALTER COLUMN ADDRESS VARCHAR(450);

INSERT INTO customer (id, name, age, city)
VALUES
(4, 'Emily Brown', 35, 'Houston'),
(6, 'Sarah Wilson', 33, 'Boston'),
(7, 'James Taylor', 45, 'Seattle'),
(8, 'Emma Martinez', 29, 'Miami'),
(9, 'Daniel Anderson', 38, 'Dallas'),
(10, 'Olivia Garcia', 27, 'Philadelphia'),
(11, 'William Hernandez', 32, 'Atlanta'),
(12, 'Sophia Lopez', 41, 'Denver'),
(13, 'Alexander Gonzalez', 26, 'Phoenix'),
(14, 'Ava Perez', 31, 'Washington'),
(15, 'Mia Smith', 42, 'Austin'),
(16, 'Ethan Wilson', 36, 'San Diego'),
(17, 'Charlotte Miller', 43, 'San Antonio'),
(18, 'Amelia Moore', 34, 'Portland'),
(19, 'Benjamin Hall', 39, 'Las Vegas'),
(20, 'Harper Clark', 44, 'Detroit'),
(21, 'Lucas Allen', 37, 'Minneapolis'),
(22, 'Abigail Adams', 46, 'Charlotte'),
(23, 'Matthew King', 23, 'Indianapolis'),
(24, 'Ella Nelson', 47, 'Jacksonville'),
(25, 'Jackson Hill', 24, 'San Jose'),
(26, 'Elizabeth Baker', 48, 'Columbus'),
(27, 'Sebastian Ross', 21, 'Memphis'),
(28, 'Liam Campbell', 49, 'San Francisco'),
(29, 'Avery Mitchell', 22, 'Louisville'),
(30, 'Scarlett Perez', 50, 'El Paso'),
(31, 'Logan Roberts', 20, 'Nashville'),
(32, 'Zoey Murphy', 51, 'Oklahoma City'),
(33, 'David Reed', 19, 'Milwaukee'),
(34, 'Penelope Turner', 52, 'Albuquerque'),
(35, 'Gabriel Phillips', 19, 'Tucson'),
(36, 'Riley Campbell', 53, 'Fresno'),
(37, 'Aria Hughes', 19, 'Sacramento'),
(38, 'Nathan Parker', 54, 'Long Beach'),
(39, 'Chloe Evans', 19, 'Kansas City'),
(40, 'Joseph Powell', 55, 'Mesa'),
(41, 'Madison Bryant', 45, 'Virginia Beach'),
(42, 'Isaac Foster', 56, 'Atlanta'),
(43, 'Hannah Cox', 20, 'Colorado Springs'),
(44, 'Wyatt Marshall', 57, 'Raleigh'),
(45, 'Aurora Richardson', 25, 'Omaha'),
(46, 'Samuel Gray', 58, 'Miami'),
(47, 'Evelyn Sanders', 22, 'Oakland'),
(48, 'Dylan Rivera', 59, 'Tulsa'),
(49, 'Victoria Murray', 21, 'Cleveland'),
(50, 'Luke Washington', 60, 'Arlington');
select * from customer;

exec sp_help orders;


select * from orders;
truncate table orders;

INSERT INTO orders (o_id, price, id, qty)
VALUES
(1, 100, 1, 5),
(2, 150, 2, 3),
(3, 200, 3, 7),
(4, 120, 4, 2),
(5, 180, 5, 4),
(6, 90, 6, 6),
(7, 130, 7, 8),
(8, 170, 8, 1),
(9, 110, 9, 3),
(10, 140, 10, 5),
(11, 210, 11, 2),
(12, 160, 12, 4),
(13, 190, 13, 6),
(14, 220, 14, 8),
(15, 230, 15, 3),
(16, 250, 16, 7),
(17, 270, 17, 4),
(18, 300, 18, 5),
(19, 280, 19, 1),
(20, 260, 20, 9);

--select those record which placed the order in past but it is done by inner-query
select * from customer where id in (select id from orders);


--select those record which placed the order in past but it is done by join
select c.name,c.age,c.city,o.qty,o.price from customer as c inner join orders as o on c.id = o.id;

select count(id) as Total
,city from customer group by (city) having count(id) > 1 order by total desc;

--this are the those customer who does not place any order yet but it is done by inner query
select * from customer where id  not in(select id from orders);

--this are the those customer who does not place any order yet but it is done by left join
select c.name,o.qty ,o.price from customer as c left join orders as o on c.id = o.id where o.qty is null;

-- This is the procedure which accept the parameter and return the result as parameter
create procedure getallcities_by_id @id int, @cities VARCHAR(30) OUT as
select distinct city from customer where id= @id;


declare @city varchar(30)
exec getallcities_by_id @id = 1, @cities = @city out;
print @city;

drop procedure getallcities_by_id;
--create table for status when something happen in supplier
create table supplier_status (id int , status nchar(45));

--create trigger for supplier table insert query
create trigger supplierstatus on supplier
	After insert
as 
	declare @sid int
	select @sid = inserted.id
	from inserted

	insert into supplier_status (id , status) values (@sid,'inserted');

insert into supplier  values (11,'akshat','akshat@gmail.com','Raipur',2);
select * from supplier;
select * from supplier_status;

--create trigger for supplier table delete query
create trigger supplierstatus_delete on supplier
	After delete
as 
	declare @sid int
	select @sid = deleted.id
	from deleted

	insert into supplier_status (id , status) values (@sid,'Deleted');

delete from supplier where id = 11;
select * from supplier;
select * from supplier_status;

--create trigger for supplier table Update query
create trigger supplierstatus_Update on supplier
	After update
as 
	declare @sid int
	declare @action varchar(30)
	select @sid = inserted.id
	from inserted

	if update(id)
		set @action = 'update id'
	if update(name)
		set @action = 'update name'
	if update(gmail)
		set @action = 'update gmail'
	if update(address)
		set @action = 'update address'
	if update(cid)
		set @action = 'update cid'
	insert into supplier_status (id , status) values (@sid,@action);
	
drop trigger supplierstatus_Update;
update supplier set cid = 2 where id=10;
select * from supplier;
select * from supplier_status;


--  table valued fuction 
create function getUserDetails (@id int)
returns table 
as 
return
(
	select * from supplier where id=@id
);
SELECT * FROM getUserDetails(2);
create procedure akshat @id int,@city varchar(45) out as 
select city from customer where id = @id;

declare @cities  varchar(30);
exec akshat @id = 3 ,@city = @cities out;
drop procedure akshat;

-- scalar function 
CREATE function getCity(@id int) 
returns  varchar(45)
as
BEGIN
	declare @city varchar(45);
	select @city = city from customer where id = @id;
	return @city;
END;

SELECT dbo.getCity(1);

Create PROCEDURE sumavg @p1 int ,@p2 int ,@sum int out ,@avg int out as
	set @sum  = @p1 + @p2
	 set @avg = @sum/2	;
declare @sum1 int ;
declare @avg1 int ;
exec sumavg  5,10,@sum1 out,@avg1 out;
print 'The sum is : '+cast(@sum1 as varchar );
print @avg1;

create view SCustomer as 

	select * from customer 

select * from SCustomer;

create procedure City_customer @id int ,@city varchar out as
BEGIN
	select city from customer where id = @id;
END;

declare @cities varchar(45);
exec City_customer @id = 1, @city = @cities out;
print @cities;

create function City_func(@id int)
returns table as 
return(
	select * from customer where id = @id
)

select * from City_func(1)

create function detail_func(@id int)
returns varchar(45) as 
BEGIN
declare @city varchar(45)
select @city = city from customer where id = @id;
return @city
END;

select dbo.detail_func(1);

-- function inside in procedure
create procedure Pro_with_func @id int ,@city varchar(45) out as

BEGIN 
	select dbo.detail_func(@id)
END;
declare @cities varchar(45);
exec Pro_with_func @id = 1,@city = @cities out;
print @cities;

-- Temporary Table of supplier
CREATE  TABLE #cust_temp (
id int ,
name varchar(45),
age int
);
select id,name,age into #cust_temp from customer;
select * from #cust_temp;
drop table #cust_temp;

-- If - Else Condition
declare @address varchar(45)
Begin
	select @address= address from supplier where address = 'Raipur';
	if @address = 'Raipur'
	begin
	
		 PRINT 'Great! The address of all user id raipur';
		 PRINT @address;
	end
	else
		print 'False';
end;

-- Case condition
SELECT 
    CASE 
        WHEN ADDRESS = 'Raipur' THEN 'The City Is Raipur'
        WHEN ADDRESS LIKE '%%' THEN 'The city is not Raipur'
        ELSE 'Not A City'
    END AS Add_Category
FROM 
    supplier;


-- Cursor 
SET NOCOUNT ON;
DECLARE @EMP_ID INT;
DECLARE @EMP_NAME NVARCHAR(MAX);
DECLARE @Gmail NVARCHAR(MAX);

DECLARE EMP_CURSOR CURSOR
    LOCAL FORWARD_ONLY FOR
    SELECT id,name,gmail FROM supplier;
OPEN EMP_CURSOR;
FETCH NEXT FROM EMP_CURSOR INTO @EMP_ID, @EMP_NAME,@Gmail;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'EMP_ID : ' + Cast( @EMP_ID as varchar) + ',  EMP_NAME : ' + @EMP_NAME + ',  EMP_GMAIL : ' + cast( @Gmail as varchar) + ', Fetch_Status : ' +cast(@@fetch_status as varchar) ;
    FETCH NEXT FROM EMP_CURSOR INTO @EMP_ID, @EMP_NAME, @Gmail;
END;


CLOSE EMP_CURSOR;
DEALLOCATE EMP_CURSOR;

-- Scroll Cursor

DECLARE @ID INT;
DECLARE @NAME NVARCHAR(MAX);
DECLARE @Gmail NVARCHAR(MAX);

DECLARE EMP_CURSOR CURSOR
    LOCAL SCROLL FOR
    SELECT id,name,gmail FROM supplier;
OPEN EMP_CURSOR;

FETCH next FROM EMP_CURSOR into @ID,@NAME,@Gmail;
while @@FETCH_STATUS = 0
BEGIN
	print 'SUPPLIER ID : ' + cast(@ID as varchar);
	print 'SUPPLIER NAME : ' + cast(@NAME as varchar);
	print 'SUPPLIER G-MAIL : ' + cast (@Gmail as varchar);
	print '------------------------------------------------';
	FETCH next FROM EMP_CURSOR into @ID,@NAME,@Gmail;
END;

FETCH FIRST FROM EMP_CURSOR;
FETCH LAST FROM EMP_CURSOR;
CLOSE EMP_CURSOR;
DEALLOCATE EMP_CURSOR;

-- Magic Table 
create table Employee (id int,name varchar(45));
SELECT * FROM Employee;

--Magic TABLE FOR INSERT
create trigger insertEmployee on Employee
after INSERT
AS	
BEGIN
	select * from inserted
END


insert into Employee (id,name) VALUES(104,'Akki');
select * from Employee;

--Magic TABLE FOR DELETE
create trigger deleteEmployee on Employee
after delete
AS	
BEGIN
	select * from deleted
END


delete from Employee where id =104;
select * from Employee;

--Magic TABLE FOR UPDATE
create trigger updateEmployee on Employee
after update
AS	
BEGIN
	select * from deleted
	select * from inserted
END


update employee set address='raipur' where id = 100;
select * from Employee;


--create trigger to add column value automatically.......
alter table Employee add  address varchar(45);

create trigger ins_sup on EMPLOYEE
instead of insert 
AS
BEGIN
	declare @id int ,@name varchar(45)
    SELECT @id = inserted.id from inserted
	select @name = inserted.name from inserted

    insert into Employee VALUES(@id,@name,'Insert')
END
begin transaction;
insert into Employee (id,name) values (100,'Akshat');
commit transaction
rollback transaction;
select * from Employee;

-- CHART
SELECT name,
       AVG(age) AS Avgage,
       REPLICATE('_', AVG(age)) AS Graph
FROM customer
GROUP BY name;
GO

-- xml generete file
select id,name,address from employee for xml path('');


-------------------------------------------------Nirmal Database-------------------------------------------
CREATE TABLE User_nirmal (
id int identity(1,1) primary key,
name varchar(15),
email varchar(20),
password varchar(15),
role varchar(15) check( role in('Admin','Customer')),
contactnumber int,
);

create table Restaurant_nirmal(
r_id int identity(1,1) primary key,
id int foreign key references User_nirmal(id),
name varchar(15),
address varchar(30),
phone int,
description varchar(10),

);

create table menu_nirmal(
id int identity(1,1) primary key,
r_id int foreign key references Restaurant_nirmal(r_id)
);

create table menu_item_nirmal(
mid int identity(1,1) primary key,
id int foreign key references menu_nirmal(id),
name varchar(20),
description varchar(20),
price int
);

select * from User_nirmal;
select * from Restaurant_nirmal;
select * from menu_nirmal;
select * from menu_item_nirmal;

-- Insert 20 records into User_nirmal table
INSERT INTO User_nirmal (name, email, password, role, contactnumber) 
VALUES 
    ('User1', 'user1@example.com', 'password1', 'Admin', 1234567890),
    ('User2', 'user2@example.com', 'password2', 'Customer', 1234567891),
    ('User3', 'user3@example.com', 'password3', 'Admin', 1234567892),
    ('User4', 'user4@example.com', 'password4', 'Customer', 1234567893),
    ('User5', 'user5@example.com', 'password5', 'Admin', 1234567894),
    ('User6', 'user6@example.com', 'password6', 'Customer', 1234567895),
    ('User7', 'user7@example.com', 'password7', 'Admin', 1234567896),
    ('User8', 'user8@example.com', 'password8', 'Customer', 1234567897),
    ('User9', 'user9@example.com', 'password9', 'Admin', 1234567898),
    ('User10', 'user10@example.com', 'password10', 'Customer', 1234567899),
    ('User11', 'user11@example.com', 'password11', 'Admin', 1234567800),
    ('User12', 'user12@example.com', 'password12', 'Customer', 1234567801),
    ('User13', 'user13@example.com', 'password13', 'Admin', 1234567802),
    ('User14', 'user14@example.com', 'password14', 'Customer', 1234567803),
    ('User15', 'user15@example.com', 'password15', 'Admin', 1234567804),
    ('User16', 'user16@example.com', 'password16', 'Customer', 1234567805),
    ('User17', 'user17@example.com', 'password17', 'Admin', 1234567806),
    ('User18', 'user18@example.com', 'password18', 'Customer', 1234567807),
    ('User19', 'user19@example.com', 'password19', 'Admin', 1234567808),
    ('User20', 'user20@example.com', 'password20', 'Customer', 1234567809);

-- Insert 20 records into Restaurant_nirmal table
INSERT INTO Restaurant_nirmal (id, name, address, phone, description) 
VALUES 
    (1, 'Restaurant1', 'Address1', 1234567890, 'Desc1'),
    (2, 'Restaurant2', 'Address2', 1234567891, 'Desc2'),
    (3, 'Restaurant3', 'Address3', 1234567892, 'Desc3'),
    (4, 'Restaurant4', 'Address4', 1234567893, 'Desc4'),
    (5, 'Restaurant5', 'Address5', 1234567894, 'Desc5'),
    (6, 'Restaurant6', 'Address6', 1234567895, 'Desc6'),
    (7, 'Restaurant7', 'Address7', 1234567896, 'Desc7'),
    (8, 'Restaurant8', 'Address8', 1234567897, 'Desc8'),
    (9, 'Restaurant9', 'Address9', 1234567898, 'Desc9'),
    (10, 'Restaurant10', 'Address10', 1234567899, 'Desc10'),
    (11, 'Restaurant11', 'Address11', 1234567800, 'Desc11'),
    (12, 'Restaurant12', 'Address12', 1234567801, 'Desc12'),
    (13, 'Restaurant13', 'Address13', 1234567802, 'Desc13'),
    (14, 'Restaurant14', 'Address14', 1234567803, 'Desc14'),
    (15, 'Restaurant15', 'Address15', 1234567804, 'Desc15'),
    (16, 'Restaurant16', 'Address16', 1234567805, 'Desc16'),
    (17, 'Restaurant17', 'Address17', 1234567806, 'Desc17'),
    (18, 'Restaurant18', 'Address18', 1234567807, 'Desc18'),
    (19, 'Restaurant19', 'Address19', 1234567808, 'Desc19'),
    (20, 'Restaurant20', 'Address20', 1234567809, 'Desc20');

-- Insert 20 records into menu_nirmal table
INSERT INTO menu_nirmal (r_id) 
VALUES 
    (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
    (11), (12), (13), (14), (15), (16), (17), (18), (19), (20);

-- Insert 20 records into menu_item_nirmal table
INSERT INTO menu_item_nirmal (id, name, description, price) 
VALUES 
    (1, 'Item1', 'Description1', 10),
    (2, 'Item2', 'Description2', 20),
    (3, 'Item3', 'Description3', 30),
    (4, 'Item4', 'Description4', 40),
    (5, 'Item5', 'Description5', 50),
    (6, 'Item6', 'Description6', 60),
    (7, 'Item7', 'Description7', 70),
    (8, 'Item8', 'Description8', 80),
    (9, 'Item9', 'Description9', 90),
    (10, 'Item10', 'Description10', 100),
    (11, 'Item11', 'Description11', 110),
    (12, 'Item12', 'Description12', 120),
    (13, 'Item13', 'Description13', 130),
    (14, 'Item14', 'Description14', 140),
    (15, 'Item15', 'Description15', 150),
    (16, 'Item16', 'Description16', 160),
    (17, 'Item17', 'Description17', 170),
    (18, 'Item18', 'Description18', 180),
    (19, 'Item19', 'Description19', 190),
    (20, 'Item20', 'Description20', 200);
