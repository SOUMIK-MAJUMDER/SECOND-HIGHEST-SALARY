Create table Worker
(
	Id int,
	Salary int
);

insert into Worker(Id, Salary)
Values
(1,100),
(2,200),
(3,300);

WITH CTE AS
(
    SELECT Salary,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS DENSERANK
    FROM Worker
)
SELECT Salary SecondHighestSalary
FROM CTE
WHERE DENSERANK = 2;
