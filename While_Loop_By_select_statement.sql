--- Example while loop by select statement output by (table, print, select)
-------------------------------------------------------
-- Example 1 while from select table
IF OBJECT_ID('tempdb..#tmpYieldData') IS NOT NULL DROP TABLE #tmpYieldData
CREATE TABLE #tmpYieldData (		
		datedata VARCHAR(20), 
		yield VARCHAR(10)
	);

DECLARE @StartDate AS DATETIME
DECLARE @EndDate AS DATETIME
DECLARE @CurrentDate AS DATETIME
DECLARE @CellNo varchar(5);

SET @StartDate = '2018-07-01'
SET @EndDate = '2018-07-05'

SET @CurrentDate = @StartDate
DECLARE @HC int;
WHILE (@CurrentDate < @EndDate)
BEGIN
	IF @@ROWCOUNT < 1		
		SELECT @HC = COUNT(*) 
			FROM [Employee].[dbo].[lnk_hr_employee]
			WHERE ISNULL(DATE_RESIGN_EFFECTIVE, CONVERT(char(10), DATEADD(year, 12,getdate()),126)) > @CurrentDate 
			AND DATE_JOINED <= @CurrentDate 
			AND CAT_NAME = 'Direct' 
			
		INSERT INTO #tmpYieldData (datedata, yield) values (CONVERT(VARCHAR(20), @CurrentDate), CONVERT(VARCHAR(10), @HC));
		--print CONVERT(VARCHAR(20), @CurrentDate) + ' = ' + CONVERT(VARCHAR(10), @HC);
		--SELECT CONVERT(VARCHAR(20), @CurrentDate) + ' = ' + CONVERT(VARCHAR(10), @HC);

	SET @CurrentDate = convert(varchar(30), dateadd(day,1, @CurrentDate), 101); /*increment current date*/
END

SELECT * FROM #tmpYieldData;
IF OBJECT_ID('tempdb..#tmpYieldData') IS NOT NULL DROP TABLE #tmpYieldData
-------------------------------------------------------
-- Example 2 Normal loop
BEGIN
		DECLARE @pLimitRow  INT
		SET @pLimitRow = 5
		DECLARE @i INT
		SET @i = 1
		WHILE (@i <= @pLimitRow)
		  BEGIN 

			PRINT + ' Row : ' + CONVERT(VARCHAR,@i)
         
			SET @i = @i + 1 
		  END -- WHILE
END
--------------------------------------------------------

