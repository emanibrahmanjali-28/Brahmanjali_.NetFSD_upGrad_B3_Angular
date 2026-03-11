CREATE DATABASE AutoRetailDB;
USE AutoRetailDB


CREATE TABLE Stocks
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2)
);


INSERT INTO Stocks VALUES
(1,'Car Tyre',50,2000),
(2,'Car Battery',20,5000),
(3,'Car Oil',100,800);

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    OrderDate DATETIME DEFAULT GETDATE()
);



CREATE TABLE Order_Items
(
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Stocks(ProductID)
);


---- Write a transaction to insert data into orders and order_items tables.

BEGIN TRANSACTION

BEGIN TRY

    -- Insert order
    INSERT INTO Orders (OrderID)
    VALUES (2)

    -- Insert order items
    INSERT INTO Order_Items (OrderItemID, OrderID, ProductID, Quantity)
    VALUES
    (3,1,1,80),
    (4,1,2,70)

    COMMIT TRANSACTION

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION
    PRINT ERROR_MESSAGE()

END CATCH
--- Check stock availability before confirming order.


IF EXISTS
(
    SELECT 1
    FROM Stocks s
    JOIN Order_Items oi
    ON s.ProductID = oi.ProductID
    WHERE s.Quantity < oi.Quantity
)
BEGIN
    PRINT 'Stock not available'
END
ELSE
BEGIN
    PRINT 'Stock available'
END

---- Create a trigger to reduce stock quantity after order insertion.


CREATE TRIGGER trg_UpdateeStock
ON Order_Items
AFTER INSERT
AS
BEGIN

    UPDATE s
    SET s.Quantity = s.Quantity - i.Quantity
    FROM Stocks s
    JOIN inserted i
    ON s.ProductID = i.ProductID

END

---- Rollback transaction if stock quantity is insufficient.


CREATE TRIGGER trg_CheckStock
ON Order_Items
AFTER INSERT
AS
BEGIN

    IF EXISTS
    (
        SELECT 1
        FROM Stocks s
        JOIN inserted i
        ON s.ProductID = i.ProductID
        WHERE s.Quantity < i.Quantity
    )
    BEGIN
        RAISERROR('Stock is insufficient',16,1)
        ROLLBACK TRANSACTION
        RETURN
    END

END

SELECT * FROM Stocks;

SELECT * FROM Orders;

SELECT * FROM Order_Items;