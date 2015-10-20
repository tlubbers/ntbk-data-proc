
## PP7

CREATE TABLE employees (
  id INT(5),
  lastname VARCHAR(10),
  firtsname VARCHAR(10),
  Job_class VARCHAR(5) ZEROFILL,
  empdate DATE DEFAULT GETDATE(),
  enddate DATE
  );

