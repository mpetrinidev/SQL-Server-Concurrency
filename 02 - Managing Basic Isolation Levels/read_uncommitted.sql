USE Test

GO 

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

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

-- ROLLBACK;

--NON REPETEABLE READ
-- BEGIN TRAN;

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