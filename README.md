# Enterprise-Web-Application
Full stack enterprise ui, api, and database using Vue JS, .Net Core Web API and Postgre SQL

Database is not hosted on a cloud server. Must create own Postgres database.
Sample Postgres database tables included.
Total of 2 tables:
  - Employee(
    EmployeeId serial,
    EmployeeName varchar(500),
    Department varchar(500),
    DateOfJoining date,
    PhotoFileName varchar(500)
  );
    
  - Department(
    DepartmentId serial,
    DepartmentName varchar(500)
  );
