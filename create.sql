-- ============================================================
-- Museum Database - create.sql
-- CPSC 332 | Team: Luis Aldana, Tristan Carreon, Nadia Ghanizada, David Cruz
-- ============================================================

DROP DATABASE IF EXISTS MuseumDB;
CREATE DATABASE MuseumDB;
USE MuseumDB;

-- Department
CREATE TABLE Department (
    Dept_ID     INT             NOT NULL AUTO_INCREMENT,
    Name        VARCHAR(100)    NOT NULL UNIQUE,
    Dept_head   INT,
    PRIMARY KEY (Dept_ID)
);

-- Employees
CREATE TABLE Employees (
    Employee_ID INT             NOT NULL AUTO_INCREMENT,
    SSN         CHAR(11)        NOT NULL,
    F_name      VARCHAR(50)     NOT NULL,
    MI          CHAR(1),
    L_name      VARCHAR(50)     NOT NULL,
    Hire_date   DATE            NOT NULL,
    Role        VARCHAR(50)     NOT NULL,
    Salary      DECIMAL(10,2)   NOT NULL CHECK (Salary > 0),
    Dept_ID     INT             NOT NULL,
    PRIMARY KEY (Employee_ID),
    UNIQUE (SSN),
    CONSTRAINT fk_emp_dept FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

ALTER TABLE Department
    ADD CONSTRAINT fk_dept_head FOREIGN KEY (Dept_head) REFERENCES Employees(Employee_ID);

-- Gallery
CREATE TABLE Gallery (
    Gallery_ID  INT             NOT NULL AUTO_INCREMENT,
    Name        VARCHAR(100)    NOT NULL,
    Floor       INT             NOT NULL,
    Wing        VARCHAR(50),
    Capacity    INT             NOT NULL CHECK (Capacity > 0),
    Location    VARCHAR(100),
    Employee_ID INT,
    PRIMARY KEY (Gallery_ID),
    CONSTRAINT fk_gallery_manager FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

-- Artist
CREATE TABLE Artist (
    Artist_ID   INT             NOT NULL AUTO_INCREMENT,
    F_name      VARCHAR(50)     NOT NULL,
    MI          CHAR(1),
    L_name      VARCHAR(50)     NOT NULL,
    Nationality VARCHAR(50)     NOT NULL,
    Birth_year  SMALLINT,
    Death_year  SMALLINT,
    Bio         TEXT            NOT NULL,
    PRIMARY KEY (Artist_ID)
);

-- Artwork
CREATE TABLE Artwork (
    Piece_ID    INT             NOT NULL AUTO_INCREMENT,
    Title       VARCHAR(200)    NOT NULL,
    Medium      VARCHAR(100)    NOT NULL,
    Year        SMALLINT,
    Artist_ID   INT             NOT NULL,
    Gallery_ID  INT,
    PRIMARY KEY (Piece_ID),
    CONSTRAINT fk_artwork_artist  FOREIGN KEY (Artist_ID)  REFERENCES Artist(Artist_ID),
    CONSTRAINT fk_artwork_gallery FOREIGN KEY (Gallery_ID) REFERENCES Gallery(Gallery_ID)
);

-- Exhibition
CREATE TABLE Exhibition (
    EX_ID       INT             NOT NULL AUTO_INCREMENT,
    Name        VARCHAR(200)    NOT NULL,
    S_date      DATE            NOT NULL,
    E_date      DATE            NOT NULL,
    Gallery_ID  INT             NOT NULL,
    PRIMARY KEY (EX_ID),
    CONSTRAINT fk_exhibition_gallery FOREIGN KEY (Gallery_ID) REFERENCES Gallery(Gallery_ID),
    CONSTRAINT chk_exhibition_dates  CHECK (E_date >= S_date)
);

-- Features
CREATE TABLE Features (
    EX_ID       INT NOT NULL,
    Piece_ID    INT NOT NULL,
    PRIMARY KEY (EX_ID, Piece_ID),
    CONSTRAINT fk_features_exhibition FOREIGN KEY (EX_ID)    REFERENCES Exhibition(EX_ID),
    CONSTRAINT fk_features_artwork    FOREIGN KEY (Piece_ID) REFERENCES Artwork(Piece_ID)
);

-- Guests
CREATE TABLE Guests (
    Email       VARCHAR(150)    NOT NULL,
    F_name      VARCHAR(50)     NOT NULL,
    MI          CHAR(1),
    L_name      VARCHAR(50)     NOT NULL,
    Zip         VARCHAR(5)      NOT NULL,
    PRIMARY KEY (Email)
);

-- MembershipTier
CREATE TABLE MembershipTier (
    Tier        ENUM('Basic','Standard','Premium') NOT NULL,
    Price       DECIMAL(8,2)    NOT NULL CHECK (Price >= 0),
    PRIMARY KEY (Tier)
);

-- Membership
CREATE TABLE Membership (
    Member_ID   INT             NOT NULL AUTO_INCREMENT,
    Email       VARCHAR(150)    NOT NULL,
    Tier        ENUM('Basic','Standard','Premium') NOT NULL,
    Start_date  DATE            NOT NULL,
    End_date    DATE,
    PRIMARY KEY (Member_ID, Email),
    CONSTRAINT fk_membership_guest  FOREIGN KEY (Email) REFERENCES Guests(Email),
    CONSTRAINT fk_membership_tier   FOREIGN KEY (Tier)  REFERENCES MembershipTier(Tier),
    CONSTRAINT chk_membership_dates CHECK (End_date >= Start_date)
);
