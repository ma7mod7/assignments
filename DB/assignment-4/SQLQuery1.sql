--part 01// my company
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

--5.Display the employees Id, name who earns more than 1000 LE monthly.
select SSN,Fname 
from Employee 
where salary>1000

--6.Display the employees Id, name who earns more than 10000 LE annually.
select SSN,Fname 
from Employee 
where salary*12>10000

--7.Display the names and salaries of the female employees 
select Fname+' '+Lname FullName ,salary 
from Employee 
where sex ='F'

--8.Display each department id, name which is managed by a manager with id equals 968574.
select Dnum ,Dname 
from Departments
where MGRSSN=968574


--9.Display the ids, names and locations of  the projects which are controlled with department 10. 
select Pnumber,Plocation,Pname 
from Project 
where Dnum=10

--==========================================================
--Part 02 // ITI
--1.Get all instructors Names without repetition
select  distinct  Ins_Name 
from Instructor

-- 2. Display instructor Name and Department Name  
select Ins_Name ,Dept_Name 
from Instructor ins left outer join  Department de
on de.Dept_Id=ins.Dept_Id


--3.Display student full name and the name of the course he is taking For only courses which have a grade  
select St_Fname +' '+St_Lname FullName , c.Crs_Name
from Student st join Stud_course stc on st.St_Id =stc.St_Id join Course c on stc.Crs_Id=c.Crs_Id
where stc.Grade is not null
--======================================================================================--
--Part 03 // My company
 
 --1.	Display the Department id, name and id and the name of its manager.
 select D.Dnum,D.Dname, E.SSN ,E.Fname
 from Departments D, Employee E
 where D.MGRSSN = E.SSN

 --2.Display the name of the departments and the name of the projects under its control.
 select D.Dname ,P.Pname
 from Departments D,Project P
 where D.Dnum=P.Dnum

 --3.Display the full data about all the dependence associated with the name of the employee they depend on .
 select D.*,E.Fname
 from Employee E,Dependent D
 where E.SSN=D.ESSN 

 --4.Display the Id, name and location of the projects in Cairo or Alex city.
 select Pnumber,Pname,Plocation
 from Project 
 where City in ('Cairo','Alex')

 --5.Display the Projects full data of the projects with a name starting with "a" letter.
 select *
 from Project
 where Pname like 'a%'

 --6.display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
 select *
 from Employee 
 where Salary between  1000 and 2000 and Dno=30


 --7.Retrieve the names of all employees in department 10 who work more than or equal 10 hours per week on the "AL Rabwah" project.
select E.Fname+' '+ E.Lname FullName
from Employee E,Works_for W,Project P
where E.SSN=W.ESSn and P.Pnumber=W.Pno and E.Dno=10 and W.Hours>=10  and P.Pname='AL Rabwah'

 --8.Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name
select E.Fname+' '+ E.Lname FullName ,P.Pname
from Employee E,Works_for W,Project P
where E.SSN=W.ESSn and P.Pnumber=W.Pno
 order by P.Pname

 --9.For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
select P.Pnumber ,D.Dname,E.Lname,E.Address,E.Bdate
from Departments D,Project P,Employee E
where D.Dnum=P.Dnum and E.SSN=D.MGRSSN and P.City='Cairo'