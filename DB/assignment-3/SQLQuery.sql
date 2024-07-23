--1.	Display all the employees Data.
select * 
from Employee
--2.Display the employee First name, last name, Salary and Department number.
 select Fname,Lname,Salary,Dno from Employee

 --3.Display all the projects names, locations and the department which is responsible for it.
 select Pname ,Plocation, D.Dname from Project P ,Departments D
 where P.Dnum=D.Dnum

--4.If you know that the company policy is to pay an annual commission for each employee with specific percent equals 10% of his/her annual salary .Display each employee full name and his annual commission in an ANNUAL COMM column (alias).


select Fname+' '+Lname FullName ,(Salary*12)*0.1 as [ANNUAL COMM]
from Employee

--4.Display the employees Id, name who earns more than 1000 LE monthly.
select SSN,Fname 
from Employee 
where salary>1000

--5.Display the employees Id, name who earns more than 10000 LE annually.
select SSN,Fname 
from Employee 
where salary*12>10000

--6.Display the names and salaries of the female employees 
select Fname+' '+Lname FullName ,salary 
from Employee 
where sex ='F'

--7.Display each department id, name which is managed by a manager with id equals 968574.
select Dnum ,Dname 
from Departments
where MGRSSN=968574


--8.Display the ids, names and locations of  the projects which are controlled with department 10. 
select Pnumber,Plocation,Pname 
from Project 
where Dnum=10