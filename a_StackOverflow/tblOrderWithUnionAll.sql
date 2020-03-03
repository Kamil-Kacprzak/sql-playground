--CREATE TABLE so.tblOrderWithUnionAll2 (
--	word	VARCHAR(100)
--)
--INSERT INTO so.tblOrderWithUnionAll2 VALUES  ('a'),
--											(null),
--											('b')

--SELECT word FROM so.tblOrderWithUnionAll
--WHERE word = 'a'
--UNION ALL
--SELECT word FROM so.tblOrderWithUnionAll
--WHERE word IS NULL
--UNION ALL
--SELECT word FROM so.tblOrderWithUnionAll
--WHERE word = 'b'
--ORDER BY  word

SELECT ISNULL(a.word, b.word ) from so.tblOrderWithUnionAll a 
 left JOIN so.tblOrderWithUnionAll2 b
 on b.word is null
 order by  ISNULL(ISNULL(a.word, b.word ),'z') asc