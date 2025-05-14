# Create database and use it
CREATE DATABASE SalesAnalysis;
USE SalesAnalysis;

# Create categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

# Create products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    SalesAmount DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

# Create sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SalesDate DATE,
    SalesAmount DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

# Insert data into categories
INSERT INTO Categories VALUES
(1, 'Electronics'), 
(2, 'Furniture'), 
(3, 'Clothing');

# Insert data into products
INSERT INTO Products VALUES
(1, 'Laptop', 1, 1500),
(2, 'Phone', 1, 800),
(3, 'Chair', 2, 100),
(4, 'Sofa', 2, 300),
(5, 'T-Shirt', 3, 20),
(6, 'Jeans', 3, 40);

# Insert data into sales
INSERT INTO Sales VALUES
(1, 1, '2025-01-01', 1500),
(2, 2, '2025-01-02', 800),
(3, 3, '2025-01-03', 100),
(4, 4, '2025-01-04', 300),
(5, 5, '2025-01-05', 20),
(6, 6, '2025-01-06', 40);

# A. Show cumulative sales (running total) for each product
SELECT 
    p.ProductName,
    s.SalesDate,
    s.SalesAmount,
    SUM(s.SalesAmount) OVER (PARTITION BY p.ProductName ORDER BY s.SalesDate) AS RunningTotal
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID;

# B. Get top-selling product from each category
SELECT c.CategoryName, p.ProductName, p.SalesAmount
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE (p.CategoryID, p.SalesAmount) IN (
    SELECT CategoryID, MAX(SalesAmount) FROM Products GROUP BY CategoryID
);

# C. Show monthly sales and average sales per product using CTE
WITH MonthlySales AS (
    SELECT 
        ProductID,
        MONTH(SalesDate) AS Month,
        SUM(SalesAmount) AS Total
    FROM Sales
    GROUP BY ProductID, MONTH(SalesDate)
)
SELECT 
    ProductID,
    Month,
    Total,
    AVG(Total) OVER (PARTITION BY ProductID) AS AvgSales
FROM MonthlySales;

