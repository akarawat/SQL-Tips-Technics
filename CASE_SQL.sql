DECLARE @strCASE varchar(10);
SET @strCASE = 'A';

SELECT
CASE @strCASE  
    WHEN 'R' THEN 'Road'  
    WHEN 'A' THEN 'Mounting'
    WHEN 'T' THEN 'Touring'  
    WHEN 'S' THEN 'Other sale items'  
    ELSE 'Not for sale'  
END
AS MyCOLS
