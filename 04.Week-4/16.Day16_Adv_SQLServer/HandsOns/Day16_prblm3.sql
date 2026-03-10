USE SalesDB;

----- Create an AFTER UPDATE trigger on orders.



ALTER TABLE Orders
ADD order_status INT,
    shipped_date DATE;


    ------ Validate that shipped_date is NOT NULL when order_status = 4.

    CREATE TRIGGER trg_OrderStatusValidation
ON Orders
AFTER UPDATE
AS
BEGIN

IF EXISTS
(
    SELECT 1
    FROM inserted
    WHERE order_status = 4
    AND shipped_date IS NULL
)
BEGIN
    RAISERROR('Shipped date cannot be NULL when order status is Completed.',16,1);
    ROLLBACK TRANSACTION;
END

END;


----- Prevent update if condition fails.
UPDATE Orders
SET order_status = 4
WHERE OrderID = 101;

UPDATE Orders
SET order_status = 4,
    shipped_date = '2026-03-06'
WHERE OrderID = 101;