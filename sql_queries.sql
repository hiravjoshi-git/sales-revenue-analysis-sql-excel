-- KPI Metrics
SELECT 
  SUM(Products.Price * OrderDetails.Quantity) AS Total_Revenue,
  COUNT(DISTINCT Orders.OrderID) AS Total_Orders,
  SUM(OrderDetails.Quantity) AS Total_Quantity
FROM Orders
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID;


-- Monthly Revenue Trend
SELECT 
  YEAR(Orders.OrderDate) AS order_year,
  MONTH(Orders.OrderDate) AS order_month,
  SUM(Products.Price * OrderDetails.Quantity) AS revenue
FROM Orders
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY 
  YEAR(Orders.OrderDate),
  MONTH(Orders.OrderDate)
ORDER BY 
  order_year,
  order_month;


-- Revenue by Category
SELECT 
  Categories.CategoryName,
  SUM(Products.Price * OrderDetails.Quantity) AS revenue
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Categories.CategoryName
ORDER BY revenue DESC;

