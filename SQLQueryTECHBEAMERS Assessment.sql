create database TECHBEAMER
use TECHBEAMER

----TABLE=> WORKER....----

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY, 
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT,
	JOINING_DATE VARCHAR(20),
	DEPARTMENT VARCHAR(25),
)

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '2014-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '2014-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '2014-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '2014-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '2014-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '2014-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '2014-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09.00.00', 'Admin')

SELECT * FROM WORKER


----TABLE=> BONUS....----

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE VARCHAR(20),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        )

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '2016-02-20'),
		(002, 3000, '2016-06-11'),
		(003, 4000, '2016-02-20'),
		(001, 4500, '2016-02-20'),
		(002, 3500, '2016-06-11')

SELECT * FROM BONUS

----TABLE=> TITLE....----

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM VARCHAR(40),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        )

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00')
 SELECT * FROM TITLE

 ----QUESTIONS AND ANSWERS----
 --Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
 SELECT FIRST_NAME AS 'WORKER_NAME' FROM WORKER

 --Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
 SELECT UPPER(FIRST_NAME) FROM WORKER

 --Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
 SELECT DISTINCT DEPARTMENT FROM WORKER

 --Q-4. Write an SQL query to print the first three characters of FIRST_NAME from the Worker table.
 SELECT SUBSTRING(FIRST_NAME,1,3)AS 'SUBSTRING' FROM WORKER

 --Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
 SELECT INSTR(FIRST_NAME,'a') FROM WORKER WHERE FIRST_NAME='Amitabh'

 --Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
 SELECT RTRIM(FIRST_NAME) FROM WORKER
 
 --Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
 SELECT LTRIM(DEPARTMENT) AS 'DEPT' FROM WORKER

 --Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
SELECT DISTINCT LEN(DEPARTMENT) AS 'LENGTH' FROM WORKER

--Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') AS 'REPLACE' FROM WORKER

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'COMPLETE_NAME' FROM WORKER

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC,DEPARTMENT DESC

--Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME IN ('Vipul','satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM WORKER WHERE DEPARTMENT='ADMIN'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____h%'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER WHERE SALARY BETWEEN 10000 AND 500000

--Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014. 
SELECT* FROM WORKER WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) AS 'COUNT' FROM WORKER WHERE DEPARTMENT='ADMIN'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000)

--Q-23. Write an SQL query to fetch the no. of workers for each department in descending order.
SELECT DEPARTMENT, COUNT(WORKER_ID) AS 'NO_OF WORKERS' FROM WORKER
GROUP BY DEPARTMENT
ORDER BY 'NO_OF WORKERS' DESC

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager')

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1

--Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2) <> 0

--Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2) = 0

--Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO WorkerClone FROM Worker

--Q-29. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone)

--Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Worker
MINUS
SELECT * FROM Title

--Q-31. Write an SQL query to show the current date and time.
SELECT GETDATE()

--Q-32. Write an SQL query to show the top n (say 10) records of a table.
SELECT TOP 10 * FROM WORKER ORDER BY SALARY DESC

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM WORKER ORDER BY SALARY DESC
OFFSET 4 ROWS 
FETCH NEXT 1 ROW ONLY

--Q-34. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 )

 --Q-35. Write an SQL query to fetch the list of employees with the same salary.
 Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID

--Q-36. Write an SQL query to show the second-highest salary from a table.
SELECT MAX(SALARY) AS 'SECOND HIGHEST' FROM WORKER WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM WORKER)

--Q-37. Write an SQL query to show one row twice in the results from a table.
select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR'

--Q-38. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone)

--Q-39. Write an SQL query to fetch the first 50% of records from a table.
SELECT * FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker)

--Q-40. Write an SQL query to fetch the departments that have less than five people in them.
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5

--Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT

--Q-42. Write an SQL query to show the last record from a table.
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker)

--Q-43. Write an SQL query to fetch the first row of a table.
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker)

--Q-44. Write an SQL query to fetch the last five records from a table.
SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary

--Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc

--Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc

--Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc

--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
 SELECT DEPARTMENT, sum(Salary) AS 'TOTAL SALARIES' from worker group by DEPARTMENT

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker)