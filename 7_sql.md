# SQL Syntax

## CREATE TABLE

Creates table, including column names and column data types.

```sql
CREATE TABLE employees (
  id INT(5) PRIMARY KEY,
  lastname VARCHAR(10),
  firtsname VARCHAR(10),
  Job_class VARCHAR(5) ZEROFILL,
  empdate DATE DEFAULT SYSDATE,
  enddate DATE
  );
'''

## DESCRIBE

Prints a table and info.

```sql
DESCRIBE employees
```

## ALTER TABLE

The ALTER TABLE command is used to change something about the table, not neccesarily values that already exist in the table. So to add column, or change a columns data type.

```sql
ALTER TABLE employees
ADD empdate DATE DEFAULT SYSDATE

ALTER TABLE employees
ADD enddate DATE

ALTER TABLE employees
MODIFY COLUMN Job_class CHAR(2)
```

## TRUNCATE TABLE

Kind of like DELETE without a WHERE clause. Does not log row delteions. Is more efficient, uses less resources than DELETE.

```sql
TRUNCATE TABLE employees
```

## DROP

Can be DROP TABLE, DROP DATABASE, OR DROP INDEX. The PURGE keyword deeply deletes a table (cannot be recovered easily)

```sql
DROP TABLE employees

DROP TABLE employees PURGE
```

## FLASHBACK

FLASHBACK works sort of like undo, and things can be flash backed to many different points. The following example flashes back to before a DROP that was just made.

```sql
DROP employees

FLASHBACK TABLE employees
TO BEFORE DROP
```

## CONSTRAINTS

Constraints are defined to safeguard aspects of the database by enforcing referential integrity. There are numerous kinds of constraints.

### NOT NULL

```sql
CREATE TABLE PersonsNotNul(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)
```
**NOTE:** In Oracle Alter Table NOT NULL is weird. It goes like this.

```sql
ALTER TABLE customers
  MODIFY customer_name varchar2(100) NOT NULL;
```
### UNIQUE

The UNIQUE constraint uniquely identifies each record in a database table.

### PRIMARY KEY

#### PRIMARY KEY constraint on CREATE TABLE

The following SQL creates a PRIMARY KEY on the "P_Id" column when the "Persons" table is created:

```sql
CREATE TABLE Persons(
P_Id int NOT NULL PRIMARY KEY,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)
```
To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

```sql
CREATE TABLE Persons(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)
)
```
#### PRIMARY KEY constraint on ALTER TABLE

```sql
ALTER TABLE Persons
ADD CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)
```

### Foreign Keys

#### FOREIGN KEY Constraint on CREATE TABLE
The following SQL creates a FOREIGN KEY on the "P_Id" column when the "Orders" table is created:

```sql
CREATE TABLE Orders(
O_Id int NOT NULL PRIMARY KEY,
OrderNo int NOT NULL,
P\_Id int FOREIGN KEY REFERENCES Persons(P\_Id)
)
```

To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

```sql
CREATE TABLE Orders(
O_Id int NOT NULL,
OrderNo int NOT NULL,
P_Id int,
PRIMARY KEY (O_Id),
CONSTRAINT fk_PerOrders FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)
)
```

####  FOREIGN KEY Constraint on ALTER TABLE

To create a FOREIGN KEY constraint on the "P_Id" column when the "Orders" table is already created, use the following SQL:

```sql
ALTER TABLE Orders
ADD FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)
```

To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

```sql
ALTER TABLE Orders
ADD CONSTRAINT fk_PerOrders
FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)
```

### CHECK

#### CHECK Constraint on CREATE TABLE

The following SQL creates a CHECK constraint on the "P\_Id" column when the "Persons" table is created. The CHECK constraint specifies that the column "P\_Id" must only include integers greater than 0.

```sql
CREATE TABLE Persons
(
P_Id int NOT NULL CHECK (P_Id>0),
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)
```
To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

```sql
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT chk_Person CHECK (P_Id>0 AND City='Sandnes')
)
```

#### CHECK Constraint on ALTER TABLE

To create a CHECK constraint on the "P_Id" column when the table is already created, use the following SQL:

```sql
ALTER TABLE Persons
ADD CHECK (P_Id>0)
```
To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

```sql
ALTER TABLE Persons
ADD CONSTRAINT chk\_Person CHECK (P_Id>0 AND City='Sandnes')
```

#### To DROP a CHECK Constraint

To drop a CHECK constraint, use the following SQL:

```sql
ALTER TABLE Persons
DROP CONSTRAINT chk_Person
MySQL:

ALTER TABLE Persons
DROP CHECK chk_Person
```

## Misc Rules/Conventions

- 30 character max for table name

