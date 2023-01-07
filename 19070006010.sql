-- Name:Baha Jiyan Yılmaz
-- ID:19070006010
-- Short description of your scenario:
-- In this scenario, I created a database for an airport. This scenario includes the airport, the planes, the owners of the planes, 
-- the model of the planes, the pilots, the employees at the airport, the flights, the customers, the seats, and the prices of the seats. 
-- Each entity has at least 2 insertions. I completed my homework by creating some queries and some updates suitable for this scenario.

-- 1. Create and use a schema for your project named SE2222_[your_ID]
DROP DATABASE IF EXISTS SE2222_19070006010;
CREATE SCHEMA SE2222_19070006010;
USE SE2222_19070006010;

DROP TABLE IF EXISTS AIRPORT;
CREATE TABLE AIRPORT(
	airportCode varchar(10) not null,
    airportLocation varchar(50) not null,
    airportName varchar(50) not null,
    planeCapacity int not null,
    humanCapacity int not null,
    airportPhone int not null,
    CONSTRAINT pk_AIRPORT primary key (airportCode),
    CONSTRAINT uq_airportLocation UNIQUE (airportLocation),
    CONSTRAINT uq_airportName UNIQUE (airportName),
    CONSTRAINT uq_airportPhone UNIQUE (airportPhone)
);

DROP TABLE IF EXISTS AIRPLANE;
CREATE TABLE AIRPLANE(
	regNumber int not null,
    planeName varchar(25) not null,
    numOfSeats int,
    constructionYear int not null,
    gasLimit int not null,
    CONSTRAINT pk_AIRPLANE primary key (regNumber)
);

DROP TABLE IF EXISTS OWNERR; 
CREATE TABLE OWNERR(
	ownerID int not null,
    ownerType varchar(25) not null,
    ownerName varchar(25) not null,
    ownerAddress varchar(50),
    purchaseDate varchar(25),
    phone int,
    regNumber int not null,
    CONSTRAINT pk_OWNERR primary key (ownerID),
    CONSTRAINT fk_OWNERR foreign key (regNumber) references AIRPLANE(regNumber)
);

DROP TABLE IF EXISTS PLANE_TYPE; 
CREATE TABLE PLANE_TYPE(
	planeModel varchar(25) not null,
    companyName varchar(25) not null,
    maxCapacity int,
    weight int not null,
    CONSTRAINT pk_PLANE_TYPE primary key (planeModel)
);

DROP TABLE IF EXISTS PILOT; 
CREATE TABLE PILOT(
	pilotID int not null,
    pilotName varchar(25) not null,
    licenseNo int not null,
    startDate varchar(25) not null,
    noOfFlights int,
    pilotAddress varchar(50) not null,
    gender varchar(1),
    phone int not null,
    CONSTRAINT pk_PILOT primary key (pilotID),
    CONSTRAINT uq_licenseNo UNIQUE(licenseNo)
);

DROP TABLE IF EXISTS EMPLOYEE; 
CREATE TABLE EMPLOYEE(
	employeeID int not null,
    SSN int not null,
    employeeName varchar(25) not null,
    department varchar(25) not null,
    dateOfBirth varchar(25),
    salary int,
    CONSTRAINT pk_EMPLOYEE primary key (employeeID),
    CONSTRAINT uq_SSN UNIQUE (SSN)
);

DROP TABLE IF EXISTS FLIGHT;
CREATE TABLE FLIGHT(
	flightCode int not null,
    flightDate varchar(50) not null,
    noOfPassengers int,
    depTime varchar(20) not null,
    arrTime varchar(20) not null,
    scheduledDepTime varchar(20) not null,
    scheduledArrTime varchar(20) not null,
    depAirportCode varchar(20) not null,
    arrAirportCode varchar(20) not null,
    regNumber int not null, -- foreign key
    CONSTRAINT pk_FLIGHT primary key (flightCode),
    CONSTRAINT fk_FLIGHT foreign key (regNumber) references AIRPLANE(regNumber)
);
DROP TABLE IF EXISTS SEAT;
CREATE TABLE SEAT(
	seatNo varchar(5) not null,
    emptySeatNo int,
	flightCode int not null, -- foreign key
    CONSTRAINT pk_SEAT primary key (seatNo),
    CONSTRAINT fk_SEAT foreign key (flightCode) references FLIGHT(flightCode)
);


DROP TABLE IF EXISTS FARE;
CREATE TABLE FARE(
	fareCode int not null,
    amount int,
    flightCode int not null, -- foreign key
    CONSTRAINT pk_FARE primary key(fareCode),
    CONSTRAINT fk_FARE foreign key(flightCode) references FLIGHT(flightCode)
);


DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER(
	customerID int not null,
    customerName varchar(25) not null,
    phone int not null,
	nationality varchar(25) not null,
    dateOfBirth varchar(25) not null,
    baggage int,
    address varchar(25) not null,
    CONSTRAINT pk_CUSTOMER primary key (customerID)
);


-- 2. Insertions(Data manipulation):
INSERT INTO AIRPORT VALUES ("ADB", "Izmir, Turkey", "Adnan Menderes", 20, 3000, 053512345);
INSERT INTO AIRPORT VALUES ("SAW", "Istanbul, Turkey", "Sabiha Gokcen",40, 8000, 053253253);
INSERT INTO AIRPORT VALUES ("FRA", "Frankfurt, Germany", "Frankfurt Airport", 70, 10000, 493512345);
INSERT INTO AIRPORT VALUES ("BGY", "Milan, Italy", "Bergamo Airport", 25, 5000, 623512345);

INSERT INTO AIRPLANE VALUES (1234, "Boomerang", 400, 2005, 100);
INSERT INTO AIRPLANE VALUES (2345, "Lightning", 100, 2015, 200);
INSERT INTO AIRPLANE VALUES (3456, "Mosquito", 250, 2008, 150);

INSERT INTO OWNERR VALUES (00, "Company", "Pegasus", "Istanbul, Turkey", 1990, 051234567, 1234);
INSERT INTO OWNERR VALUES (01, "Personal", "Ali Koc", "Izmir, Turkey", 2010, 053534567, 2345);
INSERT INTO OWNERR VALUES (02, "Company", "SunExpress", "Ankara, Turkey", 2007, 0535347845, 3456);

INSERT INTO PLANE_TYPE VALUES ("B17G", "Pegasus", 200, 10000);
INSERT INTO PLANE_TYPE VALUES ("E18S", "Ali Koc", 20, 5000);

INSERT INTO PILOT VALUES (101102103, "Baha Jiyan", 2345, "5/7/2020", 4, "Buca, Izmir", "M", 0535217778);
INSERT INTO PILOT VALUES (202203204, "Tuna Yılmaz", 3033, "30/3/2022", 0, "Hatay, Izmir", "F", 053532798);

INSERT INTO EMPLOYEE VALUES (303304, 1010212,"Selin Paksoy", "Sales", "22/4/1990", 5800);
INSERT INTO EMPLOYEE VALUES (303305, 2012012,"Esra Duman", "Cleaning", "29/1/1986", 4500);

INSERT INTO FLIGHT VALUES (789, "18/5/2022","50", "20:30", "21:45","20:30", "21:55",
		"ADB", "FRA", 1234);
INSERT INTO FLIGHT VALUES (722, "18/5/2022","30", "17:30", "18:45","17:30", "18:55",
		"BGY", "FRA", 1234);
INSERT INTO FLIGHT VALUES (810, "19/5/2022", "70", "08:05", "08:50","08:35", "09:20",
		"SAW", "ADB", 2345);
INSERT INTO FLIGHT VALUES (675, "18/3/2022","80", "10:30", "13:45","10:30", "13:55",
		"BGY", "SAW", 3456);
INSERT INTO FLIGHT VALUES (732, "07/5/2022","60", "16:30", "17:45","16:30", "17:45",
		"FRA", "BGY", 2345);        

INSERT INTO FARE VALUES (23, 1200, 789);
INSERT INTO FARE VALUES (22, 1500, 675);


INSERT INTO SEAT VALUES ("17A", 22, 810);
INSERT INTO SEAT VALUES ("22D", 17, 722);
INSERT INTO SEAT VALUES ("12C", 18, 789);


INSERT INTO CUSTOMER VALUES (401402403, "Bill Gates", 157520714, "American", "28/10/1955", 40, "Washington DC");
INSERT INTO CUSTOMER VALUES (501402403, "Luka Doncic", 857520717, "Serbian", "17/07/1999", 33, "Prag");
INSERT INTO CUSTOMER VALUES (781285478, "Arda Turan", 757520714, "Turkish", "01/04/1984", 25, "Istanbul");

-- 3. Queries:
-- (15 points)
-- Write 5 queries with explanations 
-- Write 5 queries. Your queries should do a task that is meaningful in your selected context (project topic). 
-- At least one that joins two or more tables
-- At least one that include group functions
-- At least one with one or more sub-query(es)
-- At least one update
-- At least one delete
-- At least one include arithmetic functions
-- At least one uses alias

-- Ex:
-- Finding all records in A1 table
SELECT *
FROM FLIGHT;

SELECT *
FROM EMPLOYEE;


SELECT DISTINCT f.flightCode, a.regNumber, a.planeName, o.ownerType, o.ownerName, o.purchaseDate, f.depTime
FROM FLIGHT AS f, OWNERR AS o, AIRPLANE AS a
WHERE f.flightDate = "18/5/2022" AND f.regNumber = a.regNumber
ORDER BY depTime ASC;

SELECT DISTINCT f.flightCode, a.regNumber, a.planeName, o.ownerType, o.ownerName, o.purchaseDate, f.depTime
FROM FLIGHT AS f, OWNERR AS o, AIRPLANE AS a
WHERE f.flightDate = "18/5/2022" AND f.regNumber = a.regNumber
ORDER BY depTime ASC;

UPDATE EMPLOYEE
SET salary=15000
WHERE employeeID =303304
AND SSN= 1010212;

DELETE FROM SEAT 
WHERE seatNo = "22D";

