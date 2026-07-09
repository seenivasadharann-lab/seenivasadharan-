CREATE DATABASE CUSTOMERDB;
USE CUSTOMERDB;

CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    Amount INT
);

INSERT INTO Orders VALUES
(1, 'Arjun', '2025-01-10', 2500),
(2, 'Priya', '2025-02-15', 5400),
(3, 'Kavin', '2025-03-12', 3000),
(4, 'Meena', '2025-03-18', 7200),
(5, 'Rahul', '2025-04-01', 1500),
(6, 'Divya', '2025-04-08', 6800),
(7, 'Sanjay', '2025-05-05', 4700),
(8, 'Rekha', '2025-05-15', 5200);

1. SELECT CURDATE();

2. SELECT NOW();

3. SELECT CustomerName, YEAR(OrderDate) AS OrderYear 
FROM Orders;

4. SELECT OrderID, MONTH(OrderDate) AS OrderMonth 
FROM Orders;

5. SELECT OrderID, DAY(OrderDate) AS OrderDay 
FROM Orders;

6.SELECT * FROM Orders 
WHERE YEAR(OrderDate) = 2025;

7.SELECT * FROM Orders 
WHERE MONTH(OrderDate) = 3;

8.SELECT * FROM Orders 
WHERE DAY(OrderDate) = 15;

9. SELECT OrderID, DATEDIFF(CURDATE(), OrderDate) AS DaysElapsed 
FROM Orders;

10. SELECT MAX(OrderDate) AS LatestOrderDate 
FROM Orders;

11. SELECT MIN(OrderDate) AS OldestOrderDate 
FROM Orders;

12. SELECT * FROM Orders 
WHERE YEAR(OrderDate) = 2025 AND MONTH(OrderDate) = 4;

13. SELECT MONTH(OrderDate) AS Month, COUNT(*) AS TotalOrders 
FROM Orders 
GROUP BY MONTH(OrderDate);

14. SELECT MONTH(OrderDate) AS OrderMonth, SUM(Amount) AS TotalSales 
FROM Orders 
GROUP BY MONTH(OrderDate);

15. SELECT * FROM Orders 
WHERE DATEDIFF(CURDATE(), OrderDate) BETWEEN 0 AND 30;

16.SELECT YEAR(CURDATE()) AS CurrentYear;

17. SELECT MONTH(CURDATE()) AS CurrentMonth;

18. SELECT DAY(CURDATE()) AS CurrentDay;

19. SELECT DATEDIFF('2027-01-01', '2025-01-01') AS DateDifference;

20. SELECT DISTINCT CustomerName 
FROM Orders 
WHERE YEAR(OrderDate) = YEAR(CURDATE()) AND MONTH(OrderDate) = MONTH(CURDATE());

21. SELECT * FROM Orders 
WHERE OrderDate < '2025-01-01';

22. SELECT * FROM Orders 
ORDER BY OrderDate ASC;

23. SELECT * FROM Orders 
ORDER BY OrderDate DESC;

24. SELECT * FROM Orders 
WHERE OrderDate > '2025-03-31';

25. SELECT YEAR(OrderDate) AS SalesYear, SUM(Amount) AS TotalSales 
FROM Orders 
GROUP BY YEAR(OrderDate);

26. SELECT OrderID, MONTHNAME(OrderDate) AS MonthName 
FROM Orders;

27. SELECT OrderID, CustomerName, DATEDIFF(CURDATE(), OrderDate) AS DaysAgo 
FROM Orders;

28. SELECT * FROM Orders 
WHERE DAYOFWEEK(OrderDate) IN (1, 7);

29. SELECT * FROM Orders 
WHERE QUARTER(OrderDate) = 1;

30. SELECT YEAR(OrderDate) Yr, QUARTER(OrderDate) Qtr, SUM(Amount) Sales 
FROM Orders 
GROUP BY 1, 2;