USE Test

GO 

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRAN;

    SELECT * FROM TestSavePoints;

    SELECT * FROM TestSavePoints;

COMMIT;


GO

--DIRTY READ
-- BEGIN TRAN;

--     UPDATE TestSavePoints
--     SET ConstantValue = 3.14
--     where ConstantName = 'pi'

-- WAITFOR DELAY '00:00:04';
-- ROLLBACK;

-- GO 

-- SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- BEGIN TRAN;

--     SELECT * FROM TestSavePoints;

--     SELECT * FROM TestSavePoints;

-- COMMIT;


-- GO


--NON REPETEABLE READ
-- BEGIN TRAN;

--SET LOCK_TIMEOUT -1 --WAIT FOREVER
--     UPDATE TestSavePoints
--     SET ConstantValue = 3.14
--     where ConstantName = 'pi'

-- COMMIT; 

-- --restore previous value

-- BEGIN TRAN;

--     UPDATE TestSavePoints
--     SET ConstantValue = 3.14238823238
--     where ConstantName = 'pi'

-- COMMIT; 

--PHANTOM READ
-- BEGIN TRAN;

--     INSERT INTO TestSavePoints (ConstantName, ConstantValue)
--         VALUES ('e', 3.238238);

-- ROLLBACK;