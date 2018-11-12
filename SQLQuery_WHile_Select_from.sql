USE [KPIDB_AY3];
declare @pLimitRow	INT	;
set @pLimitRow = 20;
BEGIN	
		DECLARE @i INT
		SET @i = 1
		WHILE (@i <= @pLimitRow)
		  BEGIN 
			PRINT + ' Row : ' + CONVERT(VARCHAR,@i)
			SET @i = @i + 1 
		  END -- WHILE
END
/* Example 0 
	Your Table

	CREATE TABLE TestTable 
	(
	ID INT,
	Data NVARCHAR(50)
	)
	GO

	INSERT INTO TestTable
	VALUES (1,'AABBCC'),
		   (2,'FFDD'),
		   (3,'TTHHJJKKLL')
	GO

	SELECT * FROM TestTable
	My Suggestion

	CREATE TABLE #DestinationTable
	(
	ID INT,
	Data NVARCHAR(50)
	)
	GO  
		SELECT * INTO #Temp FROM TestTable

		DECLARE @String NVARCHAR(2)
		DECLARE @Data NVARCHAR(50)
		DECLARE @ID INT

		WHILE EXISTS (SELECT * FROM #Temp)
		 BEGIN 
			SELECT TOP 1 @Data =  DATA, @ID = ID FROM  #Temp

			  WHILE LEN(@Data) > 0
				BEGIN
					SET @String = LEFT(@Data, 2)

					INSERT INTO #DestinationTable (ID, Data)
					VALUES (@ID, @String)

					SET @Data = RIGHT(@Data, LEN(@Data) -2)
				END
			DELETE FROM #Temp WHERE ID = @ID
		 END


	SELECT * FROM #DestinationTable
	Result Set

	ID  Data
	1   AA
	1   BB
	1   CC
	2   FF
	2   DD
	3   TT
	3   HH
	3   JJ
	3   KK
	3   LL
	DROP Temp Tables

	DROP TABLE #Temp
	DROP TABLE #DestinationTable
*/
/* Example 1
	DECLARE Employee_Cursor CURSOR FOR  
	SELECT EmployeeID, Title   
	FROM AdventureWorks2012.HumanResources.Employee  
	WHERE JobTitle = 'Marketing Specialist';  
	OPEN Employee_Cursor;  
	FETCH NEXT FROM Employee_Cursor;  
	WHILE @@FETCH_STATUS = 0  
	   BEGIN  
		  FETCH NEXT FROM Employee_Cursor;  
	   END;  
	CLOSE Employee_Cursor;  
	DEALLOCATE Employee_Cursor;
*/

/* Exam 2
	USE AdventureWorks2012;  
	GO  
	WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $300  
	BEGIN  
	   UPDATE Production.Product  
		  SET ListPrice = ListPrice * 2  
	   SELECT MAX(ListPrice) FROM Production.Product  
	   IF (SELECT MAX(ListPrice) FROM Production.Product) > $500  
		  BREAK  
	   ELSE  
		  CONTINUE  
	END
	PRINT 'Too much for the market to bear';  
*/


--WHILE (SELECT ProductionDate, [Shift], Machine, OpeningHours FROM [KPIDB_AY3].[dbo].[SD_MesOpeningHours] WHERE Machine = 'SEXT0093') = 0
--BEGIN  
--	print OpeningHours;
--END


select * from [dbo].[SD_MesActualHours] 

DECLARE @table2 table ( id INTEGER, data VARCHAR(500))

DECLARE Cur CURSOR FOR
--select ProductionDate, [Shift], Machine, OpeningHours from [dbo].[SD_MesOpeningHours]
OPEN Cur 
WHILE ( @@FETCH_STATUS = 0 )
    BEGIN
        DECLARE @LoopNum INTEGER
        DECLARE @tempID INTEGER
        DECLARE @tempDATA VARCHAR(255)
        FETCH NEXT FROM Cur INTO @tempID
        SET @tempDATA = select ProductionDate, [Shift], Machine, OpeningHours from [dbo].[SD_MesOpeningHours]
        SET @LoopNUM = 0
        WHILE @LoopNum< len(@tempDATA) / 2
            BEGIN
            INSERT INTO table2 (id, data)
            VALUES( @tempID, SUBSTRING(@tempDATA, @LoopNum * 2 +1, 2))
            SET @LoopNum = @LoopNum + 1
        END
    END

CLOSE Cur 
DEALLOCATE Cur 

SELECT * FROM table2
---------------

declare @StartDate datetime, @EndDate datetime

select @StartDate = '10/01/2012 08:40:18.000',@EndDate='10/04/2012 09:52:48.000'

select convert(varchar(5),DateDiff(s, @startDate, @EndDate)/3600)+':'+convert(varchar(5),DateDiff(s, @startDate, @EndDate)%3600/60)+':'+convert(varchar(5),(DateDiff(s, @startDate, @EndDate)%60))
---
/*
DECLARE @TimeSt varchar(50)
SET @TimeSt = '10:47:00:000000'
DECLARE @TimeEn varchar(50)
SET @TimeEn = '13:30:00:000'

--SELECT STUFF(@TimeSt,3,0,':') + ':00'
--SELECT STUFF(@TimeEn,3,0,':') + ':00'
select Convert(time, Left(@TimeSt,Len(@TimeSt)-3), 114)

Select CAST((@TimeEn - @TimeSt) as time(0)) '[hh:mm:ss]';

--DECLARE @s varchar(50) = '09:47:11:895799'
--SELECT Convert(time, Left(@s,Len(@s)-3), 114)
*/
-------------------

DECLARE @TimeSt varchar(50);
SET @TimeSt = '10:47:00:000000';
DECLARE @TimeEn varchar(50);
SET @TimeEn = '13:30:00:000000';
select Convert(time, Left(@TimeSt,Len(@TimeSt)-3), 114);
select Convert(time, Left(@TimeEn,Len(@TimeEn)-3), 114);

Select (@TimeEn - @TimeSt);
--#############################
USE [mydatabase]
GO
/****** Object:  StoredProcedure [dbo].[myStoredProcedure]    Script Date: 11-Sep-15 3:29:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[myStoredProcedure]

AS
BEGIN
	
-- Declare Table
DECLARE @temp TABLE
(
	RowID INT IDENTITY (1,1),
	Name VARCHAR(50),
	LastName VARCHAR(50)
)

-- Insert Table
INSERT INTO @temp (Name,LastName) VALUES ('Weerachai','Nukitram')
INSERT INTO @temp (Name,LastName) VALUES ('Surachai','Sirisart')
INSERT INTO @temp (Name,LastName) VALUES ('Adisorn','Boonsong')

-- Variable
DECLARE @i INT
DECLARE @iRow INT
DECLARE @sName VARCHAR(50)
DECLARE @sLastName VARCHAR(50)

-- Set Variable
SET @i = 1
SELECT @iRow = COUNT(*) FROM @temp

-- Loop Row
WHILE (@i <= @iRow)
	BEGIN 
		-- Select from table
		SELECT @sName = Name , @sLastName = LastName
		FROM @temp WHERE RowID = @i

		-- Print output
		PRINT ' Row : ' + CONVERT(VARCHAR,@i) + ', Name : ' + @sName + ', LastName : ' + @sLastName
         
	SET @i = @i + 1 
	END -- WHILE

END

GO
------------------------
