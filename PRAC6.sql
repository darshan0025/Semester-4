--Lab-6 :
-- Create the Products table
CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);
-- Insert data into the Products table
INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);

--Part - A :
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
DECLARE @Product_id INT,@Product_Name VARCHAR(20),@Price DECIMAL(10, 2)

DECLARE Product_Cursor cursor
for
		select * from Products
open Product_Cursor
fetch next from Product_Cursor
	into @Product_id, @Product_Name, @Price

while @@FETCH_STATUS = 0
	begin
		print cast(@Product_id as varchar(20))+'-'+@Product_Name+'-'+cast(@Price as varchar(20))
		fetch next from Product_Cursor
		into @Product_id, @Product_Name, @Price
	end
close Product_Cursor
deallocate Product_Cursor

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
--(Example: 1_Smartphone)
DECLARE @Product_id INT,@Product_Name VARCHAR(20)

DECLARE Product_Cursor_Fetch cursor
for
		select Product_id,Product_Name from Products
open Product_Cursor_Fetch
fetch next from Product_Cursor_Fetch
	into @Product_id, @Product_Name

while @@FETCH_STATUS = 0
	begin
		print cast(@Product_id as varchar(20))+'_'+@Product_Name
		fetch next from Product_Cursor_Fetch
		into @Product_id, @Product_Name
	end
close Product_Cursor_Fetch
deallocate Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
DECLARE @Product_id INT,@Product_Name VARCHAR(20),@Price DECIMAL(10, 2)

DECLARE Product_Cursor_Find cursor
for
		select * from Products where Price>30000
open Product_Cursor_Find
fetch next from Product_Cursor_Find
	into @Product_id, @Product_Name, @Price

while @@FETCH_STATUS = 0
	begin
		print cast(@Product_id as varchar(20))+'-'+@Product_Name+'-'+cast(@Price as varchar(20))
		fetch next from Product_Cursor_Find
		into @Product_id, @Product_Name, @Price
	end
close Product_Cursor_Find
deallocate Product_Cursor_Find

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.DECLARE @Product_id INT,@Product_Name VARCHAR(20),@Price DECIMAL(10, 2)

DECLARE Product_CursorDelete cursor
for
		select * from Products
open Product_CursorDelete
fetch next from Product_CursorDelete
	into @Product_id, @Product_Name, @Price

while @@FETCH_STATUS = 0
	begin
		delete from Products
		fetch next from Product_CursorDelete
		into @Product_id, @Product_Name, @Price
	end
close Product_CursorDelete
deallocate Product_CursorDelete
--Part – B :
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases
--the price by 10%.
DECLARE @Product_id INT,@Product_Name VARCHAR(20),@Price DECIMAL(10, 2)

DECLARE Product_CursorUpdate cursor
for
		select * from Products
open Product_CursorUpdate
fetch next from Product_CursorUpdate
	into @Product_id, @Product_Name, @Price

while @@FETCH_STATUS = 0
	begin
		Update products
		set Price=Price + Price*0.1
		fetch next from Product_CursorUpdate
		into @Product_id, @Product_Name, @Price
	end
close Product_CursorUpdate
deallocate Product_CursorUpdate

--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
DECLARE @Product_id INT,@Product_Name VARCHAR(20),@Price DECIMAL(10, 2)

DECLARE Product_Cursor_Round_Price cursor
for
		select * from Products
open Product_Cursor_Round_Price
fetch next from Product_Cursor_Round_Price
	into @Product_id, @Product_Name, @Price

while @@FETCH_STATUS = 0
	begin
		Update products
		set Price=round(Price,0)
		fetch next from Product_Cursor_Round_Price
		into @Product_id, @Product_Name, @Price
	end
close Product_Cursor_Round_Price
deallocate Product_Cursor_Round_Price