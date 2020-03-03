--CREATE TABLE playground
--(
--	id	INTEGER,
--	val	VARChAR(200),
--);

--CREATE TABLE playgroundConstrained
--(
--	id		INTEGER IDENTITY PRIMARY KEY,
--	val		VARCHAR(200) NOT NULL,
--	valDef	TEXT	DEFAULT	('DEF')
--);


/*
	DROP TABLE IF EXISTS playground
	DROP TABLE IF EXISTS playgroundConstrained

	SELECT * FROM playground
	SELECT * FROM playgroundConstrained

*/
/*
PART 1 
	--INSERT INTO playground  VALUES (1,'aa')

	--INSERT INTO playground DEFAULT VALUES

	--INSERT INTO playground SELECT * FROM playground

	--DELETE FROM playground

	--INSERT INTO playgroundConstrained (id,val) VALUES ( 1,'ONE') 
	--INSERT INTO playgroundConstrained (id,val) VALUES ( 2,'TWO') 
	INSERT INTO playgroundConstrained (val)	VALUES ('new')
	--INSERT INTO playgroundConstrained DEFAULT VALUES

	PART 1 END
*/

/*
PART 2 - ALTER SCHEMA
ALTER TABLE playgroundConstrained ADD valEmpty VARCHAR(200) CONSTRAINT unnecessary DEFAULT 'panda' WITH VALUES --WITH VALUES 'maslo'-- EXisitng rows get nullo as value


--DECLARE @constrain VARCHAR(100) = 'DF__playgroun__valEm__34C8D9D1'
--EXEC ('ALTER TABLE playgroundConstrained DROP CONSTRAINT '+@constrain)
ALTER TABLE playgroundConstrained DROP CONSTRAINT unnecessary
ALTER TABLE playgroundConstrained DROP COLUMN valEmpty

PART 2 END

*/

/*
--using subquery to force alias and case statement

USE [AdventureWorks2017]
GO

SELECT * FROM (
				SELECT TOP 1000 CASE WHEN NameStyle = 1 THEN 'TRUE' ELSE 'FALSE' END as isTrue, * FROM [Person].[Person]
	)	as innerTable
	WHERE isTrue = 'FALSE'
	ORDER BY 5 DESC ,1
	
	*/
