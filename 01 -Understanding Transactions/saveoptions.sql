USE Test
GO

-- Create a new table called '[TestSavePoints]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TestSavePoints]', 'U') IS NOT NULL
DROP TABLE [dbo].[TestSavePoints]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[TestSavePoints]
(
    ConstantName VARCHAR(50),
    ConstantValue FLOAT
    -- Specify more columns here
);
GO

BEGIN TRAN Hitchhikers;

    INSERT INTO TestSavePoints (ConstantName, ConstantValue)
        VALUES ('The Answer', 42);

    -- Set a savepoint
    SAVE TRAN TheAnswer;

    INSERT INTO TestSavePoints (ConstantName, ConstantValue)
        VALUES ('Phi', 1.61123723727);

    --SHOW CURRENT VALUES
    SELECT 'BEFORE FIRST ROLLBACK' AS [WHEN], * FROM TestSavePoints;

    ROLLBACK TRAN TheAnswer;

    SELECT 'AFTER FIRST ROLLBACK' AS [WHEN], * FROM TestSavePoints;

    INSERT INTO TestSavePoints (ConstantName, ConstantValue)
        VALUES ('pi', 3.14238823238);

    DECLARE @MyName SYSNAME = N'After Ford';
    SAVE TRAN @MyName;

    INSERT INTO TestSavePoints (ConstantName, ConstantValue)
        VALUES ('e', 2.718238238);

    SELECT 'BEFORE SECOND ROLLBACK' AS [WHEN], * FROM TestSavePoints;

    ROLLBACK TRAN @MyName;

COMMIT TRAN Hitchhikers;


SELECT 'AT END OF TRANSACTION' AS [WHEN], * FROM TestSavePoints;
GO