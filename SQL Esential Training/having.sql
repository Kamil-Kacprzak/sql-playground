USE [AdventureWorks2017]
GO

SELECT City,count(*) as peopleFromCity FROM [Person].[Address]
where AddressLine2 IS NOT NULL
GROUP BY City
HAVING count(*) < 100
ORDER BY 2 desc