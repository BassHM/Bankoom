-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Bankoom
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Bankoom` ;

-- -----------------------------------------------------
-- Schema Bankoom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Bankoom` DEFAULT CHARACTER SET utf8 ;
USE `Bankoom` ;

-- -----------------------------------------------------
-- Table `Bankoom`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`country` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`country` (
  `idCountry` TINYINT(3) NOT NULL AUTO_INCREMENT,
  `countryName` VARCHAR(45) NULL,
  PRIMARY KEY (`idCountry`),
  UNIQUE INDEX `idCountry_UNIQUE` (`idCountry` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`state` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`state` (
  `idState` TINYINT(3) NOT NULL AUTO_INCREMENT,
  `stateName` VARCHAR(25) NULL,
  `idCountry` TINYINT(3) NOT NULL,
  PRIMARY KEY (`idState`),
  UNIQUE INDEX `idState_UNIQUE` (`idState` ASC) VISIBLE,
  INDEX `fk_state_country1_idx` (`idCountry` ASC) VISIBLE,
  CONSTRAINT `fk_state_country1`
    FOREIGN KEY (`idCountry`)
    REFERENCES `Bankoom`.`country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`statusOfClient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`statusOfClient` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`statusOfClient` (
  `idStatus` TINYINT NOT NULL AUTO_INCREMENT,
  `statusName` VARCHAR(30) NULL,
  `statusDescripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idStatus`),
  UNIQUE INDEX `idStatus_UNIQUE` (`idStatus` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`user` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`user` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `secondLastName` VARCHAR(45) NOT NULL,
  `idStateOfResidence` TINYINT(3) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `curp` VARCHAR(18) NOT NULL,
  `rfc` VARCHAR(45) NULL,
  `phoneNumber` INT(10) NOT NULL,
  `adress` VARCHAR(90) NOT NULL,
  `postalCode` MEDIUMINT(5) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `dateOfCreation` DATE NOT NULL,
  `status_idStatus` TINYINT NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC) VISIBLE,
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC) VISIBLE,
  INDEX `fk_user_state1_idx` (`idStateOfResidence` ASC) VISIBLE,
  INDEX `fk_user_status1_idx` (`status_idStatus` ASC) VISIBLE,
  CONSTRAINT `fk_user_state1`
    FOREIGN KEY (`idStateOfResidence`)
    REFERENCES `Bankoom`.`state` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_status1`
    FOREIGN KEY (`status_idStatus`)
    REFERENCES `Bankoom`.`statusOfClient` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`credentials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`credentials` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`credentials` (
  `userName` VARCHAR(10) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`userName`, `idUser`),
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC) VISIBLE,
  INDEX `fk_UserCredentials_user_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `fk_UserCredentials_user`
    FOREIGN KEY (`idUser`)
    REFERENCES `Bankoom`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`currency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`currency` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`currency` (
  `idCurrency` TINYINT(3) NOT NULL AUTO_INCREMENT,
  `currencyName` VARCHAR(3) NULL,
  PRIMARY KEY (`idCurrency`),
  UNIQUE INDEX `idCurrency_UNIQUE` (`idCurrency` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`statusOfAccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`statusOfAccount` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`statusOfAccount` (
  `idStatusOfAccount` TINYINT(3) NOT NULL AUTO_INCREMENT,
  `statusName` VARCHAR(45) NULL,
  `statusDescription` VARCHAR(45) NULL,
  PRIMARY KEY (`idStatusOfAccount`),
  UNIQUE INDEX `idStatusOfAccount_UNIQUE` (`idStatusOfAccount` ASC) VISIBLE,
  UNIQUE INDEX `statusName_UNIQUE` (`statusName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`organization` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`organization` (
  `idOrganization` INT NOT NULL AUTO_INCREMENT,
  `organizationName` VARCHAR(45) NOT NULL,
  `comercialName` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(90) NOT NULL,
  `postalCode` MEDIUMINT(5) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `dateOfCreation` DATE NOT NULL,
  `state_idState` TINYINT(3) NOT NULL,
  `status_idStatus` TINYINT NOT NULL,
  `phoneNumber` INT(10) NULL,
  PRIMARY KEY (`idOrganization`),
  UNIQUE INDEX `idOrganization_UNIQUE` (`idOrganization` ASC) VISIBLE,
  INDEX `fk_organization_state1_idx` (`state_idState` ASC) VISIBLE,
  INDEX `fk_organization_status1_idx` (`status_idStatus` ASC) VISIBLE,
  CONSTRAINT `fk_organization_state1`
    FOREIGN KEY (`state_idState`)
    REFERENCES `Bankoom`.`state` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_status1`
    FOREIGN KEY (`status_idStatus`)
    REFERENCES `Bankoom`.`statusOfClient` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`typeOfAccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`typeOfAccount` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`typeOfAccount` (
  `idTypeOfAccount` TINYINT(3) NOT NULL AUTO_INCREMENT,
  `typeOfAccountDescription` VARCHAR(45) NULL,
  `minimumAmmount` DECIMAL(9,2) NULL,
  `maximumAmmount` DECIMAL(9,2) NULL,
  `maximumAmmountInTransactions` DECIMAL(9,2) NULL,
  `idCurrency` TINYINT(3) NOT NULL,
  PRIMARY KEY (`idTypeOfAccount`),
  INDEX `fk_typeOfAccount_currency1_idx` (`idCurrency` ASC) VISIBLE,
  UNIQUE INDEX `idTypeOfAccount_UNIQUE` (`idTypeOfAccount` ASC) VISIBLE,
  CONSTRAINT `fk_typeOfAccount_currency1`
    FOREIGN KEY (`idCurrency`)
    REFERENCES `Bankoom`.`currency` (`idCurrency`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`account` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`account` (
  `idAccount` INT NOT NULL AUTO_INCREMENT,
  `active` VARCHAR(45) NULL,
  `idStatusOfAccount` TINYINT(3) NOT NULL,
  `dateOfCreation` DATE NOT NULL,
  `idUser` INT NULL,
  `idOrganization` INT NULL,
  `balance` DECIMAL(9,2) NOT NULL,
  `idTypeOfAccount` TINYINT(3) NOT NULL,
  PRIMARY KEY (`idAccount`),
  UNIQUE INDEX `idAccount_UNIQUE` (`idAccount` ASC) VISIBLE,
  INDEX `fk_account_statusOfAccount1_idx` (`idStatusOfAccount` ASC) VISIBLE,
  INDEX `fk_account_user1_idx` (`idUser` ASC) VISIBLE,
  INDEX `fk_account_organization1_idx` (`idOrganization` ASC) VISIBLE,
  INDEX `fk_account_typeOfAccount1_idx` (`idTypeOfAccount` ASC) VISIBLE,
  CONSTRAINT `fk_account_statusOfAccount1`
    FOREIGN KEY (`idStatusOfAccount`)
    REFERENCES `Bankoom`.`statusOfAccount` (`idStatusOfAccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `Bankoom`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_organization1`
    FOREIGN KEY (`idOrganization`)
    REFERENCES `Bankoom`.`organization` (`idOrganization`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_typeOfAccount1`
    FOREIGN KEY (`idTypeOfAccount`)
    REFERENCES `Bankoom`.`typeOfAccount` (`idTypeOfAccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bankoom`.`transfer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bankoom`.`transfer` ;

CREATE TABLE IF NOT EXISTS `Bankoom`.`transfer` (
  `idTransfer` INT NOT NULL AUTO_INCREMENT,
  `concept` VARCHAR(20) NULL,
  `idAccountSender` INT NOT NULL,
  `idAccountReciever` INT NOT NULL,
  `ammount` DECIMAL(7,2) NOT NULL,
  `dateOfTransfer` DATETIME NOT NULL,
  PRIMARY KEY (`idTransfer`),
  INDEX `fk_transaction_account1_idx` (`idAccountSender` ASC) VISIBLE,
  INDEX `fk_transaction_account2_idx` (`idAccountReciever` ASC) VISIBLE,
  UNIQUE INDEX `idTransfer_UNIQUE` (`idTransfer` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_account1`
    FOREIGN KEY (`idAccountSender`)
    REFERENCES `Bankoom`.`account` (`idAccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_account2`
    FOREIGN KEY (`idAccountReciever`)
    REFERENCES `Bankoom`.`account` (`idAccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
