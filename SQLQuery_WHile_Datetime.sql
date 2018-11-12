

DECLARE @Date AS Date = '2018/07/10'
SELECT @Date AS [Date]
      ,[COMP_EMPLOY]
      ,[EMPLOYEE_NO]
      ,[TITLE_NAME_ENG]
      ,[EMPLOYEE_NAME]
      ,[TITLE_NAME_THAI]
      ,[EMPLOYEE_LOCAL_NAME]
      ,[SEX]  
      ,[COST_CENTER_CODE1]
      ,[COST_CENTER_DESCRIPTION1]  
      ,[BR_EMPLOY]
      ,[DIVISION_EMT]
      ,[HFM_ORGANIZATION_UNIT]
      ,[DEPARTMENT_EMT]
      ,[ERP_LEVEL_1]
      ,[ERP_LEVEL_2]
      ,[DEPT_NAME]
      ,[SEC_NAME]
      ,[CAT_NAME]
      ,[POSI_NAME]
      ,[POSITION_GROUP]
      ,[GRADE_EMPLOY]
      ,[DATE_JOINED]
      ,[PROBATION_PERIOD]
      ,[DATE_CONFIRM]
      ,[DATE_RESIGN_EFFECTIVE]
      ,[RESIGN_REMARK]
      ,[WORK_YEAR]
      ,[DATE_LAST_TRANSFER]
      ,[REMARK_LAST_TRANSFER]
      ,[EMPLOYEE_STATUS]
      ,[ENG_COMP_NAME]
      ,[SUPERVISOR_NAME]
      ,[MANAGER]
      ,[HEAD_GROUP]
      ,[WORK_GROUP]
      ,[LEAVE_GROUP]
      ,[HOLIDAY_GROUP]
      ,[NATIONALITY]
      ,[OFFICE_PHONE]
      ,[OFFICE_EMAIL]
      ,[REMARK_JOINED]
      ,[DEPT_CODE]
      ,[SEC_CODE]
      ,[DIVISION_EMT_CODE]
      ,[HFM_ORGANIZATION_UNIT_CODE]
      ,[DEPARTMENT_EMT_CODE]
      ,[ERP_LEVEL_1_CODE] 
      ,[ERP_LEVEL_2_CODE]
      ,[CAT_CODE]
      ,[POSITION_CODE]
      ,[SUPERIOR_NO]
  FROM [Employee].[dbo].[lnk_hr_employee]
  WHERE ISNULL(DATE_RESIGN_EFFECTIVE, '2030/12/31') > @Date
  AND DATE_JOINED <= @Date 
  AND CAT_NAME = 'Direct' 

	select top(100) * FROM [Employee].[dbo].[lnk_hr_employee];

----------------------------------------------------------------------------------
DECLARE @StartDate AS DATETIME
DECLARE @EndDate AS DATETIME
DECLARE @CurrentDate AS DATETIME

SET @StartDate = '2018-07-01'
SET @EndDate = GETDATE()
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

        print CONVERT(VARCHAR(20), @CurrentDate) + ' = ' + CONVERT(VARCHAR(10), @HC);
    SET @CurrentDate = convert(varchar(30), dateadd(day,1, @CurrentDate), 101); /*increment current date*/
END
----------------------------------------------------------------------------------

SELECT CONVERT(char(10), GetDate(),126)

SELECT DATEADD(year, 12,getdate());

SELECT CONVERT(char(10), DATEADD(year, 12,getdate()),126);





