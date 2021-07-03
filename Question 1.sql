CREATE database TEST;
USE TEST;
CREATE TABLE Employee(EID int, Ename char(3), Pid char(4));
select * from Employee; /* Used table import wizard to import data*/

CREATE TABLE Project(Pid char(4), Pname char(7));
select * from Project; /* Used table import wizard to import data*/


select Pname 
from Project
where Not exists
(
SELECT * from Employee where Project.Pid = Employee.Pid
);

SELECT e2.Ename FROM Employee e1, Employee e2 
WHERE e1.Pid = e2.Pid
AND e1.EID != e2.EID 
AND e1.Ename = "ABC";

SELECT Pname, count(*)
FROM Project
JOIN Employee On Project.Pid=Employee.Pid
group by Pname
Order by count(*);

SELECT Pname
FROM Project
JOIN Employee On Project.Pid=Employee.Pid
GROUP BY Pname
HAVING count(*) > 1;

SELECT Pname, Ename
FROM Project
LEFT JOIN Employee On Project.Pid=Employee.Pid
order by Pname, Ename;
