DROP DATABASE IF EXISTS test1;
CREATE DATABASE test1;
USE test1;

CREATE TABLE User_Type (
    User_Type_ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Continent (
    Continent_Code INT PRIMARY KEY,
    Name VARCHAR(255),
    Area DECIMAL(10,2),
    Population INT
);

CREATE TABLE Country (
    Country_Code INT PRIMARY KEY,
    Continent_Code INT,
    Name VARCHAR(255),
    Area DECIMAL(10,2),
    Population INT,
    FOREIGN KEY (Continent_Code) REFERENCES Continent(Continent_Code)
);

CREATE TABLE State (
    State_Code INT PRIMARY KEY,
    Country_Code INT,
    Name VARCHAR(255),
    Area DECIMAL(10,2),
    Population INT,
    FOREIGN KEY (Country_Code) REFERENCES Country(Country_Code)
);

CREATE TABLE City (
    City_Code INT PRIMARY KEY,
    State_Code INT,
    Name VARCHAR(255),
    Area DECIMAL(10,2),
    Population INT,
    FOREIGN KEY (State_Code) REFERENCES State(State_Code)
);

CREATE TABLE Role (
    Role_ID INT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    User_Type INT,
    FOREIGN KEY (User_Type) REFERENCES User_Type(User_Type_ID)
);

CREATE TABLE Organization (
    Organization_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Language VARCHAR(50),
    Type VARCHAR(100),
    Website VARCHAR(255),
    Status VARCHAR(50)
);

CREATE TABLE User (
    User_ID INT PRIMARY KEY,
    Organization_ID INT,
    Name VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    Role_ID INT,
    FOREIGN KEY (Organization_ID) REFERENCES Organization(Organization_ID),
    FOREIGN KEY (Role_ID) REFERENCES Role(Role_ID)
);

ALTER TABLE Organization ADD COLUMN Manager INT, 
ADD FOREIGN KEY (Manager) REFERENCES User(User_ID);

CREATE TABLE User_UserType (
    User_ID INT,
    User_Type_ID INT,
    PRIMARY KEY (User_ID, User_Type_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (User_Type_ID) REFERENCES User_Type(User_Type_ID)
);

CREATE TABLE Project (
    Project_ID INT PRIMARY KEY,
    Organization_ID INT,
    Name VARCHAR(255),
    Status VARCHAR(50),
    Description TEXT,
    Resources TEXT,
    Participants TEXT,
    Funds_Requested DECIMAL(15,2),
    Start_Date DATE,
    End_Date DATE,
    Manager_ID INT,
    FOREIGN KEY (Organization_ID) REFERENCES Organization(Organization_ID),
    FOREIGN KEY (Manager_ID) REFERENCES User(User_ID)
);

CREATE TABLE Population (
    Population_ID INT PRIMARY KEY,
    Age INT,
    City_Code INT,
    Project_ID INT,
    FOREIGN KEY (City_Code) REFERENCES City(City_Code),
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
);

CREATE TABLE Activity (
    Activity_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT,
    Organization_ID INT,
    Project_ID INT,
    Population_ID INT,
    Cost_ID INT,
    Start_Date DATE,
    End_Date DATE,
    Manager INT,
    FOREIGN KEY (Cost_ID) REFERENCES Costs(Cost_ID),
    FOREIGN KEY (Manager) REFERENCES User(User_ID),
    FOREIGN KEY (Organization_ID) REFERENCES Organization(Organization_ID),
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID),
    FOREIGN KEY (Population_ID) REFERENCES Population(Population_ID)
);

CREATE TABLE Phone (
    Phone VARCHAR(20) PRIMARY KEY,
    Prefix VARCHAR(5),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Email (
    Email VARCHAR(255) PRIMARY KEY,
    User_ID INT,
    Domain VARCHAR(100),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Fiscal_Data (
    RFC VARCHAR(20) PRIMARY KEY,
    Organization_ID INT,
    Regime VARCHAR(255),
    FOREIGN KEY (Organization_ID) REFERENCES Organization(Organization_ID)
);

CREATE TABLE Support_Type (
    Transaction_ID INT PRIMARY KEY,
    Transaction_Type VARCHAR(20) NOT NULL,
    Provider VARCHAR(30) NOT NULL,
    RFC VARCHAR(20),
    Granted_Amount DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (RFC) REFERENCES Fiscal_Data(RFC)
);

CREATE TABLE Financial_Resources (
    Resource_ID INT PRIMARY KEY,
    Budget_Requested DECIMAL(15,2),
    Budget_Granted DECIMAL(15,2),
    Organization_ID INT,
    Currency VARCHAR(10),
    Transaction_ID INT,
    FOREIGN KEY (Organization_ID) REFERENCES Organization(Organization_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES Support_Type(Transaction_ID)
);

CREATE TABLE Costs (
    Cost_ID INT PRIMARY KEY NOT NULL,
    HR_Cost DECIMAL(15,2) NOT NULL,
    Material_Cost DECIMAL(15,2) NOT NULL,
    Financial_Cost DECIMAL(15,2) NOT NULL,
    Total_Cost DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (Cost_ID) REFERENCES Activity(Cost_ID)
);
