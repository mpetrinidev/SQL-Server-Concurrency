USE limbs_test
GO

--CHECK SETTING OF IMPLICIT TRANSACTIONS
SELECT IIF(2 & @@OPTIONS = 2, 'ON', 'OFF') AS ImplicitTransactions;
SET IMPLICIT_TRANSACTIONS ON;

SELECT @@TRANCOUNT AS TranCount;

SELECT * FROM UserModels;

SELECT @@TRANCOUNT AS TranCount;

COMMIT;

SELECT @@TRANCOUNT AS TranCount;
SET IMPLICIT_TRANSACTIONS OFF;

SELECT IIF(2 & @@OPTIONS = 2, 'ON', 'OFF') AS ImplicitTransactions;
GO