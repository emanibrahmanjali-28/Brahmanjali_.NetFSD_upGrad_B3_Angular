USE SalesDB;

-- Temporary table to store revenue per order
CREATE TABLE #OrderRevenue
(
    StoreID INT,
    OrderID INT,
    Revenue DECIMAL(12,2)
);

BEGIN TRY

BEGIN TRANSACTION;

DECLARE @OrderID INT;
DECLARE @StoreID INT;
DECLARE @Discount DECIMAL(5,2);
DECLARE @Revenue DECIMAL(12,2);


-----Use a cursor to iterate through completed orders (order_status = 4).
DECLARE OrderCursor CURSOR FOR

SELECT OrderID, StoreID, ISNULL(DiscountPercent,0)
FROM Orders
WHERE order_status = 4;

OPEN OrderCursor;

FETCH NEXT FROM OrderCursor INTO @OrderID, @StoreID, @Discount;

WHILE @@FETCH_STATUS = 0
BEGIN

  
    ---- Calculate total revenue per order using OrderDetails.
    SELECT @Revenue =
        SUM((p.Price * od.Quantity) -
        ((p.Price * od.Quantity) * @Discount / 100))
    FROM OrderDetails od
    JOIN Products p
    ON od.ProductID = p.ProductID
    WHERE od.OrderID = @OrderID;

    -- Insert into temporary table
    INSERT INTO #OrderRevenue
    VALUES (@StoreID, @OrderID, @Revenue);

    FETCH NEXT FROM OrderCursor INTO @OrderID, @StoreID, @Discount;

END;

CLOSE OrderCursor;
DEALLOCATE OrderCursor;

COMMIT TRANSACTION;

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION;

PRINT 'Error occurred: ' + ERROR_MESSAGE();

END CATCH;

-- Display store wise revenue
SELECT
    StoreID,
    SUM(Revenue) AS TotalRevenue
FROM #OrderRevenue
GROUP BY StoreID;