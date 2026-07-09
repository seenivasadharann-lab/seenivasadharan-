USE CUSTDB;

1. AGGREGATE WITH JOIN   (SUM, COUNT, MIN, MAX, AVERAGE)

1. FIND TOTAL PURCHASE AMOUNT BY EACH CUSTOMER

SELECT CUSTOMERS.CUSTOMERNAME, SUM(SALES.AMOUNT) AS TOTAL_PURCHASE
FROM CUSTOMERS
INNER JOIN SALES
ON CUSTOMERS.CUSTOMERID = SALES.CUSTOMERID
GROUP BY CUSTOMERS.CUSTOMERNAME;

2. COUNT PRODUCTS PURCHASED  BY EACH CUSTOMER

SELECT CUSTOMERS.CUSTOMERNAME, COUNT(SALES.PRODUCT) AS TOTAL_PRODUCT
FROM CUSTOMERS
INNER JOIN SALES
ON CUSTOMERS.CUSTOMERID = SALES.CUSTOMERID
GROUP BY CUSTOMERS.CUSTOMERNAME;

3. FIND THE HIGHEST PURCHASED AMOUNT WITH CUSTOMER

SELECT CUSTOMERS.CUSTOMERNAME, MAX(SALES.AMOUNT) AS TOTAL_PURCHASE
FROM CUSTOMERS
INNER JOIN SALES
ON CUSTOMERS.CUSTOMERID = SALES.CUSTOMERID
GROUP BY CUSTOMERS.CUSTOMERNAME;

46. SELECT c.CustomerName, SUM(s.Amount) AS Total FROM Customers c JOIN Sales s 
ON c.CustomerID = s.CustomerID GROUP BY c.CustomerID, c.CustomerName;

47. SELECT c.CustomerName, COUNT(s.Product) AS TotalProducts 
FROM Customers c JOIN Sales s ON c.CustomerID = s.CustomerID 
GROUP BY c.CustomerID, c.CustomerName;

48. SELECT c.CustomerName, MAX(s.Amount) AS MaxPurchase 
FROM Customers c JOIN Sales s ON c.CustomerID = s.CustomerID 
GROUP BY c.CustomerID, c.CustomerName;

49. SELECT c.CustomerName, MIN(s.Amount) AS MinPurchase 
FROM Customers c JOIN Sales s ON c.CustomerID = s.CustomerID 
GROUP BY c.CustomerID, c.CustomerName;

50. SELECT c.CustomerName, AVG(s.Amount) AS AvgSales 
FROM Customers c JOIN Sales s ON c.CustomerID = s.CustomerID 
GROUP BY c.CustomerID, c.CustomerName;

51. SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmpCount 
FROM Departments d LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID 
GROUP BY d.DepartmentID, d.DepartmentName;

52. SELECT c.City, SUM(s.Amount) AS TotalSales 
FROM Customers c JOIN Sales s ON c.CustomerID = s.CustomerID 
GROUP BY c.City;

53. SELECT d.DepartmentName, SUM(e.Salary) AS TotalSalary 
FROM Departments d JOIN Employees e ON d.DepartmentID = e.DepartmentID 
GROUP BY d.DepartmentID, d.DepartmentName;

54. SELECT c.CustomerName, COUNT(o.OrderID) AS TotalOrders 
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.CustomerName;

55. SELECT c.CustomerName, SUM(s.Amount) AS Total 
FROM Customers c JOIN Sales s ON c.CustomerID = s.CustomerID 
GROUP BY c.CustomerID, c.CustomerName HAVING Total > 50000;

56. SELECT e.EmployeeName, d.DepartmentName, p.ProjectName 
FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID 
LEFT JOIN Employee_Projects ep 
ON e.EmployeeID = ep.EmployeeID LEFT JOIN Projects p ON ep.ProjectID = p.ProjectID;

57. SELECT c.CustomerName, o.OrderID, o.OrderDate, p.ProductName 
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID 
JOIN Products p ON o.ProductID = p.ProductID;

58. SELECT s.StudentName, c.CourseName, t.TeacherName AS Instructor 
FROM Students s JOIN Enrollments e ON s.StudentID = e.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID LEFT JOIN Teachers t ON c.InstructorID = t.TeacherID;

59. SELECT e.EmployeeName AS Employee, m.EmployeeName AS Manager 
FROM Employees e LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;

60. SELECT p.ProductName, c.CategoryName, s.SupplierName 
FROM Products p LEFT JOIN Categories c ON p.CategoryID = c.CategoryID 
LEFT JOIN Suppliers s ON p.SupplierID = s.SupplierID;

61. SELECT o.OrderID, c.CustomerName, sh.ShippingStatus 
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID 
LEFT JOIN Shipping sh ON o.OrderID = sh.OrderID;

62. SELECT s.SaleID, p.ProductName, c.CustomerName, s.Amount 
FROM Sales s JOIN Products p ON s.Product = p.ProductName 
JOIN Customers c ON s.CustomerID = c.CustomerID;

63. SELECT p.PatientName, d.DoctorName 
FROM Patients p JOIN Doctors d ON p.DoctorID = d.DoctorID;

64. 





























