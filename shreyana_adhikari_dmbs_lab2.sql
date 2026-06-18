CREATE database shreyana_db;
Use shreyana_db;
Create Table Employee (
EmpNo int Primary Key
);
desc Employee;

Create Table Department (
DeptNo int Primary Key
);
desc Department;

ALTER TABLE Employee
    ADD COLUMN DeptNo INT,
    ADD FOREIGN KEY (DeptNo)
    REFERENCES Department(DeptNo);
DESC Employee;
DESC Department;

ALTER TABLE Department
ADD COLUMN DeptName VARCHAR(50),
ADD COLUMN DeptEmail VARCHAR(100),
ADD COLUMN DeptHOD VARCHAR(100);

INSERT INTO Department VALUES
(2,'Computer Science','cs@sxc.edu.np','Mr. Ganesh Yogi'),
(3,'MicroBiology','microbio@sxc.edu.np','Mrs. Pramila Parajuli'),
(4,'Physics','physics@sxc.edu.np','Mr. Binod Bhandari'),
(5,'Business Studies','bs@sxc.edu.np','Mr. Maha Prasad Shrestha');
SELECT * FROM Department;

ALTER TABLE Employee
ADD COLUMN EmpName VARCHAR(50),
ADD COLUMN Job VARCHAR(50),
ADD COLUMN Phone_no BIGINT,
ADD COLUMN YearOfEnrollment INT,
ADD COLUMN EmailAddress VARCHAR(100),
ADD COLUMN PostalAddress VARCHAR(20);

INSERT INTO Employee VALUES
(1,2,'Abhiyan Sainju','Teaching Assistant',5544332,2016,'abhiyansainju@gmail.com','4066'),
(2,2,'Babis Shrestha','Software Developer',7744533,2018,'babis@gmail.com','3056'),
(3,4,'Chetana Panta','Coordinator',3322551,2015,'chetana@gmail.com','4066'),
(4,4,'Diwas Sapkota','Researcher',776644,2014,'diwas@gmail.com','9088'),
(5,3,'Elina Malla','DBA',4433532,2019,'elina@gmail.com','3056'),
(6,5,'Indu Adhikari','Counsellor',352625,2020,'indu@gmail.com','5504');
SELECT * FROM Employee;

INSERT INTO Employee VALUES
(7,'Ramesh Karki','Lecturer',9876543,2021,'ramesh@gmail.com','4466',1);

SELECT *
FROM Employee
WHERE DeptNo = 3;

SELECT *
FROM Employee
WHERE YearOfEnrollment >= 2016;

UPDATE Employee
SET Phone_no = 3344225
WHERE EmpNo = 3;

DELETE FROM Employee
WHERE DeptNo = 3;

DELETE FROM Department
WHERE DeptNo = 4;