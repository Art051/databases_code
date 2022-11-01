-- PostgeSQL Security and Administration
CREATE ROLE stephen;

-- To get all roles in the current PostgreSQL database server
SELECT rolname FROM pg_roles;

-- creates a role called hazel that has the login 
-- privilege and an initial password:
CREATE ROLE hazel 
LOGIN 
PASSWORD 'my123abc';

-- Now, you can use the role hazel to log in to the PostgreSQL database server using the psql client tool:
-- psql -U hazel -W postgres

-- The following statement creates a role called alyson that has the superuser attribute.
CREATE ROLE alyson 
SUPERUSER 
LOGIN 
PASSWORD 'my123abc';

-- Create Roles that can Create Databases
CREATE ROLE mydba 
CREATEDB 
LOGIN 
PASSWORD 'town1234';

-- Create Roles with Connection Limit
CREATE ROLE java_api
LOGIN
PASSWORD 'town1234'
CONNECTION LIMIT 10;

-- Create Roles with Validity Period
CREATE ROLE java_dev_api WITH
LOGIN
PASSWORD 'town123'
VALID UNTIL '2024-01-01';

-- Sample Grant Statements
-- First Create a Suitable Table
create table student (
    student_id int generated always as identity,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(255) not null unique,
    phone varchar(25) not null,
    primary key(student_id)
);

SELECT * FROM student;   
-- PostgreSQL issued an error:
-- ERROR:  permission denied for table student.

-- To grant the SELECT privilege on the candidates table to the role hazel
GRANT SELECT 
ON student 
TO hazel;

-- Try to Insert a Record without the Appropriate Privilege
INSERT INTO student(first_name, last_name, email, phone)
VALUES('Amy','Morgan','amy.morgan@myprovider.com','01792-123456');

-- Grant All Privileges on a Table to a Role
GRANT ALL
ON student
TO hazel;

-- Grant All Privileges on all Tables in a Schema to a Role
GRANT ALL
ON ALL TABLES
IN SCHEMA "public"
TO hazel;

-- Grant SELECT on All Tables
GRANT SELECT
ON ALL TABLES
IN SCHEMA "public"
TO java_api;

-- Revoking Priviliges
REVOKE all -- | ALL
on student --|  ALL TABLES IN SCHEMA schema_name
FROM hazel;


-- Revoking Hazel's Update Permissions
-- From the student table
REVOKE UPDATE
ON student
FROM hazel;














