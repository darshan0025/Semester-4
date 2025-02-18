--Lab-7
-- Create the Customers table
CREATE TABLE Customers (
 Customer_id INT PRIMARY KEY,
 Customer_Name VARCHAR(250) NOT NULL,
 Email VARCHAR(50) UNIQUE
);
-- Create the Orders table
CREATE TABLE Orders (
 Order_id INT PRIMARY KEY,
 Customer_id INT,
 Order_date DATE NOT NULL,
 FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

--Part-A:
--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
BEGIN TRY
	DECLARE @NUM1 INT=10,@NUM2 INT=0,@RESULT DECIMAL(8,2)
	SET @RESULT=@NUM1/@NUM2
	PRINT @RESULT
END TRY
BEGIN CATCH
	PRINT 'Error occurs that is - Divide by zero error'
END CATCH

--2. Try to convert string to integer and handle the error using try…catch block.
BEGIN TRY
	DECLARE @S1 VARCHAR(50)='HELLO WORLD',@INT INT
	SET @INT=CAST(@S1 AS INT);
	PRINT @INT
END TRY
BEGIN CATCH
	PRINT 'ERROR:UNABLE TO CONVERT VARCHAR TO INT'
END CATCH

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle
--exception with all error functions if any one enters string value in numbers otherwise print result.
CREATE OR ALTER PROCEDURE ER_Sum
	@NUM1 VARCHAR(50),@NUM2 VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		DECLARE @A INT,@B INT,@SUM INT
		SET @A=CAST(@NUM1 AS INT)
		SET @B=CAST(@NUM2 AS INT)
		SET @SUM=@A+@B
		PRINT @SUM
	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED';
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(50));
		PRINT 'Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(50));
		PRINT 'State: ' + CAST(ERROR_STATE() AS VARCHAR(50));
	END CATCH
END

EXEC ER_Sum 5,3
EXEC ER_Sum 2,X

--4. Handle a Primary Key Violation while inserting data into customers table and print the error details
--such as the error message, error number, severity, and state.
BEGIN TRY
    INSERT INTO Customers (Customer_id, Customer_Name, Email) 
    VALUES (1, 'DARSH', 'darsh@GMAIL.COM');
END TRY
BEGIN CATCH
    PRINT 'PRIMARY KEY VIOLATION ERROR';
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(50));
    PRINT 'Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(50));
    PRINT 'State: ' + CAST(ERROR_STATE() AS VARCHAR(50));
END CATCH

--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws
--Error like no Customer_id is available in database.
CREATE PROCEDURE ER_CUSTOMERROR
	@CUSTOMER_ID INT
AS
BEGIN
	IF NOT EXISTS(SELECT Customer_id FROM Customers WHERE Customer_id=@CUSTOMER_ID)
	BEGIN
		THROW 51000, 'No Customer_id is available in the database.', 10;
	END
	ELSE
	BEGIN
		PRINT 'Customer_id EXISTS';
	END
END

EXEC ER_CUSTOMERROR 1
EXEC ER_CUSTOMERROR 2