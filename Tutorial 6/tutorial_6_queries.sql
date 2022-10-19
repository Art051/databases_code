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
CREATE TABLE IF NOT EXISTS Roles
(
    RoleID   INTEGER PRIMARY KEY,
    RoleName VARCHAR(255)
);

-- Staff
CREATE TABLE IF NOT EXISTS Staff
(
    staffID              INTEGER PRIMARY KEY,
    RoleName             VARCHAR(255),
    FirstName            VARCHAR(255),
    LastName             VARCHAR(255),
    DOB                  DATE,
    Email                VARCHAR(255),
    HighestQualification VARCHAR(255),
    StaffRole            INTEGER
        CONSTRAINT StaffRole_fk REFERENCES Roles (RoleID)
);

-- -- School
CREATE TABLE IF NOT EXISTS School
(
    SchoolID        INTEGER PRIMARY KEY,
    SchoolName      VARCHAR(255),
    District        VARCHAR(255),
    Address         VARCHAR(255),
    PhoneNumber     VARCHAR(255),
    Email           VARCHAR(255),
    StaffHeadmaster INTEGER
        CONSTRAINT StaffRole_fk REFERENCES Roles (RoleID)
);

-- Year Group
CREATE TABLE IF NOT EXISTS YearGroup
(
    YearGroupID    INTEGER PRIMARY KEY,
    GraduationYear INTEGER,
    SchoolID       INTEGER
        CONSTRAINT SchoolID_fk REFERENCES School (SchoolID)
);

-- Subject
CREATE TABLE IF NOT EXISTS Subject
(
    SubjectID  INTEGER PRIMARY KEY,
    Topic      VARCHAR(255),
    Assessment VARCHAR(255),
    PassRate   NUMERIC(3, 2)
);

-- Student
CREATE TABLE IF NOT EXISTS Student
(
    StudentID   INTEGER PRIMARY KEY,
    FirstName   VARCHAR(255),
    LastName    VARCHAR(255),
    DOB         DATE,
    Address     VARCHAR(255),
    SchoolID    INTEGER
        CONSTRAINT SchoolID_fk REFERENCES School (SchoolID),
    YearGroupID INTEGER
        CONSTRAINT YearGroupID_fk REFERENCES YearGroup (YearGroupID)
);

-- Class
CREATE TABLE IF NOT EXISTS SchoolClass
(
    ClassID           INTEGER PRIMARY KEY,
    ClassLevel        NUMERIC(5, 2),
    ClassGradeAverage NUMERIC(5, 2),
    SubjectID         INTEGER
        CONSTRAINT SubjectID_fk REFERENCES Subject (SubjectID),
    SchoolID          INTEGER
        CONSTRAINT SchoolID_fk REFERENCES School (SchoolID),
    YearGroupID       INTEGER
        CONSTRAINT YearGroupID_fk REFERENCES YearGroup (YearGroupID)
);

--  DROP SEQUENCE staffID_seq;
-- DROP SEQUENCE schoolID_seq;
-- DROP SEQUENCE roleID_seq;
--  DROP SEQUENCE subjectid_seq;
--  DROP SEQUENCE yeargroupid_seq;
--  DROP SEQUENCE studentID_seq;
--  DROP SEQUENCE schoolclassid_seq;


CREATE SEQUENCE staffID_seq INCREMENT 1 START 1;
CREATE SEQUENCE schoolID_seq INCREMENT 1 START 1;
CREATE SEQUENCE roleID_seq INCREMENT 1 START 1;
CREATE SEQUENCE subjectID_seq INCREMENT 1 START 1;
CREATE SEQUENCE yeargroupID_seq INCREMENT 1 START 1;
CREATE SEQUENCE studentID_seq INCREMENT 1 START 1;
CREATE SEQUENCE schoolclassid_seq INCREMENT 1 START 1;



INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Headteacher');
INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Head of Department (HoD)');
INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Head of Year (HoY)');
INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Deputy Head of Year(DHOY)');
INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Safeguarding Officer');
INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Teacher');
INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Teaching Assistant');
INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Admin');
INSERT INTO Roles (roleid, rolename)
VALUES (NEXTVAL('roleID_seq'), 'Nurse');



INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Year (HoY)', 'Sheila-kathryn', 'Housego', '1972-01-24',
        'Sheila-kathrynHousego@bish.ac.uk', 'bsc', 7);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Jerrie', 'Strelitzer', '1986-12-20',
        'JerrieStrelitzer@bish.ac.uk', 'bsc', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Guillermo', 'Labbez', '2000-08-07', 'GuillermoLabbez@bish.ac.uk',
        'a-levels', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Year (HoY)', 'Tierney', 'Denerley', '1989-06-17', 'TierneyDenerley@bish.ac.uk',
        'bsc', 7);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Year (HoY)', 'Euell', 'Warburton', '1982-07-06', 'EuellWarburton@bish.ac.uk',
        'msc', 7);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Sarena', 'MacTerlagh', '1975-02-06',
        'SarenaMacTerlagh@bish.ac.uk', 'msc', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Langston', 'Simonelli', '1971-11-14', 'LangstonSimonelli@bish.ac.uk', 'msc',
        2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Deputy Head of Year (DHoY)', 'Gareth', 'Duckfield', '1994-03-21',
        'GarethDuckfield@bish.ac.uk', 'phd', 4);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Arte', 'Macbeth', '1993-10-13', 'ArteMacbeth@bish.ac.uk', 'phd',
        8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Ulberto', 'Cavan', '1968-08-04', 'UlbertoCavan@bish.ac.uk', 'a-levels', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Janetta', 'Chestnut', '1986-01-24', 'JanettaChestnut@bish.ac.uk',
        'msc', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Brandy', 'Goldstraw', '1979-05-01', 'BrandyGoldstraw@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Malvin', 'Joul', '1976-10-20', 'MalvinJoul@bish.ac.uk', 'bsc',
        8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Vivyanne', 'Fusco', '1962-04-13', 'VivyanneFusco@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Deputy Head of Year (DHoY)', 'Kim', 'Skule', '1987-01-06', 'KimSkule@bish.ac.uk',
        'bsc', 4);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Gus', 'Galletly', '1991-07-19', 'GusGalletly@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Nurse', 'Benji', 'Hamshere', '1983-05-27', 'BenjiHamshere@bish.ac.uk', 'phd', 5);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Deonne', 'Begwell', '1988-03-25', 'DeonneBegwell@bish.ac.uk',
        'phd', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Desmund', 'Lidgely', '1981-11-03', 'DesmundLidgely@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Hallsy', 'Nayer', '1994-02-24', 'HallsyNayer@bish.ac.uk', 'phd',
        8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Admin', 'Gerri', 'Priscott', '1967-03-06', 'GerriPriscott@bish.ac.uk', 'phd', 3);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Heidi', 'Van Castele', '1978-07-06', 'HeidiVan Castele@bish.ac.uk', 'msc',
        2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Headteacher', 'Susette', 'Humbee', '1972-11-07', 'SusetteHumbee@bish.ac.uk', 'bsc', 1);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Ricki', 'Standage', '1983-11-11', 'RickiStandage@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Teddy', 'Muehler', '1985-06-22', 'TeddyMuehler@bish.ac.uk', 'a-levels', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Nurse', 'Liliane', 'Schlagh', '1993-02-01', 'LilianeSchlagh@bish.ac.uk', 'a-levels',
        5);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Jourdan', 'Janout', '1965-03-31', 'JourdanJanout@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Tanney', 'Fell', '1975-01-30', 'TanneyFell@bish.ac.uk',
        'phd', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Kerrin', 'Ingarfill', '1964-10-18', 'KerrinIngarfill@bish.ac.uk', 'msc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Year (HoY)', 'Lyndsay', 'Rimbault', '1999-12-14', 'LyndsayRimbault@bish.ac.uk',
        'phd', 7);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Deputy Head of Year (DHoY)', 'Norine', 'Ollenbuttel', '1987-01-14',
        'NorineOllenbuttel@bish.ac.uk', 'a-levels', 4);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Urbano', 'Withnall', '1975-11-12',
        'UrbanoWithnall@bish.ac.uk', 'a-levels', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Dulce', 'Poone', '1989-02-17', 'DulcePoone@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Norrie', 'Skillicorn', '1990-02-28',
        'NorrieSkillicorn@bish.ac.uk', 'a-levels', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Jule', 'Claybourn', '1979-08-30', 'JuleClaybourn@bish.ac.uk',
        'a-levels', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Loydie', 'Wank', '1983-11-27', 'LoydieWank@bish.ac.uk', 'msc',
        8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Homer', 'Wiley', '1979-07-28', 'HomerWiley@bish.ac.uk', 'phd',
        8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Neely', 'Avis', '1987-02-05', 'NeelyAvis@bish.ac.uk', 'msc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Nurse', 'Tierney', 'Ambroziak', '1980-06-19', 'TierneyAmbroziak@bish.ac.uk', 'phd', 5);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Ferris', 'Bennion', '1989-12-14', 'FerrisBennion@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Regina', 'Gobbet', '1982-11-01', 'ReginaGobbet@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Bronson', 'O''Lagene', '1986-04-01', 'BronsonO''Lagene@bish.ac.uk', 'msc',
        2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Year (HoY)', 'Idelle', 'Benallack', '1988-04-25', 'IdelleBenallack@bish.ac.uk',
        'phd', 7);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Shelley', 'Fellow', '1983-02-05', 'ShelleyFellow@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Joanne', 'Beaby', '1964-10-26', 'JoanneBeaby@bish.ac.uk',
        'bsc', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Lavina', 'Delepine', '1965-05-18', 'LavinaDelepine@bish.ac.uk', 'a-levels',
        2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Britte', 'Withrop', '1967-06-19', 'BritteWithrop@bish.ac.uk', 'msc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Year (HoY)', 'Adella', 'Novotna', '1965-02-27', 'AdellaNovotna@bish.ac.uk',
        'bsc', 7);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Anette', 'Mallya', '1967-05-23', 'AnetteMallya@bish.ac.uk',
        'msc', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Jae', 'Parradye', '1994-10-07', 'JaeParradye@bish.ac.uk', 'bsc',
        8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Terri-jo', 'Helgass', '1972-06-11', 'Terri-joHelgass@bish.ac.uk',
        'bsc', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Antonietta', 'Bratt', '1975-05-01', 'AntoniettaBratt@bish.ac.uk',
        'a-levels', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Admin', 'Trace', 'Sabberton', '1993-03-19', 'TraceSabberton@bish.ac.uk', 'bsc', 3);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Jaquenetta', 'Corck', '1984-01-10', 'JaquenettaCorck@bish.ac.uk',
        'phd', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Ced', 'Andreasen', '1981-07-29', 'CedAndreasen@bish.ac.uk', 'a-levels', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Wildon', 'Kardos', '1994-06-04', 'WildonKardos@bish.ac.uk',
        'msc', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Griswold', 'Latliff', '1979-01-29', 'GriswoldLatliff@bish.ac.uk',
        'a-levels', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Doyle', 'Klais', '1968-03-23', 'DoyleKlais@bish.ac.uk',
        'a-levels', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Headteacher', 'Dudley', 'Watkin', '1966-06-21', 'DudleyWatkin@bish.ac.uk', 'a-levels',
        1);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Sosanna', 'Tremayle', '1998-06-12',
        'SosannaTremayle@bish.ac.uk', 'phd', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Garfield', 'Franca', '1967-11-06', 'GarfieldFranca@bish.ac.uk',
        'phd', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Markos', 'Hacksby', '1989-11-22', 'MarkosHacksby@bish.ac.uk', 'a-levels',
        2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Aldrich', 'Fairweather', '1994-09-06',
        'AldrichFairweather@bish.ac.uk', 'msc', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Cordey', 'Beadles', '1963-11-28', 'CordeyBeadles@bish.ac.uk', 'a-levels',
        2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Mimi', 'Toffano', '1969-10-02', 'MimiToffano@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Ronny', 'Lawrie', '1966-03-26', 'RonnyLawrie@bish.ac.uk',
        'phd', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Averyl', 'Devenish', '1970-11-04', 'AverylDevenish@bish.ac.uk', 'msc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Edin', 'Angric', '2000-09-18', 'EdinAngric@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Hallsy', 'Woolf', '1966-08-29', 'HallsyWoolf@bish.ac.uk',
        'phd', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Andie', 'Messager', '1977-12-07', 'AndieMessager@bish.ac.uk',
        'bsc', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Admin', 'Miller', 'Hotson', '1990-10-09', 'MillerHotson@bish.ac.uk', 'msc', 3);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Mar', 'Ragsdall', '1974-08-24', 'MarRagsdall@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Wolfy', 'Bonsale', '1997-03-02', 'WolfyBonsale@bish.ac.uk', 'msc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Jermaine', 'Roderighi', '1971-05-13', 'JermaineRoderighi@bish.ac.uk', 'phd',
        2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Tasia', 'Bourrel', '1993-10-28', 'TasiaBourrel@bish.ac.uk',
        'a-levels', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Keri', 'Basey', '1992-08-17', 'KeriBasey@bish.ac.uk', 'a-levels', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Nurse', 'Kailey', 'Guidetti', '1991-09-24', 'KaileyGuidetti@bish.ac.uk', 'bsc', 5);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Aili', 'Motion', '1978-10-05', 'AiliMotion@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Willamina', 'Evennett', '2000-01-08', 'WillaminaEvennett@bish.ac.uk', 'msc',
        2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Orville', 'Sawnwy', '1993-01-09', 'OrvilleSawnwy@bish.ac.uk',
        'a-levels', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Jonie', 'Foxton', '1977-01-11', 'JonieFoxton@bish.ac.uk',
        'phd', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Creight', 'Cruden', '1972-05-09', 'CreightCruden@bish.ac.uk',
        'bsc', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Maressa', 'Oxbrow', '1988-06-26', 'MaressaOxbrow@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Rowan', 'McAviy', '1995-07-29', 'RowanMcAviy@bish.ac.uk',
        'a-levels', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Beniamino', 'Andrivel', '1983-12-03',
        'BeniaminoAndrivel@bish.ac.uk', 'a-levels', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Myrta', 'Wathall', '1986-05-20', 'MyrtaWathall@bish.ac.uk',
        'msc', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Admin', 'Delly', 'Juris', '1975-07-21', 'DellyJuris@bish.ac.uk', 'bsc', 3);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Vernice', 'Winscom', '1964-11-15',
        'VerniceWinscom@bish.ac.uk', 'bsc', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Wade', 'Rennenbach', '1960-11-20', 'WadeRennenbach@bish.ac.uk',
        'bsc', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Sheelah', 'Cobelli', '1999-06-06',
        'SheelahCobelli@bish.ac.uk', 'a-levels', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Nadiya', 'Earry', '1995-06-07', 'NadiyaEarry@bish.ac.uk',
        'a-levels', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Safeguarding Officer', 'Marlyn', 'Oxtoby', '1969-09-13', 'MarlynOxtoby@bish.ac.uk',
        'phd', 6);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Roth', 'McDiarmid', '1994-05-20', 'RothMcDiarmid@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Tabatha', 'Scuse', '1980-07-23', 'TabathaScuse@bish.ac.uk',
        'phd', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Filmer', 'Pryn', '1964-05-11', 'FilmerPryn@bish.ac.uk', 'phd', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teacher', 'Barrie', 'Peasegood', '1961-08-02', 'BarriePeasegood@bish.ac.uk', 'bsc', 2);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Conway', 'Strang', '1999-02-28', 'ConwayStrang@bish.ac.uk',
        'bsc', 9);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Ardyce', 'Koomar', '1980-05-02', 'ArdyceKoomar@bish.ac.uk',
        'phd', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Teaching Assistant', 'Melodee', 'Klazenga', '2000-07-01', 'MelodeeKlazenga@bish.ac.uk',
        'phd', 8);
INSERT INTO staff (staffid, rolename, firstname, lastname, dob, email, highestqualification, staffrole)
VALUES (NEXTVAL('staffID_seq'), 'Head of Department (HoD)', 'Wald', 'Sterricks', '1963-11-26',
        'WaldSterricks@bish.ac.uk', 'phd', 9);

INSERT INTO School (schoolid, schoolname, district, address, phonenumber, email, staffheadmaster)
VALUES (NEXTVAL('schoolID_seq'), 'bishopston', 'bishopston', 'The Glebe, Bishopston, Swansea, SA3 3JP, United Kingdom',
        '01792 234121', '6704069_BishopstonComprehensive@Hwbcymru.net', '1');


INSERT INTO yeargroup (yeargroupid, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), 2027, 1);
INSERT INTO yeargroup (yeargroupid, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), 2026, 1);
INSERT INTO yeargroup (yeargroupid, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), 2025, 1);
INSERT INTO yeargroup (yeargroupid, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), 2024, 1);
INSERT INTO yeargroup (yeargroupid, graduationyear, SchoolID)
VALUES (NEXTVAL('yeargroupid_seq'), 2023, 1);



INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'English', 'Exam', 0.79);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Biology', 'Essay', 0.611);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Physics', 'Essay', 0.667);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Chemistry', 'Exam', 0.772);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Maths', 'Essay', 0.422);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'History', 'Exam', 0.579);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Religious Studies', 'Essay', 0.431);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'PE', 'Exam', 0.731);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'Geography', 'Exam', 0.848);
INSERT INTO subject (subjectid, topic, assessment, passrate)
VALUES (NEXTVAL('subjectID_seq'), 'English', 'Exam', 0.926);



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



INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.26, 67.65, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.12, 87.44, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.7, 67.46, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.47, 67.83, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.22, 87.98, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.49, 78.93, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.88, 89.96, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.84, 56.88, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.09, 87.37, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.47, 59.92, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.55, 83.48, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.28, 86.04, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.33, 73.57, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.72, 85.66, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.21, 90.34, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.06, 71.9, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.32, 89.21, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.16, 62.74, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.47, 75.9, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.09, 67.6, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.91, 70.96, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.4, 82.15, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.58, 86.54, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.1, 85.08, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.53, 74.58, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.45, 67.45, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.16, 60.14, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.08, 62.35, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.1, 94.11, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.52, 74.41, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.59, 62.15, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.06, 80.88, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.97, 69.88, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.56, 79.88, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.17, 80.68, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.24, 85.75, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.43, 88.21, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.53, 88.62, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.8, 88.34, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.54, 88.29, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.89, 92.61, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.2, 57.2, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.49, 88.23, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.62, 55.75, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.85, 56.12, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.4, 86.71, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.64, 85.19, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.08, 76.19, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.84, 68.52, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.51, 59.38, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.87, 58.31, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.73, 87.21, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.52, 90.58, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.81, 67.95, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.02, 64.9, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.57, 85.05, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.0, 92.84, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.92, 80.17, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.24, 58.26, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.85, 62.19, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.2, 62.6, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.52, 63.07, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.6, 55.41, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.76, 74.75, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.13, 78.5, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.05, 55.27, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.53, 84.27, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.43, 66.91, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.2, 74.4, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.34, 80.81, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.31, 93.09, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.13, 55.75, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.51, 58.38, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.51, 64.85, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.31, 80.51, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.98, 70.7, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.95, 56.26, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.78, 77.31, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.03, 85.52, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.51, 74.52, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.73, 59.47, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.66, 72.89, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.98, 63.84, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.68, 55.35, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.87, 69.93, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.65, 63.68, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.72, 65.26, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.74, 94.13, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.37, 59.49, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.01, 66.6, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.19, 87.62, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.4, 85.42, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.86, 67.84, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.7, 76.82, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.73, 64.59, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.38, 67.68, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.74, 89.35, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.58, 63.19, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.88, 75.94, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.42, 77.59, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.41, 67.04, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.53, 94.69, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.87, 68.72, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.85, 73.48, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.84, 84.06, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.36, 85.44, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.65, 55.46, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.88, 94.46, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.62, 68.1, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.51, 71.81, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.13, 63.42, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.68, 77.38, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.93, 87.87, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.31, 73.4, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.87, 75.42, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.62, 85.3, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.17, 76.76, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.17, 94.69, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.73, 92.09, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.2, 91.82, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.31, 66.29, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.57, 55.73, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.25, 62.5, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.23, 83.55, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.24, 91.68, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.17, 94.07, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.54, 56.46, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.41, 80.56, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.28, 76.85, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.71, 83.74, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.59, 75.82, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.59, 74.69, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.1, 93.28, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.83, 70.32, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.09, 65.85, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.37, 81.04, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.68, 74.04, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.24, 84.83, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.03, 67.72, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.47, 55.79, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.05, 77.86, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.21, 93.5, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.8, 89.0, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.18, 76.3, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.44, 60.66, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.02, 79.7, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.43, 63.15, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.27, 86.96, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.83, 90.48, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.79, 89.42, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.37, 74.3, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.73, 55.77, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.45, 55.44, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.16, 70.71, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.24, 90.99, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.45, 86.81, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.94, 93.8, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.94, 83.98, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.04, 73.43, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.5, 78.48, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.04, 73.32, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.49, 69.88, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.91, 83.68, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.22, 87.14, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.03, 90.17, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.53, 76.31, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.03, 63.92, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.49, 57.87, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.02, 93.27, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.69, 60.85, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.52, 77.72, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.31, 65.86, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.09, 67.59, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.15, 56.17, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.73, 55.49, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.63, 82.43, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.93, 81.95, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.25, 60.23, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.51, 92.71, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.33, 73.33, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.78, 71.49, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.7, 88.19, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.65, 68.08, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.15, 78.96, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.69, 94.15, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.32, 88.09, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.13, 83.21, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.88, 67.2, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.8, 77.81, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.0, 90.26, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.23, 82.7, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.37, 76.49, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.65, 69.09, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.77, 89.85, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.61, 57.69, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.86, 72.35, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.7, 79.68, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.9, 66.77, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.14, 71.19, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.33, 88.44, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.27, 82.67, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.24, 85.91, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.39, 60.42, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.78, 61.35, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.29, 57.46, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.43, 73.58, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.74, 81.06, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.89, 74.71, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.16, 91.35, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.84, 71.12, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.49, 63.97, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.08, 86.62, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.21, 86.15, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.86, 64.28, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.12, 85.39, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.04, 56.83, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.5, 59.92, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.3, 60.37, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.46, 85.63, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.93, 76.46, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.14, 92.86, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.94, 94.82, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.44, 81.39, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.78, 62.79, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.13, 78.27, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.26, 64.17, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.67, 57.2, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.68, 75.39, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.07, 58.58, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.49, 68.81, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.29, 81.28, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.08, 59.86, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.2, 85.07, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.56, 81.15, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.54, 89.72, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.72, 93.86, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.97, 82.0, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.95, 71.09, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.03, 58.85, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.51, 67.29, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.05, 94.85, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.43, 80.71, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.59, 67.29, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.43, 74.32, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.81, 81.63, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.36, 58.01, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.66, 75.24, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.34, 76.69, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.7, 59.89, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.86, 85.91, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.89, 78.19, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.31, 71.59, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.95, 75.47, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.52, 72.62, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.93, 76.5, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.73, 86.72, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.18, 62.56, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.58, 70.3, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.6, 90.6, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.21, 80.42, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.53, 65.33, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.41, 71.86, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.29, 83.43, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.76, 78.88, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.37, 84.07, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.21, 76.57, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.57, 64.05, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.83, 70.13, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.38, 80.43, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.13, 84.55, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.66, 74.24, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.19, 64.58, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.48, 84.3, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.58, 66.74, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.92, 62.3, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.6, 73.07, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.22, 63.04, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.09, 60.63, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.44, 61.59, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.73, 59.66, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.37, 71.12, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.52, 68.93, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.69, 80.2, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.8, 90.1, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.12, 69.42, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.11, 73.34, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.81, 70.42, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.32, 66.93, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.77, 66.14, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.57, 63.77, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.28, 93.2, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.13, 92.88, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.07, 83.39, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.67, 84.59, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.58, 73.39, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.93, 73.34, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.54, 88.92, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.13, 89.39, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.51, 69.46, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.54, 78.37, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.02, 80.16, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.46, 76.24, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.05, 87.38, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.29, 84.11, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.36, 80.2, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.27, 67.62, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.5, 78.78, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.16, 55.77, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.29, 88.66, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.52, 93.42, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.16, 84.41, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.85, 63.16, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.48, 85.23, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.5, 61.5, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.14, 74.84, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.61, 77.33, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.56, 62.22, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.61, 61.26, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.45, 65.81, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.0, 86.9, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.08, 67.88, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.66, 67.03, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.8, 84.0, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.35, 58.13, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.06, 77.94, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.64, 87.66, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.06, 87.21, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.61, 92.49, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.15, 69.39, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.96, 86.39, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.27, 60.85, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.42, 62.32, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.01, 71.81, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.96, 64.35, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.93, 65.4, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.01, 56.52, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.22, 90.39, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.06, 78.56, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 91.84, 81.61, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.11, 93.65, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.76, 81.76, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.7, 80.86, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.12, 58.42, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.62, 92.71, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 99.41, 56.37, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.42, 82.91, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.21, 76.79, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.6, 85.74, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.55, 88.74, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.76, 77.07, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.78, 60.98, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.58, 78.75, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.66, 72.36, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 95.04, 88.81, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.77, 62.06, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.67, 83.86, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 97.97, 87.65, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.97, 93.54, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.46, 89.28, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.6, 88.33, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.51, 60.88, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.85, 73.58, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.78, 79.68, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.15, 88.23, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.18, 86.07, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.11, 64.29, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 82.91, 87.04, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.01, 60.64, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.43, 85.95, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.07, 58.84, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.38, 90.53, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.45, 77.23, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.4, 62.6, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.37, 57.17, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.38, 69.84, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.36, 90.13, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 90.97, 81.59, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.78, 90.87, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.97, 89.23, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 93.15, 89.8, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 80.41, 93.03, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.4, 67.51, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.79, 91.22, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.79, 64.92, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 88.86, 57.45, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.32, 89.99, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.32, 87.1, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 96.55, 71.83, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.65, 63.53, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 89.62, 86.81, 10, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 94.88, 80.77, 1, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 92.56, 93.66, 2, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.97, 56.82, 3, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 86.49, 92.19, 4, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 98.94, 80.59, 5, 1, 5);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 85.25, 65.39, 6, 1, 1);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 84.3, 70.21, 7, 1, 2);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 81.55, 60.95, 8, 1, 3);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 87.85, 75.83, 9, 1, 4);
INSERT INTO schoolclass (classid, classlevel, classgradeaverage, subjectid, schoolid, yeargroupid)
VALUES (NEXTVAL('schoolclassid_seq'), 83.62, 71.55, 10, 1, 5);






