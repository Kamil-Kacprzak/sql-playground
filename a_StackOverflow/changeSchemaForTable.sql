IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'so')) 
BEGIN
    EXEC ('CREATE SCHEMA [so] AUTHORIZATION [dbo]')
END

ALTER SCHEMA so
	TRANSFER dbo.assignDateEvery8thperson