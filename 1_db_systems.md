# Module 1 - Database Systems
A high level overview of data and database mgmt.

### Databases
*Def: Database* - Shared, integrated structure that stores a collection of: end user data (raw facts), metadata (data about data).

#### Types of Databases
Can be classified by the number of users...

- Single User: Supports only one user at a time.
- Multiple User: Supports multiple users.
    - Workgroup
    - Enterprise

Can be classified by location...

- Centralized: Supports data located at a single site
- Distributed: Supports data distributed across several sites

Can be classified by use...

- Operational database
    - Supports a company's day to day operations/transactions.
- Informational database (data warehouse)
    - Stores data used to generate information required to make tactical or strategic decisions
    - Often used to store historical data
    - Structure is very different

### Brief History of Databases
Manual paper databases were replaced in business starting in late sixties, eventually becoming popular in accounting departments, and eventually widespread throughout departments. Lead to the IT profession. In the 80's, SQL became the standard query language and relational databases were designed. This helped alleviate *data program dependance* issues and achieved independance between data and data programs.

### DBMS Functions
DBMS' guarantee data integrity and consistency. The functions used by the dbms to do this include...

- Data Dictionary mgmt
- Data storage mgmt
- Data transformation and prsentation
- Security mgmt
- Multi user access control (concurrency)
- Backup and recovery mgmt



