CREATE DATABASE daba;
USE daba;

/*Department table*/
CREATE TABLE DeptTable(DeptNo integer ,Dname varchar(100),Loc text);
INSERT INTO DeptTable VALUES(10,'Accounts','Bangalore');
INSERT INTO DeptTable VALUES(20,'IT','Delhi');
INSERT INTO DeptTable VALUES(30,'Production','Chennai');
INSERT INTO DeptTable VALUES(40,'Sales','Hyd');
INSERT INTO DeptTable VALUES(50,'Admn','London');
SELECT * FROM DeptTable;

/*Employee Table*/
CREATE TABLE EmpTable(EmpNo integer,Ename text,Sal integer,Hire_Date date,Commission integer,DeptNo integer,Mgr integer);
INSERT INTO EmpTable VALUES(1001,'Sachin',19000,'1980-1-1',2100,20,1003);
INSERT INTO EmpTable VALUES(1002,'Kapil',15000,'1970-1-1',2300,10,1003);
INSERT INTO EmpTable VALUES(1003,'Stefen',12000,'1990-1-1',500,20,1007);
INSERT INTO EmpTable VALUES(1004,'Williams',9000,'2001-1-1',NULL,30,1007);
INSERT INTO EmpTable VALUES(1005,'John',5000,'2005-1-1',NULL,30,1006);
INSERT INTO EmpTable VALUES(1006,'Dravid',19000,'1985-1-1',2400,10,1007);
INSERT INTO EmpTable VALUES(1007,'Martin',21000,'2000-1-1',1040,NULL,NULL);
SELECT * FROM EmpTable;

/* 1) Select Employee details of department no 10 or 30*/
SELECT * FROM EmpTable WHERE DeptNo=10 or DeptNO=30;

/*2)A query to fetch all the dept details with more than 1 Employee.*/
SELECT DeptTable.DeptNo,DeptTable.Dname,DeptTable.Loc
FROM DeptTable
INNER JOIN EmpTable ON DeptTable.DeptNo=EmpTable.DeptNo
GROUP BY DeptTable.DeptNo
HAVING COUNT(EmpTable.DeptNo)>1;

/* 3) A query to fetch employee details whose name starts with the letter “S”*/
SELECT * FROM EmpTable WHERE Ename LIKE "s%";

/* 4) Emp Details Whose experience is more than 2 years*/
SELECT * FROM EmpTable WHERE Hire_Date<'2018-1-1';

/* 5) A SELECT statement to replace the char “a” with “#” in Employee Name*/
SELECT REPLACE (Ename,'a','#') FROM EmpTable;

/* 6) A query to fetch employee name and his/her manager name.*/
SELECT e.Ename ,m.Ename AS manager_name
FROM EmpTable e
JOIN EmpTable m ON e.Mgr=m.EmpNo;

/* 7) Fetch Dept Name , Total Salry of the Dept*/
SELECT Dname,SUM(Sal) AS total_sal FROM EmpTable
JOIN DeptTable
ON DeptTable.DeptNo=EmpTable.DeptNo
GROUP BY EmpTable.DeptNo;

/* 8) A query to fetch ALL the  employee details along with department name, department location, irrespective of employee existance in the department.*/
SELECT * FROM DeptTable INNER JOIN EmpTable ON DeptTable.DeptNo=EmpTable.DeptNo;

/* 9) Write an update statement to increase the employee salary by 10 %*/
UPDATE EmpTable SET Sal=Sal+(Sal*10/100);
SELECT * FROM EmpTable;

/* 10) A statement to delete employees belong to Chennai location.*/
 DELETE FROM EmpTable WHERE DeptNo=30;
 SELECT *FROM EmpTable;

/* 11) Get Employee Name and gross salary (sal + comission) .*/
SELECT Ename,SUM(Sal+Commission) AS gross_salary FROM EmpTable

/* 12) Increase the data length of the column Ename of Emp table from  100 to 250 using ALTER statement*/
ALTER TABLE EmpTable MODIFY COLUMN Ename varchar(250);

/* 13) A query to get current datetime*/
SELECT CURRENT_TIMESTAMP();


/* 14) A statement to create STUDENT table, with related 5 columns*/
CREATE TABLE STUDENT1(ROLL_NO INTEGER,NAME TEXT,BRANCH TEXT,AGE INTEGER,DOB date);
INSERT INTO STUDENT1 VALUES(35,'Nishchit','IS',20,'2000-5-20');
SELECT * FROM STUDENT1;


/* 15) A query to fetch number of employees in who is getting salary more than 10000*/
SELECT COUNT(*) FROM EmpTable WHERE Sal>10000;


/* 16) A query to fetch minimum salary, maximum salary and average salary from emp table.*/
SELECT MIN(Sal),MAX(Sal),AVG(Sal) FROM EmpTable;


/* 17) A query to fetch number of employees in each location*/
SELECT COUNT(*),DeptTable.Loc FROM EmpTable
JOIN DeptTable
ON DeptTable.DeptNo=EmpTable.DeptNo
GROUP BY EmpTable.DeptNo;


/* 18) A query to display emplyee names in descending order*/
SELECT Ename FROM EmpTable
ORDER BY Ename DESC;


/* 19) A statement to create a new table(EMP_BKP) from the existing EMP table */
CREATE TABLE EMP_BKP(EmpNo INTEGER,Ename TEXT,Sal INTEGER,Hire_Date date,Commission INTEGER,DeptNo INTEGER,Mgr INTEGER);
INSERT INTO EMP_BKP SELECT * FROM EmpTable;
SELECT  * FROM EMP_BKP;

/*20)A query to fetch first 3 characters from employee name appended with salary.*/
SELECT substr(Ename,1,3)||Sal FROM EmpTable;
