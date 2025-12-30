-- use lab_mysql database
USE lab_mysql;
-- =============================================================================
-- TABLE : INVENTORY
-- =============================================================================
CREATE TABLE `INVENTORY` (
    `quantity` INT,

    -- PRIMARY KEY
    `Inventory ID` INT NOT NULL AUTO_INCREMENT,  
	PRIMARY KEY (`Inventory ID`) 
);
-- =============================================================================
-- TABLE : CARS
-- =============================================================================
CREATE TABLE `CARS` (
	`manufacturer`CHAR(100), 
    `model` CHAR(100), 
    `year` INT, 
    `color` CHAR(50),
	
    -- PRIMARY KEY 
    `VIN` INT NOT NULL AUTO_INCREMENT, 
	PRIMARY KEY (`VIN`) 
);
-- =============================================================================
-- TABLE : CUSTOMERS
-- =============================================================================
USE lab_mysql;
CREATE TABLE `CUSTOMERS` (
    `name` CHAR(100), 
    `phone number` INT, 
    `email` CHAR(100), 
    `address` CHAR(100), 
    `city` CHAR(100), 
    `state/province` CHAR(100), 
    `country` CHAR(100), 
    `zip/postal code` CHAR(10),
    
    -- PRIMARY KEY
    `Customer ID` INT NOT NULL AUTO_INCREMENT,  
	PRIMARY KEY (`Customer ID`) 
);
-- =============================================================================
-- TABLE : SALESPERSONS
-- =============================================================================
USE lab_mysql;
CREATE TABLE `SALESPERSONS` (
    `name` CHAR(100), 
	`store` CHAR(100),

    -- PRIMARY KEY
    `staff ID` INT NOT NULL AUTO_INCREMENT, 
	PRIMARY KEY (`staff ID`) 
);
-- =============================================================================
-- TABLE : INVOICES
-- =============================================================================
USE lab_mysql;
CREATE TABLE `INVOICES` (
    
    -- FOREIGN KEYS ----------
	-- FK CARS
	-- FK CUSTOMERS
	-- FK from SALESPERSONS

    -- PRIMARY KEY
    `Invoice number` INT NOT NULL AUTO_INCREMENT,  
	PRIMARY KEY (`Invoice number`) 
);
-- =============================================================================
-- TABLE : SALES
-- =============================================================================
USE lab_mysql;
CREATE TABLE `SALES` (
    
    -- FOREIGN KEYS ----------------------------
	-- FK from CARS
	-- FK from CUSTOMERS
	
	-- salesperson related to each car sale
    -- FK from SALESPERSONS

    -- PRIMARY KEY
    `Sale ID` INT NOT NULL AUTO_INCREMENT,  
	PRIMARY KEY (`Sale ID`) 
);
-- ---------------------------------------------------------------------------------------------------
-- empty table
SELECT * FROM `CARS`;
SELECT * FROM `CUSTOMERS`;
SELECT * FROM `SALESPERSONS`;
SELECT * FROM `INVOICES`;
SELECT * FROM `SALES`;
-- ===================================================================================================
-- INSERT DATA INTO TABLE INVOICES  from different tables --------------------------------------------
-- ===================================================================================================
INSERT INTO `INVOICES` ( `VIN`, `Customer ID`, `staff ID`)
SELECT `VIN` FROM `CARS`;
SELECT `Customer ID` FROM `CUSTOMERS`;
SELECT `Staff ID` FROM `SALESPERSONS`
GROUP BY
	`VIN`,
	`Customer ID`,
	`staff ID`;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSERT DATA INTO TABLE INVOICES from TABLE SALES --------------------------------------------------
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
INSERT INTO INVOICES (`VIN`, `Customer ID`, `Staff ID`)
SELECT VIN, `Customer ID`, `Staff ID` FROM SALES;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ALTER TABLE CUSTOMERS -----------------------------------------------------------------------------
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ALTER TABLE `CUSTOMERS` 
-- add FK VIN (primary key of CARS)
ADD CONSTRAINT `customers_fk_salespersons` FOREIGN KEY (`staff ID`) REFERENCES CARS(`Staff ID`);