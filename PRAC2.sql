-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);
--Part ? A
--1. Department, Designation & Person Table?s INSERT, UPDATE & DELETE Procedures.
CREATE PROCEDURE PR_Department_Insert
	@DepartmentID INT,
	@DepartmentName VARCHAR(100)
AS 
BEGIN
	INSERT INTO Department
	(DepartmentID,DepartmentName)
	VALUES
	(@DepartmentID,@DepartmentName)
END
EXEC PR_Department_Insert 1,'Admin'
EXEC PR_Department_Insert 2,'IT'
EXEC PR_Department_Insert 3,'HR'
EXEC PR_Department_Insert 4,'Account'

CREATE PROCEDURE PR_Designation_Insert
	@DesignationID INT,
	@DesignationName VARCHAR(100)
AS 
BEGIN
	INSERT INTO Designation
	(DesignationID,DesignationName)
	VALUES
	(@DesignationID,@DesignationName)
END
EXEC PR_Designation_Insert 11,'Jobber'
EXEC PR_Designation_Insert 12,'Welder'
EXEC PR_Designation_Insert 13,'Clerk'
EXEC PR_Designation_Insert 14,'Manager'
EXEC PR_Designation_Insert 15,'CEO'

SELECT * FROM Designation

CREATE PROCEDURE PR_Person_Insert
	@FirstName VARCHAR(100),
	@LastName VARCHAR(100),
	@Salary Decimal (8,2) ,
	@JoiningDate Datetime,
	@DepartmentID INT,
	@DesignationID INT
AS 
BEGIN
	INSERT INTO Person
	(FirstName,LastName,Salary,JoiningDate,DepartmentID,DesignationID)
	VALUES
	(@FirstName,@LastName,@Salary,@JoiningDate,@DepartmentID,@DesignationID)
END
EXEC PR_Person_Insert 'Rahul','Anshu',56000,'1990-01-01',1,12
EXEC PR_Person_Insert 'Hardik','Hinsu',18000,'1990-09-25',2,11
EXEC PR_Person_Insert 'Bhavin','Kamani',25000,'1991-05-14',NULL,11
EXEC PR_Person_Insert 'Bhoomi','Patel',39000,'2014-02-20',1,13
EXEC PR_Person_Insert 'Rohit','Rajgor',17000,'1990-07-23',2,15
EXEC PR_Person_Insert 'Priya','Mehta',25000,'1990-10-18',1,NULL
EXEC PR_Person_Insert 'Neha','Trivedi',18000,'2014-02-20',3,15

SELECT * FROM Person
--DELETE
CREATE PROCEDURE PR_Department_Delete
	@DepartmentID INT,
AS 
BEGIN
	Delete From Department
	WHERE DepartmentID = @DepartmentID
END
EXEC PR_Department_Delete 1

CREATE OR ALTER PROCEDURE PR_Designation_delete
     @DesignationID INT,
	 @DesignationName VARCHAR(500)
AS 
BEGIN
     DELETE FROM Designation
    WHERE DesignationID = @DesignationID;

END


---------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_Person_DELETE
     @PersonID INT,
	 @FirstName Varchar (100),
	 @LastName Varchar (100),
	 @Salary Decimal (8,2), 
	 @JoiningDate Datetime, 
	 @DepartmentID Int,
	 @DesignationID Int
AS 
BEGIN
    DELETE FROM Person
    WHERE PersonID = @PersonID;
END


--UPDATE
CREATE PROCEDURE PR_DEPARTMENT_UPDATE
    @DepartmentID INT,        
    @DepartmentName VARCHAR(255) 
AS
BEGIN
    UPDATE Department
    SET DepartmentName = @DepartmentName
    WHERE DepartmentID = @DepartmentID;

 END

 EXEC PR_DEPARTMENT_UPDATE  @DepartmentID =1 ,@DepartmentName ='dk';
 select * from Department

 ---------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_Designation_UPDATE
     @DesignationID INT,
	 @DesignationName VARCHAR(500)
AS 
BEGIN
     UPDATE Designation
    SET @DesignationName = @DesignationName
    WHERE DesignationID = @DesignationID;

END

EXEC PR_Designation_UPDATE  @DesignationID = 13,@DesignationName = 'kkk';
SELECT * FROM Designation


---------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_Person_UPDATE
     @PersonID INT,
	 @FirstName Varchar (100),
	 @LastName Varchar (100),
	 @Salary Decimal (8,2), 
	 @JoiningDate Datetime, 
	 @DepartmentID Int,
	 @DesignationID Int
AS 
BEGIN
     UPDATE Person
    SET
	 FirstName =@FirstName,
        LastName = @LastName,
        Salary = @Salary,
        JoiningDate = @JoiningDate,
        DepartmentID = @DepartmentID,
        DesignationID = @DesignationID
    WHERE PersonID = @PersonID;
END


---------------------------------------------------------------------------
CREATE PROCEDURE PR_DEPARTMENT_DE
    @DepartmentID INT       
AS
BEGIN
	DELETE FROM Department
    WHERE DepartmentID = @DepartmentID;
	END
	EXEC PR_DEPARTMENT_DE 1

CREATE OR ALTER PROCEDURE PR_Department_SELECTBYPRIMARYKEY
    @DepartmentID INT 
	
AS 
BEGIN
   SELECT * FROM Department
   WHERE DepartmentID=@DepartmentID
END

EXEC PR_Department_SELECTBYPRIMARYKEY 2

CREATE OR ALTER PROCEDURE PR_Designation_SELECTBYPRIMARYKEY
    @DesignationID INT 
	
AS 
BEGIN
   SELECT * FROM Designation
   WHERE DesignationID=@DesignationID
END
EXEC PR_Designation_SELECTBYPRIMARYKEY 13

CREATE OR ALTER PROCEDURE PR_Person_SELECTBYPRIMARYKEY
    @PersonID INT 
	
AS 
BEGIN
   SELECT * FROM Person
   WHERE PersonID=@PersonID
END
EXEC PR_Person_SELECTBYPRIMARYKEY 106

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take 
--columns on select list)
CREATE OR ALTER PROCEDURE PR_Person_foreignKEY
AS 
BEGIN
   SELECT * FROM Person JOIN Department
   ON Department.DepartmentID=PERSON.DepartmentID
   JOIN Designation
   ON Designation.DesignationID=PERSON.DesignationID
END

EXEC PR_Person_foreignKEY

--4. Create a Procedure that shows details of the first 3 persons.
CREATE OR ALTER Procedure PR_Person_TOP3
AS 
BEGIN 
SELECT TOP 3 * FROM person JOIN Department
ON person.DEPARTMENTID=Department.DepartmentID
JOIN Designation
ON person.DesignationID=Designation.DesignationID
END

EXEC PR_Person_TOP3