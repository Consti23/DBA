-----------------------------------------------------------------
-- Foreign keys
--
-- rudi@babaluga.com, go ahead license
-----------------------------------------------------------------

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT 
	  ccu.TABLE_CATALOG
	  ,ccu.TABLE_SCHEMA
	  ,ccu.TABLE_NAME
	  ,ccu.COLUMN_NAME
	  ,ccu.CONSTRAINT_CATALOG
	  ,ccu.CONSTRAINT_SCHEMA
	  ,ccu.CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc
JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ccu
	ON rc.CONSTRAINT_CATALOG = ccu.CONSTRAINT_CATALOG
	AND rc.CONSTRAINT_SCHEMA = ccu.CONSTRAINT_SCHEMA
	AND rc.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
OPTION (RECOMPILE, MAXDOP 1);