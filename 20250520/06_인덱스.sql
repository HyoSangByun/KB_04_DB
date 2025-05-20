USE employees;

SELECT  * FROM  employees.employees
order by birth_date DESC;

SELECT  * FROM  employees.employees
order by emp_no DESC;

--

USE sqldb;

SELECT  * FROM buytbl;

START TRANSACTION;
DELETE FROM buytbl WHERE num = 1;
DELETE FROM buytbl WHERE num = 2;

SELECT * FROM buytbl;

ROLLBACK;

SELECT * FROM buytbl;

--
SELECT @@autocommit;

set autocommit = false;

SELECT @@autocommit;

USE SQLDB;

SELECT * FROM BUYTBL;

START TRANSACTION;

DELETE FROM buytbl WHERE num = 1;
DELETE FROM buytbl WHERE num = 2;

SELECT * FROM BUYTBL;

ROLLBACK;

SELECT * FROM BUYTBL