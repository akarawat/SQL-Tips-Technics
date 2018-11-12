
DECLARE @valueList varchar(8000)
DECLARE @pos INT
DECLARE @len INT
DECLARE @value varchar(8000)

SET @valueList = 'aa,bb,cc,f,sduygfdctys,w,e,r,t,sd sdf sdf,yyy yyy yy,'

set @pos = 0
set @len = 0

WHILE CHARINDEX(',', @valueList, @pos+1)>0
BEGIN
    set @len = CHARINDEX(',', @valueList, @pos+1) - @pos
    set @value = SUBSTRING(@valueList, @pos, @len)
    --SELECT @pos, @len, @value /*this is here for debugging*/
        
    PRINT @value
    --Here is you value
    --DO YOUR STUFF HERE
    --DO YOUR STUFF HERE
    --DO YOUR STUFF HERE
    --DO YOUR STUFF HERE
    --DO YOUR STUFF HERE

    set @pos = CHARINDEX(',', @valueList, @pos+@len) +1
END
