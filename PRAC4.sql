--Lab-4
--Part – A :
--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION fn_hello_world()
RETURNS VARCHAR(20)
AS
BEGIN 
	RETURN 'HELLO WORLD';
END
SELECT dbo.fn_hello_world();

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION fn_addition(@NUM1 INT,@NUM2 INT)
RETURNS INT
AS
BEGIN 
	RETURN @NUM1+@NUM2;
END
SELECT dbo.fn_addition(5,6);

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION fn_oddoreven(@NUM INT)
RETURNS VARCHAR(50)
AS
BEGIN 
	DECLARE @RESULT VARCHAR(10)
	IF @NUM%2=0
		SET @RESULT='EVEN'
	ELSE
		SET @RESULT='ODD'
	RETURN @RESULT
END
SELECT dbo.fn_oddoreven(6);

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION fn_person_firstnamewithb()
RETURNS TABLE
AS
	RETURN(SELECT * FROM PERSON WHERE FIRSTNAME LIKE 'B%');
SELECT * FROM fn_person_firstnamewithb();

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION fn_person_uniquename()
RETURNS TABLE
AS
	RETURN(SELECT DISTINCT FIRSTNAME FROM PERSON );
SELECT * FROM fn_person_uniquename();

--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION fn_print1ton(@NUM INT)
RETURNS VARCHAR(20)
AS
BEGIN 
	DECLARE @I INT=1
	DECLARE @N VARCHAR(100)='';
	WHILE @I<=@NUM
		BEGIN
			SET @N=@N+CAST(@I AS VARCHAR)+' '
			SET @I=@I+1
		END
	RETURN @N
END
SELECT dbo.fn_print1ton(4);

--7. Write a function to find the factorial of a given integer.CREATE OR ALTER FUNCTION fn_factorial(@NUM INT)
RETURNS INT
AS
BEGIN 
	DECLARE @SUM INT=1
	DECLARE @I INT=1
	WHILE @I<=@NUM
		BEGIN
			SET @SUM=@SUM*@I
			SET @I=@I+1
		END
	RETURN @SUM
END
SELECT dbo.fn_factorial(5);--Part – B :
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION fn_comparetwonumbers(@NUM1 INT,@NUM2 INT)
	RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @RESULT  VARCHAR(50)
	SET @RESULT=CASE
		WHEN @NUM1>@NUM2 THEN 'NUM1 IS GREATER THAN NUM2'
		WHEN @NUM1<@NUM2 THEN 'NUM2 IS GREATER THAN NUM1'
		ELSE 'NUM1 AND NUM2 ARE EQUAL'
		END
	RETURN @RESULT
END
SELECT dbo.fn_comparetwonumbers(4,5);

--9. Write a function to print the sum of even numbers between 1 to 20.
CREATE OR ALTER FUNCTION fn_sumofevennumbers()
RETURNS INT
AS
BEGIN
	DECLARE @RESULT INT=0;
	DECLARE @I INT=1;
	WHILE @I<=20
		BEGIN
			IF @I%2=0
				SET @RESULT=@RESULT+@I;
			SET @I=@I+1;
		END
	RETURN @RESULT
END
SELECT dbo.fn_sumofevennumbers();

--10. Write a function that checks if a given string is a palindrome
CREATE OR ALTER FUNCTION fn_palindrome(@STRING VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @REVERSE VARCHAR(100)=REVERSE(@STRING);
	DECLARE @RESULT VARCHAR(100)
	IF @STRING=@REVERSE
		SET @RESULT='PALINDROME';
	ELSE 
		SET @RESULT='NOT PALINDROME';
	RETURN @RESULT
END
SELECT dbo.fn_palindrome('DAD');
