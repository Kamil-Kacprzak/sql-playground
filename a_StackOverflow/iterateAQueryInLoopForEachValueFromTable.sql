--Creating schema
DROP TABLE IF EXISTS tblOrder
DROP TABLE IF EXISTS #tblResult
DROP TABLE IF EXISTS #tmp

CREATE TABLE tblOrder (OrderId int) 
CREATE TABLE #tblResult (OrderId int) 

INSERT INTO tblOrder 
VALUES (1),
		(2),
		(3),
		(4),
		(5);

-- Tmp table to itterate over		
SELECT OrderId INTO #tmp
FROM tblOrder

DECLARE @tmpOrder int
DECLARE @sResult VARCHAR (max) = ''
--Main loop with required statements inside
--WHILE EXISTS (SELECT TOP 1 1 FROM #tmp)
--	BEGIN
--		--Taking next Id and storing the result
--		SELECT TOP 1 @tmpOrder = OrderId FROM #tmp

--		INSERT INTO #tblResult
--		SELECT * FROM  tblOrder WHERE OrderId = @tmpOrder
--		--PRINT @tmpOrder

--		--Remove the row that operation has been performed for
--		-- You can use additional variable as a counter or a flag in #tmp table instead
--		DELETE FROM #tmp 
--		WHERE OrderId = @tmpOrder
--	END

--	SELECT * FROM #tblResult

WHILE EXISTS (SELECT TOP 1 1 FROM #tmp)
	BEGIN
		--Taking next Id and storing the result
		SELECT TOP 1 @tmpOrder = OrderId FROM #tmp

		SET @sResult += 'SELECT * FROM tblOrder WHERE OrderId = '+CAST(@tmpOrder as VARCHAR(20))
		IF ((SELECT count(*) FROM #tmp) > 1 )
			BEGIN
				SET @sResult += ' UNION ALL '
			END
		--Remove the row that operation has been performed for
		-- You can use additional variable as a counter or a flag in #tmp table instead
		DELETE FROM #tmp 
		WHERE OrderId = @tmpOrder
	END

	EXEC (@sResult)