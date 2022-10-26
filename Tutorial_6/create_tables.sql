-- REVISED --


DROP TABLE IF EXISTS Roles CASCADE;
DROP TABLE IF EXISTS Staff CASCADE;
DROP TABLE IF EXISTS School CASCADE;
DROP TABLE IF EXISTS YearGroup CASCADE;
DROP TABLE IF EXISTS Subject CASCADE;
DROP TABLE IF EXISTS Student CASCADE;
DROP TABLE IF EXISTS class CASCADE;

-- Roles
CREATE TABLE IF NOT EXISTS Roles
(
    RoleID INTEGER PRIMARY KEY,
    role   VARCHAR(100)
);

-- Staff
CREATE TABLE IF NOT EXISTS Staff
(
    staffID              INTEGER PRIMARY KEY,
    FirstName            VARCHAR(50),
    LastName             VARCHAR(50),
    DOB                  DATE,
    Email                VARCHAR(124), -- firstname.lastname@bish.school.swansea.gov  -- 24 char suffix after the names -> 50 first, 50 last, 17 suffix == 117
    HighestQualification VARCHAR(25),
    staffrole            INTEGER
        CONSTRAINT StaffRole_fk REFERENCES Roles (RoleID)
);

-- School
CREATE TABLE IF NOT EXISTS School
(
    SchoolID    INTEGER PRIMARY KEY,
    SchoolName  VARCHAR(50),
    District    VARCHAR(100),
    Address     VARCHAR(255),
    PhoneNumber VARCHAR(12),
    Email       varchar(63), -- schoolname@Hwbcymru.net  -  50 prefix +13 suffix == 63
    headmaster  INTEGER
        CONSTRAINT staffid_fk REFERENCES staff (staffID)
);

-- Year Group
CREATE TABLE IF NOT EXISTS YearGroup
(
    YearGroupID    INTEGER PRIMARY KEY,
    enrollyear     date,
    GraduationYear date,
    SchoolID       INTEGER
        CONSTRAINT SchoolID_fk REFERENCES School (SchoolID)
);


-- Subject
CREATE TABLE IF NOT EXISTS Subject
(
    SubjectID  INTEGER PRIMARY KEY,
    Topic      VARCHAR(100),
    Assessment VARCHAR(50),
    PassRate   NUMERIC(4, 2)
);

-- Student
CREATE TABLE IF NOT EXISTS Student
(
    StudentID   INTEGER PRIMARY KEY,
    FirstName   VARCHAR(150),
    LastName    VARCHAR(150),
    DOB         DATE,
    Address     VARCHAR(255),
    SchoolID    INTEGER
        CONSTRAINT SchoolID_fk REFERENCES School (SchoolID),
    YearGroupID INTEGER
        CONSTRAINT YearGroupID_fk REFERENCES YearGroup (YearGroupID)
);

-- Class
CREATE TABLE IF NOT EXISTS class
(
    classid           INTEGER PRIMARY KEY,
    level             varchar(3), -- this is for KS<num> - for Key Stage 3,4
    ClassGradeAverage NUMERIC(4, 2),
    staffID           integer
        CONSTRAINT staffid_fk REFERENCES Staff (staffID),
    SchoolID          INTEGER
        CONSTRAINT SchoolID_fk REFERENCES School (SchoolID),
    YearGroupID       INTEGER
        CONSTRAINT YearGroupID_fk REFERENCES YearGroup (YearGroupID),
    SubjectID         INTEGER
        CONSTRAINT SubjectID_fk REFERENCES Subject (SubjectID)
);

drop SEQUENCE if exists roleid_seq;
drop SEQUENCE if exists staffID_seq;
drop SEQUENCE if exists schoolID_seq;
drop SEQUENCE if exists yeargroupid_seq;
drop SEQUENCE if exists subjectID_seq;
drop SEQUENCE if exists studentID_seq;
drop SEQUENCE if exists classid_seq;
CREATE SEQUENCE roleID_seq INCREMENT 1 START 1;
CREATE SEQUENCE staffID_seq INCREMENT 1 START 1;
CREATE SEQUENCE schoolID_seq INCREMENT 1 START 1;
CREATE SEQUENCE yeargroupID_seq INCREMENT 1 START 1;
CREATE SEQUENCE subjectID_seq INCREMENT 1 START 1;
CREATE SEQUENCE studentID_seq INCREMENT 1 START 1;
CREATE SEQUENCE classid_seq INCREMENT 1 START 1;