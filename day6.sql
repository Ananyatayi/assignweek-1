CREATE DATABASE EcommerceDB;
USE EcommerceDB;
CREATE TABLE Customers (
    CustomerId INT,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Email VARCHAR(100)
);
CREATE TABLE Products (
    ProductId INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
CREATE TABLE Orders (
    OrderId INT,
    CustomerId INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);
CREATE TABLE OrderItems (
    OrderItemId INT,
    OrderId INT,
    ProductId INT,
    Quantity INT
);
ALTER TABLE Customers ADD PRIMARY KEY (CustomerId);
ALTER TABLE Products ADD PRIMARY KEY (ProductId);
ALTER TABLE Orders ADD PRIMARY KEY (OrderId);
ALTER TABLE OrderItems ADD PRIMARY KEY (OrderItemId);
ALTER TABLE Orders ADD FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId); 
ALTER TABLE OrderItems ADD FOREIGN KEY (OrderId) REFERENCES Orders(OrderId);
ALTER TABLE OrderItems ADD FOREIGN KEY (ProductId) REFERENCES Products(ProductId);

INSERT INTO Customers VALUES
(1, 'Ananya', 'Bangalore', 'ananya@gmail.com'),
(2, 'tayi', 'Delhi', 'tayi@gmail.com'),
(3, 'thanusha', 'Chennai', 'thanusha@gmail.com'),
(4, 'manasa', 'Mumbai', NULL),
(5, 'Anisah', 'Bangalore', 'aniss@gmail.com');

INSERT INTO Products VALUES
(1, 'Mobile', 'Electronics', 1000),
(2, 'Laptop', 'Electronics', 5000),
(103, 'Chair', 'Furniture', 7000),
(104, 'Table', 'Furniture', 3000),
(105, 'Watch', 'Accessories', 6000);

INSERT INTO Orders VALUES
(201, 1, '2026-02-11', 27000),
(202, 2, '2026-03-05', 60000),
(203, 3, '2026-01-21', 34000),
(204, 1, '2026-04-12', 30000),
(205, 5, '2026-02-09', 40000);

INSERT INTO OrderItems VALUES
(1, 201, 101, 2),
(2, 202, 102, 1),
(3, 203, 105, 3),
(4, 204, 103, 2),
(5, 205, 104, 1),
(6, 201, 105, 1);

SELECT Quantity * 1000 AS EstimatedTotal FROM OrderItems;

SELECT ProductName, Price + 500 AS NewPrice FROM Products;

SELECT ProductName, Price - 200 AS ReducedPrice FROM Products;

SELECT Quantity * 2 AS DoubleQuantity FROM OrderItems;

SELECT OrderId, TotalAmount / 2 AS HalfAmount FROM Orders;
SELECT * FROM Orders WHERE TotalAmount > 10000;

SELECT * FROM Products WHERE Price < 5000;

SELECT * FROM Orders WHERE TotalAmount >= 25000;

SELECT * FROM Products WHERE Price <= 8000;

SELECT * FROM Customers WHERE City = 'Chennai';

SELECT * FROM Customers WHERE City != 'Delhi';

SELECT * FROM Customers 
WHERE City = 'Bangalore' AND CustomerName LIKE 'A%';

SELECT * FROM Products 
WHERE Category = 'Electronics' OR Category = 'Furniture';

SELECT * FROM Orders 
WHERE TotalAmount > 5000 AND TotalAmount < 70000;

SELECT * FROM Customers WHERE City != 'Mumbai';

SELECT * FROM Products WHERE Category != 'Accessories';

SELECT * FROM Products 
WHERE Category IN ('Electronics', 'Furniture');

SELECT * FROM Customers 
WHERE City NOT IN ('Chennai', 'Bangalore');

SELECT * FROM Orders 
WHERE TotalAmount BETWEEN 5000 AND 60000;

SELECT * FROM Orders 
WHERE TotalAmount NOT BETWEEN 5000 AND 60000;

SELECT * FROM Customers WHERE CustomerName LIKE '%a';

SELECT * FROM Products WHERE ProductName LIKE 'M%';

SELECT * FROM Customers WHERE Email IS NULL;

SELECT * FROM Customers WHERE Email IS NOT NULL;

SELECT * FROM Customers WHERE City = 'Chennai';

SELECT * FROM Orders WHERE OrderDate > '2024-02-01';

SELECT * FROM Products WHERE Price > 10000;

SELECT * FROM OrderItems WHERE Quantity = 1;
SELECT * FROM Orders ORDER BY TotalAmount DESC;

SELECT * FROM Customers ORDER BY CustomerName ASC;

SELECT * FROM Products ORDER BY Price DESC;

SELECT * FROM Orders ORDER BY OrderDate ASC;
SELECT CustomerId, COUNT(*) AS TotalOrders
FROM Orders GROUP BY CustomerId;

SELECT CustomerId, SUM(TotalAmount) AS TotalRevenue
FROM Orders GROUP BY CustomerId;

SELECT CustomerId, AVG(TotalAmount) AS AvgOrder
FROM Orders GROUP BY CustomerId;

SELECT ProductId, SUM(Quantity) AS TotalSold
FROM OrderItems GROUP BY ProductId;

SELECT Category, COUNT(*) AS ProductCount
FROM Products GROUP BY Category;

SELECT CustomerId, SUM(TotalAmount) AS Total
FROM Orders GROUP BY CustomerId
HAVING Total > 50000;

SELECT CustomerId, COUNT(*) AS OrdersCount
FROM Orders GROUP BY CustomerId
HAVING OrdersCount > 1;

SELECT ProductId, SUM(Quantity) AS TotalSold
FROM OrderItems GROUP BY ProductId
HAVING TotalSold > 1;

SELECT Category, COUNT(*) AS CountProducts
FROM Products GROUP BY Category
HAVING CountProducts > 1;

SELECT CustomerId, AVG(TotalAmount) AS AvgAmount
FROM Orders GROUP BY CustomerId
HAVING AvgAmount > 20000;

SELECT c.CustomerName, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId;

SELECT p.ProductName, oi.Quantity
FROM Products p
JOIN OrderItems oi ON p.ProductId = oi.ProductId;

SELECT c.CustomerName, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId;

SELECT o.OrderId, p.ProductName, oi.Quantity
FROM Orders o
JOIN OrderItems oi ON o.OrderId = oi.OrderId
JOIN Products p ON oi.ProductId = p.ProductId;

SELECT * FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
JOIN OrderItems oi ON o.OrderId = oi.OrderId
JOIN Products p ON oi.ProductId = p.ProductId;

-- Top customers by revenue
SELECT CustomerId, SUM(TotalAmount) AS Revenue
FROM Orders GROUP BY CustomerId ORDER BY Revenue DESC;


SELECT ProductId, SUM(Quantity) AS Sold
FROM OrderItems GROUP BY ProductId ORDER BY Sold DESC;

SELECT * FROM Customers WHERE Email IS NULL;

-- Monthly revenue
SELECT MONTH(OrderDate) AS Month, SUM(TotalAmount)
FROM Orders GROUP BY MONTH(OrderDate);


SELECT * FROM Orders WHERE TotalAmount > 20000;


SELECT * FROM Products 
WHERE ProductId NOT IN (SELECT ProductId FROM OrderItems);


SELECT * FROM Customers 
WHERE CustomerId NOT IN (SELECT CustomerId FROM Orders);


SELECT CustomerId, SUM(TotalAmount) AS Revenue
FROM Orders GROUP BY CustomerId
ORDER BY Revenue DESC LIMIT 3;


SELECT p.Category, SUM(oi.Quantity)
FROM Products p
JOIN OrderItems oi ON p.ProductId = oi.ProductId
GROUP BY p.Category;

SELECT CustomerId, AVG(TotalAmount)
FROM Orders GROUP BY CustomerId;