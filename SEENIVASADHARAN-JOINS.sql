-- ==========================================
-- DATABASE SETUP
-- ==========================================
CREATE DATABASE IF NOT EXISTS CUSTDB;
USE CUSTDB;

-- Drop tables if they already exist to ensure a clean setup
DROP TABLE IF EXISTS Invoices;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Employee_Projects;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Customers;

-- ==========================================
-- 1. ORIGINAL CUSTOMERS & SALES TABLES (From your file)
-- ==========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Arjun', 'Chennai'),
(2, 'Priya', 'Bangalore'),
(3, 'Kavin', 'Chennai'),
(4, 'Meena', 'Hyderabad'),
(5, 'Rahul', 'Pune');

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Amount INT
);

-- Note: CustomerID 7 and 6 don't exist in Customers table (perfect for testing RIGHT/FULL JOINs!)
INSERT INTO Sales VALUES
(106, 7, 'Pendrive', 600),
(101, 1, 'Laptop', 55000),
(102, 2, 'Mobile', 25000),
(103, 3, 'Tablet', 18000),
(104, 1, 'Mouse', 1000),
(105, 4, 'Keyboard', 2500),
(109, 6, 'Pendrive', 600);


-- ==========================================
-- 2. EMPLOYEES & DEPARTMENTS TABLES
-- ==========================================

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary INT,
    ManagerID INT
);

INSERT INTO Departments VALUES 
(10, 'IT'),
(20, 'Sales'),
(30, 'HR'),
(40, 'Marketing'),
(50, 'Finance'); -- Department with no employees

INSERT INTO Employees VALUES 
(101, 'Amit', 10, 60000, NULL),     -- Top manager
(102, 'Bhavna', 10, 75000, 101),   -- Managed by Amit
(103, 'Chetan', 20, 45000, 101),   -- Managed by Amit
(104, 'Divya', 30, 50000, 102),    -- Managed by Bhavna
(105, 'Esha', NULL, 55000, NULL);  -- No department, no manager


-- ==========================================
-- 3. PROJECTS & EMPLOYEE_PROJECTS TABLES
-- ==========================================

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50)
);

CREATE TABLE Employee_Projects (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID)
);

INSERT INTO Projects VALUES 
(501, 'Alpha'),
(502, 'Beta'),
(503, 'Gamma'),
(504, 'Delta'); -- Project with no employees

INSERT INTO Employee_Projects VALUES 
(101, 501),
(101, 502),
(102, 502),
(103, 503);


-- ==========================================
-- 4. STUDENTS, COURSES & ENROLLMENTS TABLES
-- ==========================================

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    InstructorID INT
);

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID)
);

INSERT INTO Students VALUES 
(1, 'Rohan'),
(2, 'Simran'),
(3, 'Yash'),
(4, 'Ananya'); -- Not enrolled in any course

INSERT INTO Courses VALUES 
(301, 'Java Core', 1),
(302, 'Python Data Science', 2),
(303, 'SQL Databases', 3),
(304, 'Web Development', NULL); -- No instructor assigned

INSERT INTO Enrollments VALUES 
(1, 301),
(1, 303),
(2, 302),
(3, 303);


-- ==========================================
-- 5. TEACHERS & SUBJECTS TABLES
-- ==========================================

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50)
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50),
    TeacherID INT
);

INSERT INTO Teachers VALUES 
(1, 'Dr. Sharma'),
(2, 'Prof. Verma'),
(3, 'Dr. Reddy'),
(4, 'Mrs. Sen'); -- No subjects assigned

INSERT INTO Subjects VALUES 
(201, 'Mathematics', 1),
(202, 'Physics', 2),
(203, 'Chemistry', 3),
(204, 'Biology', NULL); -- No teacher assigned


-- ==========================================
-- 6. SUPPLIERS, CATEGORIES & PRODUCTS TABLES
-- ==========================================

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT,
    SupplierID INT,
    Price INT
);

INSERT INTO Suppliers VALUES 
(1, 'Logitech'),
(2, 'Dell'),
(3, 'HP'),
(4, 'Apple');

INSERT INTO Categories VALUES 
(10, 'Electronics'),
(20, 'Accessories'),
(30, 'Office Supply'),
(40, 'Furniture');

INSERT INTO Products VALUES 
(1001, 'Laptop', 10, 2, 55000),
(1002, 'Mobile', 10, 4, 25000),
(1003, 'Tablet', 10, 2, 18000),
(1004, 'Mouse', 20, 1, 1000),
(1005, 'Keyboard', 20, 1, 2500),
(1006, 'Gel Pen Set', 30, NULL, 150); -- Product with no supplier


-- ==========================================
-- 7. ORDERS, INVOICES & SHIPPING TABLES
-- ==========================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT
);

CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    Amount INT
);

CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY,
    OrderID INT,
    ShippingStatus VARCHAR(20)
);

INSERT INTO Orders VALUES 
(901, 1, '2026-05-10', 1001),
(902, 2, '2026-05-12', 1002),
(903, 3, '2026-05-15', 1003),
(904, NULL, '2026-05-18', 1004); -- Missing customer info

INSERT INTO Invoices VALUES 
(8001, 1, 55000),
(8002, 2, 25000),
(8003, NULL, 15000); -- Missing customer info

INSERT INTO Shipping VALUES
(701, 901, 'Delivered'),
(702, 902, 'In Transit'),
(703, 903, 'Pending');

1. SELECT Customers.CustomerName, Sales.Product
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID;

2. SELECT Customers.CustomerName, Sales.Amount
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID;

3. SELECT DISTINCT Customers.CustomerName
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID;

4. SELECT Customers.City, Sales.Product
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID;

5. SELECT Sales.Product
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID
WHERE Customers.City = 'Chennai';

6. SELECT Employees.EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

7. SELECT DISTINCT Customers.CustomerName
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID
WHERE Sales.Product = 'Laptop';

8. SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName, Customers.City
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

9. SELECT Sales.Product
FROM Employees
INNER JOIN Sales ON Employees.EmployeeID = Sales.EmployeeID
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'IT';

10. SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

11. SELECT Employees.EmployeeName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'Sales';

12. SELECT Students.StudentName, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

13. SELECT DISTINCT Customers.CustomerName
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID
WHERE Sales.Amount > 20000;

14. SELECT Employees.EmployeeName, Projects.ProjectName
FROM Employees
INNER JOIN Employee_Projects ON Employees.EmployeeID = Employee_Projects.EmployeeID
INNER JOIN Projects ON Employee_Projects.ProjectID = Projects.ProjectID;

15. SELECT Customers.CustomerName
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID
GROUP BY Customers.CustomerID, Customers.CustomerName
HAVING COUNT(Sales.SaleID) > 1;

16. SELECT Customers.CustomerName, Sales.Product
FROM Customers
LEFT JOIN Sales ON Customers.CustomerID = Sales.CustomerID;

17. SELECT Customers.CustomerName
FROM Customers
LEFT JOIN Sales ON Customers.CustomerID = Sales.CustomerID
WHERE Sales.SaleID IS NULL;

18. SELECT Employees.EmployeeName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

19. SELECT Departments.DepartmentName
FROM Departments
LEFT JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID
WHERE Employees.EmployeeID IS NULL;

20. SELECT Students.StudentName, Enrollments.CourseID
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

21. SELECT Products.ProductName
FROM Products
LEFT JOIN Sales ON Products.ProductID = Sales.ProductID
WHERE Sales.SaleID IS NULL;

22. SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

23. SELECT Employees.EmployeeName
FROM Employees
LEFT JOIN Employee_Projects ON Employees.EmployeeID = Employee_Projects.EmployeeID
WHERE Employee_Projects.ProjectID IS NULL;

24. SELECT Teachers.TeacherName, Subjects.SubjectName
FROM Teachers
LEFT JOIN Subjects ON Teachers.TeacherID = Subjects.TeacherID;

25. SELECT Customers.CustomerName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

26. SELECT Customers.CustomerName, Sales.Product, Sales.Amount
FROM Customers
RIGHT JOIN Sales ON Customers.CustomerID = Sales.CustomerID;

27. SELECT Employees.EmployeeName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

28. SELECT Enrollments.StudentID, Courses.CourseName
FROM Enrollments
RIGHT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

29. SELECT Employee_Projects.EmployeeID, Projects.ProjectName
FROM Employee_Projects
RIGHT JOIN Projects ON Employee_Projects.ProjectID = Projects.ProjectID;

30. SELECT Sales.SaleID, Sales.Product, Sales.Amount
FROM Customers
RIGHT JOIN Sales ON Customers.CustomerID = Sales.CustomerID
WHERE Customers.CustomerID IS NULL;

31. SELECT Teachers.TeacherName, Subjects.SubjectName
FROM Teachers
RIGHT JOIN Subjects ON Teachers.TeacherID = Subjects.TeacherID;

32. SELECT Orders.OrderID, Products.ProductName
FROM Products
RIGHT JOIN Orders ON Products.ProductID = Orders.ProductID;

33. SELECT Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.EmployeeID IS NULL;

34. SELECT Categories.CategoryName, Products.ProductName
FROM Products
RIGHT JOIN Categories ON Products.CategoryID = Categories.CategoryID;

35. SELECT Invoices.InvoiceID, Invoices.Amount, Customers.CustomerName
FROM Customers
RIGHT JOIN Invoices ON Customers.CustomerID = Invoices.CustomerID;

36. SELECT Customers.CustomerName, Sales.Product FROM Customers LEFT JOIN Sales ON Customers.CustomerID = Sales.CustomerID
UNION
SELECT Customers.CustomerName, Sales.Product FROM Customers RIGHT JOIN Sales ON Customers.CustomerID = Sales.CustomerID;

37. SELECT Employees.EmployeeName, Departments.DepartmentName FROM Employees LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
UNION
SELECT Employees.EmployeeName, Departments.DepartmentName FROM Employees RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

38. SELECT s.StudentName, c.CourseName FROM Students s LEFT JOIN Enrollments e ON s.StudentID = e.StudentID 
LEFT JOIN Courses c ON e.CourseID = c.CourseID UNION
SELECT s.StudentName, c.CourseName FROM Students s 
RIGHT JOIN Enrollments e ON s.StudentID = e.StudentID RIGHT JOIN Courses c ON e.CourseID = c.CourseID;

39. SELECT Products.ProductName, Sales.Amount
FROM Products
FULL JOIN Sales ON Products.ProductID = Sales.ProductID;

40. SELECT Teachers.TeacherName, Subjects.SubjectName
FROM Teachers
FULL JOIN Subjects ON Teachers.TeacherID = Subjects.TeacherID;

41. SELECT Customers.CustomerName, Sales.Product
FROM Customers
FULL JOIN Sales ON Customers.CustomerID = Sales.CustomerID
WHERE Customers.CustomerID IS NULL OR Sales.CustomerID IS NULL;

42. SELECT Employees.EmployeeName, Projects.ProjectName
FROM Employees
FULL JOIN Employee_Projects ON Employees.EmployeeID = Employee_Projects.EmployeeID
FULL JOIN Projects ON Employee_Projects.ProjectID = Projects.ProjectID;

43. SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

44. SELECT  Suppliers.SupplierName, Products.ProductName
FROM Categories
FULL JOIN Products ON  Suppliers.SupplierID = Products.SupplierID;

45.SELECT Suppliers.SupplierName, Products.ProductName
FROM Suppliers
RIGHT JOIN Products ON Suppliers.SupplierID = Products.SupplierID;


