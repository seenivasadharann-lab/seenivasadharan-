CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

CREATE TABLE IF NOT EXISTS Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);

INSERT INTO Employees (EmpID, Name, Department, Salary, City) VALUES
(101, 'Arjun', 'HR', 45000, 'Chennai'),
(102, 'Priya', 'IT', 60000, 'Bangalore'),
(103, 'Kavin', 'Finance', 55000, 'Chennai'),
(104, 'Meena', 'IT', 72000, 'Hyderabad'),
(105, 'Rahul', 'HR', 48000, 'Pune'),
(106, 'Divya', 'Sales', 50000, 'Chennai'),
(107, 'Sanjay', 'IT', 80000, 'Bangalore'),
(108, 'Rekha', 'Finance', 62000, 'Mumbai'),
(109, 'Ajay', 'Sales', 47000, 'Delhi'),
(110, 'Sneha', 'HR', 53000, 'Chennai');

1. SELECT * FROM Employees;

2.SELECT Name, Salary 
FROM Employees;

3.SELECT Name, Department 
FROM Employees;

4. SELECT City FROM Employees;

5. SELECT EmpID, Name FROM Employees

6. SELECT Department FROM Employees

7. SELECT Salary FROM Employees

8. SELECT NAME,CITY FROM EMPLOYEES

9. SELECT EMPID FROM EMPLOYEES

10. SELECT * FROM EMPLOYEES

11. SELECT * FROM EMPLOYEES WHERE CITY='CHENNAI'

12. SELECT * FROM EMPLOYEES WHERE DEPARTMENT='IT'

13. SELECT * FROM EMPLOYEES WHERE SALARY>50000

14. SELECT * FROM EMPLOYEES WHERE SALARY<60000

15. SELECT * FROM EMPLOYEES WHERE SALARY=72000;

16. SELECT * FROM EMPLOYEES WHERE CITY='Bangalore'

17. SELECT * FROM EMPLOYEES WHERE CITY='Hyderabad'

18. SELECT * FROM EMPLOYEES WHERE DEPARTMENT='FINANCE'

19. SELECT * FROM EMPLOYEES WHERE salary>=55000

20. select * FROM EMPLOYEES WHERE SALARY<=50000

21. SELECT DISTINCT Department FROM Employees

22. SELECT DISTINCT City FROM Employees

23. SELECT DISTINCT Salary FROM Employees

24. SELECT DISTINCT Department, City FROM Employees

25. SELECT DISTINCT City FROM Employees 
ORDER BY City ASC

26. SELECT * FROM Employees 
ORDER BY Salary ASC

27. SELECT * FROM Employees 
ORDER BY Salary DESC

28. SELECT * FROM Employees 
ORDER BY Name ASC

29. SELECT * FROM Employees 
ORDER BY City ASC

30. SELECT * FROM Employees 
ORDER BY Department ASC, Salary 

31. SELECT * FROM Employees 
ORDER BY EmpID 

32. SELECT * FROM Employees 
ORDER BY Salary DESC

33. SELECT * FROM Employees 
ORDER BY Department ASC;

34. SELECT * FROM Employees 
ORDER BY City DESC;

35. SELECT * FROM Employees 
ORDER BY Salary ASC, City ASC;

36. SELECT * FROM Employees 
ORDER BY Salary DESC 
LIMIT 3;

37. SELECT * FROM EMPLOYEES 
LIMIT 5;

38.SELECT * FROM Employees 
ORDER BY Salary ASC 
LIMIT 2;

39. SELECT * FROM EMPLOYEES
WHERE DEPARTMENT='IT'
LIMIT 4;

40. SELECT * FROM Employees 
ORDER BY Name ASC 
LIMIT 3;

41. SELECT DISTINCT Salary FROM Employees 
ORDER BY Salary DESC 
LIMIT 5;

42. SELECT * FROM Employees 
WHERE City = 'Chennai' 
LIMIT 2;

43. SELECT * FROM Employees 
ORDER BY Salary DESC 
LIMIT 1;

44. SELECT * FROM Employees 
ORDER BY EmpID ASC 
LIMIT 3;

45. SELECT * FROM Employees 
WHERE Department = 'Finance' 
LIMIT 2;

46. SELECT * FROM Employees 
WHERE City = 'Chennai' AND Salary > 50000;

47. SELECT * FROM Employees 
WHERE Department = 'IT' AND Salary > 70000;

48. SELECT * FROM Employees 
WHERE Department = 'HR' AND City = 'Chennai';

49. SELECT * FROM Employees 
WHERE Department = 'Finance' AND Salary < 60000;

50. SELECT * FROM Employees 
WHERE Department = 'Sales' AND City = 'Delhi';

51. SELECT * FROM Employees 
WHERE City = 'Bangalore' AND Salary > 60000;

52. SELECT * FROM Employees 
WHERE City = 'Hyderabad' AND Department = 'IT';

53. SELECT * FROM Employees 
WHERE Salary > 45000 AND Salary < 70000;

54. SELECT * FROM Employees 
WHERE Department = 'HR' AND Salary < 55000;

55. SELECT * FROM Employees 
WHERE Department = 'Finance' AND City = 'Chennai';

56. SELECT * FROM Employees 
WHERE City = 'Chennai' OR City = 'Bangalore';

57. SELECT * FROM Employees 
WHERE Department = 'HR' OR Department = 'Finance';

58. SELECT * FROM Employees 
WHERE Salary < 50000 OR Salary > 70000;

59. SELECT * FROM Employees 
WHERE City = 'Pune' OR City = 'Hyderabad';

60. SELECT * FROM Employees 
WHERE Department = 'Sales' OR Department = 'IT';

61. SELECT * FROM Employees 
WHERE Salary = 50000 OR Salary = 60000;

62. SELECT * FROM Employees 
WHERE City = 'Chennai' OR City = 'Delhi';

63. SELECT * FROM Employees 
WHERE Department = 'Finance' OR Department = 'HR';

64. SELECT * FROM Employees 
WHERE Salary < 45000 OR Salary > 75000;

65. SELECT * FROM Employees 
WHERE City = 'Bangalore' OR City = 'Mumbai';

66. SELECT * FROM Employees 
WHERE City != 'Chennai';

67. SELECT * FROM Employees 
WHERE Department != 'HR';

68. SELECT * FROM Employees 
WHERE Salary != 50000;

69. SELECT * FROM Employees 
WHERE City != 'Bangalore';

70. SELECT * FROM Employees 
WHERE Department != 'IT';

71. SELECT * FROM Employees 
WHERE City != 'Hyderabad';

72. SELECT * FROM Employees 
WHERE Department != 'Sales';

73. SELECT * FROM Employees 
WHERE NOT Salary > 70000;

74. SELECT * FROM Employees 
WHERE City != 'Pune';

75. SELECT * FROM Employees 
WHERE EmpID != 101;

76. SELECT * FROM Employees 
WHERE Salary BETWEEN 50000 AND 70000;

77. SELECT * FROM Employees 
WHERE EmpID BETWEEN 103 AND 108;

78. SELECT * FROM Employees 
WHERE Salary BETWEEN 45000 AND 55000;

79. SELECT * FROM Employees 
WHERE EmpID BETWEEN 101 AND 105;

80. SELECT * FROM Employees 
WHERE Salary BETWEEN 60000 AND 80000;

81. SELECT * FROM Employees 
WHERE Salary BETWEEN 47000 AND 62000;

82. SELECT * FROM Employees 
WHERE EmpID BETWEEN 106 AND 110;

83. SELECT * FROM Employees 
WHERE Salary BETWEEN 48000 AND 72000;

84. SELECT * FROM Employees 
WHERE Salary BETWEEN 45000 AND 50000;

85. SELECT * FROM Employees 
WHERE EmpID BETWEEN 102 AND 109;

86. SELECT * FROM Employees 
WHERE City IN ('Chennai', 'Bangalore', 'Pune');

87. SELECT * FROM Employees 
WHERE Department IN ('HR', 'IT');

88. SELECT * FROM Employees 
WHERE Salary IN (45000, 50000, 80000);

89. SELECT * FROM Employees 
WHERE City IN ('Hyderabad', 'Mumbai');

90. SELECT * FROM Employees 
WHERE Department IN ('Finance', 'Sales');

91. SELECT * FROM Employees 
WHERE EmpID IN (101, 105, 109);

92. SELECT * FROM Employees 
WHERE Salary IN (55000, 62000);

93 SELECT * FROM Employees 
WHERE City IN ('Chennai', 'Delhi');

94. SELECT * FROM Employees 
WHERE Department IN ('IT', 'HR', 'Sales');

95. SELECT * FROM Employees 
WHERE Salary IN (47000, 48000, 53000);

96. SELECT * FROM Employees 
WHERE Name LIKE 'S%';

97. SELECT * FROM Employees 
WHERE Name LIKE '%a';

98. SELECT * FROM Employees 
WHERE Name LIKE '%a%';

99. SELECT * FROM Employees 
WHERE City LIKE 'C%';

100. SELECT * FROM Employees 
WHERE Department LIKE '%s';

101. SELECT * FROM Employees 
WHERE Name LIKE 'A%';

102. SELECT * FROM Employees 
WHERE Name LIKE '%n';

103. SELECT * FROM Employees 
WHERE City LIKE '%e%';

104. SELECT * FROM Employees 
WHERE Department LIKE 'F%';

105. SELECT * FROM Employees 
WHERE Name LIKE '%r%';

106. SELECT * FROM Employees 
WHERE Department = 'IT' 
ORDER BY Salary DESC 
LIMIT 5;

107. SELECT * FROM Employees 
WHERE (City = 'Chennai' OR City = 'Hyderabad') AND Salary > 50000;

108. SELECT * FROM Employees 
WHERE Name LIKE 'A%' AND Salary > 40000;

109. SELECT DISTINCT City FROM Employees 
ORDER BY City ASC;

110. SELECT * FROM Employees 
ORDER BY Salary ASC 
LIMIT 3;

111. SELECT * FROM Employees 
WHERE Department = 'Finance' AND City = 'Chennai' AND Salary > 50000;

112. SELECT * FROM Employees 
ORDER BY Department ASC, Salary ASC;

113. SELECT * FROM Employees 
WHERE City != 'Chennai' AND Salary > 45000;

114. SELECT * FROM Employees 
WHERE Department = 'HR' 
ORDER BY Salary DESC 
LIMIT 2;

115. SELECT * FROM Employees 
WHERE Name LIKE '%a%' AND City = 'Bangalore';



