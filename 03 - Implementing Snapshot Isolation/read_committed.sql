USE Test;
GO

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRAN;

    SELECT * FROM TestSavePoints;

    SELECT * FROM TestSavePoints;

COMMIT;


--RUN THIS IN ANOTHER FILE
BEGIN TRAN;

    UPDATE TestSavePoints
    SET ConstantValue = 3.14
    where ConstantName = 'pi'

WAITFOR DELAY '00:00:10';
ROLLBACK;