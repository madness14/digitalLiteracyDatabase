DROP DATABASE IF EXISTS litDigital;
CREATE DATABASE litDigital;
USE litDigital;

-- CONTINENT
CREATE TABLE continent (
  idContinent INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  population BIGINT
);

-- COUNTRY
CREATE TABLE country (
  idCountry INT PRIMARY KEY AUTO_INCREMENT,
  idContinent INT,
  name VARCHAR(100),
  population BIGINT,
  FOREIGN KEY (idContinent) REFERENCES continent(idContinent)
);

-- STATE
CREATE TABLE state (
  idState INT PRIMARY KEY AUTO_INCREMENT,
  idCountry INT,
  name VARCHAR(100),
  population BIGINT,
  FOREIGN KEY (idCountry) REFERENCES country(idCountry)
);

-- CITY
CREATE TABLE city (
  idCity INT PRIMARY KEY AUTO_INCREMENT,
  idState INT,
  name VARCHAR(100),
  population BIGINT,
  FOREIGN KEY (idState) REFERENCES state(idState)
);

-- FISCAL DATA
CREATE TABLE fiscalData (
  taxId VARCHAR(13) PRIMARY KEY,
  taxRegime VARCHAR(100)
);

-- ORGANIZATION
CREATE TABLE organization (
  idOrganization INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  type VARCHAR(100),
  registrationDate DATE,
  closingDate DATE,
  website VARCHAR(255),
  language VARCHAR(50),
  operationStatus VARCHAR(50)
);

-- ORG_FISCALDATA
CREATE TABLE orgFiscalData (
  idOrganization INT,
  taxId VARCHAR(13),
  PRIMARY KEY (idOrganization, taxId),
  FOREIGN KEY (idOrganization) REFERENCES organization(idOrganization),
  FOREIGN KEY (taxId) REFERENCES fiscalData(taxId)
);

-- MEMBER
CREATE TABLE member (
  idMember INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  position VARCHAR(100),
  phone VARCHAR(20),
  age INT,
  email VARCHAR(100)
);

-- ORG_MEMBER
CREATE TABLE orgMember (
  idOrganization INT,
  idMember INT,
  PRIMARY KEY (idOrganization, idMember),
  FOREIGN KEY (idOrganization) REFERENCES organization(idOrganization),
  FOREIGN KEY (idMember) REFERENCES member(idMember)
);

-- TRANSACTION
CREATE TABLE transaction (
  idTransaction INT PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(50),
  grantedAmount DECIMAL(12,2),
  transactionDate DATE
);

-- ORG_TRANSACTION
CREATE TABLE orgTransaction (
  idOrganization INT,
  idTransaction INT,
  PRIMARY KEY (idOrganization, idTransaction),
  FOREIGN KEY (idOrganization) REFERENCES organization(idOrganization),
  FOREIGN KEY (idTransaction) REFERENCES transaction(idTransaction)
);

-- RESOURCES
CREATE TABLE resources (
  idResources INT PRIMARY KEY AUTO_INCREMENT,
  requestedBudget DECIMAL(12,2),
  grantedBudget DECIMAL(12,2),
  currency VARCHAR(10)
);

-- TRANSACTION_RESOURCES
CREATE TABLE transactionResources (
  idTransaction INT,
  idResources INT,
  PRIMARY KEY (idTransaction, idResources),
  FOREIGN KEY (idTransaction) REFERENCES transaction(idTransaction),
  FOREIGN KEY (idResources) REFERENCES resources(idResources)
);

-- PROJECT
CREATE TABLE project (
  idProject INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  operationStatus DECIMAL(5,2),
  startDate DATE,
  endDate DATE,
  description TEXT,
  responsible INT
);

-- ORG_PROJECT
CREATE TABLE orgProject (
  idOrganization INT,
  idProject INT,
  PRIMARY KEY (idOrganization, idProject),
  FOREIGN KEY (idOrganization) REFERENCES organization(idOrganization),
  FOREIGN KEY (idProject) REFERENCES project(idProject)
);

-- PROJECT_RESOURCES
CREATE TABLE projectResources (
  idProject INT,
  idResources INT,
  PRIMARY KEY (idProject, idResources),
  FOREIGN KEY (idProject) REFERENCES project(idProject),
  FOREIGN KEY (idResources) REFERENCES resources(idResources)
);

-- ACTIVITY COSTS
CREATE TABLE activityCosts (
  idCosts INT PRIMARY KEY AUTO_INCREMENT,
  humanResourcesCost DECIMAL(12,2),
  materialCost DECIMAL(12,2),
  financialCost DECIMAL(12,2)
  );

-- ACTIVITY
CREATE TABLE activity (
  idActivity INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  description TEXT,
  startDate DATE,
  endDate DATE,
  idCosts INT,
  FOREIGN KEY (idCosts) REFERENCES activityCosts(idCosts)
);

-- PROJECT_ACTIVITY
CREATE TABLE projectActivity (
  idProject INT,
  idActivity INT,
  PRIMARY KEY (idProject, idActivity),
  FOREIGN KEY (idProject) REFERENCES project(idProject),
  FOREIGN KEY (idActivity) REFERENCES activity(idActivity)
);

-- PARTICIPANT
CREATE TABLE participant (
  idParticipant INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  position VARCHAR(100),
  phone VARCHAR(20),
  age INT,
  email VARCHAR(100)
);

-- ACTIVITY_PARTICIPANT
CREATE TABLE activityParticipant (
  idActivity INT,
  idParticipant INT,
  PRIMARY KEY (idActivity, idParticipant),
  FOREIGN KEY (idActivity) REFERENCES activity(idActivity),
  FOREIGN KEY (idParticipant) REFERENCES participant(idParticipant)
);

-- POPULATION
CREATE TABLE population (
  idPopulation INT PRIMARY KEY AUTO_INCREMENT,
  age INT,
  idCity INT,
  FOREIGN KEY (idCity) REFERENCES city(idCity)
);

-- PROJECT_POPULATION
CREATE TABLE projectPopulation (
  idProject INT,
  idPopulation INT,
  PRIMARY KEY (idProject, idPopulation),
  FOREIGN KEY (idProject) REFERENCES project(idProject),
  FOREIGN KEY (idPopulation) REFERENCES population(idPopulation)
);
