
# comment

CREATE TABLE employees (
  id INT(5) PRIMARY KEY,
  lastname VARCHAR(10),
  firtsname VARCHAR(10),
  Job_class VARCHAR(5) ZEROFILL,
  empdate DATE DEFAULT SYSDATE,
  enddate DATE
  );

ALTER TABLE employees
ADD empdate DATE DEFAULT SYSDATE

ALTER TABLE employees
ADD enddate DATE

ALTER TABLE employees
MODIFY COLUMN Job_class CHAR(2)

TRUNCATE TABLE employees

DESCRIBE employees

DROP employees

FLASHBACK TABLE employees
TO BEFORE DROP

DROP employees PURGE

SELECT ACCTMANAGER
