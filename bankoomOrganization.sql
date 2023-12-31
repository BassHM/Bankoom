-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bankoomOrganization
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bankoomOrganization
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bankoomOrganization` DEFAULT CHARACTER SET utf8mb3 ;
USE `bankoomOrganization` ;

-- -----------------------------------------------------
-- Table `bankoomOrganization`.`organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`organization` (
  `idOrganization` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `comercialName` VARCHAR(45) NOT NULL,
  `idState` INT NOT NULL,
  PRIMARY KEY (`idOrganization`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bankoomOrganization`.`organizationAccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`organizationAccount` (
  `idOrganizationAccount` INT NOT NULL auto_increment,
  `idOrganization` VARCHAR(45) NOT NULL,
  `accountName` VARCHAR(45) NOT NULL,
  `balance` DECIMAL(18,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idOrganizationAccount`),
  INDEX `fk_organizationAccount_organization1_idx` (`idOrganization` ASC),
  CONSTRAINT `fk_organizationAccount_organization1`
    FOREIGN KEY (`idOrganization`)
    REFERENCES `bankoomOrganization`.`organization` (`idOrganization`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
