--Lab - 5 :
-- Creating PersonInfo Table
CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);
-- Creating PersonLog Table
CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY(1,1),
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL,
);

--Part – A :
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display
--a message “Record is Affected.”
CREATE OR ALTER TRIGGER tr_DisplayMessage
ON PersonInfo
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    PRINT 'Record is Affected.'
END
INSERT INTO PersonInfo VALUES (3,'Darsh',350000,'2000-02-02','Morbi',18,'1990-02-02')

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that,
--log all operations performed on the person table into PersonLog.
CREATE OR ALTER TRIGGER tr_After_Insert
ON PersonInfo
AFTER INSERT
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	SELECT @PersonID = PersonID FROM inserted
	SELECT @PersonName = PersonName FROM inserted
	INSERT INTO PersonLog VALUES (@PersonID,@PersonName,'INSERT',GETDATE())
END

CREATE OR ALTER TRIGGER tr_After_Update
ON PersonInfo
AFTER UPDATE
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	SELECT @PersonID = PersonID FROM inserted
	SELECT @PersonName = PersonName FROM inserted
	INSERT INTO PersonLog VALUES (@PersonID,@PersonName,'UPDATE',GETDATE())
END

UPDATE PersonInfo
SET PersonName = 'Darshan'
Where PersonName = 'Darsh'

CREATE OR ALTER TRIGGER tr_After_Delete
ON PersonInfo
AFTER DELETE
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	SELECT @PersonID = PersonID FROM deleted
	SELECT @PersonName = PersonName FROM deleted
	INSERT INTO PersonLog VALUES (@PersonID,@PersonName,'DELETE',GETDATE())
END

DELETE FROM PersonLog 
WHERE PersonID = 1

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo
--table. For that, log all operations performed on the person table into PersonLog.
CREATE OR ALTER TRIGGER tr_InsteadLogOperations_INSERT
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	SELECT @PersonID = PersonID FROM inserted
	SELECT @PersonName = PersonName FROM inserted
	INSERT INTO PersonLog VALUES (@PersonID,@PersonName,'INSERT',GETDATE())
END

CREATE OR ALTER TRIGGER tr_InsteadLogOperations_UPDATE
ON PersonInfo
INSTEAD OF UPDATE
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	SELECT @PersonID = PersonID FROM inserted
	SELECT @PersonName = PersonName FROM inserted
	INSERT INTO PersonLog VALUES (@PersonID,@PersonName,'INSERT',GETDATE())
END
UPDATE PersonLog
SET PersonName = 'Darshan'
Where PersonName = 'Darsh'

CREATE OR ALTER TRIGGER tr_InsteadLogOperations_DELETE
ON PersonInfo
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	SELECT @PersonID = PersonID FROM deleted
	SELECT @PersonName = PersonName FROM deleted
	INSERT INTO PersonLog VALUES (@PersonID,@PersonName,'INSERT',GETDATE())
END
DELETE FROM PersonLog 
WHERE PersonID = 1

--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into
--uppercase whenever the record is inserted.
CREATE OR ALTER TRIGGER tr_UppercaseName
ON PersonInfo
AFTER Insert
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	SELECT @PersonID = PersonID FROM inserted
	SELECT @PersonName = PersonName FROM inserted
	UPDATE PersonInfo
    SET PersonName = UPPER(@PersonName)
    WHERE PersonID = @PersonID
END

INSERT INTO PersonInfo VALUES (2,'fgsadsh',350000,'2000-02-02','Morbi',18,'1990-02-02')

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
CREATE OR ALTER TRIGGER tr_Stop_Duplicate
ON PersonInfo
AFTER Insert
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	SELECT @PersonID = PersonID FROM inserted
	SELECT @PersonName = PersonName FROM inserted
	WHERE PersonName not in	(select PersonName from PersonInfo)
END

--6. Create trigger that prevent Age below 18 years.
CREATE OR ALTER TRIGGER tr_Insert_age_below18
ON PersonInfo
AFTER Insert
AS
BEGIN
    DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(50);
	DECLARE @Age INT;
	SELECT @PersonID = PersonID FROM inserted
	SELECT @PersonName = PersonName FROM inserted
	SELECT @Age = Age FROM inserted
	WHERE Age >=18
END
