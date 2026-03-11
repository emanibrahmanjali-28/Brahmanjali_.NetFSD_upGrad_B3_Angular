USE AutoRetailDB

ALTER TABLE Orders
ADD Order_Status INT;

 
------ Begin a transaction when cancelling an order.
-------- Restore stock quantities based on order_items.
----------- Update order_status to 3.
----------- Use SAVEPOINT before stock restoration.
----- If stock restoration fails, rollback to SAVEPOINT.
------- Commit transaction only if all operations succeed.


BEGIN TRANSACTION

BEGIN TRY

    -- Savepoint
    SAVE TRANSACTION SaveBeforeRestore

    -- Restore stock
    UPDATE s
    SET s.Quantity = s.Quantity + oi.Quantity
    FROM Stocks s
    JOIN Order_Items oi
    ON s.ProductID = oi.ProductID
    WHERE oi.OrderID = 1

    -- Update order status
    UPDATE Orders
    SET Order_Status = 3
    WHERE OrderID = 1

    -- Commit if success
    COMMIT TRANSACTION

END TRY

BEGIN CATCH

    PRINT 'Error occurred during cancellation'

    -- Rollback to savepoint
    ROLLBACK TRANSACTION SaveBeforeRestore

    PRINT ERROR_MESSAGE()

END CATCH

SELECT * FROM Stocks;
SELECT * FROM Orders;
SELECT * FROM Order_Items;