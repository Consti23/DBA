-----------------------------------------------------------------
-- change all TEXT columns to VARCHAR(MAX)
--
-- rudi@babaluga.com, go ahead license
-----------------------------------------------------------------

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT 
	CONCAT('ALTER TABLE [', TABLE_SCHEMA, '].[', TABLE_NAME, '] ALTER COLUMN [', COLUMN_NAME, '] VARCHAR(MAX) '
	, CASE IS_NULLABLE WHEN 'YES' THEN 'NULL' ELSE 'NOT NULL' END , ';') as DDL
FROM INFORMATION_SCHEMA.COLUMNS
WHERE DATA_TYPE = 'text'
OPTION (RECOMPILE, MAXDOP 1);

SELECT 
	CONCAT('ALTER TABLE [', TABLE_SCHEMA, '].[', TABLE_NAME, '] REBUILD;') as DDL
FROM INFORMATION_SCHEMA.COLUMNS
WHERE DATA_TYPE = 'text'
GROUP BY TABLE_SCHEMA, TABLE_NAME
OPTION (RECOMPILE, MAXDOP 1);