use playground
go

/*
	SELECT * FROM playgroundConstrained
	SELECT * FROM [dbo].[playground]
*/
--SELECT * FROM playgroundConstrained a 
--right  join playground b
--on a.id = b.id

--SELECT value from STRING_SPLIT('1.2.3.4.5','.')

--SELECT QUOTENAME ('this is var+''string escaped''')
--SELECT QUOTENAME ('this is var'+'string')

--SELECT STRING_AGG (id,char(13)) FROM playgroundConstrained

--SELECT FORMATMESSAGE('Signed int %i, %d %i, %d, %+i, %+d, %+i, %+d', 5, -5, 50, -50, -11, -11, 11, 11);
--SELECT FORMATMESSAGE('Signed int with up to 3 leading zeros %03i', 5.000);  

--SELECT TRIM('Signed int with up to 3 leading zeros			')

----SELECT TYPE_NAME(valDef) FROM playgroundConstrained -- nie dzia³a :( 

----DECLARE @new money
----SET @new = '4$' --to tez nie ale dlatego ze nie chce mi sie czytac

----SELECT @new

--SELECT 1/2
--SELECT round(1/2,3)
--SELECT MOD(1,2)

--DECLARE @time DATETIME = GETDATE()

--SELECT @time