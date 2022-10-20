-- REVISED --


DROP TABLE IF EXISTS Roles CASCADE;
DROP TABLE IF EXISTS Staff CASCADE;
DROP TABLE IF EXISTS School CASCADE;
DROP TABLE IF EXISTS YearGroup CASCADE;
DROP TABLE IF EXISTS Subjectf CASCADE;
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

-- TRUNCATE roles,staff,school,yeargroup,subject,student,class;

INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Headteacher');
INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Head of Department (HoD)');
INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Head of Year (HoY)');
INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Deputy Head of Year(DHOY)');
INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Safeguarding Officer');
INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Teacher');
INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Teaching Assistant');
INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Admin');
INSERT INTO Roles (roleid, role)
VALUES (NEXTVAL('roleID_seq'), 'Nurse');

INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Aldridge', 'Trime', '1981-02-22', 'Aldridge.@bish.school.swansea.gov', 'bs', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Berny', 'Steward', '1962-06-04', 'Berny.@bish.school.swansea.gov', 'bs', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Aundrea', 'Seid', '1992-04-17', 'Aundrea.@bish.school.swansea.gov', 'phd', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Cornell', 'Brownlea', '1981-02-04', 'Cornell.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Winnifred', 'Curley', '1961-02-26', 'Winnifred.@bish.school.swansea.gov', 'phd', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Harriette', 'Pettendrich', '1962-03-26', 'Harriette.@bish.school.swansea.gov', 'ma',
        7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Adria', 'Allchorn', '1961-01-03', 'Adria.@bish.school.swansea.gov', 'bs', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Joy', 'Calcraft', '1999-11-20', 'Joy.@bish.school.swansea.gov', 'bs', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Dougie', 'Compson', '1984-02-16', 'Dougie.@bish.school.swansea.gov', 'ba', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Ottilie', 'Hainey`', '1978-02-08', 'Ottilie.@bish.school.swansea.gov', 'ma', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Shirleen', 'Vokes', '1986-08-08', 'Shirleen.@bish.school.swansea.gov', 'ba', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Gorden', 'Baxster', '1969-05-21', 'Gorden.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Randy', 'Figliovanni', '1992-05-20', 'Randy.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Katy', 'Jans', '1968-12-11', 'Katy.@bish.school.swansea.gov', 'ma', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Burton', 'Coleyshaw', '1995-12-28', 'Burton.@bish.school.swansea.gov', 'phd', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Conrade', 'Woolfenden', '1988-08-03', 'Conrade.@bish.school.swansea.gov', 'ma', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Vonny', 'Imm', '1978-01-15', 'Vonny.@bish.school.swansea.gov', 'ma', 9);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Domingo', 'Pawel', '1992-08-28', 'Domingo.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Cyrillus', 'Goeff', '1973-12-21', 'Cyrillus.@bish.school.swansea.gov', 'msc', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Cordy', 'Jarmyn', '1987-07-09', 'Cordy.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Grayce', 'Ingraham', '1963-10-14', 'Grayce.@bish.school.swansea.gov', 'msc', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Betsy', 'Twiname', '1997-06-22', 'Betsy.@bish.school.swansea.gov', 'msc', 3);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Emiline', 'Brothwell', '1975-09-19', 'Emiline.@bish.school.swansea.gov', 'ba', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Mattie', 'Novotna', '1989-01-30', 'Mattie.@bish.school.swansea.gov', 'phd', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Krisha', 'Toping', '1990-10-09', 'Krisha.@bish.school.swansea.gov', 'ma', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Vinnie', 'Slocket', '1972-01-09', 'Vinnie.@bish.school.swansea.gov', 'ba', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Tedra', 'Lanktree', '1988-01-07', 'Tedra.@bish.school.swansea.gov', 'msc', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Aili', 'Clowes', '1988-05-22', 'Aili.@bish.school.swansea.gov', 'phd', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Edward', 'Mowlam', '1981-07-28', 'Edward.@bish.school.swansea.gov', 'phd', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Georgena', 'Luten', '1976-06-30', 'Georgena.@bish.school.swansea.gov', 'msc', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Jo-ann', 'Beverley', '1994-10-03', 'Jo-ann.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Iggy', 'Boyfield', '1981-04-27', 'Iggy.@bish.school.swansea.gov', 'ba', 3);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Aretha', 'Sallans', '1976-01-06', 'Aretha.@bish.school.swansea.gov', 'ba', 9);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Abigale', 'Sebastian', '1977-09-21', 'Abigale.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Blythe', 'Fairchild', '1998-03-28', 'Blythe.@bish.school.swansea.gov', 'msc', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Goldina', 'Renzini', '1990-04-08', 'Goldina.@bish.school.swansea.gov', 'bs', 9);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Niko', 'MacGilrewy', '1995-06-26', 'Niko.@bish.school.swansea.gov', 'phd', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Thia', 'Crowdy', '1992-07-24', 'Thia.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Dasie', 'Burnhams', '1990-05-27', 'Dasie.@bish.school.swansea.gov', 'ma', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Jemmie', 'Quinet', '1987-05-12', 'Jemmie.@bish.school.swansea.gov', 'phd', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Barnabas', 'Guyan', '1979-08-19', 'Barnabas.@bish.school.swansea.gov', 'ma', 1);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Kingsley', 'Clubb', '1965-04-05', 'Kingsley.@bish.school.swansea.gov', 'phd', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Lexi', 'Cranton', '1974-04-16', 'Lexi.@bish.school.swansea.gov', 'ma', 4);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Hanni', 'Klamp', '1989-06-17', 'Hanni.@bish.school.swansea.gov', 'msc', 3);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Melissa', 'Tremethack', '1999-04-24', 'Melissa.@bish.school.swansea.gov', 'bs', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Cordy', 'Tenpenny', '1973-03-01', 'Cordy.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Emiline', 'Tant', '1965-11-08', 'Emiline.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Daryl', 'Bartozzi', '1993-08-09', 'Daryl.@bish.school.swansea.gov', 'phd', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Leland', 'Farrar', '1982-05-10', 'Leland.@bish.school.swansea.gov', 'msc', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Chucho', 'Duggan', '1998-08-24', 'Chucho.@bish.school.swansea.gov', 'phd', 4);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Jarvis', 'Gossage', '1964-07-17', 'Jarvis.@bish.school.swansea.gov', 'phd', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Robinetta', 'Halpen', '1998-10-26', 'Robinetta.@bish.school.swansea.gov', 'ba', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Rivy', 'Roncelli', '2000-09-07', 'Rivy.@bish.school.swansea.gov', 'msc', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Sabrina', 'Stoaks', '1997-05-09', 'Sabrina.@bish.school.swansea.gov', 'ba', 9);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Kahaleel', 'Possek', '1997-05-01', 'Kahaleel.@bish.school.swansea.gov', 'ba', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Esta', 'Back', '1998-04-10', 'Esta.@bish.school.swansea.gov', 'msc', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Titus', 'Issacof', '1961-09-22', 'Titus.@bish.school.swansea.gov', 'msc', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Sean', 'Alway', '1977-03-17', 'Sean.@bish.school.swansea.gov', 'ba', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Aluino', 'Shwenn', '1967-12-30', 'Aluino.@bish.school.swansea.gov', 'ba', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Caddric', 'Jeandillou', '1969-01-29', 'Caddric.@bish.school.swansea.gov', 'phd', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Jessie', 'Callaghan', '1967-01-19', 'Jessie.@bish.school.swansea.gov', 'bs', 3);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Flor', 'Brussels', '1993-12-14', 'Flor.@bish.school.swansea.gov', 'bs', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Nicol', 'Raiman', '1967-03-11', 'Nicol.@bish.school.swansea.gov', 'phd', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Fredia', 'Sheraton', '1976-02-15', 'Fredia.@bish.school.swansea.gov', 'ba', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Sonny', 'Cheers', '1995-11-14', 'Sonny.@bish.school.swansea.gov', 'ba', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Addy', 'Ericssen', '1979-08-26', 'Addy.@bish.school.swansea.gov', 'msc', 5);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Gerick', 'Ransbury', '1969-04-30', 'Gerick.@bish.school.swansea.gov', 'ma', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Mac', 'Sinnocke', '1998-05-26', 'Mac.@bish.school.swansea.gov', 'bs', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Shelden', 'Wykey', '1976-06-22', 'Shelden.@bish.school.swansea.gov', 'msc', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Lyndsay', 'Niccols', '1980-02-01', 'Lyndsay.@bish.school.swansea.gov', 'ba', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Goober', 'Sainthill', '1974-10-15', 'Goober.@bish.school.swansea.gov', 'ma', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Garrett', 'Hamlin', '1972-03-16', 'Garrett.@bish.school.swansea.gov', 'ba', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Ase', 'McArd', '1989-12-05', 'Ase.@bish.school.swansea.gov', 'msc', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Dyan', 'Gibke', '1970-07-10', 'Dyan.@bish.school.swansea.gov', 'bs', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Stanleigh', 'Queen', '1969-03-24', 'Stanleigh.@bish.school.swansea.gov', 'msc', 9);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Sloan', 'Simoni', '1999-12-13', 'Sloan.@bish.school.swansea.gov', 'phd', 9);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Tommy', 'Gianiello', '1980-11-26', 'Tommy.@bish.school.swansea.gov', 'bs', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Kass', 'Prescot', '1974-01-19', 'Kass.@bish.school.swansea.gov', 'ma', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Patrick', 'Jakoub', '1985-02-17', 'Patrick.@bish.school.swansea.gov', 'msc', 5);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Sibilla', 'Friedlos', '1992-05-12', 'Sibilla.@bish.school.swansea.gov', 'ba', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Andrey', 'McInnerny', '1969-06-28', 'Andrey.@bish.school.swansea.gov', 'msc', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Emmeline', 'Duiguid', '1967-07-26', 'Emmeline.@bish.school.swansea.gov', 'bs', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Thorpe', 'Dubock', '1996-01-22', 'Thorpe.@bish.school.swansea.gov', 'msc', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Husain', 'Culverhouse', '1991-12-17', 'Husain.@bish.school.swansea.gov', 'ba', 9);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Horatius', 'Risdall', '1976-11-13', 'Horatius.@bish.school.swansea.gov', 'ba', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Keely', 'Fretson', '1962-11-26', 'Keely.@bish.school.swansea.gov', 'msc', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Tim', 'O''Duggan', '1966-06-28', 'Tim.@bish.school.swansea.gov', 'ba', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Vonni', 'Orth', '1967-03-20', 'Vonni.@bish.school.swansea.gov', 'phd', 9);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Jeanie', 'Stripling', '1994-02-03', 'Jeanie.@bish.school.swansea.gov', 'ba', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Jodi', 'Cordes', '1964-11-05', 'Jodi.@bish.school.swansea.gov', 'msc', 6);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Merrill', 'Paxman', '1983-03-08', 'Merrill.@bish.school.swansea.gov', 'msc', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Lenette', 'Maddrell', '1996-04-23', 'Lenette.@bish.school.swansea.gov', 'msc', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Rawley', 'Tanti', '1968-03-06', 'Rawley.@bish.school.swansea.gov', 'ma', 8);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Melvyn', 'Mummery', '1969-01-07', 'Melvyn.@bish.school.swansea.gov', 'bs', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Todd', 'Cutmere', '1973-07-07', 'Todd.@bish.school.swansea.gov', 'ma', 2);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Aubry', 'Manthorpe', '1975-07-30', 'Aubry.@bish.school.swansea.gov', 'ma', 3);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Lorita', 'Kennham', '1988-12-08', 'Lorita.@bish.school.swansea.gov', 'msc', 3);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Cybil', 'Abby', '1998-05-08', 'Cybil.@bish.school.swansea.gov', 'msc', 3);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Gage', 'McAulay', '1988-12-26', 'Gage.@bish.school.swansea.gov', 'ma', 7);
INSERT INTO staff (staffid, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffid_seq'), 'Lane', 'Wasteney', '1988-05-01', 'Lane.@bish.school.swansea.gov', 'msc', 7);

INSERT INTO School (schoolid, schoolname, district, address, phonenumber, email, headmaster)
VALUES (NEXTVAL('schoolID_seq'), 'bishopston', 'bishopston', 'The Glebe, Bishopston, Swansea, SA3 3JP, United Kingdom',
        '01792 234121', '6704069_BishopstonComprehensive@Hwbcymru.net', '1');

INSERT INTO yeargroup (yeargroupid, enrollyear, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), '2022-09-01', '2027-06-30', 1);
INSERT INTO yeargroup (yeargroupid, enrollyear, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), '2021-09-01', '2026-06-30', 1);
INSERT INTO yeargroup (yeargroupid, enrollyear, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), '2020-09-01', '2025-06-30', 1);
INSERT INTO yeargroup (yeargroupid, enrollyear, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), '2019-09-01', '2024-06-30', 1);
INSERT INTO yeargroup (yeargroupid, enrollyear, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), '2018-09-01', '2023-06-30', 1);

INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'English', 'Exam', 79.05);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Biology', 'Essay', 61.54);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Physics', 'Essay', 66.66);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Chemistry', 'Exam', 77.55);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Maths', 'Essay', 42.20);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'History', 'Exam', 57.90);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Religious Studies', 'Essay', 43.10);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'PE', 'Exam', 73.15);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Geography', 'Exam', 84.87);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'English', 'Exam', 92.60);

INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bradley', 'Pamplin', '2008-12-05', '1 Pankratz Lane', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lee', 'McLugish', '2009-01-16', '5352 Arkansas Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ambur', 'Erridge', '2006-12-06', '5 Namekagon Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carlyn', 'Wilcockes', '2007-11-20', '052 Trailsway Pass', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gus', 'MacKibbon', '2010-10-20', '34 Park Meadow Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sidnee', 'Dahler', '2008-02-12', '5079 Talisman Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ibrahim', 'Kanter', '2010-03-28', '166 Johnson Pass', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eduard', 'Cobden', '2007-06-29', '74443 Sommers Junction', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bat', 'Goodger', '2009-05-17', '19031 Morrow Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Aymer', 'Outright', '2011-02-16', '178 Birchwood Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Roderigo', 'Lejeune', '2007-12-15', '85 Loeprich Circle', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lula', 'Fuente', '2010-10-29', '6789 East Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sibyl', 'Richt', '2009-07-10', '4115 Canary Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lucias', 'Gonnet', '2010-03-02', '0063 Forest Run Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Janel', 'Parnby', '2009-08-25', '8021 Stoughton Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tootsie', 'Hucker', '2010-05-15', '572 Lyons Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sibley', 'Beamson', '2011-07-29', '0 Havey Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Clay', 'Broggio', '2010-03-04', '0181 Paget Park', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dani', 'Anfusso', '2009-10-01', '48 Ramsey Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gregorio', 'Tregear', '2008-07-03', '8 Elka Terrace', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Haven', 'Widocks', '2010-03-22', '77130 Grayhawk Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tania', 'Sponton', '2010-06-22', '45226 Lotheville Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Barty', 'Ede', '2008-04-28', '28010 Haas Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Issiah', 'Schusterl', '2011-03-12', '4133 Mesta Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nomi', 'Yesson', '2007-09-02', '3 Golf View Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dina', 'Veall', '2006-11-16', '51 Bonner Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tuckie', 'Leil', '2009-09-16', '69 Pankratz Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Regan', 'Crathorne', '2009-04-24', '46298 North Trail', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tobey', 'Capeloff', '2009-04-19', '1390 Mayer Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Obidiah', 'Haugeh', '2009-07-12', '7 Basil Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Amelia', 'Drejer', '2010-03-17', '69 Scott Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Thorn', 'Nuemann', '2009-05-04', '85 Saint Paul Place', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ginnie', 'Kaspar', '2007-12-06', '57 Linden Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cleo', 'Cussen', '2008-04-30', '61258 Cascade Drive', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shellysheldon', 'Holdey', '2011-08-02', '37469 Village Green Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Norah', 'Giannasi', '2011-01-31', '6190 Vermont Circle', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pauly', 'Issacof', '2009-03-22', '4 Lerdahl Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Waring', 'Klimkov', '2009-08-17', '4517 Del Sol Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mora', 'Leith-Harvey', '2011-07-13', '846 Eagle Crest Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hyatt', 'Verrier', '2010-07-14', '99356 Erie Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Barnabas', 'De Rechter', '2011-08-07', '281 Pankratz Junction', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Linoel', 'Empleton', '2007-10-12', '722 Green Ridge Pass', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Georas', 'Bellworthy', '2010-01-04', '61 Fremont Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Emmett', 'Chittim', '2009-11-10', '36 Linden Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Godfry', 'Ivel', '2009-10-30', '32243 American Ash Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Onfroi', 'Rowlinson', '2007-04-16', '9530 2nd Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Padriac', 'Curragh', '2010-10-04', '48 Bunting Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lauritz', 'Goodey', '2010-03-01', '87117 Pleasure Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Branden', 'McNally', '2011-01-12', '3623 East Street', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alexandre', 'Dewdeny', '2007-04-12', '22 Macpherson Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Aldis', 'Nuccii', '2010-09-12', '29 Golf Course Parkway', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Berny', 'Cropper', '2008-06-23', '807 South Lane', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Burt', 'Denisard', '2010-11-02', '9951 Dapin Plaza', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Fanny', 'Jephcott', '2011-10-08', '0 West Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shepherd', 'Giacopello', '2008-05-05', '21231 Parkside Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Noelani', 'Aleevy', '2011-08-12', '5 Petterle Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hoebart', 'Cash', '2010-04-06', '2240 Wayridge Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Patton', 'McGaffey', '2009-11-18', '70548 Little Fleur Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Omero', 'Tordiffe', '2010-05-26', '704 2nd Terrace', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lian', 'Juschka', '2008-09-21', '4541 Goodland Circle', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Benedikt', 'Redsull', '2011-02-11', '39 Golf View Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Giavani', 'Jerdein', '2009-07-08', '06870 Clemons Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eleen', 'Tomsu', '2010-07-29', '24 Talmadge Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Clarinda', 'Mackinder', '2010-09-10', '483 Ryan Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Melina', 'Stealfox', '2007-05-17', '19 Sage Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cord', 'Aspling', '2011-01-21', '8 Thompson Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sherrie', 'Valente', '2011-02-06', '59 Di Loreto Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Oates', 'Scoates', '2007-11-24', '0439 Fallview Street', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vidovik', 'McGarrell', '2011-07-01', '3 Troy Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Darbee', 'Klimaszewski', '2007-06-25', '388 Melvin Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Billye', 'Latour', '2010-03-28', '95 Arizona Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dorthy', 'Ife', '2009-11-14', '3 American Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kipp', 'Crosi', '2011-06-27', '39065 Clarendon Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Saunder', 'Boston', '2007-05-13', '60028 Crownhardt Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bordie', 'Weber', '2009-03-09', '94043 Grayhawk Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leonelle', 'Siviour', '2006-11-29', '738 Sunbrook Avenue', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eartha', 'Orpwood', '2008-08-17', '7 Veith Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Paolo', 'Wall', '2008-11-07', '78402 Delladonna Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Clemmie', 'Beernt', '2009-04-25', '1 John Wall Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Torrance', 'Hogben', '2010-08-26', '71681 Atwood Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pearl', 'Fenck', '2008-12-10', '0 Commercial Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Waldon', 'Gillaspy', '2009-07-21', '0789 Porter Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leona', 'O''Hingerty', '2008-04-08', '1717 Jenna Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tessi', 'Balint', '2011-05-14', '206 Carioca Lane', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ernestine', 'Duker', '2010-07-10', '18650 Canary Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eugine', 'Carlill', '2011-08-24', '2807 Ronald Regan Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jeramey', 'Fullylove', '2009-02-01', '9579 Fair Oaks Lane', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Robinia', 'Ofield', '2010-04-24', '9 Brentwood Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nolly', 'Gullifant', '2007-02-19', '391 Brentwood Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Saunders', 'Eyles', '2009-05-23', '895 Westport Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Natasha', 'Trinke', '2010-09-01', '8018 Randy Terrace', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shayla', 'Childrens', '2007-10-14', '55 Pennsylvania Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Holden', 'Kelberman', '2010-02-02', '5622 Sloan Parkway', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Silvio', 'Northing', '2007-05-20', '30 Ilene Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Delphinia', 'Ricoald', '2011-04-03', '45067 Bunting Drive', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Aindrea', 'Meeson', '2007-03-30', '9 Moland Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Emyle', 'Meni', '2009-02-17', '8 Di Loreto Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Constantin', 'Stallan', '2010-03-02', '4 Londonderry Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hurlee', 'Bonsall', '2008-08-31', '3 Sutteridge Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marlane', 'Collicott', '2011-03-31', '25438 Mallory Circle', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tommie', 'Benza', '2010-11-01', '8 Swallow Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ellene', 'Greveson', '2011-02-03', '63844 Village Alley', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lamar', 'Moorcroft', '2007-02-26', '72533 Mallory Way', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Geri', 'Cattrall', '2007-07-29', '670 Nevada Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zorine', 'Labram', '2008-05-30', '77 Pine View Lane', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eugenie', 'Ruse', '2007-06-20', '10733 Sunnyside Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pearce', 'Spehr', '2009-06-21', '793 Hovde Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Candida', 'Blagdon', '2008-10-31', '776 Arapahoe Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Elyssa', 'Tildesley', '2009-05-04', '57 Gale Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sonni', 'Debnam', '2007-07-05', '572 Jenna Park', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Naomi', 'Streeton', '2008-03-19', '90 Saint Paul Park', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Clareta', 'Itzhaki', '2011-07-14', '8784 La Follette Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Velma', 'Clifft', '2007-03-15', '217 Northfield Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bunnie', 'Treharne', '2007-12-20', '03 Bunker Hill Parkway', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Umberto', 'Tarbox', '2008-03-01', '3420 Crest Line Circle', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bret', 'Amsden', '2007-12-19', '1 La Follette Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Georgine', 'Abbey', '2009-05-10', '232 Lerdahl Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Port', 'Dabling', '2009-02-28', '101 Barnett Lane', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Charmian', 'Giacubbo', '2008-10-08', '2239 Eggendart Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ardyce', 'Merit', '2009-09-10', '839 Fairfield Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Enrico', 'Loftin', '2011-05-07', '7013 Maple Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ronica', 'Dehm', '2009-04-10', '94577 Meadow Ridge Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Filia', 'Blazynski', '2006-11-05', '7 Southridge Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bevon', 'Commuzzo', '2009-04-17', '013 Del Mar Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eleen', 'Margrem', '2007-06-04', '5 Raven Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pierce', 'Tamburo', '2011-03-28', '391 Knutson Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Courtnay', 'Mateu', '2009-05-12', '15 Schlimgen Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rupert', 'Colcomb', '2009-12-22', '5 Logan Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Giusto', 'Stanyland', '2007-12-01', '99787 Jackson Pass', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jasun', 'Limming', '2010-12-05', '0856 Stoughton Terrace', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rennie', 'Nardrup', '2007-12-14', '30441 Debs Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chery', 'Kaesmans', '2008-01-20', '4 Garrison Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Melvyn', 'Tassell', '2008-10-16', '805 Manitowish Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sanford', 'Thams', '2008-11-12', '7073 Di Loreto Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Roderich', 'Zapatero', '2006-11-09', '382 Lotheville Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Farris', 'Plant', '2010-06-24', '89 Harper Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Randal', 'Blaiklock', '2009-09-07', '9493 Kropf Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gui', 'Vasilyev', '2009-12-01', '55 Prentice Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gregorio', 'Peealess', '2010-08-12', '75 Blaine Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tallie', 'Nelhams', '2011-08-09', '17699 Bunker Hill Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Verine', 'Caddell', '2011-07-13', '7 Eggendart Drive', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lamond', 'Bathow', '2007-08-24', '35647 Esker Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Aryn', 'Mackneis', '2011-01-09', '21 Roth Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Germayne', 'MacDermot', '2011-03-14', '6 Kingsford Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Charmian', 'Stoffersen', '2010-12-28', '4531 Schmedeman Junction', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Harrietta', 'Kliner', '2006-12-28', '47 Goodland Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hanni', 'Stubbin', '2010-09-30', '2 Badeau Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zane', 'Mazzia', '2010-11-13', '41 Lerdahl Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Maryann', 'Oene', '2007-01-06', '6 Truax Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Corny', 'Feak', '2009-06-04', '72 Butternut Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gillian', 'Sollon', '2008-09-22', '3702 Nobel Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Taite', 'Fairfoot', '2006-11-11', '17 Esch Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dorry', 'Reymers', '2009-12-12', '98 Donald Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Corbie', 'Ragsdall', '2008-09-08', '62 Marquette Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nicole', 'Savill', '2010-04-22', '60598 Forster Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Berty', 'Melluish', '2011-06-10', '3176 Hagan Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Brit', 'Jowett', '2010-04-01', '0 Fordem Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Briny', 'Broadberry', '2008-01-10', '7 Fuller Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Helga', 'Donn', '2007-06-16', '570 Macpherson Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jodie', 'Bagwell', '2009-07-09', '2 Brickson Park Circle', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lorianna', 'Ollington', '2007-11-03', '8491 Beilfuss Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Temple', 'Goodreid', '2008-03-04', '0995 Sutteridge Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Emyle', 'Skurm', '2008-10-06', '95177 West Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Yule', 'Francescotti', '2007-11-13', '8 Hazelcrest Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Joletta', 'McKenny', '2011-08-02', '4 Morning Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gabrila', 'Bernocchi', '2008-07-21', '06 Judy Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Paolo', 'Hebdon', '2007-07-24', '091 Surrey Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Odelle', 'Loblie', '2009-04-24', '81286 Talisman Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Reagan', 'Ternouth', '2008-12-03', '4 Commercial Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vergil', 'Sigart', '2009-01-01', '15105 Bultman Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jo-ann', 'Douthwaite', '2007-04-29', '63 Manufacturers Park', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Windham', 'Gomes', '2009-11-14', '84869 Morrow Crossing', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Linette', 'Barribal', '2009-02-25', '34758 Upham Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jasen', 'Jeffries', '2010-03-19', '3693 Talisman Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Fritz', 'Quayle', '2011-09-14', '154 Darwin Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gail', 'Warry', '2006-11-10', '8765 Lighthouse Bay Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Anson', 'Singyard', '2007-10-19', '40 Doe Crossing Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nesta', 'Van Hault', '2007-08-12', '878 Maple Wood Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Normie', 'Marley', '2011-02-17', '22122 Lukken Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Monique', 'Woolfall', '2011-10-08', '85383 Pleasure Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Johannah', 'Lanigan', '2008-10-25', '7 Fairview Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Morris', 'Rutherforth', '2010-08-06', '83967 Erie Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jennica', 'Jandac', '2010-10-10', '192 Thompson Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Trumann', 'MacConnel', '2009-03-04', '9 Brentwood Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'York', 'Lannen', '2008-04-02', '5813 Brentwood Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Isaiah', 'Kubiczek', '2007-05-05', '5179 Stuart Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Arlie', 'Gallaccio', '2006-11-18', '6558 Erie Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dodie', 'Trippitt', '2009-07-13', '4 Delaware Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Guilbert', 'Hubback', '2007-01-23', '5617 Lerdahl Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Theadora', 'Yosselevitch', '2011-05-14', '35 Kenwood Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Andres', 'Abramsky', '2007-11-25', '8 Caliangt Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Emmeline', 'Matterson', '2011-05-02', '201 High Crossing Lane', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vilma', 'Tyndall', '2011-09-04', '1977 Crownhardt Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marve', 'Clapperton', '2006-12-14', '15 Tennessee Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leigha', 'Longhorne', '2008-07-18', '5056 Carioca Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Amandy', 'Rosenschein', '2009-08-08', '8 Dawn Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kizzee', 'Purkis', '2007-06-16', '4 Prairie Rose Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Diena', 'Durie', '2011-02-22', '58 Quincy Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hana', 'Murford', '2007-09-29', '81 Scofield Pass', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Reinhold', 'Ambrosoni', '2007-11-07', '9 Esker Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shea', 'Rubes', '2007-09-07', '92246 Eastwood Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ebba', 'Cool', '2007-02-01', '6 Truax Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Wrennie', 'Tart', '2007-11-26', '838 Old Shore Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Serene', 'Tuftin', '2007-12-24', '9095 Veith Street', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Constantine', 'Hogsden', '2008-11-18', '2 Randy Place', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Avram', 'Huxstep', '2010-02-26', '84435 Westend Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jonell', 'Shipcott', '2008-11-03', '71 Dahle Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Viviyan', 'Brugmann', '2008-08-02', '866 Lyons Lane', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ingeborg', 'Pike', '2010-04-10', '83 Merry Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bertie', 'O'' Neligan', '2008-07-16', '0 Shasta Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Garrik', 'Herche', '2010-02-22', '40547 Merchant Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Em', 'Andell', '2010-01-11', '49334 Superior Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mikol', 'Gulliver', '2010-06-29', '9242 Chinook Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cirillo', 'Klugman', '2011-02-03', '51738 Spohn Circle', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Milli', 'Senten', '2006-11-26', '4 Erie Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pavel', 'Tamas', '2008-03-19', '5391 Pankratz Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dasya', 'Syvret', '2009-10-23', '18586 Heffernan Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Flinn', 'Donke', '2011-05-08', '28421 Loomis Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cirstoforo', 'Hawkey', '2007-12-05', '5 Haas Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Catherina', 'Sabathier', '2008-09-23', '2035 Debs Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Reinhold', 'Chace', '2007-11-03', '55 Harbort Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Derk', 'Heaysman', '2008-04-11', '6578 Magdeline Lane', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bryn', 'Coxall', '2008-06-08', '2262 Cambridge Park', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Adelbert', 'Fawdery', '2010-10-25', '3310 Loeprich Avenue', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Arman', 'Wolfinger', '2009-05-09', '9 Tony Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Markos', 'Iveagh', '2008-10-17', '0 Boyd Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Raviv', 'Lazenbury', '2009-08-29', '587 Randy Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Constance', 'Crathorne', '2008-09-10', '79 Artisan Junction', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Flossie', 'Scholard', '2010-02-22', '5520 Autumn Leaf Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sharity', 'Camsey', '2007-09-09', '945 Arrowood Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lauritz', 'Hammerman', '2010-12-15', '9 Hanson Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bord', 'Blackmuir', '2011-09-11', '74378 Tomscot Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sephira', 'Embury', '2007-11-18', '23 Bluejay Way', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cele', 'Seiler', '2009-04-05', '4 Vahlen Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Caleb', 'Congram', '2011-03-15', '20906 Sunfield Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dur', 'Cuniffe', '2009-11-13', '3474 Gale Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Engelbert', 'Balderstone', '2008-07-12', '55175 Hovde Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Queenie', 'Spirit', '2010-10-12', '84702 Anderson Terrace', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Winni', 'Clemenzo', '2010-10-09', '93 Lakewood Gardens Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Noel', 'Haacker', '2009-07-09', '4803 Macpherson Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gibbie', 'Blankau', '2010-10-19', '65137 David Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Saba', 'Tancock', '2008-09-06', '28 Heffernan Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Even', 'Fusedale', '2007-06-22', '19009 Ruskin Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ellary', 'Knuckles', '2011-08-05', '7522 Brickson Park Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Harwilll', 'Francomb', '2010-10-17', '63980 Bayside Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Giacobo', 'Junes', '2009-10-22', '04118 Lien Lane', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gerianna', 'Joules', '2008-12-14', '554 International Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Danie', 'Balducci', '2008-12-03', '8 Anthes Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Floris', 'Kulvear', '2009-03-01', '71 Mayer Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eldon', 'Conniam', '2010-12-11', '5079 Northland Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Miller', 'Laite', '2010-02-19', '00126 Declaration Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Geordie', 'Baff', '2010-04-29', '67 Annamark Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vassili', 'Ducker', '2010-11-30', '754 Jenifer Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ulrike', 'Traite', '2010-09-20', '1 Eagan Junction', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leif', 'Conyer', '2007-03-02', '2 Gerald Place', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Fedora', 'Folliott', '2008-12-05', '2041 Susan Lane', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ford', 'Graalmans', '2008-07-06', '705 Glendale Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lelia', 'Oene', '2010-10-31', '6851 Gulseth Circle', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Auria', 'Fussey', '2010-04-27', '62 Acker Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Franciska', 'Bearne', '2008-11-01', '4 Vera Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zane', 'Gabe', '2009-10-25', '2 Bluestem Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bibby', 'Kassman', '2008-04-21', '8 Everett Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Peta', 'Douglas', '2007-10-31', '499 Porter Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kimberly', 'Schapero', '2011-03-06', '976 Banding Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ki', 'Lightowlers', '2008-07-10', '91858 Mesta Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Berta', 'Hartop', '2010-05-24', '75 Straubel Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dionysus', 'Starking', '2009-01-10', '3 Debs Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marcella', 'Piddlesden', '2010-08-15', '24 Swallow Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Christy', 'Coale', '2009-03-22', '65410 Maryland Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Maggee', 'Helling', '2009-06-07', '0016 Ludington Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kylie', 'Orbon', '2009-12-06', '4 Rockefeller Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kordula', 'Bayston', '2006-11-22', '8354 Brentwood Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Abram', 'Sawell', '2011-08-21', '9945 Surrey Place', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ashlen', 'Symmons', '2008-09-03', '99 Blaine Lane', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Malinde', 'Archibould', '2010-01-18', '7872 Shoshone Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tedda', 'Troubridge', '2008-01-11', '1 La Follette Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Karney', 'Notti', '2010-11-17', '3813 Cambridge Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cordelia', 'Kubek', '2009-11-24', '6298 Wayridge Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gustav', 'Pattrick', '2010-08-10', '9 Almo Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eadmund', 'Wigin', '2010-03-12', '93 Esch Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Junia', 'Tretwell', '2010-11-24', '94 Northview Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rickie', 'Krzyzowski', '2010-08-22', '351 Farragut Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alvie', 'Goodhay', '2009-02-13', '610 Dovetail Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tabbie', 'Starbucke', '2007-04-01', '65215 Everett Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Fletcher', 'MacLoughlin', '2010-11-10', '01061 Maywood Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Reuven', 'MacCombe', '2007-07-11', '3427 Moland Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Amie', 'Pearne', '2010-02-28', '558 Corben Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jewel', 'Woodrup', '2008-06-09', '904 Meadow Vale Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Neel', 'Duggan', '2009-10-15', '7935 Clarendon Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Danit', 'Khidr', '2010-06-17', '12545 Golden Leaf Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bertina', 'Housen', '2010-03-11', '46179 Badeau Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cosimo', 'Giovannoni', '2007-12-22', '5 Butterfield Alley', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Henderson', 'Arrighi', '2010-03-30', '5 5th Lane', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Joete', 'Pauer', '2008-02-19', '7262 Chive Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Coraline', 'Beneze', '2008-01-31', '072 Veith Point', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jud', 'Lively', '2010-12-19', '92333 International Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bambie', 'O''Lochan', '2011-01-06', '056 Heffernan Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ciro', 'Stegel', '2008-07-17', '1083 Morningstar Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rusty', 'Ropking', '2008-12-01', '0860 Prentice Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Orson', 'Clissett', '2009-07-10', '73 Lake View Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Adela', 'Agent', '2008-01-10', '02975 Delladonna Avenue', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Loni', 'Grelka', '2009-05-26', '252 Hintze Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ethelda', 'Abramin', '2008-06-17', '29 Merrick Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vasilis', 'Greenwell', '2011-02-03', '6 Westport Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marcie', 'Clifford', '2006-10-26', '93 4th Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eloisa', 'Orsay', '2010-02-25', '4134 Anzinger Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sigismund', 'Confait', '2007-11-02', '7891 Roth Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Paten', 'Kubera', '2008-11-28', '7661 Ryan Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Editha', 'Samweyes', '2007-07-06', '134 La Follette Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Grange', 'Lockyear', '2007-11-17', '737 Farwell Point', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Greg', 'Insall', '2010-07-09', '8901 Helena Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cori', 'Kennally', '2009-12-24', '06532 Barnett Hill', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Melantha', 'De Meis', '2007-04-17', '9 Surrey Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kelcey', 'Feacham', '2008-09-01', '2349 Shelley Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Conn', 'Toolin', '2007-01-18', '116 Lakewood Gardens Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Levy', 'Gentle', '2009-07-12', '3 Fieldstone Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carolann', 'Shoreson', '2006-10-28', '7321 Lighthouse Bay Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Meagan', 'Erickson', '2007-12-22', '6373 Melrose Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Corabel', 'Anscombe', '2010-09-15', '51 Norway Maple Terrace', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kathryne', 'Maureen', '2011-01-07', '167 Beilfuss Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gerianna', 'Gore', '2011-01-02', '8414 Everett Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Arabele', 'Edlyn', '2010-01-27', '61 Corscot Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ram', 'Skivington', '2007-12-16', '66929 Towne Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kameko', 'Croft', '2010-08-15', '60 Ridgeview Crossing', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Corabel', 'Vennard', '2010-08-11', '99 Arizona Plaza', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lyle', 'Fancutt', '2007-10-27', '239 Upham Hill', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vincents', 'Shapera', '2011-01-24', '914 Briar Crest Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Freeland', 'Calkin', '2008-10-13', '9 Hayes Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Timofei', 'Aloigi', '2009-03-27', '4 Katie Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hamlin', 'Christofe', '2007-04-19', '193 Fieldstone Pass', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Callean', 'Moyer', '2008-04-04', '28258 Muir Street', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rickert', 'Reignould', '2010-07-29', '2 Anderson Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lynea', 'Hessenthaler', '2008-12-29', '7184 Sullivan Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Florida', 'Pigne', '2009-01-08', '5607 Victoria Trail', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Florry', 'Banbrigge', '2010-02-07', '567 Bartelt Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Orel', 'MacCoughan', '2008-08-12', '58 Pierstorff Way', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alvin', 'Hallet', '2009-03-07', '76944 Steensland Street', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tobe', 'O''Gready', '2008-04-03', '862 Springview Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Raven', 'Windridge', '2009-10-04', '58 Merry Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Heinrik', 'Serot', '2010-05-17', '54 Kim Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mathe', 'Chooter', '2010-03-16', '6 North Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zerk', 'Skocroft', '2007-11-14', '73 Delaware Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Prudence', 'Klulik', '2008-02-13', '6 Carioca Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alissa', 'Northing', '2010-06-21', '26751 Susan Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Caesar', 'Semken', '2009-04-22', '27254 Pepper Wood Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cyb', 'Devonald', '2010-08-14', '308 Center Plaza', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Korrie', 'Casiroli', '2008-01-17', '59896 Melby Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Andromache', 'Foard', '2011-01-19', '0 Charing Cross Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nana', 'Hazzard', '2007-10-20', '3264 Elmside Junction', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hilarius', 'Wiffler', '2007-01-13', '249 Namekagon Circle', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Fredrika', 'Vollam', '2009-05-04', '11648 Ludington Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Angelika', 'Shubotham', '2010-04-08', '15573 Golf Course Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ellynn', 'Mellsop', '2007-10-27', '14 Artisan Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kathryne', 'Gidney', '2008-04-09', '06334 Talisman Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nan', 'Hounsham', '2010-06-30', '31413 Memorial Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jeannie', 'Jime', '2009-03-14', '25347 Havey Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mariam', 'Arnaut', '2010-08-08', '4 Sullivan Alley', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tedd', 'Jenking', '2007-08-11', '79 Vidon Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Katlin', 'Wards', '2008-01-17', '1 Dorton Junction', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tera', 'Bennett', '2009-06-26', '3 Summer Ridge Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lemmy', 'Levensky', '2007-03-16', '8896 Moulton Lane', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sharai', 'Waldera', '2010-02-02', '56612 Gulseth Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kerr', 'Pirson', '2009-07-09', '409 Nobel Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ara', 'Tonbridge', '2008-11-17', '28345 Clyde Gallagher Lane', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Elsy', 'MacDonnell', '2010-09-22', '8 Russell Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Harriett', 'Casetta', '2010-09-21', '21 Ridgeview Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shellysheldon', 'Huxster', '2009-06-08', '4226 Hansons Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Daile', 'Ambrosio', '2006-11-07', '56 Hanover Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ethelred', 'Humble', '2008-06-03', '083 Sutherland Street', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Emerson', 'Barnwell', '2007-07-22', '8528 Morrow Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chrissy', 'O''Canavan', '2007-01-01', '5704 Warrior Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jeniece', 'Galbraeth', '2008-06-25', '14 Manitowish Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lyda', 'Farnfield', '2010-09-10', '151 Oakridge Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Adrea', 'Minshull', '2007-01-25', '1 Vernon Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Saloma', 'Trustey', '2010-12-08', '87079 Arkansas Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kanya', 'Commusso', '2008-06-12', '1 Golden Leaf Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chevalier', 'Bettleson', '2011-09-27', '9429 Algoma Trail', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Michal', 'Ewan', '2008-01-05', '3 Surrey Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'George', 'Tomasicchio', '2009-10-08', '835 Memorial Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dicky', 'Dielhenn', '2007-09-23', '24174 Hallows Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tiffi', 'Warre', '2008-08-31', '777 Ilene Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cassondra', 'Elliman', '2009-02-14', '3 Ohio Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Caleb', 'Risborough', '2007-09-04', '5 Rusk Parkway', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mady', 'Swapp', '2007-04-22', '757 Linden Junction', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nicholas', 'Petrushka', '2009-09-19', '5 Fieldstone Pass', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Obadiah', 'Cliss', '2009-10-22', '38 Melrose Street', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marsh', 'Hasslocher', '2011-01-02', '0816 Arapahoe Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dionysus', 'Wimlet', '2009-11-30', '6 Kensington Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Melisa', 'Clues', '2008-08-11', '893 Nevada Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hewitt', 'Brawley', '2010-12-16', '12 Ramsey Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jerrylee', 'Rowswell', '2010-07-14', '2 Graedel Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Daile', 'Haselwood', '2009-12-17', '90 Sauthoff Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mohandis', 'Gilbee', '2009-01-28', '4783 Sunnyside Alley', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Prentice', 'Rego', '2007-03-25', '79 Evergreen Drive', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Olivie', 'Lismore', '2011-05-29', '808 Granby Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Barth', 'Walkden', '2009-03-05', '74 Coolidge Drive', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Catha', 'Kirkby', '2009-06-04', '558 Spohn Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ania', 'Jobin', '2008-08-18', '0 Mandrake Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Frieda', 'Byrnes', '2007-09-29', '0 Grover Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cazzie', 'Milleton', '2010-06-11', '47388 Mesta Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tabatha', 'Withringten', '2010-05-14', '1502 Corry Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bryan', 'Stollery', '2008-04-22', '03288 Debra Street', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bride', 'Argont', '2009-01-24', '538 Vernon Plaza', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rochell', 'Hurne', '2009-02-13', '521 Bayside Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cos', 'Connaughton', '2007-12-24', '90711 Mccormick Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carole', 'Ughelli', '2009-06-24', '35269 Dapin Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Suellen', 'Keightley', '2011-03-23', '3838 Walton Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nikki', 'Jessett', '2007-04-05', '31574 Orin Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Corabella', 'Haisell', '2010-02-18', '57690 Glendale Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lamont', 'Candey', '2008-01-31', '11372 Sachtjen Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Helenelizabeth', 'Carmichael', '2011-03-25', '6 Warbler Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nataline', 'Yerbury', '2011-02-09', '9 Esch Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hayley', 'Guirard', '2009-11-20', '77241 American Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Aindrea', 'Beaney', '2007-05-23', '8 Spenser Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jewell', 'Jowett', '2009-10-17', '78 Almo Junction', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jorgan', 'Laverty', '2008-07-26', '7783 1st Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vina', 'Nissle', '2008-03-21', '492 Fairview Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cletus', 'Dmytryk', '2007-08-18', '7 Butterfield Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Randee', 'Franzel', '2007-02-10', '2 Badeau Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kristal', 'Godman', '2011-07-07', '006 Fairview Street', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Massimo', 'Cotta', '2009-06-07', '947 Messerschmidt Circle', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Torin', 'Sale', '2008-11-26', '937 Arkansas Street', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hatti', 'Haynesford', '2009-10-21', '6 Fulton Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Madella', 'Championnet', '2010-03-05', '275 Starling Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cedric', 'Mandel', '2008-08-05', '0163 Mallard Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nara', 'Veryard', '2008-12-07', '8014 Vermont Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Violante', 'Ricci', '2010-08-29', '8 Sage Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jocko', 'Hadgkiss', '2007-07-29', '8 Tomscot Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cosme', 'Seyfart', '2010-03-09', '966 Barby Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dal', 'Ferrillo', '2011-09-23', '2 Corry Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cesaro', 'Cabbell', '2007-02-27', '223 Corscot Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leroi', 'Linklater', '2009-01-24', '41 Hazelcrest Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Guenna', 'Tejada', '2009-05-07', '2667 Mccormick Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hartwell', 'Di Carlo', '2007-12-27', '2 Warbler Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hubey', 'Barbour', '2009-05-20', '31 Crowley Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shoshana', 'Sconce', '2011-02-11', '23489 Eagle Crest Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Courtney', 'Philipsohn', '2009-06-01', '86744 Gerald Crossing', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Emmy', 'Dadswell', '2010-07-05', '2424 Mayfield Terrace', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Maddie', 'Collingridge', '2011-07-05', '25439 Hudson Lane', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Seward', 'Tribble', '2008-08-28', '7 Shoshone Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dudley', 'Boxen', '2007-07-03', '07 Spohn Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Wilma', 'Brophy', '2007-09-27', '4013 West Lane', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Livvyy', 'Tuffell', '2011-01-25', '81273 Lyons Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Griselda', 'Pomeroy', '2009-06-21', '6 Columbus Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Calypso', 'Rayburn', '2008-04-21', '5 Hazelcrest Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jessi', 'Newns', '2008-02-14', '01275 Dakota Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lory', 'Maldin', '2009-04-12', '08 Vermont Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Barbabra', 'Nockalls', '2007-11-27', '97302 Northview Drive', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ive', 'Schustl', '2010-10-06', '7866 Morning Street', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tyler', 'Paskerful', '2010-05-31', '5025 Buhler Way', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cletus', 'Ascough', '2008-10-22', '0290 Sachtjen Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carlee', 'Caccavella', '2010-01-26', '891 Rusk Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nanine', 'Hainsworth', '2009-03-25', '1 Sherman Trail', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Murray', 'Wakeling', '2011-03-18', '24 Browning Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Davide', 'Brain', '2010-09-07', '9 Boyd Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Diane-marie', 'Makeswell', '2009-03-13', '46388 Magdeline Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pier', 'Brailsford', '2008-09-03', '1166 Aberg Terrace', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ross', 'Boughtflower', '2009-09-06', '37941 Waywood Street', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Reeva', 'Caulwell', '2008-04-30', '4384 Scofield Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gnni', 'Iacovielli', '2009-10-09', '2 Dunning Pass', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sauncho', 'Mynett', '2011-07-23', '6508 Forest Dale Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ransom', 'Iddens', '2009-12-28', '6417 Nova Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cory', 'Bernth', '2010-05-06', '9080 Porter Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Silvie', 'Pyer', '2008-12-03', '2825 Menomonie Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Darnell', 'Lawrie', '2009-11-03', '15179 Sommers Street', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Freddy', 'Huffer', '2009-09-13', '62 Thierer Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bonnie', 'Heningham', '2008-02-20', '4 Di Loreto Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Krissy', 'Ivanikov', '2007-08-24', '54 David Way', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Renado', 'Lembcke', '2007-09-07', '05255 Mandrake Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shaina', 'Pecht', '2009-12-24', '17 Cardinal Circle', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Adolphus', 'Mattiessen', '2008-08-09', '90295 Kenwood Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Silvanus', 'Witherden', '2007-07-30', '81 Cascade Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Florencia', 'Oaks', '2007-02-12', '82 Golf Course Way', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Colette', 'Copelli', '2009-03-19', '9794 Hudson Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zebulon', 'McNaughton', '2011-10-08', '1 Kim Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chuck', 'Bazell', '2007-09-18', '7 Knutson Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dorise', 'Brockherst', '2009-02-20', '85 Stone Corner Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Timmie', 'Arnke', '2009-09-22', '62013 Columbus Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Agretha', 'Ilyin', '2010-08-07', '8413 Stephen Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Karalynn', 'Matschoss', '2009-03-26', '64533 Moose Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Opal', 'Shakle', '2009-01-11', '9 Bartillon Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gerrilee', 'Kubiczek', '2006-11-24', '0 Anhalt Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Claudelle', 'Korpal', '2007-04-11', '305 North Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tann', 'Verrill', '2009-06-04', '53 South Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kris', 'Jordeson', '2008-01-20', '826 Lyons Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lothaire', 'Rouf', '2009-07-22', '8 Maple Wood Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Emmit', 'Bugler', '2010-02-14', '7 Starling Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Joanna', 'Widdecombe', '2009-11-10', '7606 Huxley Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Claire', 'Sarjent', '2010-11-08', '1641 Anderson Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Adella', 'Coysh', '2009-03-05', '6 Rowland Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Agnese', 'Surr', '2008-12-04', '72 Talisman Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kai', 'Reubel', '2008-02-20', '4846 Graedel Center', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leilah', 'Ballinghall', '2007-02-15', '18611 Golf View Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Oran', 'Markl', '2008-12-20', '4 Manufacturers Drive', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Thatcher', 'Ledamun', '2007-03-02', '9 Cambridge Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Franklin', 'Caldroni', '2010-11-17', '9216 Crest Line Plaza', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Blondell', 'Blaise', '2011-05-27', '66677 Dakota Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cristi', 'Tilzey', '2011-07-19', '9554 Namekagon Way', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sallyanne', 'Creaven', '2011-01-29', '1122 Helena Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Brien', 'Hendrix', '2007-12-28', '2924 Vahlen Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Camey', 'Brawley', '2007-12-21', '4 Hayes Parkway', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Warden', 'Giacomasso', '2008-10-20', '82898 Ridgeview Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Selinda', 'Tiebe', '2007-08-05', '55265 Nevada Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Joshuah', 'Lorne', '2009-12-03', '79169 Muir Alley', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Addison', 'Gornall', '2008-02-08', '1 Farwell Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cherianne', 'Vasilenko', '2009-07-06', '8 Mitchell Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Helaina', 'Fayerbrother', '2010-12-07', '8962 John Wall Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kristoforo', 'Palfrey', '2008-04-21', '34 Northfield Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Babb', 'Mcwhinnie', '2011-10-15', '8913 Riverside Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Concettina', 'Deverale', '2010-11-10', '36 Porter Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Benyamin', 'Eloi', '2011-10-16', '7 American Ash Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Roberto', 'Monro', '2009-09-02', '23784 Union Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rina', 'Phillippo', '2010-04-26', '6 Northridge Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Henry', 'Mapston', '2007-10-08', '9 Derek Park', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Keane', 'Treweke', '2007-07-28', '3245 Haas Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vanessa', 'Clackers', '2007-01-03', '45553 Old Gate Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chandra', 'Jurzyk', '2011-06-27', '1425 Comanche Terrace', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ardelle', 'Reolfo', '2007-05-31', '6 Grim Junction', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nilson', 'Wick', '2008-12-25', '1 Bluejay Plaza', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Baird', 'Bailie', '2010-10-20', '87 Maryland Circle', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Peggie', 'Frisdick', '2009-06-10', '0254 Rockefeller Circle', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sonja', 'Giraudy', '2008-05-13', '9 Sunnyside Circle', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gerrilee', 'Childerhouse', '2010-02-28', '1585 Upham Circle', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jozef', 'Kobes', '2011-10-09', '14 Alpine Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marrilee', 'Ardling', '2008-11-21', '82 Calypso Plaza', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Salvador', 'Larway', '2009-04-24', '72 Clyde Gallagher Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Patty', 'Gregory', '2009-05-18', '06019 Jenifer Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Helen-elizabeth', 'Bickle', '2010-11-28', '4368 Shelley Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Matthew', 'Clamp', '2007-05-12', '7 Carberry Street', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gradey', 'Zimmermeister', '2007-01-29', '5534 Dennis Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Adrea', 'Tomala', '2007-07-10', '62992 Claremont Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Maurizia', 'Girard', '2010-10-27', '08487 Morningstar Avenue', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dulcy', 'Stinchcombe', '2008-10-26', '47 Lakewood Gardens Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shannon', 'Mulqueen', '2007-05-30', '11120 Dakota Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Christoforo', 'Lorand', '2010-04-23', '23 Oak Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kirby', 'Troillet', '2011-02-26', '7 Thackeray Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pieter', 'Dyde', '2011-09-15', '6 Macpherson Alley', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Di', 'Kennion', '2008-01-19', '737 Service Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chilton', 'Gouda', '2008-05-14', '2865 Lakeland Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Brody', 'Barhims', '2010-07-12', '4 Beilfuss Pass', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dannie', 'Dundin', '2006-10-23', '7 Dapin Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dorris', 'Fehners', '2009-01-01', '7 Rusk Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Buiron', 'Devennie', '2008-12-06', '59 School Parkway', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Melloney', 'Klaus', '2009-06-25', '32 Sommers Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Klara', 'Jon', '2008-03-15', '85449 Mcbride Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mortimer', 'Choupin', '2008-03-24', '065 Scoville Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zita', 'Abad', '2010-06-17', '6 Straubel Point', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jillane', 'Bellows', '2011-08-20', '39 Pine View Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Devin', 'Westhofer', '2010-05-22', '9495 Cody Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Aleta', 'Hovenden', '2007-03-09', '575 Anniversary Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Berni', 'Miroy', '2009-04-05', '58908 7th Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lavinie', 'Finlator', '2008-12-29', '5 Stoughton Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hortensia', 'Kither', '2008-06-30', '72 Kings Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Abagael', 'Muckleston', '2011-06-01', '453 Fremont Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Brewer', 'Attryde', '2010-06-25', '431 Iowa Lane', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cherye', 'Guillerman', '2010-03-02', '92084 Reindahl Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alida', 'Ashard', '2011-05-18', '4 Continental Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cynthie', 'Heasly', '2011-01-04', '332 Paget Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Meade', 'Prettejohns', '2007-06-20', '49 Milwaukee Junction', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dirk', 'Sleeny', '2009-04-12', '53052 Sycamore Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ingrid', 'Doers', '2011-06-30', '1 Anhalt Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lamar', 'Geany', '2009-11-08', '192 International Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tabby', 'Ashurst', '2008-02-19', '06637 Pierstorff Parkway', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Krispin', 'Foggo', '2008-07-10', '341 Haas Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Torr', 'Banke', '2009-06-10', '0 Claremont Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Van', 'Chrichton', '2009-05-09', '2890 Debra Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Korrie', 'Jeskin', '2009-01-15', '0648 Anhalt Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Paulie', 'St. Aubyn', '2008-12-04', '337 Arizona Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carry', 'Ghilardini', '2011-01-30', '61 Mesta Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ingaborg', 'Goodie', '2008-10-10', '83819 Dayton Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tedmund', 'Benesevich', '2011-08-05', '8070 Burrows Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Louise', 'Cleugher', '2009-04-09', '730 Morrow Circle', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Darn', 'Langfield', '2009-05-20', '58732 Evergreen Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Trixie', 'Amber', '2011-02-12', '4 Harper Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nye', 'Ebbs', '2007-08-29', '5 Burning Wood Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cassie', 'Ivankov', '2007-12-08', '2 Colorado Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ford', 'Cathie', '2006-10-23', '830 Ohio Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sondra', 'Rumming', '2010-01-03', '81509 Calypso Pass', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bethany', 'Cornuau', '2011-10-11', '3870 Cottonwood Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Anett', 'De Matteis', '2010-12-11', '245 Glendale Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dewain', 'Utton', '2010-11-25', '15 New Castle Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zoe', 'Sieb', '2011-07-31', '3 Grim Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Elisha', 'Toop', '2010-03-28', '2 Luster Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lorne', 'Shaxby', '2011-08-20', '0 Bluejay Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Franky', 'Henfre', '2007-01-13', '4932 Morning Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lavinia', 'Peal', '2009-05-11', '43 Meadow Vale Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Markos', 'Bettis', '2007-10-01', '1855 Rutledge Plaza', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alyda', 'Manicomb', '2007-01-08', '1 Vernon Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Silas', 'Rykert', '2009-01-24', '4 Crescent Oaks Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kikelia', 'Kerley', '2009-11-11', '69 Troy Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Julee', 'Huggons', '2009-12-21', '85 Heffernan Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Valli', 'Leahy', '2011-03-08', '22880 Hallows Terrace', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bidget', 'Castellani', '2011-06-07', '6 Blackbird Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Faber', 'Pescod', '2010-01-06', '254 Manley Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carlee', 'McGonigal', '2011-04-20', '66251 2nd Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marthe', 'Osinin', '2007-02-22', '9830 Ridgeway Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jared', 'Hallen', '2011-06-29', '2 Daystar Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Wells', 'Saiens', '2010-04-08', '08 Mccormick Circle', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ichabod', 'Partington', '2007-11-28', '6130 Atwood Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Holmes', 'Python', '2009-06-15', '117 Oak Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nellie', 'Gouley', '2010-05-06', '19 Londonderry Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Casey', 'Culwen', '2007-06-30', '705 Sachs Drive', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nestor', 'Causbey', '2010-01-11', '72646 Clove Pass', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dareen', 'Stower', '2009-04-22', '64 Fairfield Terrace', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jeremie', 'Gillatt', '2010-01-01', '692 Rockefeller Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Piotr', 'Khoter', '2011-01-04', '19 Forest Dale Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dorian', 'Jereatt', '2009-09-23', '81981 Barby Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Moore', 'Moncarr', '2010-07-23', '9 Elgar Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Brandea', 'Chamberlain', '2009-03-24', '097 Dovetail Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Russell', 'Marchent', '2011-07-26', '830 Acker Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Erminie', 'Awdry', '2010-06-07', '42 Hayes Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mavra', 'Dwerryhouse', '2009-06-24', '701 Saint Paul Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Flem', 'Colwill', '2007-07-18', '020 Village Green Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Filide', 'Oleszcuk', '2007-10-06', '10104 Maryland Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kynthia', 'Fenich', '2009-02-22', '636 Logan Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bernadine', 'Bootman', '2009-08-24', '07597 Truax Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hart', 'Bows', '2007-03-01', '3429 Esch Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Clio', 'Gehrels', '2007-02-06', '45758 Eggendart Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Loy', 'Jiras', '2008-12-01', '9 Glendale Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jackquelin', 'Nottram', '2009-05-05', '3024 Kensington Hill', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Minna', 'Shilston', '2007-10-11', '8 Clyde Gallagher Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Claudia', 'Oliff', '2010-12-01', '6772 Sutteridge Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gael', 'Long', '2010-08-05', '07691 Grim Drive', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ruthann', 'McCreedy', '2007-05-31', '8 Miller Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shaun', 'Diche', '2009-01-27', '5115 Thierer Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Stephine', 'Twigley', '2011-01-15', '9 Golf View Parkway', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Keeley', 'Cansdell', '2009-12-12', '689 Vernon Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Russ', 'Wrate', '2007-11-15', '3994 Harper Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Collette', 'Alsford', '2008-11-01', '988 Veith Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Camella', 'Pol', '2008-02-24', '4 Pierstorff Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Burr', 'Avrahamy', '2008-01-29', '7002 North Street', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carley', 'Billborough', '2007-12-05', '7 Hansons Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bealle', 'Clews', '2008-12-05', '02 Beilfuss Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leonard', 'Rosenzwig', '2010-12-07', '75 Marquette Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bernetta', 'Smartman', '2006-11-09', '495 Fremont Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Warner', 'Beston', '2010-12-02', '8321 Pleasure Trail', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Yevette', 'Arthur', '2009-02-12', '56 Moose Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ricki', 'Billinge', '2007-06-20', '0560 3rd Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lin', 'Wrigley', '2008-05-17', '81 Arrowood Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Erhard', 'Vann', '2008-05-04', '29 Elgar Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Peggie', 'Lewtey', '2007-01-12', '22 Corscot Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Anabella', 'Waslin', '2007-10-07', '72 Fordem Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Colline', 'Dacombe', '2010-08-13', '1 Pawling Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eadmund', 'Chazelas', '2007-02-18', '9 Glendale Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Guillemette', 'Wainwright', '2011-03-23', '4 Meadow Ridge Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bernhard', 'Sands', '2007-12-18', '881 Bultman Street', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sile', 'Chadd', '2008-12-18', '4 Ohio Avenue', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Yoshiko', 'Found', '2009-02-12', '418 Straubel Street', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sofia', 'Boule', '2010-03-16', '128 Warbler Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Burk', 'McKeran', '2009-10-31', '06652 Prentice Drive', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Stefano', 'Pudner', '2009-07-19', '1456 Stone Corner Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carlynn', 'Seares', '2007-07-11', '5846 Hoard Hill', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Phelia', 'Hemshall', '2011-01-14', '4 Emmet Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marya', 'Poge', '2009-01-11', '65123 Carpenter Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Evangeline', 'Semechik', '2008-12-03', '27795 Westridge Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Antoinette', 'Hurling', '2010-08-01', '2 Holmberg Lane', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eyde', 'Trengrouse', '2010-07-13', '00238 Shopko Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hayyim', 'Capenor', '2007-07-03', '13 Little Fleur Parkway', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ashly', 'Scarfe', '2011-04-12', '32 Green Ridge Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Aubrey', 'Park', '2010-03-10', '90754 Oneill Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ruth', 'Capell', '2011-08-20', '735 Kings Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bonny', 'Spridgen', '2011-09-09', '5 Lindbergh Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dixie', 'Losebie', '2007-11-21', '379 Heath Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lucita', 'Overnell', '2008-04-07', '96582 Packers Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kelcy', 'Andreou', '2008-09-17', '6 Fordem Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ali', 'Beaten', '2009-04-10', '2 Weeping Birch Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bren', 'Ambrogetti', '2009-02-14', '70 Upham Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Diena', 'Fentem', '2009-10-26', '13943 Lake View Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Templeton', 'Feary', '2009-03-08', '2663 Aberg Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eddy', 'Ferrarone', '2008-10-14', '25799 Manley Junction', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lisetta', 'Bartolomeotti', '2010-10-30', '102 Carberry Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Herta', 'Danielis', '2007-03-24', '59473 Linden Place', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Addi', 'Pummery', '2010-02-19', '78445 Granby Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gray', 'McCluskey', '2007-11-17', '9 Old Shore Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Delmar', 'Wiggin', '2007-10-26', '959 Ryan Circle', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Karalynn', 'Harburtson', '2007-09-06', '06769 Bluejay Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bone', 'Cloke', '2007-09-08', '69386 Huxley Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'De', 'Hatliff', '2007-02-12', '460 Graceland Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Morissa', 'Habben', '2011-05-30', '455 Linden Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zola', 'Haithwaite', '2009-04-19', '6380 Maryland Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Brand', 'Boorne', '2009-03-18', '199 Paget Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Viole', 'Ruck', '2009-05-04', '3 Shasta Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Abigail', 'Bown', '2010-03-22', '657 North Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Siana', 'Heavy', '2007-06-21', '131 Briar Crest Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rod', 'Cokly', '2009-04-16', '464 Hoard Circle', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Fern', 'Wardingly', '2006-11-25', '00 Mayer Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mario', 'Curness', '2010-11-14', '7794 Blackbird Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Yancy', 'Allred', '2010-01-20', '32866 Michigan Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dore', 'Roblin', '2006-12-28', '60 Ruskin Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Elaine', 'Brattan', '2009-10-31', '7 Redwing Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Wynnie', 'Thornton', '2008-09-04', '141 Acker Street', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Merlina', 'Sommersett', '2007-11-15', '15847 Ridge Oak Junction', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kissie', 'Depport', '2009-01-20', '9918 Meadow Vale Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Isidor', 'Dawtre', '2007-06-06', '587 Farmco Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pearline', 'Whittington', '2008-02-12', '87569 Marquette Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Doris', 'Carnson', '2011-10-04', '8 Starling Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Estrella', 'O''Meara', '2009-06-11', '91227 Dorton Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tammie', 'Goakes', '2007-04-19', '67423 American Ash Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Colin', 'Slatcher', '2007-08-18', '888 Springview Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nance', 'Cremins', '2011-04-20', '94 Corben Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kacie', 'Cattellion', '2008-08-17', '3051 Blackbird Parkway', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Yurik', 'Dimberline', '2008-04-30', '07543 Nelson Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ancell', 'Hebson', '2008-08-08', '7 Jackson Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chiquita', 'Hitschke', '2008-06-08', '7007 Briar Crest Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Maureene', 'Bownass', '2010-09-17', '4 Ohio Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tom', 'Carlo', '2010-07-20', '6 Luster Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Irwinn', 'Schwandt', '2007-03-15', '58 Prairieview Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gaspard', 'Schachter', '2008-08-07', '49 Monterey Parkway', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sebastien', 'Danneil', '2010-04-25', '94242 Southridge Center', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tyson', 'Sampey', '2009-09-18', '7309 Arrowood Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Laverne', 'Amburgy', '2007-11-28', '51153 Shopko Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rosana', 'Matiewe', '2010-09-08', '77532 Independence Terrace', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Orlan', 'Plet', '2010-02-02', '510 Logan Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hasty', 'Smallshaw', '2008-02-20', '4 Clyde Gallagher Way', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leonid', 'Packer', '2009-12-05', '2481 Talmadge Junction', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gabriella', 'Girauld', '2009-11-26', '957 Scofield Circle', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Charles', 'Renehan', '2010-06-12', '2 Farwell Plaza', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hayward', 'Sambath', '2009-01-12', '153 Nevada Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Eli', 'Becraft', '2007-12-04', '513 Raven Circle', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lennie', 'Bollum', '2006-10-19', '01 Fulton Street', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Siusan', 'Etridge', '2010-08-16', '90603 Park Meadow Hill', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dillon', 'Rudinger', '2009-09-17', '4 Sycamore Alley', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jeana', 'Tuffield', '2011-01-18', '1751 Briar Crest Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Genna', 'Wellbelove', '2010-01-29', '227 Ilene Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Emlynn', 'Florey', '2008-08-19', '74 Lakewood Gardens Avenue', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bradan', 'Szwandt', '2007-05-01', '79 Moland Plaza', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Godwin', 'Glison', '2009-08-06', '80340 Nelson Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sela', 'Yetton', '2008-07-26', '5 Gateway Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Codie', 'Smedmoor', '2006-10-28', '98 Columbus Lane', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Temp', 'Ballentime', '2010-10-05', '49 Graceland Trail', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lanni', 'Laite', '2009-07-01', '6 Doe Crossing Pass', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Celestyn', 'Pelos', '2010-05-02', '19 Sutherland Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Avrom', 'Kissell', '2009-09-16', '2 Moulton Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ada', 'Strethill', '2007-05-06', '91 Superior Pass', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Evelina', 'Puleque', '2006-11-11', '7311 Banding Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Margit', 'Treves', '2008-08-25', '23592 Debs Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Randolph', 'Holdren', '2008-08-10', '3 Lotheville Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pooh', 'Pien', '2010-07-27', '4 Summer Ridge Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hewet', 'Othick', '2011-06-06', '52 Meadow Valley Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Beverie', 'Vallis', '2009-02-22', '606 Bay Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Stevy', 'Walkinshaw', '2008-07-23', '369 Dexter Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Berthe', 'Peplaw', '2009-10-03', '855 Briar Crest Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Romain', 'Skene', '2008-02-04', '045 Red Cloud Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Heath', 'Gallahue', '2009-12-09', '739 Fisk Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Elmira', 'Gillcrist', '2007-10-08', '5128 Jay Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Agatha', 'Skillings', '2008-04-05', '0354 Erie Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Evonne', 'Croshaw', '2011-06-26', '137 Namekagon Pass', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Deni', 'Salman', '2008-04-15', '730 Blue Bill Park Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Valentino', 'Sandell', '2008-10-02', '037 Nova Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Wynny', 'Tarbatt', '2008-11-15', '1632 Boyd Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Haily', 'Antonik', '2009-06-24', '892 Surrey Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Milicent', 'Bentz', '2010-05-19', '9 Monterey Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rodd', 'Weedenburg', '2007-08-12', '425 Manley Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Edyth', 'Ruddy', '2010-03-31', '5 Petterle Circle', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jedediah', 'Ackeroyd', '2008-07-08', '849 Kropf Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lona', 'McKeggie', '2009-06-25', '979 Northridge Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Karoly', 'Hintze', '2008-04-25', '8495 Badeau Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Yves', 'Vaar', '2008-01-17', '442 Artisan Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jannel', 'Scawton', '2010-06-28', '5679 Thackeray Alley', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alina', 'Southcomb', '2007-03-05', '10 Lake View Junction', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kore', 'Smythin', '2006-10-24', '40562 Holmberg Way', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jenine', 'Tunder', '2010-10-19', '22 Anzinger Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Wynnie', 'O''Glessane', '2010-11-29', '5 Continental Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alic', 'de Amaya', '2009-10-18', '13921 Harbort Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Teresita', 'Beetham', '2008-05-08', '11 Steensland Terrace', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lena', 'Clarke-Williams', '2011-08-08', '418 Grayhawk Way', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Keenan', 'MacWhan', '2008-04-29', '3 Mifflin Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Henrieta', 'Beakes', '2008-05-03', '4855 Spaight Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Adel', 'Goodsell', '2009-02-10', '50 Leroy Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rosina', 'Kiebes', '2010-02-02', '97931 Almo Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Johnathon', 'Sutterfield', '2010-05-24', '05 Shelley Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Delphine', 'Sircomb', '2010-07-27', '20722 Valley Edge Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Brendan', 'Doble', '2009-04-23', '8332 Morrow Lane', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Barr', 'Osgodby', '2011-04-03', '4728 Lillian Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Fredelia', 'Thow', '2009-12-14', '19 School Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Benedetto', 'Readhead', '2010-10-01', '562 Division Park', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Glennis', 'Pashley', '2007-10-04', '57893 Delladonna Pass', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mirelle', 'Jahns', '2011-08-27', '643 Acker Hill', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lucina', 'Broadwell', '2009-06-30', '74288 Prairie Rose Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gipsy', 'Josefowicz', '2008-10-01', '8686 Towne Center', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jourdain', 'McCurdy', '2007-10-07', '46 Red Cloud Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nicoline', 'Riep', '2009-08-12', '436 Oneill Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Man', 'Dorot', '2008-12-09', '5501 John Wall Circle', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Trescha', 'Loney', '2010-08-05', '108 Shelley Park', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Esteban', 'Hallam', '2008-06-25', '83876 Artisan Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lacey', 'Olivetti', '2011-06-25', '87 Hoepker Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sibyl', 'Nono', '2008-06-29', '1584 Eastlawn Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Skippy', 'Laytham', '2010-06-10', '103 Burning Wood Point', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Merrily', 'Telfer', '2010-11-05', '98 Sunnyside Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lindy', 'Bascomb', '2007-03-13', '55 Larry Pass', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Godard', 'Judgkins', '2008-06-10', '5874 Hintze Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Konstance', 'Mardoll', '2010-11-04', '0151 Weeping Birch Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jesselyn', 'Andrei', '2008-07-27', '42 Dixon Avenue', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Peggi', 'Yendle', '2008-05-11', '42 Eagan Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hertha', 'Harback', '2009-06-29', '4 Kipling Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tammie', 'Spurnier', '2009-12-31', '0 Hooker Way', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Wilbert', 'Ingraham', '2011-06-18', '0 Hudson Street', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marya', 'Symcock', '2006-12-17', '3 Lillian Center', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Darla', 'Malser', '2011-02-07', '03473 Blaine Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ashly', 'Mustin', '2008-06-26', '301 Old Gate Court', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Daren', 'Catling', '2011-09-05', '9562 Sommers Street', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Orv', 'Santos', '2007-12-25', '21 Evergreen Junction', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Alec', 'Snowden', '2009-07-15', '8 Nobel Plaza', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rahel', 'McLeary', '2008-09-15', '89 Warbler Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tome', 'Antosch', '2010-12-01', '8 Dorton Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vevay', 'Bason', '2007-11-04', '576 Doe Crossing Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Laetitia', 'Torrese', '2007-07-31', '32 Cascade Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mateo', 'Mellings', '2008-01-17', '9 Anthes Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gerrie', 'Hamelyn', '2009-07-21', '510 Schurz Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kerianne', 'Carp', '2009-07-03', '4411 Mayer Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ginnifer', 'Schaben', '2011-06-08', '4349 Trailsway Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Almeda', 'Tattershaw', '2010-09-29', '6 Stuart Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Thalia', 'Rogister', '2007-08-04', '352 Oakridge Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Odo', 'Baylie', '2011-01-29', '7 Ramsey Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lisette', 'Marling', '2009-12-17', '0270 Florence Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Khalil', 'Dougharty', '2008-03-15', '89848 Fulton Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Paco', 'Aris', '2010-11-28', '44892 Karstens Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bonni', 'Ninnotti', '2008-01-31', '6238 Mockingbird Street', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Delilah', 'Poupard', '2009-04-06', '56892 Shelley Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Steffi', 'Jereatt', '2010-10-27', '53431 Forest Run Way', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gwenore', 'Vaudrey', '2008-03-10', '2 Eagan Park', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Brinna', 'Skym', '2007-12-24', '92460 Utah Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Karol', 'Gilsthorpe', '2011-07-01', '58920 Miller Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mariquilla', 'McNickle', '2011-04-25', '48 High Crossing Alley', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kelley', 'Lewcock', '2010-12-01', '47 Darwin Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pietrek', 'Sirmon', '2006-12-19', '2089 Becker Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rozanna', 'Skirvane', '2008-11-01', '4 Merry Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Drugi', 'Hache', '2008-09-09', '43859 Old Gate Terrace', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Fernande', 'Freeburn', '2010-04-04', '9 Dunning Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Addy', 'Jaffa', '2007-02-07', '40600 Mosinee Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Stesha', 'Gladman', '2007-08-01', '98053 Monterey Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Delores', 'Haryngton', '2010-11-20', '73 Manufacturers Way', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Morganica', 'Boshers', '2008-03-21', '16413 Dayton Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Stan', 'Sollam', '2010-07-20', '09660 Meadow Valley Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rawley', 'Wannes', '2011-10-03', '95685 Sundown Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sergeant', 'Sherratt', '2008-07-29', '4 Quincy Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Birgitta', 'Heisman', '2009-03-30', '62267 John Wall Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ring', 'Taveriner', '2007-02-24', '876 Boyd Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Damaris', 'Botley', '2010-12-28', '6 Maple Alley', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nathanial', 'Alston', '2007-03-20', '2 Westend Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Maryanne', 'Bramelt', '2008-12-12', '69 Tennessee Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Grier', 'Harmer', '2011-02-15', '6316 Ronald Regan Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Karmen', 'Gypps', '2011-06-30', '51 Londonderry Hill', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gearard', 'Gold', '2008-06-04', '739 Melby Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Teodoor', 'Dutchburn', '2008-08-20', '95 Mayer Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mufinella', 'Murcutt', '2008-08-07', '4426 Lien Lane', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sorcha', 'Mc Gaughey', '2007-06-17', '75 Namekagon Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mellie', 'Kunzelmann', '2010-09-12', '116 Everett Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marsha', 'Stanyard', '2007-10-16', '415 American Ash Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Berty', 'Pauleit', '2010-12-15', '2 South Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Larissa', 'Klemt', '2009-06-15', '10 Toban Place', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bogey', 'Grigori', '2010-05-25', '8777 Marquette Street', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sherwood', 'Trewett', '2008-07-06', '61012 Lerdahl Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Johnette', 'Cruddace', '2009-04-12', '57 Knutson Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gannie', 'Antunez', '2007-01-31', '7 Maryland Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jamil', 'Kissock', '2009-03-08', '39 Scott Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chickie', 'Handrick', '2010-05-28', '6 Goodland Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Scotty', 'Mackison', '2010-07-11', '139 Golf View Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tann', 'Risbridger', '2007-10-03', '1 Transport Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ave', 'Braidley', '2011-02-16', '4 Carpenter Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Curran', 'Nano', '2007-02-28', '327 5th Junction', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nestor', 'Oughton', '2007-06-27', '65729 Sheridan Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Oneida', 'Southerns', '2010-11-05', '1 Erie Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mirabelle', 'Streetley', '2008-10-01', '81 Amoth Trail', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kata', 'Mingotti', '2007-11-21', '5803 Becker Way', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Augustus', 'Faraker', '2008-04-15', '66 Loftsgordon Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Michelina', 'Sutherley', '2007-06-10', '393 Tennyson Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mohammed', 'Fierro', '2008-07-06', '724 Moland Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Christopher', 'Duignan', '2008-09-30', '649 Marcy Way', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nathaniel', 'Seeley', '2009-05-19', '48 Randy Point', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Glennie', 'Korba', '2009-03-25', '0575 New Castle Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gerianna', 'Children', '2009-04-06', '477 Hayes Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lewie', 'Eggle', '2008-05-18', '8957 Menomonie Court', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Zilvia', 'Berthot', '2008-03-20', '11197 Sundown Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Astrid', 'Chicco', '2009-07-15', '024 Weeping Birch Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gery', 'Errichi', '2010-02-21', '44646 Cherokee Street', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Glenna', 'Mansuer', '2010-01-14', '25960 Lake View Road', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Huberto', 'Posner', '2008-01-10', '96 Redwing Alley', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gwendolen', 'Furnival', '2007-02-02', '35 Dawn Parkway', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Leigh', 'Berndtsson', '2008-08-11', '979 Helena Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cherilynn', 'Sweet', '2011-01-13', '56 Buena Vista Place', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Vito', 'Dyer', '2009-06-24', '808 Elmside Court', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Annabelle', 'Prosch', '2011-02-20', '6190 Randy Trail', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marje', 'Sheara', '2007-06-03', '44 Burrows Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Josefa', 'Chalder', '2010-02-09', '5630 Delaware Avenue', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tracy', 'Giuron', '2009-05-18', '98 Lake View Way', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Robbie', 'Attryde', '2009-11-29', '516 Eliot Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Devina', 'Simonetti', '2008-01-28', '87 Nelson Terrace', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Randolph', 'Singers', '2011-06-27', '1 Little Fleur Parkway', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Warden', 'Wessel', '2007-06-09', '95722 Forster Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Dorisa', 'Ramsay', '2009-04-26', '26741 Dapin Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Garrik', 'Pinniger', '2008-11-10', '914 Anniversary Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Bink', 'Bawle', '2006-11-03', '36433 Waywood Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mario', 'Duncanson', '2008-04-27', '3498 Evergreen Parkway', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Babbie', 'Maplestone', '2011-07-11', '70 Rigney Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sigfrid', 'Brockelsby', '2007-09-08', '7 Northfield Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Poul', 'Shobbrook', '2009-05-20', '17640 Grover Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rebecca', 'Palmar', '2008-02-28', '59978 Main Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Marji', 'Cassidy', '2007-07-07', '21 Eastwood Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Joeann', 'Noton', '2008-12-23', '94235 Oakridge Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sonnie', 'Downage', '2009-06-28', '21329 Prairie Rose Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Arne', 'Lilleycrop', '2007-01-14', '8 Chinook Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Weidar', 'Blinman', '2007-09-19', '11159 Waywood Center', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Clemmy', 'Rumgay', '2007-06-11', '6804 Old Gate Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Manon', 'Saggs', '2010-06-12', '37 Bowman Plaza', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Winn', 'Marciskewski', '2006-12-12', '2924 Florence Lane', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Donelle', 'Follitt', '2011-01-27', '55 Lien Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Elaina', 'Dumini', '2009-02-14', '357 Declaration Place', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Simeon', 'Furnell', '2011-09-08', '8 Dixon Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Prudence', 'Attrill', '2008-04-18', '7934 Cherokee Crossing', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Andriette', 'Alphonso', '2008-05-21', '9 Wayridge Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Carina', 'Lyven', '2009-08-27', '236 Waubesa Crossing', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Murielle', 'Duggon', '2008-12-16', '0031 Forest Dale Street', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Berrie', 'Orford', '2008-03-19', '3 Spohn Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Freedman', 'Ormond', '2011-04-15', '63101 Garrison Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jordain', 'Sollam', '2011-03-20', '49162 Grayhawk Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Niel', 'Moehle', '2007-09-10', '34631 Melvin Park', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kaylee', 'Bilam', '2008-03-18', '74 Hollow Ridge Trail', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Merell', 'Cantopher', '2011-03-24', '30726 Armistice Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pacorro', 'Slidders', '2011-04-23', '834 Larry Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Joellyn', 'Scowcraft', '2010-04-25', '6 Ryan Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Hurley', 'Morfett', '2008-09-12', '6 Northland Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Archie', 'Wemm', '2008-11-25', '678 Esker Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Joscelin', 'Brownscombe', '2008-06-11', '073 Boyd Trail', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pall', 'Errey', '2011-05-10', '43 Shopko Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kerr', 'Grushin', '2009-01-14', '58 Badeau Lane', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mela', 'Moffat', '2008-05-24', '0031 Sundown Place', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Iggy', 'Garahan', '2008-03-31', '75 Green Junction', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Orin', 'Piccop', '2010-01-23', '569 Dakota Pass', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jesse', 'Stoll', '2009-04-29', '80961 Quincy Place', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kimberly', 'Kubis', '2010-04-22', '1 Corben Lane', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Cary', 'Gobbet', '2008-10-26', '41 Eagan Drive', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Katya', 'Irving', '2011-05-05', '504 Evergreen Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gill', 'Peplow', '2009-12-09', '14 Carey Point', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Wylie', 'Reglar', '2007-04-13', '582 Cardinal Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ernestine', 'Bagby', '2006-12-17', '4 Buhler Hill', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Betsey', 'Ellerton', '2011-03-02', '2009 Sunfield Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Pauly', 'Gorvette', '2007-10-20', '68 Del Mar Point', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Tiebout', 'Brandom', '2008-09-09', '06 Northland Road', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kendra', 'Aldcorne', '2007-11-17', '7259 Kennedy Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Anderea', 'Huckster', '2009-04-03', '1039 Waxwing Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Deane', 'Mullenger', '2009-01-03', '30016 Golden Leaf Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nike', 'McDugal', '2007-05-25', '37 Mendota Alley', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Constanta', 'Botha', '2008-04-12', '8216 Swallow Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rosalynd', 'Whylie', '2008-09-07', '89868 Johnson Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lilly', 'Leyland', '2011-04-01', '816 Quincy Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Chastity', 'Sherlock', '2008-03-28', '90677 Onsgard Center', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Garrik', 'Haddacks', '2011-07-29', '59 Hanson Circle', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Korrie', 'Ropking', '2011-04-07', '9054 Lunder Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Scarface', 'Gregson', '2011-08-14', '1631 Blackbird Plaza', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Morie', 'Balme', '2007-01-22', '83 Rutledge Junction', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Nathanial', 'Lightbourne', '2009-01-06', '37157 Sauthoff Parkway', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rochester', 'Augur', '2007-01-01', '859 Schurz Crossing', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Udall', 'Wolpert', '2010-08-16', '285 Kim Court', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Inness', 'De La Cote', '2011-04-14', '13745 Lotheville Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Shawna', 'Brik', '2008-04-03', '0 Manley Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Robbert', 'Stollman', '2010-10-13', '04362 Ruskin Crossing', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gerard', 'Cherm', '2010-04-22', '333 Macpherson Terrace', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rudiger', 'Camellini', '2010-04-09', '201 Montana Park', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Doyle', 'Gerrard', '2011-10-05', '94768 Quincy Plaza', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ruy', 'Standering', '2008-06-26', '0 Rutledge Parkway', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kelci', 'Paddison', '2008-01-24', '29 Sachtjen Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Yelena', 'Attryde', '2010-02-23', '031 Truax Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Conchita', 'Odby', '2006-12-05', '441 Elka Drive', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Arne', 'Toby', '2008-02-20', '6837 Rockefeller Way', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Isidro', 'Listone', '2008-04-19', '12 Esch Way', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Frazer', 'Dron', '2008-09-08', '60 Muir Avenue', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jeremias', 'Iffe', '2008-08-19', '85 Green Point', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Gaby', 'Marchi', '2010-08-08', '58 Bonner Place', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sibella', 'Markie', '2007-05-16', '719 Barnett Road', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Merrill', 'Timblett', '2010-06-02', '356 Mccormick Circle', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Heloise', 'Daouse', '2008-07-15', '9 American Point', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Percival', 'Ertelt', '2010-03-08', '23656 Bunker Hill Drive', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Aurel', 'Dryden', '2010-09-08', '9 Northridge Road', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Selby', 'Antos', '2007-04-12', '636 Iowa Hill', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Colet', 'Alcock', '2008-08-22', '8411 Del Mar Terrace', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Sherry', 'Dutnell', '2008-04-16', '0535 Caliangt Lane', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Waite', 'Champion', '2009-02-21', '73378 Corscot Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kathy', 'Weathers', '2007-04-20', '529 Chinook Street', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Flossi', 'Folkes', '2010-05-25', '2659 Springs Plaza', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Clerissa', 'Ginnety', '2010-10-29', '463 Debra Circle', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Mersey', 'Merle', '2011-06-07', '1941 Macpherson Plaza', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kattie', 'Valentinetti', '2008-05-18', '217 Prentice Pass', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Georgy', 'Baughn', '2011-06-15', '9943 Maple Alley', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Melisa', 'Moret', '2011-03-22', '1460 Carey Court', 1, 4);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Whitaker', 'Maunder', '2011-03-16', '637 Green Pass', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ina', 'Guyton', '2010-01-08', '43 Montana Point', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Kamillah', 'O''Shirine', '2008-09-19', '04 Forest Dale Crossing', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Perla', 'Doleman', '2006-10-23', '818 Myrtle Place', 1, 1);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Edd', 'Schwaiger', '2009-04-13', '49 Blue Bill Park Hill', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Rosella', 'O''Hagirtie', '2009-03-04', '30 Talisman Alley', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Laurence', 'Ivchenko', '2006-12-21', '11 Esch Place', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Jennie', 'Cavanagh', '2008-10-04', '2 American Trail', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lonna', 'O''Fallone', '2009-06-30', '48416 Morrow Crossing', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Lelia', 'Tompkinson', '2010-09-03', '8347 Fulton Way', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Petey', 'Huchot', '2010-08-15', '94 Vernon Center', 1, 3);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Justis', 'O''Shevlan', '2009-07-30', '17 Eagle Crest Street', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Reinald', 'Josland', '2007-10-07', '975 Cardinal Lane', 1, 5);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Moise', 'Featonby', '2009-12-04', '7 Lawn Road', 1, 2);
INSERT INTO student (studentid, firstname, lastname, dob, address, schoolid, yeargroupid)
VALUES (NEXTVAL('studentID_seq'), 'Ladonna', 'Swannack', '2008-05-22', '52 Huxley Alley', 1, 3);


INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (1, 'KS3', 53.7, 1, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (2, 'KS3', 52.5, 2, 1, 4, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (3, 'KS4', 55.3, 3, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (4, 'KS3', 59.4, 4, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (5, 'KS3', 61.8, 5, 1, 1, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (6, 'KS3', 66.3, 6, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (7, 'KS3', 89.2, 7, 1, 1, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (8, 'KS4', 68.5, 12, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (9, 'KS4', 51.1, 13, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (10, 'KS3', 98.1, 15, 1, 2, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (11, 'KS4', 59.1, 18, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (12, 'KS4', 63.9, 20, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (13, 'KS4', 64.0, 23, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (14, 'KS3', 63.0, 25, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (15, 'KS4', 66.8, 27, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (16, 'KS4', 60.6, 28, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (17, 'KS4', 71.0, 29, 1, 5, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (18, 'KS4', 57.5, 30, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (19, 'KS4', 63.0, 31, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (20, 'KS3', 97.1, 34, 1, 1, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (21, 'KS3', 92.0, 37, 1, 2, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (22, 'KS3', 75.1, 38, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (23, 'KS3', 98.2, 39, 1, 4, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (24, 'KS4', 81.1, 40, 1, 4, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (25, 'KS3', 71.4, 42, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (26, 'KS4', 81.4, 45, 1, 4, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (27, 'KS3', 65.9, 46, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (28, 'KS3', 60.8, 47, 1, 1, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (29, 'KS3', 60.5, 48, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (30, 'KS3', 66.3, 49, 1, 1, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (31, 'KS3', 88.8, 51, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (32, 'KS4', 55.4, 53, 1, 1, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (33, 'KS4', 94.8, 55, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (34, 'KS3', 86.8, 57, 1, 4, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (35, 'KS3', 64.6, 58, 1, 4, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (36, 'KS3', 88.4, 59, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (37, 'KS4', 94.5, 60, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (38, 'KS3', 76.8, 62, 1, 2, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (39, 'KS3', 67.1, 64, 1, 2, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (40, 'KS3', 77.9, 65, 1, 1, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (41, 'KS4', 62.4, 67, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (42, 'KS4', 59.6, 69, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (43, 'KS4', 55.0, 70, 1, 4, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (44, 'KS3', 69.9, 71, 1, 2, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (45, 'KS4', 53.3, 72, 1, 1, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (46, 'KS3', 81.2, 73, 1, 5, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (47, 'KS4', 75.7, 74, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (48, 'KS3', 54.2, 77, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (49, 'KS3', 62.3, 78, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (50, 'KS4', 68.6, 80, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (51, 'KS3', 71.4, 81, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (52, 'KS4', 53.8, 82, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (53, 'KS3', 91.9, 83, 1, 1, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (54, 'KS4', 87.3, 85, 1, 2, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (55, 'KS4', 82.1, 86, 1, 4, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (56, 'KS4', 87.8, 87, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (57, 'KS4', 64.1, 90, 1, 4, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (58, 'KS3', 61.3, 91, 1, 4, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (59, 'KS4', 61.0, 99, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (60, 'KS4', 61.7, 100, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (61, 'KS3', 77.8, 1, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (62, 'KS4', 81.7, 2, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (63, 'KS3', 79.4, 3, 1, 4, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (64, 'KS4', 89.6, 4, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (65, 'KS3', 90.1, 5, 1, 2, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (66, 'KS3', 78.2, 6, 1, 1, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (67, 'KS3', 72.8, 7, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (68, 'KS3', 92.1, 12, 1, 1, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (69, 'KS4', 57.3, 13, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (70, 'KS3', 74.2, 15, 1, 2, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (71, 'KS3', 63.1, 18, 1, 1, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (72, 'KS3', 65.2, 20, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (73, 'KS3', 88.6, 23, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (74, 'KS4', 58.5, 25, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (75, 'KS3', 69.9, 27, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (76, 'KS3', 61.3, 28, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (77, 'KS3', 96.7, 29, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (78, 'KS3', 52.4, 30, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (79, 'KS4', 84.2, 31, 1, 2, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (80, 'KS3', 83.3, 34, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (81, 'KS4', 62.3, 37, 1, 4, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (82, 'KS3', 76.0, 38, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (83, 'KS3', 97.0, 39, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (84, 'KS3', 98.0, 40, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (85, 'KS3', 93.3, 42, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (86, 'KS3', 66.7, 45, 1, 1, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (87, 'KS4', 88.5, 46, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (88, 'KS3', 84.2, 47, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (89, 'KS4', 63.0, 48, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (90, 'KS3', 91.6, 49, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (91, 'KS3', 50.4, 51, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (92, 'KS3', 97.1, 53, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (93, 'KS3', 88.4, 55, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (94, 'KS3', 56.2, 57, 1, 1, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (95, 'KS4', 53.2, 58, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (96, 'KS3', 74.7, 59, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (97, 'KS4', 59.7, 60, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (98, 'KS4', 57.7, 62, 1, 1, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (99, 'KS3', 62.0, 64, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (100, 'KS3', 52.8, 65, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (101, 'KS3', 88.9, 67, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (102, 'KS3', 73.4, 69, 1, 3, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (103, 'KS4', 87.6, 70, 1, 1, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (104, 'KS3', 69.6, 71, 1, 2, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (105, 'KS4', 62.4, 72, 1, 4, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (106, 'KS3', 53.6, 73, 1, 4, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (107, 'KS3', 72.3, 74, 1, 2, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (108, 'KS3', 71.1, 77, 1, 4, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (109, 'KS3', 67.5, 78, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (110, 'KS3', 92.7, 80, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (111, 'KS3', 77.1, 81, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (112, 'KS3', 84.1, 82, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (113, 'KS4', 79.9, 83, 1, 3, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (114, 'KS3', 95.8, 85, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (115, 'KS3', 52.3, 86, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (116, 'KS3', 98.1, 87, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (117, 'KS3', 54.2, 90, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (118, 'KS4', 59.5, 91, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (119, 'KS3', 62.2, 99, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (120, 'KS3', 55.1, 100, 1, 3, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (121, 'KS4', 77.7, 1, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (122, 'KS3', 83.2, 2, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (123, 'KS4', 50.9, 3, 1, 1, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (124, 'KS3', 64.1, 4, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (125, 'KS3', 74.5, 5, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (126, 'KS4', 66.2, 6, 1, 1, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (127, 'KS3', 77.5, 7, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (128, 'KS4', 99.0, 12, 1, 2, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (129, 'KS4', 53.6, 13, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (130, 'KS3', 69.8, 15, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (131, 'KS4', 63.9, 18, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (132, 'KS3', 73.8, 20, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (133, 'KS4', 63.8, 23, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (134, 'KS3', 72.6, 25, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (135, 'KS3', 98.7, 27, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (136, 'KS4', 64.4, 28, 1, 2, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (137, 'KS4', 84.3, 29, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (138, 'KS3', 85.2, 30, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (139, 'KS3', 81.7, 31, 1, 2, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (140, 'KS4', 80.9, 34, 1, 3, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (141, 'KS4', 80.1, 37, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (142, 'KS3', 64.7, 38, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (143, 'KS3', 74.4, 39, 1, 1, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (144, 'KS3', 52.4, 40, 1, 3, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (145, 'KS4', 72.6, 42, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (146, 'KS3', 53.6, 45, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (147, 'KS3', 68.4, 46, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (148, 'KS4', 88.2, 47, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (149, 'KS4', 65.4, 48, 1, 4, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (150, 'KS3', 83.1, 49, 1, 1, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (151, 'KS4', 89.0, 51, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (152, 'KS4', 98.6, 53, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (153, 'KS4', 68.8, 55, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (154, 'KS4', 81.3, 57, 1, 3, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (155, 'KS3', 79.6, 58, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (156, 'KS3', 62.6, 59, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (157, 'KS3', 56.4, 60, 1, 4, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (158, 'KS3', 65.9, 62, 1, 2, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (159, 'KS3', 85.1, 64, 1, 5, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (160, 'KS3', 84.7, 65, 1, 2, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (161, 'KS3', 98.6, 67, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (162, 'KS3', 59.4, 69, 1, 2, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (163, 'KS3', 61.6, 70, 1, 1, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (164, 'KS3', 87.9, 71, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (165, 'KS3', 52.8, 72, 1, 2, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (166, 'KS3', 92.4, 73, 1, 2, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (167, 'KS3', 51.2, 74, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (168, 'KS3', 87.2, 77, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (169, 'KS3', 92.0, 78, 1, 1, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (170, 'KS3', 58.9, 80, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (171, 'KS4', 60.1, 81, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (172, 'KS3', 69.3, 82, 1, 1, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (173, 'KS3', 71.2, 83, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (174, 'KS4', 68.2, 85, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (175, 'KS3', 53.3, 86, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (176, 'KS3', 70.9, 87, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (177, 'KS3', 51.4, 90, 1, 4, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (178, 'KS3', 96.7, 91, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (179, 'KS4', 64.7, 99, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (180, 'KS4', 87.9, 100, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (181, 'KS3', 60.2, 1, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (182, 'KS4', 66.5, 2, 1, 2, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (183, 'KS4', 79.6, 3, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (184, 'KS3', 65.8, 4, 1, 3, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (185, 'KS3', 90.9, 5, 1, 2, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (186, 'KS3', 73.2, 6, 1, 3, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (187, 'KS3', 65.2, 7, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (188, 'KS3', 93.8, 12, 1, 4, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (189, 'KS3', 51.2, 13, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (190, 'KS4', 93.4, 15, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (191, 'KS4', 83.8, 18, 1, 3, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (192, 'KS3', 50.7, 20, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (193, 'KS3', 87.9, 23, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (194, 'KS4', 87.3, 25, 1, 2, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (195, 'KS4', 70.5, 27, 1, 2, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (196, 'KS3', 83.6, 28, 1, 5, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (197, 'KS4', 57.4, 29, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (198, 'KS4', 84.8, 30, 1, 2, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (199, 'KS4', 90.7, 31, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (200, 'KS3', 60.3, 34, 1, 3, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (201, 'KS4', 88.5, 37, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (202, 'KS4', 60.8, 38, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (203, 'KS3', 69.2, 39, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (204, 'KS4', 85.7, 40, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (205, 'KS4', 66.8, 42, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (206, 'KS3', 94.1, 45, 1, 4, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (207, 'KS4', 91.5, 46, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (208, 'KS3', 67.6, 47, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (209, 'KS3', 87.6, 48, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (210, 'KS4', 65.7, 49, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (211, 'KS3', 74.6, 51, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (212, 'KS4', 57.2, 53, 1, 4, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (213, 'KS4', 57.4, 55, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (214, 'KS4', 96.8, 57, 1, 1, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (215, 'KS4', 98.6, 58, 1, 5, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (216, 'KS3', 54.0, 59, 1, 1, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (217, 'KS3', 83.1, 60, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (218, 'KS4', 68.1, 62, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (219, 'KS3', 54.4, 64, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (220, 'KS3', 68.9, 65, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (221, 'KS4', 67.3, 67, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (222, 'KS3', 86.8, 69, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (223, 'KS3', 88.8, 70, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (224, 'KS4', 84.1, 71, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (225, 'KS3', 61.0, 72, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (226, 'KS3', 97.0, 73, 1, 3, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (227, 'KS4', 53.8, 74, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (228, 'KS3', 85.7, 77, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (229, 'KS4', 94.2, 78, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (230, 'KS3', 64.3, 80, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (231, 'KS3', 65.0, 81, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (232, 'KS3', 67.2, 82, 1, 4, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (233, 'KS3', 84.6, 83, 1, 2, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (234, 'KS3', 59.5, 85, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (235, 'KS3', 72.3, 86, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (236, 'KS3', 77.6, 87, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (237, 'KS4', 82.9, 90, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (238, 'KS3', 92.7, 91, 1, 5, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (239, 'KS3', 56.3, 99, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (240, 'KS4', 84.6, 100, 1, 3, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (241, 'KS4', 89.9, 1, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (242, 'KS4', 83.2, 2, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (243, 'KS3', 64.1, 3, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (244, 'KS3', 54.8, 4, 1, 5, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (245, 'KS4', 61.4, 5, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (246, 'KS4', 55.9, 6, 1, 2, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (247, 'KS4', 91.9, 7, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (248, 'KS4', 68.8, 12, 1, 3, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (249, 'KS3', 56.5, 13, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (250, 'KS4', 68.2, 15, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (251, 'KS3', 68.3, 18, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (252, 'KS3', 96.4, 20, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (253, 'KS3', 62.5, 23, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (254, 'KS3', 54.3, 25, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (255, 'KS3', 85.3, 27, 1, 4, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (256, 'KS3', 80.3, 28, 1, 1, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (257, 'KS3', 60.6, 29, 1, 4, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (258, 'KS4', 63.5, 30, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (259, 'KS4', 69.4, 31, 1, 5, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (260, 'KS4', 79.4, 34, 1, 2, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (261, 'KS3', 77.9, 37, 1, 2, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (262, 'KS3', 79.7, 38, 1, 4, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (263, 'KS3', 65.2, 39, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (264, 'KS4', 98.8, 40, 1, 2, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (265, 'KS3', 80.3, 42, 1, 4, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (266, 'KS4', 80.7, 45, 1, 1, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (267, 'KS4', 73.9, 46, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (268, 'KS3', 94.3, 47, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (269, 'KS3', 98.6, 48, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (270, 'KS3', 72.5, 49, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (271, 'KS3', 65.5, 51, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (272, 'KS3', 88.2, 53, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (273, 'KS4', 75.2, 55, 1, 5, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (274, 'KS3', 73.0, 57, 1, 4, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (275, 'KS4', 79.9, 58, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (276, 'KS4', 92.9, 59, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (277, 'KS4', 55.5, 60, 1, 3, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (278, 'KS4', 85.2, 62, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (279, 'KS4', 72.4, 64, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (280, 'KS3', 65.4, 65, 1, 3, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (281, 'KS3', 68.2, 67, 1, 5, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (282, 'KS3', 76.3, 69, 1, 1, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (283, 'KS3', 87.2, 70, 1, 3, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (284, 'KS3', 50.9, 71, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (285, 'KS3', 64.9, 72, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (286, 'KS3', 50.5, 73, 1, 1, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (287, 'KS3', 78.9, 74, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (288, 'KS4', 79.0, 77, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (289, 'KS4', 60.0, 78, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (290, 'KS4', 59.7, 80, 1, 3, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (291, 'KS4', 59.3, 81, 1, 4, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (292, 'KS4', 54.8, 82, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (293, 'KS3', 66.9, 83, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (294, 'KS3', 88.1, 85, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (295, 'KS3', 77.3, 86, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (296, 'KS3', 54.0, 87, 1, 1, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (297, 'KS3', 55.7, 90, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (298, 'KS4', 52.2, 91, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (299, 'KS4', 58.3, 99, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (300, 'KS4', 60.3, 100, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (301, 'KS4', 59.8, 1, 1, 1, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (302, 'KS3', 82.9, 2, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (303, 'KS3', 65.2, 3, 1, 5, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (304, 'KS3', 66.4, 4, 1, 2, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (305, 'KS3', 70.7, 5, 1, 2, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (306, 'KS3', 83.6, 6, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (307, 'KS4', 95.6, 7, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (308, 'KS3', 93.7, 12, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (309, 'KS3', 75.6, 13, 1, 4, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (310, 'KS4', 65.4, 15, 1, 1, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (311, 'KS3', 88.0, 18, 1, 3, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (312, 'KS3', 66.8, 20, 1, 1, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (313, 'KS3', 62.3, 23, 1, 2, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (314, 'KS3', 91.3, 25, 1, 5, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (315, 'KS3', 79.7, 27, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (316, 'KS3', 96.8, 28, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (317, 'KS3', 56.5, 29, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (318, 'KS4', 62.0, 30, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (319, 'KS4', 89.8, 31, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (320, 'KS4', 94.6, 34, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (321, 'KS4', 76.6, 37, 1, 3, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (322, 'KS4', 55.9, 38, 1, 5, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (323, 'KS4', 87.3, 39, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (324, 'KS4', 58.5, 40, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (325, 'KS4', 59.9, 42, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (326, 'KS4', 90.2, 45, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (327, 'KS4', 94.0, 46, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (328, 'KS4', 60.9, 47, 1, 3, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (329, 'KS3', 52.0, 48, 1, 1, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (330, 'KS3', 97.6, 49, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (331, 'KS3', 84.6, 51, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (332, 'KS4', 60.6, 53, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (333, 'KS3', 97.0, 55, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (334, 'KS4', 97.8, 57, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (335, 'KS3', 84.7, 58, 1, 5, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (336, 'KS4', 85.1, 59, 1, 4, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (337, 'KS3', 53.2, 60, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (338, 'KS4', 81.5, 62, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (339, 'KS4', 71.6, 64, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (340, 'KS3', 59.6, 65, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (341, 'KS4', 87.3, 67, 1, 5, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (342, 'KS4', 68.7, 69, 1, 2, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (343, 'KS3', 57.6, 70, 1, 1, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (344, 'KS4', 62.3, 71, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (345, 'KS4', 89.2, 72, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (346, 'KS4', 69.7, 73, 1, 2, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (347, 'KS4', 84.7, 74, 1, 1, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (348, 'KS4', 56.9, 77, 1, 2, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (349, 'KS3', 98.4, 78, 1, 2, 8);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (350, 'KS4', 60.8, 80, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (351, 'KS3', 54.0, 81, 1, 2, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (352, 'KS4', 87.9, 82, 1, 4, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (353, 'KS4', 97.1, 83, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (354, 'KS4', 83.2, 85, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (355, 'KS4', 66.5, 86, 1, 3, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (356, 'KS4', 60.5, 87, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (357, 'KS3', 92.1, 90, 1, 3, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (358, 'KS4', 69.6, 91, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (359, 'KS3', 79.3, 99, 1, 4, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (360, 'KS3', 50.5, 100, 1, 4, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (361, 'KS3', 72.6, 1, 1, 2, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (362, 'KS4', 58.9, 2, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (363, 'KS4', 73.1, 3, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (364, 'KS3', 53.7, 4, 1, 1, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (365, 'KS4', 84.4, 5, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (366, 'KS3', 53.0, 6, 1, 4, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (367, 'KS3', 50.0, 7, 1, 4, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (368, 'KS3', 82.6, 12, 1, 4, 10);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (369, 'KS3', 93.3, 13, 1, 4, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (370, 'KS3', 98.6, 15, 1, 3, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (371, 'KS3', 52.9, 18, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (372, 'KS4', 51.9, 20, 1, 3, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (373, 'KS3', 75.5, 23, 1, 3, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (374, 'KS3', 58.8, 25, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (375, 'KS4', 72.2, 27, 1, 4, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (376, 'KS4', 91.9, 28, 1, 5, 7);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (377, 'KS4', 84.4, 29, 1, 4, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (378, 'KS3', 73.5, 30, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (379, 'KS3', 64.4, 31, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (380, 'KS3', 70.0, 34, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (381, 'KS3', 61.5, 37, 1, 2, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (382, 'KS4', 70.5, 38, 1, 2, 6);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (383, 'KS4', 88.3, 39, 1, 4, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (384, 'KS3', 97.9, 40, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (385, 'KS3', 98.7, 42, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (386, 'KS3', 86.0, 45, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (387, 'KS3', 56.6, 46, 1, 2, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (388, 'KS3', 85.7, 47, 1, 5, 3);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (389, 'KS4', 59.0, 48, 1, 2, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (390, 'KS4', 78.9, 49, 1, 5, 5);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (391, 'KS4', 95.5, 51, 1, 4, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (392, 'KS4', 93.3, 53, 1, 3, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (393, 'KS4', 66.0, 55, 1, 5, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (394, 'KS3', 61.9, 57, 1, 1, 9);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (395, 'KS4', 50.1, 58, 1, 1, 2);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (396, 'KS4', 75.7, 59, 1, 1, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (397, 'KS4', 87.9, 60, 1, 1, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (398, 'KS3', 76.8, 62, 1, 5, 1);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (399, 'KS4', 67.2, 64, 1, 5, 4);
INSERT INTO class (classid, level, classgradeaverage, staffid, schoolid, yeargroupid, subjectid)
VALUES (400, 'KS3', 58.2, 65, 1, 4, 10);
