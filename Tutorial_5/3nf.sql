CREATE TABLE Habitats
(
	HabitatID integer primary key,
	HabitatName varchar(50),
	HabitatTemperature varchar(50),
	HabitatType varchar(50)
);
CREATE TABLE Species
(
	SpeciesID integer primary key,
	Name varchar(50),
	Mammal boolean	,
	Carnivorous boolean,
	Animalroar	boolean,
	Animalhabitattype integer CONSTRAINT Animalhabitattype REFERENCES Habitats(HabitatID)
);
CREATE TABLE Staff(
	StaffID integer primary key,
	Zooowner boolean,
	Zoomanager boolean,
	Zookeeper boolean,	
	FirstName varchar(50),
	LastName varchar(50),
	Address varchar(500),
	PhoneNumber varchar(50),
	DateOfBirth DATE,
	Speciality integer CONSTRAINT Speciality REFERENCES Species(SpeciesID)
);
CREATE TABLE Animal(
	AnimalID integer primary key,
	Animalname varchar(50),
	Animalage integer,
	Animalspecies integer CONSTRAINT Animalspecies REFERENCES Species(SpeciesID)
);



CREATE TABLE Zoo
(
	ZooID integer primary key,
	Zooname	varchar(50),
	Zooaddress	varchar(500),
	Zoocountry varchar(50),
	Zoocity	varchar(50),
	Zoopostcode	varchar(15),
	Zoocapacity integer,
	Zoospeciesspeciality integer CONSTRAINT Zoospeciesspeciality REFERENCES Species(SpeciesID),
	Zooanimaloccupancy integer
);

CREATE TABLE Roles 
(
	RoleID integer primary key,
	RoleTitle Varchar(50),
	RoleSalary numeric,
	RoleRota Varchar(50)
);
CREATE TABLE StaffRoles
(
	StaffRoleID integer primary key,
	StaffID integer CONSTRAINT StaffID REFERENCES Staff(StaffID),
	RoleID integer CONSTRAINT RoleID REFERENCES Roles(RoleID)
);
CREATE TABLE ZooHabitats
(
	ZooHabitatID integer primary key,
	ZooID integer CONSTRAINT ZooID REFERENCES Zoo(ZooID),
	HabitatID integer CONSTRAINT HabitatID REFERENCES Habitats(HabitatID)	
);
CREATE TABLE AnimalInZooHabitat
(
	AnimalHabitatID integer Primary KEY,
	ZooHabitatID integer CONSTRAINT ZooHabitatID REFERENCES ZooHabitats(ZooHabitatID),
	AnimalID integer CONSTRAINT AnimalID REFERENCES Animal(AnimalID)
);

CREATE TABLE ZooStaff(
	ZooStaffID integer primary key,
	ZooID integer CONSTRAINT ZooID REFERENCES Zoo(ZooID),
	StaffID integer CONSTRAINT StaffID REFERENCES Staff(StaffID)
);
CREATE TABLE ZooAnimals
(
	ZooAnimalID integer primary key,
	ZooID integer CONSTRAINT ZooID REFERENCES Zoo(ZooID),
	AnimalID integer CONSTRAINT AnimalID REFERENCES Animal(AnimalID)
);


CREATE TABLE StaffSpeciality
(
	StaffSpecialityID integer primary key,
	StaffID integer CONSTRAINT StaffID REFERENCES Staff(StaffID),
	SpeciesID integer CONSTRAINT SpeciesID REFERENCES Species(SpeciesID)
);