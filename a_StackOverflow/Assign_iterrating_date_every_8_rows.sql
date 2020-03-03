-- This part was used for creation and population of the table
DROP TABLE IF EXISTS assignDateEvery8thperson

CREATE TABLE assignDateEvery8thperson
(
	userName varchar(200),
	dateUser DATETIME
)
DECLARE @iteration INT = 0
WHILE @iteration < 17
	BEGIN
		INSERT INTO assignDateEvery8thperson (userName) VALUES ('A')
		INSERT INTO assignDateEvery8thperson (userName) VALUES ('B')
		SET @iteration +=1
	END

SELECT * FROM assignDateEvery8thperson
-- Creating iteration table and preparing dataset that will be changed
DROP TABLE IF EXISTS #tmp
SELECT DISTINCT COUNT(userName) as 'No.',userName 
INTO #tmp 
FROM assignDateEvery8thperson 
GROUP BY userName

--Update main table before altering. 
--I'm using this as condition in loop - that can be done on many ways
UPDATE assignDateEvery8thperson
SET dateUser = NULL
WHERE userName IN (SELECT userName from #tmp)

-- Iterating over users to apply dates
	DECLARE @userName VARCHAR(100) 
	DECLARE @date		DATETIME

	--Iterate over rows that need to be changed
	WHILE EXISTS ( SELECT TOP 1 1 FROM #tmp )
		BEGIN
			--Take first userName
			SELECT TOP 1 @userName=userName FROM #tmp 
			SELECT @date=convert(varchar(10),GETDATE(),120)
			--After first update this loop will keep iterating over the same user if there are some rows (after first 8) left
			WHILE EXISTS (SELECT TOP 1 1 FROM assignDateEvery8thperson WHERE userName = @userName AND dateUser IS NULL)
				BEGIN			
					UPDATE TOP (8) assignDateEvery8thperson
					SET dateUser = @date
					WHERE	userName = @userName 
							AND 
							dateUser IS NULL
					SET @date = DATEADD(day,1,@date)
				END
			--DELETE this user from our tmp table - data fro him has been already updated
			DELETE FROM #tmp WHERE userName = @userName
		END

--Present results
SELECT * FROM assignDateEvery8thperson 
ORDER BY 1,2
