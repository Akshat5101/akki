create database Akshat_Task_Exam;

use Akshat;
create table Category_Master (
Category_id int primary key  identity(1,1),
Category_Name varchar(30) not null,
Category_Description varchar(30),
Is_Active char(2) not null,
Created_Date date not null,
)

create table Item_Master (
Itemid int primary key identity(1,1),
Category_id int foreign key references Category_Master(Category_id),
Item_Name varchar(30) not null,
Item_Description varchar(30),
Price int not null,
GST decimal(20,2) not null,
Is_Active char(2) not null,
Created_Date date not null,
)

create table Coupon_Master(
Couponed_id int primary key identity(1,1),
Coupon_Text varchar(30) not null,
Discount_Percentage decimal(20,2) not null,
Expiry_Date date not null
)

create table Order_Master (
Ordered int primary key identity(1001,1),
Delivery_Charge int not null,
Coupon_Amount decimal(20,2),
Subtotal int not null,
Total int not null,
Order_Date date not null,
)

create table Order_Details(
Order_Details_Id int primary key identity(1001,1),
Ordered int foreign key references Order_Master(Ordered),
Itemid int foreign key references Item_Master(Itemid) ,
Quantity int not null ,
Total int not null,
)

-- 1 : Stored Procedure to Add data in Category , Item , Coupon table 
--Insert into Category_Master (Category_Name,Category_Description,Is_Active,Created_Date) values ('pizza','Cheeze Pizza','yes','2023-12-12');
create procedure AddCategory 
@cname varchar(30),@cdesc varchar(30),@active char(2),@getdate date
AS
BEGIN 
	Insert into Category_Master (Category_Name,Category_Description,Is_Active,Created_Date) values (@cname,@cdesc,@active,@getdate)
END;
select * from Category_Master;
EXEC AddCategory @cname = 'Pasta',@cdesc = ' Pasta',@active = 'n' ,@getdate = '2023-4-30';

create procedure AddItem 
@cid int,@itemname varchar(30),@itemdesc varchar(30),@price int ,@gst decimal(20,2),@active char(2),@getdate date
AS
BEGIN 
	Insert into Item_Master (Category_id,Item_Name,Item_Description,Price,GST,Is_Active,Created_Date) values (@cid,@itemname,@itemdesc,@price,@gst,@active,@getdate)
END;

EXEC AddItem @cid=2,@itemname='Dabeli',@itemdesc='oil Dabeli',@price=250,@gst=18,@active ='y',@getdate = '2024-4-10'

create procedure AddCoupon
@cou_text varchar(30),@discount decimal(20,2),@edate date
AS
BEGIN
	Insert Into Coupon_Master (Coupon_Text,Discount_Percentage,Expiry_Date) values (@cou_text,@discount,@edate);
END;

EXEC AddCoupon @cou_text='UPTO10',@discount=10,@edate='2024-10-10';

select * from Coupon_Master;

--- ANS

select * from Item_Master;

ALTER procedure InsertOrderDetailsRecord @id int ,@qty int ,@coupon int
AS
BEGIN
	declare @iid int, @quantity int, @couponid int
	set @iid = @id
	set @quantity = @qty 
	set @couponid = @coupon
	--print @iid
	--print @quantity
	--print  @couponid
	--1
	declare @Iis_Active char(2),@cid int ,@Cis_Active char(2)
	select @cid = Category_id, @Iis_Active = Is_Active from Item_Master where Itemid = @iid; 
	if @Iis_Active = 'n'
		print 'Item is not Available'
	else
		begin
		print 'Item is Active'
		-- 2 
		select @Cis_Active = c.Is_Active from Category_Master  as c join Item_Master as i on c.Category_id = i.Category_id where c.Category_id = @cid
		if @Cis_Active = 'n'
			print 'Category is not Available'
		else
			begin
			print 'Category is Available'
			declare @Total int,@SubTotal int
			select @Total = Price* @quantity  from Item_Master where Itemid = @iid
			print @Total
			if @Total >1000
				begin 
				set @SubTotal = 0
				end;
			else if @Total >500 
				begin
				set @SubTotal = 50
				end;
			else 
			begin 
				set @SubTotal = 80
			end;
			print @SubTotal
			end;
			DECLARE @Expiry_Date date,@currentDate  date 
			set @currentDate = GETDATE()
			
			select @Expiry_Date= Expiry_Date from Coupon_Master Where Couponed_id = @couponid;
			if @currentDate > @Expiry_Date
				begin
				print ' EXPIRE'
				end;
			else
				begin
				print 'Not EXPIRED'
				declare @SubTotalValue int
				declare @CouponAmount  int
				set @CouponAmount = (@Total + @SubTotal)/10
				set @SubTotalValue = ((@Total + @SubTotal) - ((@Total + @SubTotal)/10))
				--print @SubTotalValue
				insert into Order_Master (Delivery_Charge,Coupon_Amount,Subtotal,Total,Order_Date) values (@SubTotal,@CouponAmount,@Total,@SubTotalValue,@currentDate)
				declare @Oid int
				select @Oid = Ordered from Order_Master order by Ordered desc
				insert into Order_Details (Ordered,Itemid,Quantity,Total) values (@Oid,3,3,@SubTotalValue)

				select * from Order_Master
				select * from Order_Details
				end;
			end;
END;

exec InsertOrderDetailsRecord @id=3,@qty=4,@coupon= 4

