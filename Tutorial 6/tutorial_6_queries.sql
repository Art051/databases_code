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

-- -- School
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

-- DROP SEQUENCE schoolID_seq;
-- DROP SEQUENCE roleID_seq;
--  DROP SEQUENCE staffID_seq;

CREATE SEQUENCE staffID_seq INCREMENT 1 START 1;
-- CREATE SEQUENCE schoolID_seq INCREMENT 1 START 1;
-- CREATE SEQUENCE roleID_seq INCREMENT 1 START 1;
-- CREATE SEQUENCE subjectID_seq INCREMENT 1 START 1;
-- CREATE SEQUENCE yeargroupID_seq INCREMENT 1 START 1;
-- CREATE SEQUENCE studentID_seq INCREMENT 1 START 1;

-- INSERT TABLE DATA QUERIES:

-- Roles
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Headteacher');
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Head of Department (HoD)');
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Head of Year (HoY)');
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Deputy Head of Year(DHOY)');
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Safeguarding Officer');
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Teacher');
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Teaching Assistant');
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Admin');
insert into Roles (roleid, rolename) values (NEXTVAL('roleID_seq'), 'Nurse');

-- School
insert into School (schoolid, schoolname, district, address, phonenumber, email, staffheadmaster) values (NEXTVAL('schoolID_seq'), 'bishopston', 'bishopston', 'The Glebe, Bishopston, Swansea, SA3 3JP, United Kingdom', '01792 234121', '6704069_BishopstonComprehensive@Hwbcymru.net', '1');

-- Staff
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Manon', 'Peete', '1976-08-05', 'Manon.Peete@swanseacomprehensives.ac.uk', 'Msc', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Sheri', 'Ferryman', '1997-08-28', 'Sheri.Ferryman@swanseacomprehensives.ac.uk', 'Bsc', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Benson', 'Chase', '1997-04-26', 'Benson.Chase@swanseacomprehensives.ac.uk', 'PHD', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Eryn', 'Haack', '1972-12-17', 'Eryn.Haack@swanseacomprehensives.ac.uk', 'Bsc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Cecil', 'Hutt', '1983-09-18', 'Cecil.Hutt@swanseacomprehensives.ac.uk', 'Bsc', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Clayborn', 'Garioch', '1971-09-01', 'Clayborn.Garioch@swanseacomprehensives.ac.uk', 'Bsc', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Rina', 'Attwooll', '1989-07-18', 'Rina.Attwooll@swanseacomprehensives.ac.uk', 'Bsc', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Drud', 'Coggles', '1973-12-20', 'Drud.Coggles@swanseacomprehensives.ac.uk', 'PHD', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Sela', 'Higginbottam', '1988-09-22', 'Sela.Higginbottam@swanseacomprehensives.ac.uk', 'Bsc', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Kiele', 'Geaveny', '1996-03-27', 'Kiele.Geaveny@swanseacomprehensives.ac.uk', 'Msc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Ynez', 'Blomefield', '1993-03-22', 'Ynez.Blomefield@swanseacomprehensives.ac.uk', 'Msc', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Shandy', 'Grelik', '1996-07-07', 'Shandy.Grelik@swanseacomprehensives.ac.uk', 'PHD', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Kaspar', 'Sandey', '1979-06-10', 'Kaspar.Sandey@swanseacomprehensives.ac.uk', 'Bsc', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Gabriela', 'Pruckner', '1969-12-25', 'Gabriela.Pruckner@swanseacomprehensives.ac.uk', 'A-Level', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Jedd', 'Letixier', '1990-04-25', 'Jedd.Letixier@swanseacomprehensives.ac.uk', 'Msc', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Anders', 'Lamberth', '1985-11-15', 'Anders.Lamberth@swanseacomprehensives.ac.uk', 'A-Level', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Igor', 'Danaher', '1995-09-30', 'Igor.Danaher@swanseacomprehensives.ac.uk', 'A-Level', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Neill', 'Rubinovici', '1975-01-22', 'Neill.Rubinovici@swanseacomprehensives.ac.uk', 'Msc', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Augie', 'Scobbie', '1990-09-22', 'Augie.Scobbie@swanseacomprehensives.ac.uk', 'Msc', 6);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Laryssa', 'Meade', '1991-03-25', 'Laryssa.Meade@swanseacomprehensives.ac.uk', 'Msc', 6);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Bordie', 'Kunkel', '1988-04-03', 'Bordie.Kunkel@swanseacomprehensives.ac.uk', 'PHD', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Beltran', 'Widdowfield', '1987-10-29', 'Beltran.Widdowfield@swanseacomprehensives.ac.uk', 'Msc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Hillel', 'Masdin', '1989-06-30', 'Hillel.Masdin@swanseacomprehensives.ac.uk', 'Bsc', 6);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Nalani', 'Mara', '1962-04-10', 'Nalani.Mara@swanseacomprehensives.ac.uk', 'PHD', 6);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Emilie', 'Kendell', '1991-07-11', 'Emilie.Kendell@swanseacomprehensives.ac.uk', 'A-Level', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Ximenez', 'Flipek', '1986-02-13', 'Ximenez.Flipek@swanseacomprehensives.ac.uk', 'Msc', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Roseline', 'Foffano', '1969-01-10', 'Roseline.Foffano@swanseacomprehensives.ac.uk', 'Msc', 6);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Kendrick', 'Garry', '1991-03-08', 'Kendrick.Garry@swanseacomprehensives.ac.uk', 'Msc', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Gamaliel', 'Ebden', '1980-05-29', 'Gamaliel.Ebden@swanseacomprehensives.ac.uk', 'Bsc', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Ailyn', 'Pember', '1978-02-02', 'Ailyn.Pember@swanseacomprehensives.ac.uk', 'Msc', 6);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Eula', 'Ripsher', '1987-06-11', 'Eula.Ripsher@swanseacomprehensives.ac.uk', 'A-Level', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Kirby', 'Derycot', '1968-08-06', 'Kirby.Derycot@swanseacomprehensives.ac.uk', 'A-Level', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Dayle', 'Fredson', '1983-01-30', 'Dayle.Fredson@swanseacomprehensives.ac.uk', 'PHD', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Dermot', 'Jobson', '1971-11-16', 'Dermot.Jobson@swanseacomprehensives.ac.uk', 'PHD', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Chere', 'Hruska', '1992-03-03', 'Chere.Hruska@swanseacomprehensives.ac.uk', 'A-Level', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Dena', 'Peter', '1999-07-20', 'Dena.Peter@swanseacomprehensives.ac.uk', 'Msc', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Marget', 'Govini', '1994-12-14', 'Marget.Govini@swanseacomprehensives.ac.uk', 'Msc', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Oralie', 'Hullbrook', '1971-10-16', 'Oralie.Hullbrook@swanseacomprehensives.ac.uk', 'A-Level', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Annabell', 'Pinnington', '1996-03-03', 'Annabell.Pinnington@swanseacomprehensives.ac.uk', 'A-Level', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Arlinda', 'Dessaur', '1979-08-14', 'Arlinda.Dessaur@swanseacomprehensives.ac.uk', 'Bsc', 2);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Vassili', 'Murty', '1984-11-29', 'Vassili.Murty@swanseacomprehensives.ac.uk', 'Bsc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Gertrude', 'Ablitt', '1984-08-14', 'Gertrude.Ablitt@swanseacomprehensives.ac.uk', 'Bsc', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Mame', 'Moorerud', '1970-10-14', 'Mame.Moorerud@swanseacomprehensives.ac.uk', 'Bsc', 2);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Janifer', 'Buttler', '1962-07-20', 'Janifer.Buttler@swanseacomprehensives.ac.uk', 'Msc', 2);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Oneida', 'MacCoughan', '1973-06-04', 'Oneida.MacCoughan@swanseacomprehensives.ac.uk', 'A-Level', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Claude', 'Ragdale', '1985-04-30', 'Claude.Ragdale@swanseacomprehensives.ac.uk', 'PHD', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Griz', 'Fenby', '1966-12-24', 'Griz.Fenby@swanseacomprehensives.ac.uk', 'A-Level', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Timothee', 'Lindermann', '1985-06-13', 'Timothee.Lindermann@swanseacomprehensives.ac.uk', 'A-Level', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Ellynn', 'Bartocci', '1977-02-10', 'Ellynn.Bartocci@swanseacomprehensives.ac.uk', 'Bsc', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Ingrim', 'Deyes', '1962-12-31', 'Ingrim.Deyes@swanseacomprehensives.ac.uk', 'Msc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Katerine', 'Cocker', '1993-11-27', 'Katerine.Cocker@swanseacomprehensives.ac.uk', 'PHD', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Clarabelle', 'Asbury', '1971-03-14', 'Clarabelle.Asbury@swanseacomprehensives.ac.uk', 'PHD', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Gay', 'Whitloe', '1980-07-15', 'Gay.Whitloe@swanseacomprehensives.ac.uk', 'A-Level', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Wini', 'Carnegie', '2000-06-23', 'Wini.Carnegie@swanseacomprehensives.ac.uk', 'Msc', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Urbain', 'Gruszka', '1977-04-11', 'Urbain.Gruszka@swanseacomprehensives.ac.uk', 'PHD', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Pauline', 'Forsaith', '1978-02-26', 'Pauline.Forsaith@swanseacomprehensives.ac.uk', 'PHD', 2);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Caron', 'Gajownik', '1982-10-11', 'Caron.Gajownik@swanseacomprehensives.ac.uk', 'PHD', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Inness', 'Gerson', '1967-04-10', 'Inness.Gerson@swanseacomprehensives.ac.uk', 'A-Level', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Padraig', 'Milhench', '1991-04-06', 'Padraig.Milhench@swanseacomprehensives.ac.uk', 'A-Level', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Tomas', 'Kemitt', '1977-02-10', 'Tomas.Kemitt@swanseacomprehensives.ac.uk', 'Bsc', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Lilly', 'Temple', '1966-03-11', 'Lilly.Temple@swanseacomprehensives.ac.uk', 'Msc', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Hephzibah', 'Shearsby', '1979-02-14', 'Hephzibah.Shearsby@swanseacomprehensives.ac.uk', 'Msc', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Gretal', 'Peret', '1993-01-22', 'Gretal.Peret@swanseacomprehensives.ac.uk', 'PHD', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Worth', 'Lindmark', '1973-12-20', 'Worth.Lindmark@swanseacomprehensives.ac.uk', 'Msc', 2);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Dorthea', 'MacGaffey', '1977-01-03', 'Dorthea.MacGaffey@swanseacomprehensives.ac.uk', 'A-Level', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Freddie', 'Frackiewicz', '1995-08-21', 'Freddie.Frackiewicz@swanseacomprehensives.ac.uk', 'PHD', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Tanney', 'Vlach', '1998-10-16', 'Tanney.Vlach@swanseacomprehensives.ac.uk', 'PHD', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Lemmy', 'Deere', '1984-06-17', 'Lemmy.Deere@swanseacomprehensives.ac.uk', 'PHD', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Douglass', 'Brownsell', '1993-06-18', 'Douglass.Brownsell@swanseacomprehensives.ac.uk', 'A-Level', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Knox', 'Abbis', '1973-03-27', 'Knox.Abbis@swanseacomprehensives.ac.uk', 'PHD', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Cary', 'Rickasse', '1965-07-18', 'Cary.Rickasse@swanseacomprehensives.ac.uk', 'Bsc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Bren', 'Jasiak', '1965-11-08', 'Bren.Jasiak@swanseacomprehensives.ac.uk', 'PHD', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Fred', 'Giacomuzzo', '2000-04-09', 'Fred.Giacomuzzo@swanseacomprehensives.ac.uk', 'PHD', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Fran', 'Severs', '1964-06-28', 'Fran.Severs@swanseacomprehensives.ac.uk', 'Bsc', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Blinni', 'Schubbert', '1992-08-13', 'Blinni.Schubbert@swanseacomprehensives.ac.uk', 'Msc', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Guthrey', 'Gulliman', '1994-09-03', 'Guthrey.Gulliman@swanseacomprehensives.ac.uk', 'A-Level', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Hogan', 'Belliard', '1966-07-30', 'Hogan.Belliard@swanseacomprehensives.ac.uk', 'Bsc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Fitz', 'Lehrle', '1996-09-06', 'Fitz.Lehrle@swanseacomprehensives.ac.uk', 'Msc', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Vergil', 'Klimov', '1984-06-22', 'Vergil.Klimov@swanseacomprehensives.ac.uk', 'Msc', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Hyacinthe', 'Reubens', '1988-11-04', 'Hyacinthe.Reubens@swanseacomprehensives.ac.uk', 'Bsc', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Filip', 'Jakes', '1993-12-23', 'Filip.Jakes@swanseacomprehensives.ac.uk', 'Msc', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Maryanna', 'Kerford', '1990-07-12', 'Maryanna.Kerford@swanseacomprehensives.ac.uk', 'PHD', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Ruth', 'Nice', '1996-02-06', 'Ruth.Nice@swanseacomprehensives.ac.uk', 'Msc', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Jordain', 'Lorence', '1973-09-21', 'Jordain.Lorence@swanseacomprehensives.ac.uk', 'Msc', 1);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Kassey', 'Berfoot', '1991-05-06', 'Kassey.Berfoot@swanseacomprehensives.ac.uk', 'Msc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Jehu', 'Fingleton', '1993-04-25', 'Jehu.Fingleton@swanseacomprehensives.ac.uk', 'PHD', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Chic', 'Gomer', '1974-07-11', 'Chic.Gomer@swanseacomprehensives.ac.uk', 'Bsc', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Terrel', 'Brocket', '1994-06-28', 'Terrel.Brocket@swanseacomprehensives.ac.uk', 'A-Level', 2);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Werner', 'Androlli', '1987-12-04', 'Werner.Androlli@swanseacomprehensives.ac.uk', 'Bsc', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Joline', 'MacNeilage', '1973-12-17', 'Joline.MacNeilage@swanseacomprehensives.ac.uk', 'Msc', 6);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Trudy', 'Dyzart', '1973-10-21', 'Trudy.Dyzart@swanseacomprehensives.ac.uk', 'A-Level', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Derron', 'Buggs', '1967-11-03', 'Derron.Buggs@swanseacomprehensives.ac.uk', 'Bsc', 6);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Skippie', 'Ties', '1983-05-17', 'Skippie.Ties@swanseacomprehensives.ac.uk', 'Msc', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Emilie', 'Boseley', '1963-06-26', 'Emilie.Boseley@swanseacomprehensives.ac.uk', 'PHD', 4);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Thane', 'Luckey', '1966-03-06', 'Thane.Luckey@swanseacomprehensives.ac.uk', 'Bsc', 7);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Donielle', 'Hatwells', '1995-03-13', 'Donielle.Hatwells@swanseacomprehensives.ac.uk', 'Bsc', 3);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Maren', 'Raspison', '1986-06-29', 'Maren.Raspison@swanseacomprehensives.ac.uk', 'A-Level', 9);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Ricard', 'Arch', '1973-02-12', 'Ricard.Arch@swanseacomprehensives.ac.uk', 'Msc', 5);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Goober', 'McMillam', '1965-11-01', 'Goober.McMillam@swanseacomprehensives.ac.uk', 'PHD', 8);
insert into Staff (staffID, rolename, firstname, lastname, dob, email, highestqualification, staffrole) values (NEXTVAL('staffID_seq'), 'role-name', 'Cornela', 'Daens', '2000-08-05', 'Cornela.Daens@swanseacomprehensives.ac.uk', 'A-Level', 5);
