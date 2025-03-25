DROP DATABASE IF EXISTS sample_db;
CREATE DATABASE sample_db;
USE sample_db;

CREATE TABLE user_role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL
);

CREATE TABLE continent (
    continent_id INT PRIMARY KEY,
    continent_name VARCHAR(255) NOT NULL,
    area_km2 DECIMAL(12,2),
    population INT
);

CREATE TABLE country (
    country_id INT PRIMARY KEY,
    continent_id INT,
    country_name VARCHAR(255) NOT NULL,
    area_km2 DECIMAL(12,2),
    population INT,
    FOREIGN KEY (continent_id) REFERENCES continent(continent_id)
);

CREATE TABLE state_province (
    state_id INT PRIMARY KEY,
    country_id INT,
    state_name VARCHAR(255) NOT NULL,
    area_km2 DECIMAL(12,2),
    population INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE city (
    city_id INT PRIMARY KEY,
    state_id INT,
    city_name VARCHAR(255) NOT NULL,
    area_km2 DECIMAL(12,2),
    population INT,
    FOREIGN KEY (state_id) REFERENCES state_province(state_id)
);

CREATE TABLE job_position (
    position_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES user_role(role_id)
);

CREATE TABLE organization (
    org_id INT PRIMARY KEY,
    org_name VARCHAR(255) NOT NULL,
    primary_language VARCHAR(50),
    org_type VARCHAR(100),
    website_url VARCHAR(255),
    status VARCHAR(50)
);

CREATE TABLE app_user (
    user_id INT PRIMARY KEY,
    org_id INT,
    full_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(255),
    position_id INT,
    FOREIGN KEY (org_id) REFERENCES organization(org_id),
    FOREIGN KEY (position_id) REFERENCES job_position(position_id)
);

ALTER TABLE organization ADD COLUMN manager_id INT, 
ADD FOREIGN KEY (manager_id) REFERENCES app_user(user_id);

CREATE TABLE user_role_assignment (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES app_user(user_id),
    FOREIGN KEY (role_id) REFERENCES user_role(role_id)
);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    org_id INT,
    project_name VARCHAR(255) NOT NULL,
    status VARCHAR(50),
    description TEXT,
    required_resources TEXT,
    team_members TEXT,
    requested_funding DECIMAL(15,2),
    start_date DATE,
    end_date DATE,
    project_lead INT,
    FOREIGN KEY (org_id) REFERENCES organization(org_id),
    FOREIGN KEY (project_lead) REFERENCES app_user(user_id)
);

CREATE TABLE target_population (
    population_id INT PRIMARY KEY,
    age_group INT,
    city_id INT,
    project_id INT,
    FOREIGN KEY (city_id) REFERENCES city(city_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE TABLE user_phone (
    phone_number VARCHAR(20) PRIMARY KEY,
    country_code VARCHAR(5),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES app_user(user_id)
);

CREATE TABLE user_email (
    email_address VARCHAR(255) PRIMARY KEY,
    user_id INT,
    email_domain VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES app_user(user_id)
);

CREATE TABLE tax_information (
    tax_id VARCHAR(20) PRIMARY KEY,
    org_id INT,
    tax_regime VARCHAR(255),
    FOREIGN KEY (org_id) REFERENCES organization(org_id)
);

CREATE TABLE funding_type (
    transaction_id INT PRIMARY KEY,
    funding_type VARCHAR(20) NOT NULL,
    provider_name VARCHAR(30) NOT NULL,
    tax_id VARCHAR(20),
    amount_granted DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (tax_id) REFERENCES tax_information(tax_id)
);

CREATE TABLE financial_resources (
    resource_id INT PRIMARY KEY,
    budget_requested DECIMAL(15,2),
    budget_approved DECIMAL(15,2),
    org_id INT,
    currency VARCHAR(10),
    transaction_id INT,
    FOREIGN KEY (org_id) REFERENCES organization(org_id),
    FOREIGN KEY (transaction_id) REFERENCES funding_type(transaction_id)
);

CREATE TABLE project_costs (
    cost_id INT PRIMARY KEY NOT NULL,
    labor_cost DECIMAL(15,2) NOT NULL,
    material_cost DECIMAL(15,2) NOT NULL,
    financial_cost DECIMAL(15,2) NOT NULL,
    total_cost DECIMAL(15,2) NOT NULL
);

CREATE TABLE project_activity (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(50) NOT NULL,
    activity_description TEXT, 
    org_id INT,
    project_id INT,
    population_id INT,
    cost_id INT,
    start_date DATE,
    end_date DATE,
    activity_lead INT,
    FOREIGN KEY (activity_lead) REFERENCES app_user(user_id),
    FOREIGN KEY (org_id) REFERENCES organization(org_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id),
    FOREIGN KEY (population_id) REFERENCES target_population(population_id),
    FOREIGN KEY (cost_id) REFERENCES project_costs(cost_id)
);
