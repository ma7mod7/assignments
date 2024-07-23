--Part 01 // ITI
--1.Get all instructors Names without repetition
select  distinct  Ins_Name 
from Instructor

-- 2. Display instructor Name and Department Name  
select Ins_Name ,Dept_Name 
from Instructor ins left join  Department de
on de.Dept_Id=ins.Dept_Id


--3.Display student full name and the name of the course he is taking For only courses which have a grade  
select St_Fname +' '+St_Lname FullName , c.Crs_Name
from Student st join Stud_course stc on st.St_Id =stc.St_Id join Course c on stc.Crs_Id=c.Crs_Id
where stc.Grade is not null

--======================================================================================--
--Part 02 // My company
 
 --1.	Display the Department id, name and id and the name of its manager.
 select D.Dnum,D.Dname, E.SSN ,E.Fname
 from Departments D, Employee E
 where E.SSN=D.MGRSSN

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


--======================================================================================--
--Part 03 //ITI
--1.Retrieve a number of students who have a value in their age. 
select count(*) as [number of student]
from Student
where St_Age is not null


--2.Display number of courses for each topic name 
select T.Top_Name ,count(C.Crs_Id) as [number of courses]
from Course C, Topic T
where T.Top_Id=C.Top_Id
group by T.Top_Name


--3.Select Student first name and the data of his supervisor 
select s.St_Fname,sp.*
from Student s,Student sp
where sp.St_Id=s.St_super

--4.	Display student with the following Format (use isNull function)
--Student ID | Student Full Name | Department name
select St_Id,CONCAT(IsNull(St_Fname,'not found'),' ',isNull(St_Lname,'not found')) FullName ,D.Dept_Name DepartmentName
from Student S,Department D
where s.Dept_Id=D.Dept_Id

--5.Select instructor name and his salary but if there is no salary display value ‘0000’ . “use one of Null Function” 
select Ins_Name,IsNull(Salary,0000) 
from Instructor  
		
--6.Select Supervisor first name and the count of students who supervises on them
select sp.St_Fname ,count(s.St_Id)
from  Student s,Student sp
where sp.St_Id=s.St_super
group by sp.St_Fname


--7.Display max and min salary for instructors
select max(Salary) maxsalary ,min(Salary) minsalary
from Instructor


--8.Select Average Salary for instructors 
select avg(salary)
from Instructor


--9.Display instructors who have salaries less than the average salary of all instructors.
SELECT *
FROM Instructor
WHERE salary < (SELECT AVG(salary) FROM Instructor);


--10.	Display the Department name that contains the instructor who receives the minimum salary
select D.Dept_Name
from Department D join Instructor Ins 
on  D.Dept_Id=Ins.Dept_Id
where Ins.Salary= (select Min(salary) from Instructor)