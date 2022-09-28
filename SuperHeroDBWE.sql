drop database if exists SuperHeroSightingsDB;

create database SuperHeroSightingsDB;

use SuperHeroSightingsDB;


CREATE TABLE Organisation(
	OrganisationID int AUTO_INCREMENT NOT NULL,
    OrganisationName varchar(50) not null,
    Alignment boolean not null,
    Description varchar(255),
    Location varchar(255),
    PhoneNumber varchar(255),
    PRIMARY KEY (OrganisationID)
);

CREATE TABLE SuperPerson(
	SuperPersonID int AUTO_INCREMENT NOT NULL,
    PersonName varchar(50) NOT NULL,
    IsVillain boolean NOT NULL,
    Description varchar(255),
    OrganisationID int NOT NULL,
    PRIMARY KEY (SuperPersonID),
    FOREIGN KEY (OrganisationID) REFERENCES Organisation(OrganisationID)
);

CREATE TABLE Power(
	PowerID int AUTO_INCREMENT NOT NULL,
    PowerName varchar(50) not null,
    Description varchar(255),
    SuperPersonID int NOT NULL,
    PRIMARY KEY (PowerID),
    FOREIGN KEY (SuperPersonID) REFERENCES SuperPerson(SuperPersonID)
);

CREATE TABLE Location (
    LocationID INT AUTO_INCREMENT NOT NULL,
    LocationName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Coordinates DECIMAL(11 , 8 ) NOT NULL,
    Description VARCHAR(255),
    PRIMARY KEY (LocationID)
);

CREATE TABLE Sighting(
	SightingID int AUTO_INCREMENT NOT NULL,
	SuperPersonID int NOT NULL,
    LocationID int NOT NULL,
    SightingTime datetime NOT NULL,
    PRIMARY KEY (SightingID),
    FOREIGN KEY (SuperPersonID) REFERENCES SuperPerson(SuperPersonID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);




