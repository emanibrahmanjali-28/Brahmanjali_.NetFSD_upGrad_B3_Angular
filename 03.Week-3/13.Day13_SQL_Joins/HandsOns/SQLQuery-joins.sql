
CREATE DATABASE StoreDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO Customers (first_name, last_name, email) VALUES
('Anjali', 'Reddy', 'anjali@gmail.com'),
('Rahul', 'Sharma', 'rahul@gmail.com'),
('Priya', 'Kumar', 'priya@gmail.com'),
('Arjun', 'Verma', 'arjun@gmail.com'),
('Sneha', 'Patel', 'sneha@gmail.com');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1001,1),
    customer_id INT,
    order_date DATE,
    order_status INT,
    
    CONSTRAINT FK_Customer_Order
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

INSERT INTO Orders (customer_id, order_date, order_status) VALUES
(1, '2026-03-01', 1),  -- Pending
(2, '2026-03-02', 4),  -- Completed
(3, '2026-03-03', 2),  -- Cancelled
(1, '2026-03-04', 4),  -- Completed
(4, '2026-03-05', 1),  -- Pending
(5, '2026-03-06', 3);  -- Shipped


 -----------------------1ST QUERY

    SELECT 
        C.first_name,
        C.last_name,
        O.order_id,
        O.order_date,
        O.order_status
    FROM Customers C INNER JOIN Orders O ON C.customer_id = O.customer_id;


    -----------------------2ND QUERY

  SELECT O.order_status FROM Orders O WHERE O.order_status = 1 OR O.order_status = 4;


   -----------------------3RD QUERY
   -----------------------Sort the results by order_date in descending order.

   SELECT * FROM Orders ORDER BY order_date DESC;



   --------------------------2ND QUESTION

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);


CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2),
    CONSTRAINT FK_Product_Brand FOREIGN KEY (brand_id)
        REFERENCES brands(brand_id),
    CONSTRAINT FK_Product_Category FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);


INSERT INTO brands VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Apple'),
(4, 'Samsung');


INSERT INTO categories VALUES
(1, 'Shoes'),
(2, 'Electronics'),
(3, 'Clothing');


INSERT INTO products VALUES
(101, 'Air Max', 1, 1, 2023, 750.00),
(102, 'Ultraboost', 2, 1, 2022, 680.00),
(103, 'iPhone 14', 3, 2, 2023, 999.00),
(104, 'Galaxy S23', 4, 2, 2023, 850.00),
(105, 'T-Shirt Pro', 1, 3, 2022, 300.00),
(106, 'Running Shorts', 2, 3, 2023, 250.00);


-----------------------------1ST QUERY
--------------------------Display product_name, brand_name, category_name, model_year, and list_price.

SELECT 
    p.product_name,
    b.brand_name,
    c.category_name,
    p.model_year,
    p.list_price FROM products p
INNER JOIN brands b 
    ON p.brand_id = b.brand_id
INNER JOIN categories c 
    ON p.category_id = c.category_id;

    -----------------------------------2ND QUERY

    --------------. Filter products with list_price greater than 500.

    SELECT p.product_name,p.list_price FROM products p WHERE p.list_price > 500;



    --------------------------------3rd query
    -----------------------------Sort results by list_price in ascending order.

    SELECT p.product_name,p.list_price FROM products p ORDER BY p.list_price ASC;



    ---------------------------------3rd questionn


    CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL
);

    INSERT INTO stores VALUES
    (1, 'Hyderabad Store'),
    (2, 'Chennai Store'),
    (3, 'Bangalore Store');


    ALTER TABLE Orders
    ADD store_id INT;

    ALTER TABLE Orders
    ADD CONSTRAINT FK_Store_Order
    FOREIGN KEY (store_id)
    REFERENCES stores(store_id);


    UPDATE Orders SET store_id = 1 WHERE order_id = 1001;
    UPDATE Orders SET store_id = 2 WHERE order_id = 1002;
    UPDATE Orders SET store_id = 3 WHERE order_id = 1003;
    UPDATE Orders SET store_id = 1 WHERE order_id = 1004;
    UPDATE Orders SET store_id = 2 WHERE order_id = 1005;
    UPDATE Orders SET store_id = 3 WHERE order_id = 1006;

    SELECT * FROM Orders


    CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),

    CONSTRAINT FK_OrderItems_Order
    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
    );

    INSERT INTO order_items (order_id, quantity, list_price, discount) VALUES
    (1001, 2, 5000, 0.10),
    (1002, 1, 3000, 0.05),
    (1003, 4, 2500, 0.00),
    (1004, 3, 4000, 0.15),
    (1005, 2, 6000, 0.10),
    (1006, 1, 2000, 0.05);

    --------------------------1st query
    ----------------------------Display store_name and total sales amount.


   SELECT 
    s.store_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
    FROM stores s
    INNER JOIN Orders o ON s.store_id = o.store_id
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY s.store_name;

    --------------------------2nd query
    ---------------------------total sales 

    SELECT SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales FROM order_items oi;

    ---------------------------------3rd query
    ----------------------------------Include only completed orders (order_status = 4).

    SELECT * FROM Orders WHERE order_status = 4;

    -----------------------------------------4th query
    -------------------Group results by store_name.

    SELECT 
    s.store_name,
    COUNT(o.order_id) AS total_orders
    FROM stores s
    INNER JOIN Orders o ON s.store_id = o.store_id
    GROUP BY s.store_name;

    --------------------Sort total sales in descending order.
    ---------------------------5th query

    SELECT 
    s.store_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
    FROM stores s
    INNER JOIN Orders o ON s.store_id = o.store_id
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY s.store_name
    ORDER BY total_sales DESC;


    ----------------------------------------4TH QUESTION
    ---------------------------

    CREATE TABLE stocks (
    store_id INT,
    product_id INT,
    quantity INT,

    CONSTRAINT PK_Stocks PRIMARY KEY (store_id, product_id),

    CONSTRAINT FK_Stocks_Store
    FOREIGN KEY (store_id)
        REFERENCES stores(store_id),

    CONSTRAINT FK_Stocks_Product
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

INSERT INTO stocks VALUES
(1, 101, 20),
(1, 102, 15),
(1, 103, 10),
(2, 104, 25),
(2, 105, 30),
(3, 106, 40);

--------------------------------------
------------------Display product_name, store_name, available stock quantity, and total quantity sold.
----------------------------Include products even if they have not been sold (use appropriate join)
-------------Group results by product_name and store_name.

SELECT 
    p.product_name,
    s.store_name,
    st.quantity AS available_stock_quantity,
    ISNULL(SUM(oi.quantity), 0) AS total_quantity_sold
FROM stocks st
INNER JOIN products p 
    ON st.product_id = p.product_id
INNER JOIN stores s 
    ON st.store_id = s.store_id
LEFT JOIN Orders o 
    ON st.store_id = o.store_id
LEFT JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY 
    p.product_name,
    s.store_name,
    st.quantity;
    --------------------------4th query
    -----------------Sort results by product_name.

    SELECT 
    p.product_name,
    s.store_name,
    st.quantity AS available_stock_quantity,
    ISNULL(SUM(oi.quantity), 0) AS total_quantity_sold
FROM stocks st
INNER JOIN products p 
    ON st.product_id = p.product_id
INNER JOIN stores s 
    ON st.store_id = s.store_id
LEFT JOIN Orders o 
    ON st.store_id = o.store_id
LEFT JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY 
    p.product_name,
    s.store_name,
    st.quantity
ORDER BY 
    p.product_name;








