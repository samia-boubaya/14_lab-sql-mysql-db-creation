-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`salespersons` (
  `name` CHAR(100) NULL DEFAULT NULL,
  `store` CHAR(100) NULL DEFAULT NULL,
  `staff ID` INT NOT NULL,
  PRIMARY KEY (`staff ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`customers` (
  `name` CHAR(100) NULL DEFAULT NULL,
  `phone number` INT NULL DEFAULT NULL,
  `email` CHAR(100) NULL DEFAULT NULL,
  `address` CHAR(100) NULL DEFAULT NULL,
  `city` CHAR(100) NULL DEFAULT NULL,
  `state/province` CHAR(100) NULL DEFAULT NULL,
  `country` CHAR(100) NULL DEFAULT NULL,
  `zip/postal code` CHAR(10) NULL DEFAULT NULL,
  `Customer ID` INT NOT NULL,
  `salespersons_staff ID` INT NOT NULL,
  PRIMARY KEY (`Customer ID`),
  INDEX `fk_customers_salespersons1_idx` (`salespersons_staff ID` ASC) VISIBLE,
  CONSTRAINT `fk_customers_salespersons1`
    FOREIGN KEY (`salespersons_staff ID`)
    REFERENCES `lab_mysql`.`salespersons` (`staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoices` (
  `date` DATE NULL DEFAULT NULL,
  `Customer ID` INT NULL DEFAULT NULL,
  `staff ID` CHAR(100) NULL DEFAULT NULL,
  `invoice number` INT NOT NULL AUTO_INCREMENT,
  `salespersons_staff ID` INT NOT NULL,
  `customers_Customer ID` INT NOT NULL,
  PRIMARY KEY (`invoice number`),
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_staff ID` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_Customer ID` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_staff ID`)
    REFERENCES `lab_mysql`.`salespersons` (`staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_Customer ID`)
    REFERENCES `lab_mysql`.`customers` (`Customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`cars` (
  `manufacturer` CHAR(100) NULL DEFAULT NULL,
  `model` CHAR(100) NULL DEFAULT NULL,
  `year` INT NULL DEFAULT NULL,
  `color` CHAR(50) NULL DEFAULT NULL,
  `VIN` INT NOT NULL AUTO_INCREMENT,
  `customers_Customer ID` INT NOT NULL,
  `invoices_invoice number` INT NOT NULL,
  PRIMARY KEY (`VIN`),
  INDEX `fk_cars_customers_idx` (`customers_Customer ID` ASC) VISIBLE,
  INDEX `fk_cars_invoices1_idx` (`invoices_invoice number` ASC) VISIBLE,
  CONSTRAINT `fk_cars_customers`
    FOREIGN KEY (`customers_Customer ID`)
    REFERENCES `lab_mysql`.`customers` (`Customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_invoice number`)
    REFERENCES `lab_mysql`.`invoices` (`invoice number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Sales` (
  `idSales` INT NOT NULL,
  `salespersons_staff ID` INT NOT NULL,
  `invoices_invoice number` INT NOT NULL,
  PRIMARY KEY (`idSales`),
  INDEX `fk_Sales_salespersons1_idx` (`salespersons_staff ID` ASC) VISIBLE,
  INDEX `fk_Sales_invoices1_idx` (`invoices_invoice number` ASC) VISIBLE,
  CONSTRAINT `fk_Sales_salespersons1`
    FOREIGN KEY (`salespersons_staff ID`)
    REFERENCES `lab_mysql`.`salespersons` (`staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_invoices1`
    FOREIGN KEY (`invoices_invoice number`)
    REFERENCES `lab_mysql`.`invoices` (`invoice number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
