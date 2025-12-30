-- ======================================================================================================
-- use lab_mysql database ----------------------------------------------------------------------------------
USE lab_mysql;

-- ======================================================================================================
-- TABLE : CARS ----------------------------------------------------------------------------------------
CREATE TABLE `CARS` (
	`manufacturer`CHAR(100), 
    `model` CHAR(100), 
    `year` INT, 
    `color` CHAR(100),
	
    -- FOREIGN KEYS:
    `customer ID` INT NOT NULL,
    	-- FK CUSTOMERS
	`invoice number` INT NOT NULL,
    	-- FK INVOICES
    
    -- PRIMARY KEY 
    `VIN` CHAR(17) NOT NULL,
	PRIMARY KEY (`VIN`) 
);
-- ======================================================================================================
-- TABLE : CUSTOMERS ------------------------------------------------------------------------------------
CREATE TABLE `CUSTOMERS` (
    `name` CHAR(100), 
    `phone number` VARCHAR(20), 
    `email` CHAR(100), 
    `address` CHAR(100), 
    `city` CHAR(100), 
    `state/province` CHAR(100), 
    `country` CHAR(100), 
    `zip/postal code` CHAR(10),    
    
    -- FOREIGN KEYS:
    `staff ID` INT NOT NULL, 
        -- FK SALESPERSONS
    
    -- PRIMARY KEY
    `customer ID` INT NOT NULL,  
	PRIMARY KEY (`customer ID`) 
);
-- ======================================================================================================
-- TABLE : SALESPERSONS ---------------------------------------------------------------------------------
CREATE TABLE `SALESPERSONS` (
    `name` CHAR(100), 
	`store` CHAR(100),
    -- FOREIGN KEYS:
		-- NONE
    -- PRIMARY KEY
    `staff ID` INT NOT NULL, 
	PRIMARY KEY (`staff ID`) 
);
-- ======================================================================================================
-- TABLE : INVOICES -------------------------------------------------------------------------------------
CREATE TABLE `INVOICES` (
    `date` DATE,
    
    -- FOREIGN KEYS:
	`customer ID` INT NOT NULL,
        -- FK CUSTOMERS / CUSTOMER
	`staff ID` INT NOT NULL, 
		-- FK from SALESPERSONS / STUFF

    -- PRIMARY KEY
    `invoice number` INT NOT NULL AUTO_INCREMENT,  
	PRIMARY KEY (`invoice number`) 
);

-- ========================================================================================================
-- ADD FK to CUSTOMERS ------------------------------------------------------------------------------------
ALTER TABLE `CUSTOMERS`
ADD CONSTRAINT `CUSTOMERS FK SALESPERSONS` FOREIGN KEY (`staff ID`) REFERENCES SALESPERSONS(`staff ID`);
-- ADD FK to CARS -----------------------------------------------------------------------------------------
ALTER TABLE `CARS`
ADD CONSTRAINT `CARS FK CUSTOMERS` FOREIGN KEY (`customer ID`) REFERENCES CUSTOMERS(`customer ID`),
ADD CONSTRAINT `CARS FK INVOICES` FOREIGN KEY (`invoice number`) REFERENCES INVOICES(`invoice number`);

-- ADD FK to INVOICES -------------------------------------------------------------------------------------
ALTER TABLE `INVOICES`
ADD CONSTRAINT `INVOICES FK CUSTOMERS` FOREIGN KEY (`customer ID`) REFERENCES CUSTOMERS(`customer ID`),
ADD CONSTRAINT `INVOICES FK SALESPERSONS` FOREIGN KEY (`staff ID`) REFERENCES SALESPERSONS(`staff ID`);
-- Error Code: 1072. Key column 'staff ID' doesn't exist in table

-- ========================================================================================================
-- HOW TO -------------------------------------------------------------------------------------------------
-- How to drop a table from a database
DROP TABLE `table_name`;
-- ---------------------------------------------------
-- How to alter a table and drop a foreign key
ALTER TABLE `table_name`
DROP FOREIGN KEY `foreign_key_name`;
-- ---------------------------------------------------
-- How to add constraints (Foreign keys to a table)
-- only add to the one that has a many or depends on it
-- Alter the table with constraints (relationships)
ALTER TABLE `table_name`
ADD CONSTRAINT `constraint_name` FOREIGN KEY (`foreign key name`) REFERENCES source_table(`foreign key name`),
ADD CONSTRAINT `constraint_name` FOREIGN KEY (`foreign key name`) REFERENCES source_table(`foreign key name`),
ADD CONSTRAINT `constraint_name` FOREIGN KEY (`foreign key name`) REFERENCES source_table(`foreign key name`);
-- ---------------------------------------------------
-- QUESTIONS!
-- When to use VARCHAR or CHAR?
-- What's the difference between CHAR, VARCHAR, TEXT?
-- Storage engine must support FK? What does it mean exactly?
SHOW TABLE STATUS WHERE Name = 'table_name';
SHOW TABLE STATUS WHERE Name = 'INVOICES';

