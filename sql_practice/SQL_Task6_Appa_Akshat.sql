use  Akshat_Task1;
-- Create the Customers table

CREATE TABLE Customers_Task6 (

    CustomerID INT IDENTITY(1,1) PRIMARY KEY,

    CustomerName VARCHAR(50),

    CustomerAddress VARCHAR(100)

);
 
-- Create the Products table

CREATE TABLE Products_Task6 (

    ProductID INT IDENTITY(1,1) PRIMARY KEY,

    ProductName VARCHAR(50),

    ProductPrice DECIMAL(10,2)

);
 
-- Create the Orders table

CREATE TABLE Orders_Task6 (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATE,
    OrderQuantity INT,
    OrderTotal DECIMAL(10,2),
    CustomerID INT FOREIGN KEY REFERENCES Customers_Task6(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products_Task6(ProductID),
    PaymentTotal DECIMAL(10,2) -- New column
);

 
-- Insert 20 records into the Customers table

INSERT INTO Customers_Task6 (CustomerName, CustomerAddress)
VALUES
('Ramesh Kumar', '123 ABC Street'),
('Sunita Sharma', '456 XYZ Road'),
('Ajay Singh', '789 PQR Avenue'),
('Priya Gupta', '456 LMN Lane'),
('Amit Patel', '789 DEF Boulevard'),
('Anjali Mishra', '123 GHI Crescent'),
('Rajesh Verma', '456 JKL Drive'),
('Preeti Tiwari', '789 UVW Place'),
('Vijay Singh', '123 OPQ Road'),
('Sneha Jain', '456 RST Avenue'),
('Neha Reddy', '789 XYZ Street'),
('Sanjay Kumar', '123 MNO Lane'),
('Anita Devi', '456 ABC Boulevard'),
('Rahul Sharma', '789 PQR Drive'),
('Aarti Gupta', '123 LMN Place'),
('Arun Singh', '456 JKL Road'),
('Deepak Patel', '789 GHI Avenue'),
('Pooja Verma', '123 UVW Drive'),
('Vikas Sharma', '456 OPQ Boulevard'),
('Riya Mishra', '789 RST Crescent');

-- Insert 20 records into the Products table

-- Insert 20 records into the Products_Task6 table
INSERT INTO Products_Task6 (ProductName, ProductPrice)
VALUES
('Masala Tea', 20.99),
('Saree', 799.99),
('Kurta', 499.99),
('Palak Paneer', 8.99),
('Mango Lassi', 5.99),
('Chapati Maker', 299.99),
('Kesar Milk', 12.99),
('Tandoori Chicken', 15.99),
('Biryani Masala', 4.99),
('Gulab Jamun', 7.99),
('Kaju Katli', 9.99),
('Samosa', 2.99),
('Pani Puri', 3.99),
('Butter Chicken', 13.99),
('Aloo Paratha', 6.99),
('Rasgulla', 6.99),
('Pakora', 4.99),
('Gajar Halwa', 8.99),
('Jalebi', 7.99),
('Rajma Chawal', 10.99);

-- Insert 20 records into the Orders table

-- Insert 20 records into the Orders_Task6 table
INSERT INTO Orders_Task6 (OrderDate, OrderQuantity, OrderTotal, CustomerID, ProductID, PaymentTotal)
VALUES
('2024-03-21', 2, 25.98, 1, 1, 10.00),
('2024-03-22', 1, 499.99, 2, 2, 0.00),
('2024-03-23', 3, 999.97, 3, 3, 25.00),
('2024-03-24', 1, 8.99, 4, 4, 0.00),
('2024-03-25', 2, 11.98, 5, 5, 15.00),
('2024-03-26', 1, 299.99, 6, 6, 0.00),
('2024-03-27', 1, 12.99, 7, 7, 20.00),
('2024-03-28', 1, 15.99, 8, 8, 0.00),
('2024-03-29', 2, 9.98, 9, 9, 0.00),
('2024-03-30', 3, 23.97, 10, 10, 30.00),
('2024-03-31', 4, 11.96, 11, 11, 0.00),
('2024-04-01', 2, 7.98, 12, 12, 0.00),
('2024-04-02', 3, 11.97, 13, 13, 0.00),
('2024-04-03', 1, 13.99, 14, 14, 0.00),
('2024-04-04', 2, 13.98, 15, 15, 0.00),
('2024-04-05', 1, 6.99, 16, 16, 0.00),
('2024-04-06', 2, 9.98, 17, 17, 0.00),
('2024-04-07', 1, 8.99, 18, 18, 0.00),
('2024-04-08', 3, 21.97, 19, 19, 0.00),
('2024-04-09', 1, 10.99, 1, 20, 0.00);


select * from customers_task6;
select * from products_task6;
select * from orders_task6;


-- 1. Create a stored procedure called "get_customers" that returns all customers from the "customers" table.
create procedure get_customers
as
begin
    select * from customers_task6
end;

exec get_customers;

-- 2. Create a stored procedure called "get_orders" that returns all orders from the "orders" table.
create procedure get_orders
as
begin
    select * from orders_task6
end;

exec get_orders;

-- 3. Create a stored procedure called "get_order_details" that accepts an order ID as a parameter and returns the details of that order (i.e., the products and quantities).
create procedure get_order_details  @id int
as
begin
    select p.ProductID,p.ProductName,o.OrderQuantity from orders_task6 as o inner join products_task6 as p 
	on o.ProductID = p.ProductID
	where o.orderid = @id
end;

exec get_order_details @id = 10;

-- 4.Create a stored procedure called "get_customer_orders" that accepts a customer ID as a parameter and returns all orders for that customer.
--INSERT INTO Orders_Task6 (OrderDate, OrderQuantity, OrderTotal, CustomerID, ProductID,PaymentTotal)
--VALUES
--('2024-03-01', 2, 35.98, 10, 1,10.00); 
create procedure get_customer_orders  @id int
as
begin
    select c.customername,o.* from orders_task6 as o inner join customers_task6 as c 
	on o.CustomerID = c.CustomerID
	where o.CustomerID = @id
end;

exec get_customer_orders @id = 10;

-- 5.Create a stored procedure called "get_order_total" that accepts an order ID as a parameter and returns the total amount of the order.
create procedure get_order_total  @id int
as
begin
    select ordertotal from orders_task6  where orderid = @id
end;

exec get_order_total @id = 10;

-- 6.Create a stored procedure called "get_product_list" that returns a list of all products from the "products" table.
create procedure get_product_list
as
begin
    select * from products_task6
end;

exec get_product_list;

-- 7.Create a stored procedure called "get_product_info" that accepts a product ID as a parameter and returns the details of that product.
create procedure get_product_info  @id int
as
begin
     select * from products_task6 where productid = @id
end;

exec get_product_info @id = 10;

-- 8.Create a stored procedure called "get_customer_info" that accepts a customer ID as a parameter and returns the details of that customer.
create procedure get_customer_info  @id int
as
begin
     select * from customers_task6 where customerid = @id
end;

exec get_customer_info @id = 15;

-- 9.Create a stored procedure called "update_customer_info" that accepts a customer ID and new information as parameters and updates the customer's information in the "customers" table.
create procedure update_customer_info  @id int,@cust_name varchar(30)
as
begin
     update Customers_Task6 set CustomerName=@cust_name where CustomerID=@id
end;

exec update_customer_info @id = 15,@cust_name='Akshat';

-- 10.Create a stored procedure called "delete_customer" that accepts a customer ID as a parameter and deletes that customer from the "customers" table.
create procedure delete_customer  @id int
as
begin
	delete from Orders_Task6 from Orders_Task6 where customerid = @id
     delete from Customers_Task6 where CustomerID=@id
end;

exec delete_customer @id = 20;

-- 11.Create a stored procedure called "get_order_count" that accepts a customer ID as a parameter and returns the number of orders for that customer.
create procedure get_order_count  @id int
as
begin
	select count(orderid) as [Total Orders Placed By Customer] from Orders_Task6 where CustomerID= @id
end;

exec get_order_count @id = 10;

-- 12.Create a stored procedure called "get_customer_balance" that accepts a customer ID as a parameter and returns the customer's balance (i.e., the total amount of all orders minus the total amount of all payments).
alter procedure get_customer_balance  @id int
as
begin
	select sum(ordertotal - paymenttotal) as Customer_Remaining_Balance from Orders_Task6 where CustomerID= @id
	
end;

exec get_customer_balance @id = 1;

-- 13.Create a stored procedure called "get_customer_payments" that accepts a customer ID as a parameter and returns all payments made by that customer.
create procedure get_customer_payments  @id int
as
begin
	select paymenttotal as Customer_All_Payments from Orders_Task6 where CustomerID= @id

end;

exec get_customer_payments @id = 1;

-- 14.Create a stored procedure called "add_customer" that accepts a name and address as parameters and adds a new customer to the "customers" table.
create procedure add_customer @name varchar(25),@add varchar(45)
as
begin
    insert into Customers_Task6 values (@name,@add)
end;

exec add_customer @name='Akshat',@add = 'Ahmedabad';

-- 15.Create a stored procedure called "get_top_products" that returns the top 10 products based on sales volume.
create procedure get_top_products 
as
begin
    select top 10 p.productid ,p.productName,p.productprice,sum(o.orderquantity) from orders_task6 as o inner join
	products_task6 as p on p.productid = o.ProductID
	group by p.productid ,p.productName,p.productprice
	order by sum(o.orderquantity) desc
end;

exec get_top_products;

-- 16.Create a stored procedure called "get_product_sales" that accepts a product ID as a parameter and returns the total sales volume for that product.
create procedure get_product_sales @pid int
as
begin
    select top 10 sum(o.orderquantity) as [Total Quantity of products] from orders_task6 as o inner join
	products_task6 as p on p.productid = o.ProductID
	where p.productid=@pid
	group by p.productid ,p.productName,p.productprice
	order by sum(o.orderquantity) desc
end;

exec get_product_sales @pid = 11;

-- 17.Create a stored procedure called "get_customer_orders_by_date" that accepts a customer ID and date range as parameters and returns all orders for that customer within the specified date range.
create procedure get_customer_orders_by_date  @id int,@sdate date,@edate date
as
begin
     select c.*,o.* from customers_task6 as c inner join orders_task6 as o on c.CustomerID = o.CustomerID
	 where c.CustomerID=@id and o.OrderDate between @sdate and @edate
end;
select * from orders_task6;
exec get_customer_orders_by_date @id = 1,@sdate = '2024-03-21',@edate='2024-04-09';

-- 18.Create a stored procedure called "get_order_details_by_date" that accepts an order ID and date range as parameters and returns the details of that order within the specified date range.
create procedure get_order_details_by_date  @oid int,@sdate date,@edate date
as
begin
     select orders_task6.* from orders_task6 where orderid=@oid and  OrderDate between @sdate and @edate
end;

exec get_order_details_by_date @oid = 31,@sdate = '2024-03-21',@edate='2024-04-09';

-- 19.Create a stored procedure called "get_product_sales_by_date" that accepts a product ID and date range as parameters and returns the total sales volume for that product within the specified date range.
create procedure get_product_sales_by_date  @pid int,@sdate date,@edate date
as
begin
     select sum(o.orderquantity) as [Total Sales] from orders_task6 as o inner join Products_Task6 as p
	 on o.ProductID = p.ProductID
	 where p.productid=@pid and  o.OrderDate between @sdate and @edate
end;

exec get_product_sales_by_date @pid = 1,@sdate = '2024-03-21',@edate='2024-04-09';

-- 20.Create a stored procedure called "get_customer_balance_by_date" that accepts a customer ID and date range as parameters and returns the customer's balance within the specified date range.
create procedure get_customer_balance_by_date  @cid int,@sdate date,@edate date
as
begin
     select sum(ordertotal - paymenttotal) as [customer's balance]  from orders_task6 as o inner join customers_Task6 as c
	 on o.customerid = c.customerid
	 where c.customerid=@cid and  o.OrderDate between @sdate and @edate
end;

exec get_customer_balance_by_date @cid = 1,@sdate = '2024-03-21',@edate='2024-04-09';
 
-- 21.Create a stored procedure called "add_order" that accepts a customer ID, order date, and total amount as parameters and adds a new order to the "orders" table.
create procedure add_order  @cid int,@sdate date,@tamount int
as
begin
     insert into orders_task6 (customerid,orderdate,ordertotal) values (@cid,@sdate,@tamount)
end;

exec add_order @cid = 1,@sdate = '2024-03-21',@tamount = 20.99;

-- 22.Create a stored procedure called "update_order_total" that accepts an order ID and a new total amount as parameters and updates the total amount of the order in the "orders" table.
create procedure update_order_total  @oid int,@tamount int
as
begin
     update orders_task6 set ordertotal = @tamount where orderid = @oid
end;

exec update_order_total @oid = 41,@tamount = 499.99;

-- 23.Create a stored procedure called "delete_order" that accepts an order ID as a parameter and deletes that order from the "orders" table.
create procedure delete_order  @oid int
as
begin
    delete from orders_task6 where orderid = @oid;
end;

exec delete_order @oid = 41;
