--wk3 tut2 making sql from ER diagram

-- DROP TABLE Roles;
-- DROP TABLE Staff;
-- DROP TABLE School;
-- DROP TABLE YearGroup;
-- DROP TABLE Subject;
-- DROP TABLE Student;
-- DROP TABLE SchoolClass;

-- SELECT * FROM Roles;
-- SELECT * FROM Staff;
-- SELECT * FROM School;

-- Roles
CREATE TABLE IF NOT EXISTS Roles(
	RoleID INTEGER PRIMARY KEY,
	RoleName VARCHAR(255)
);

-- Staff
CREATE TABLE IF NOT EXISTS Staff(
	RoleID INTEGER PRIMARY KEY,
	RoleName VARCHAR(255),
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	DOB DATE,
	Email VARCHAR(255),
	HighestQualification VARCHAR(255),
	StaffRole INTEGER CONSTRAINT StaffRole_fk REFERENCES Roles(RoleID)
);

-- School
CREATE TABLE IF NOT EXISTS School(
	SchoolID INTEGER PRIMARY KEY,
	SchoolName VARCHAR(255),
	District VARCHAR(255),
	Address VARCHAR(255),
	PhoneNumber VARCHAR(255),
	Email VARCHAR(255),
	StaffHeadmaster INTEGER CONSTRAINT StaffRole_fk REFERENCES Roles(RoleID)
);

-- Year Group
CREATE TABLE IF NOT EXISTS YearGroup(
	YearGroupID INTEGER PRIMARY KEY,
	GraduationYear INTEGER,
	SchoolID INTEGER CONSTRAINT SchoolID_fk REFERENCES School(SchoolID)
);

-- Subject
CREATE TABLE IF NOT EXISTS Subject(
	SubjectID INTEGER PRIMARY KEY,
	Topic VARCHAR(255),
	Assessment VARCHAR(255),
	PassRate NUMERIC(3, 2)
);

-- Student
CREATE TABLE IF NOT EXISTS Student(
	StudentID INTEGER PRIMARY KEY,
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	DOB DATE,
	Address VARCHAR(255),
	SchoolID INTEGER CONSTRAINT SchoolID_fk REFERENCES School(SchoolID),
	YearGroupID INTEGER CONSTRAINT YearGroupID_fk REFERENCES YearGroup(YearGroupID)
);

-- Class
CREATE TABLE IF NOT EXISTS SchoolClass(
	ClassID INTEGER PRIMARY KEY,
	ClassLevel NUMERIC(5, 2),
	ClassGradeAverage NUMERIC(5, 2),
	SubjectID INTEGER CONSTRAINT SubjectID_fk REFERENCES Subject(SubjectID),
	SchoolID INTEGER CONSTRAINT SchoolID_fk REFERENCES School(SchoolID),
	YearGroupID INTEGER CONSTRAINT YearGroupID_fk REFERENCES YearGroup(YearGroupID)
);

