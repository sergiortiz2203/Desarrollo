CREATE DATABASE University;

USE University;

CREATE TABLE students
(
	recordId INT NOT NULL PRIMARY KEY,
    firstName NVARCHAR(100) NOT NULL,
    lastName NVARCHAR(100) NOT NULL
)Engine=InnoDB;

/////////////////////////////////////////////////////////



CREATE DATABASE University;

USE University;

CREATE TABLE Roles
(
    roleId int not null, 
    value varchar(20) not null,
    PRIMARY KEY (roleId)    
)Engine=InnoDB;

CREATE TABLE Users
(
    userId int NOT NULL,
    roleId int NOT NULL,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    dni VARCHAR(10) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    bithDay DATE NOT NULL,
    phoneNumber VARCHAR(50) NOT NULL,    
    PRIMARY KEY (userId),
    FOREIGN KEY (roleId) REFERENCES Roles (roleId)
)Engine=InnoDB;



CREATE TABLE Careers
(
    careerId int not null,
    description VARCHAR(100) not null,
    active VARCHAR(1) not null,
    PRIMARY KEY (careerId)
)Engine=InnoDB;

CREATE TABLE Companies
(
    companyId INT not null,
    name VARCHAR(100) not null,
    address varchar(100) not null,
    email varchar(100) not null,
    phoneNumbre varchar(100) not null,
    cuit varchar(100) not null,
    PRIMARY KEY (companyId)
)Engine=InnoDB;

CREATE TABLE students
(
    studentId int not null,
    fileNumber int not null,
    careerId int,
    userId int,
    active int not null,
    PRIMARY KEY (studentId),
    FOREIGN KEY (careerId) REFERENCES Careers (careerId),
    FOREIGN KEY (userId) REFERENCES Users (userId)
)Engine=InnoDB;

CREATE TABLE JobPositions
(
    jobPositionId int not null,
    careerId int,
    description varchar(200) not null,
    PRIMARY KEY (jobPositionId),
    FOREIGN KEY (careerId) REFERENCES Careers (careerId)
)Engine=InnoDB;

create table JobOffers
(
    jobOfferId int not null,
    companyId int not null,
    careerId int not null,
    jobPositionId int not null,
    PRIMARY KEY (jobOfferId),
    FOREIGN KEY (companyId) REFERENCES Companies (companyId),
    FOREIGN KEY (careerId) REFERENCES Careers (careerId),
    FOREIGN KEY (jobPositionId) REFERENCES JobPositions (jobPositionId)
)Engine=InnoDB;