USE SalesDB 
---- Create an AFTER INSERT trigger on order_items.
---- Reduce the corresponding quantity in stocks table.
---- Prevent stock from becoming negative.
---- If stock is insufficient, rollback the transaction with a custom error message.

CREATE TRIGGER trg_UpdateStockAfterOrder
ON OrderDetails
AFTER INSERT
AS
BEGIN
BEGIN TRY

IF EXISTS
(
    SELECT 1
    FROM Stocks s
    JOIN inserted i
    ON s.ProductID = i.ProductID
    WHERE s.StockQuantity < i.Quantity
)
BEGIN
    RAISERROR('Insufficient stock available.',16,1);
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    UPDATE s
    SET s.StockQuantity = s.StockQuantity - i.Quantity
    FROM Stocks s
    JOIN inserted i
    ON s.ProductID = i.ProductID;
END

END TRY

BEGIN CATCH
ROLLBACK TRANSACTION;
PRINT ERROR_MESSAGE();
END CATCH

END;

SELECT * FROM Stocks;
--test the values
INSERT INTO OrderDetails
VALUES (11,101,1,3);

SELECT * FROM OrderDetails


