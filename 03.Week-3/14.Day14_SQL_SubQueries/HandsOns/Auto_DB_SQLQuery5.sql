CREATE DATABASE AutoDb;

USE AutoDb;
CREATE TABLE Categories
(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);
INSERT INTO Categories VALUES (1,'Sedan');
INSERT INTO Categories VALUES (2,'Sports Car');
INSERT INTO Categories VALUES (3,'SUV');

CREATE TABLE Products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2),

    FOREIGN KEY (category_id)
    REFERENCES Categories(category_id)
);


INSERT INTO Products VALUES (1,'Honda Civic',1,2018,800000);
INSERT INTO Products VALUES (2,'Toyota Corolla',1,2019,900000);
INSERT INTO Products VALUES (3,'Hyundai Elantra',1,2020,220000);
INSERT INTO Products VALUES (4,'Mahindra Scorpio',2,2017,350000);
INSERT INTO Products VALUES (5,'Defender',2,2018,37000);
INSERT INTO Products VALUES (6,'Dodge Challenger',2,2019,330000);
INSERT INTO Products VALUES (7,'BMW X5',3,2020,600000);
INSERT INTO Products VALUES (8,'Audi Q7',3,2019,580000);
INSERT INTO Products VALUES (9,'Mercedes GLE',3,2021,650000);


--------------------1st question

----------1. Retrieve product details (product_name, model_year, list_price)

SELECT product_name, model_year, list_price FROM Products;



---------2. Compare each product’s price with the average price of products in the same category using a nested query

SELECT 
product_name,
model_year,
list_price,
(
    SELECT AVG(list_price)
    FROM Products p2
    WHERE p2.category_id = p1.category_id
) AS Category_Avg_Price
FROM Products p1;


----------3. Display only those products whose price is greater than the category average

SELECT product_name, model_year, list_price
FROM Products p1
WHERE list_price >
(
    SELECT AVG(list_price)
    FROM Products p2
    WHERE p2.category_id = p1.category_id
);


-------4. Show calculated difference between product price and category average
SELECT 
product_name,
model_year,
list_price,
list_price -
(
    SELECT AVG(list_price)
    FROM Products p2
    WHERE p2.category_id = p1.category_id
) AS Price_Difference
FROM Products p1;


-----------5. Concatenate product name and model year as a single column (e.g., 'ProductName (2017)')

SELECT 
product_name + ' (' + CAST(model_year AS VARCHAR) + ')' AS Product_Details,
list_price
FROM Products;



--------------------2ND QUESTION

CREATE TABLE Customers
(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


INSERT INTO Customers VALUES (1,'John','Smith');
INSERT INTO Customers VALUES (2,'Joe','Scott');
INSERT INTO Customers VALUES (3,'Anjali','Sharma');
INSERT INTO Customers VALUES (4,'Sophia','Nivas');
INSERT INTO Customers VALUES (5,'Daniel','Klien');
INSERT INTO Customers VALUES (6,'Oliva','Ayyar');

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_value DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES (101,1,'2023-01-10',3000);
INSERT INTO Orders VALUES (102,1,'2023-02-15',2500);
INSERT INTO Orders VALUES (103,2,'2023-03-20',6000);
INSERT INTO Orders VALUES (104,3,'2023-04-18',12000);
INSERT INTO Orders VALUES (105,3,'2023-05-10',2000);
INSERT INTO Orders VALUES (106,5,'2023-06-12',4000);


----------------1.Use nested query to calculate total order value per customer

SELECT customer_id,
(
    SELECT SUM(order_value)
    FROM Orders o
    WHERE o.customer_id = c.customer_id
) AS Total_Order_Value
FROM Customers c;

-------------------2. Classify customers using conditional logic:
  -------- - 'Premium' if total order value > 10000
  -------- - 'Regular' if total order value between 5000 and 10000
  ----------- - 'Basic' if total order value < 5000

  SELECT c.customer_id, SUM(o.order_value) AS Total_Order_Value,
    CASE 
    WHEN SUM(o.order_value) > 10000 THEN 'Premium'
    WHEN SUM(o.order_value) BETWEEN 5000 AND 10000 THEN 'Regular'
    WHEN SUM(o.order_value) < 5000 THEN 'Basic'
    END AS Customer_Type
    FROM Customers c
    JOIN Orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_id;

    ------3.Use UNION to display customers with orders and customers without orders

    SELECT c.customer_id, c.first_name, c.last_name
    FROM Customers c
    JOIN Orders o
    ON c.customer_id = o.customer_id

    UNION

    SELECT c.customer_id, c.first_name, c.last_name
    FROM Customers c
    WHERE c.customer_id NOT IN
    (
        SELECT customer_id FROM Orders
    );

    ----------4.Display full name using string concatenation

    SELECT first_name + ' ' + last_name AS Full_Name FROM Customers;

    -------------5.Handle NULL cases appropriately

    SELECT c.customer_id,c.first_name + ' ' + c.last_name AS Full_Name,
    ISNULL(SUM(o.order_value),0) AS Total_Order_Value
    FROM Customers c
    LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name;


    -----------3RD Question

    CREATE TABLE Stores(
        store_id INT PRIMARY KEY,
        store_name VARCHAR(50)
);

INSERT INTO Stores VALUES (1,'City Store');
INSERT INTO Stores VALUES (2,'Offline Store');
INSERT INTO Stores VALUES (3,'Online Store');

CREATE TABLE Order_Items
(
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(10,2),

    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES (1,101,1,2,800000,5000);
INSERT INTO Order_Items VALUES (2,101,2,1,900000,10000);
INSERT INTO Order_Items VALUES (3,102,3,1,220000,2000);
INSERT INTO Order_Items VALUES (4,103,4,1,350000,5000);
INSERT INTO Order_Items VALUES (5,104,7,1,600000,10000);
INSERT INTO Order_Items VALUES (6,105,8,2,580000,8000);
INSERT INTO Order_Items VALUES (7,106,9,1,650000,12000);


CREATE TABLE Stocks
(
    store_id INT,
    product_id INT,
    quantity INT,

    PRIMARY KEY (store_id, product_id),

    FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Stocks VALUES (1,1,5);
INSERT INTO Stocks VALUES (1,2,3);
INSERT INTO Stocks VALUES (1,3,0);
INSERT INTO Stocks VALUES (2,4,2);
INSERT INTO Stocks VALUES (2,5,0);
INSERT INTO Stocks VALUES (2,6,4);
INSERT INTO Stocks VALUES (3,7,1);
INSERT INTO Stocks VALUES (3,8,0);
INSERT INTO Stocks VALUES (3,9,2);

ALTER TABLE Orders ADD store_id INT;

ALTER TABLE Orders ADD CONSTRAINT FK_store
FOREIGN KEY (store_id)
REFERENCES Stores(store_id);

UPDATE Orders SET store_id = 1 WHERE order_id = 101;
UPDATE Orders SET store_id = 1 WHERE order_id = 102;
UPDATE Orders SET store_id = 2 WHERE order_id = 103;
UPDATE Orders SET store_id = 2 WHERE order_id = 104;
UPDATE Orders SET store_id = 3 WHERE order_id = 105;
UPDATE Orders SET store_id = 3 WHERE order_id = 106;




--------1. Identify products sold in each store using nested queries.

SELECT s.store_name, p.product_name
FROM stores s
JOIN products p 
ON p.product_id IN
(
    SELECT oi.product_id
    FROM order_items oi
    JOIN orders o 
    ON oi.order_id = o.order_id
    WHERE o.store_id = s.store_id
);

---------2. Compare sold products with current stock using INTERSECT and EXCEPT operators.
----using intersect it shows  Products that are sold and still available in stock

SELECT product_id FROM order_items
INTERSECT
SELECT product_id FROM stocks;

---except is showing Sold products that have no stock

SELECT product_id FROM order_items
EXCEPT
SELECT product_id FROM stocks
WHERE quantity > 0;



-------3. Display store_name, product_name, total quantity sold.

SELECT s.store_name,
       p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN orders o 
ON oi.order_id = o.order_id
JOIN stores s 
ON o.store_id = s.store_id
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY s.store_name, p.product_name;

------4. Calculate total revenue per product (quantity × list_price – discount).

SELECT p.product_name,
       SUM(oi.quantity * oi.list_price - oi.discount) AS total_revenue
FROM order_items oi
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY p.product_name;


----------5. Update stock quantity to 0 for discontinued products (simulation).


ALTER TABLE Products ADD discontinued BIT; -----it stores only one value

UPDATE Products SET discontinued = 0 WHERE product_id IN (1,2,3,4,6,7,8);
UPDATE Products SET discontinued = 1 WHERE product_id IN (5,9);

UPDATE stocks
SET quantity = 0
WHERE product_id IN
(
    SELECT product_id
    FROM products
    WHERE discontinued = 1
);

 SELECT product_id
    FROM products
    WHERE discontinued = 1 

----4TH QUESTION

ALTER TABLE Orders ADD order_status INT,
required_date DATE,
shipped_date DATE;

UPDATE Orders SET order_status = 2, required_date='2023-01-15', shipped_date='2023-01-14' WHERE order_id=101;
UPDATE Orders SET order_status = 2, required_date='2023-02-20', shipped_date='2023-02-22' WHERE order_id=102;
UPDATE Orders SET order_status = 3, required_date='2022-03-25', shipped_date=NULL WHERE order_id=103;
UPDATE Orders SET order_status = 2, required_date='2023-04-25', shipped_date='2023-04-24' WHERE order_id=104;
UPDATE Orders SET order_status = 3, required_date='2022-05-20', shipped_date=NULL WHERE order_id=105;
UPDATE Orders SET order_status = 2, required_date='2023-06-20', shipped_date='2023-06-19' WHERE order_id=106;

---------------------------1. Insert archived records into a new table (archived_orders) using INSERT INTO SELECT.

CREATE TABLE archived_orders
(
order_id INT,
customer_id INT,
order_date DATE,
order_value DECIMAL(10,2),
store_id INT,
order_status INT
);

INSERT INTO archived_orders
SELECT order_id, customer_id, order_date, order_value, store_id, order_status
FROM Orders
WHERE order_status = 3
AND order_date < DATEADD(YEAR,-1,GETDATE());


------------2. Delete orders where order_status = 3 (Rejected) and older than 1 year.

DELETE oi
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 3
AND o.order_date < DATEADD(YEAR,-1,GETDATE());

DELETE FROM Orders
WHERE order_status = 3
AND order_date < DATEADD(YEAR,-1,GETDATE());
---------------------------3. Use nested query to identify customers whose all orders are completed.

SELECT customer_id
FROM Customers
WHERE customer_id NOT IN
(
SELECT customer_id
FROM Orders
WHERE order_status <> 2
);
------------4. Display order processing delay (DATEDIFF between shipped_date and order_date).

SELECT order_id,
DATEDIFF(day, order_date, shipped_date) AS processing_delay
FROM Orders;
-------------------------5. Mark orders as 'Delayed' or 'On Time' using CASE expression based on required_date.

SELECT order_id,
order_date,
required_date,
shipped_date,
CASE
WHEN shipped_date > required_date THEN 'Delayed'
ELSE 'On Time'
END AS delivery_status
FROM Orders;














