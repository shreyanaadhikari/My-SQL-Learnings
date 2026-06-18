CREATE database SXC;
SHOW databases;
Use sxc;
CREATE Table Employee (
	EID INT,
	FirstName VARCHAR(15),
	LastName VARCHAR(15),
	DeptId SMALLINT,
	DOB DATE
);
SHOW tables;
desc Employee;
ALTER TABLE Employee
	ADD column ContactNo Bigint,
    ADD column Email varchar(30),
    ADD column Salary DECIMAL(10,2);
desc Employee;
ALTER TABLE employee
	drop column DOB;
desc Employee;
CREATE TABLE Department (
	DID SMALLINT Primary Key not null,
	DName VARCHAR(20) not null,
	Email VARCHAR(20) not null
);
desc Department;
ALTER TABLE Employee
	ADD PRIMARY KEY (EID);
ALTER TABLE Employee
	ADD FOREIGN KEY (DeptId)
	REFERENCES Department(DID);
desc Employee;
desc Department;
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(20)
);
Show tables;
desc Customer;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
);
show tables;
desc Orders;