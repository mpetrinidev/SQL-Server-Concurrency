USE limbs_test
GO

-- --Explicit Transaction
-- BEGIN TRANSACTION;

--     SELECT @@TRANCOUNT AS TranCount_AfterBegin
--     SELECT * FROM UserModels;

-- COMMIT;

-- SELECT @@TRANCOUNT AS TranCount_AfterCommit
-- GO

--Nested
PRINT CONCAT('@@TRANCOUNT before transaction: ', @@TRANCOUNT);

BEGIN TRAN;
    PRINT CONCAT('@@TRANCOUNT in OUTER transaction: ', @@TRANCOUNT);

    BEGIN TRAN;

        PRINT CONCAT('@@TRANCOUNT in inner transaction: ', @@TRANCOUNT);

    COMMIT;
    PRINT CONCAT('@@TRANCOUNT after inner commit: ', @@TRANCOUNT);

COMMIT;

PRINT CONCAT('@@TRANCOUNT after OUTER COMMIT: ', @@TRANCOUNT);
GO