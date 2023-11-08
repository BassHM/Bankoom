-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bankoomuser
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bankoomuser
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bankoomuser` DEFAULT CHARACTER SET utf8mb3 ;
USE `bankoomuser` ;

-- -----------------------------------------------------
-- Table `bankoomuser`.`currency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`currency` (
  `idCurrencyIso4217` VARCHAR(3) NOT NULL,
  `currencyName` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`idCurrencyIso4217`),
  UNIQUE INDEX `idCurrency_UNIQUE` (`idCurrencyIso4217` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoomuser`.`typeofaccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`typeofaccount` (
  `idTypeOfAccount` TINYINT NOT NULL AUTO_INCREMENT,
  `typeOfAccountDescription` VARCHAR(45) NOT NULL,
  `minimumAmmount` DECIMAL(9,2) NOT NULL,
  `maximumAmmount` DECIMAL(9,2) NOT NULL,
  `maximumAmmountInTransactions` DECIMAL(9,2) NOT NULL,
  `idCurrencyIso4217` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`idTypeOfAccount`),
  UNIQUE INDEX `idTypeOfAccount_UNIQUE` (`idTypeOfAccount` ASC),
  INDEX `fk_typeOfAccount_currency1_idx` (`idCurrencyIso4217` ASC),
  CONSTRAINT `fk_typeOfAccount_currency1`
    FOREIGN KEY (`idCurrencyIso4217`)
    REFERENCES `bankoomuser`.`currency` (`idCurrencyIso4217`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoomuser`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`country` (
  `idCountry` INT NOT NULL auto_increment,
  `countryName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoomuser`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`state` (
  `idState` INT NOT NULL auto_increment,
  `stateName` VARCHAR(45) NULL,
  `idCountry` INT NOT NULL,
  PRIMARY KEY (`idState`),
  INDEX `fk_state_country1_idx` (`idCountry` ASC),
  CONSTRAINT `fk_state_country1`
    FOREIGN KEY (`idCountry`)
    REFERENCES `bankoomuser`.`country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bankoomuser`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`user` (
  `idUser` VARCHAR(15) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `secondLastName` VARCHAR(45) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `curp` VARCHAR(18) NOT NULL,
  `rfc` VARCHAR(45) NULL DEFAULT NULL,
  `phoneNumber` INT NOT NULL,
  `adress` VARCHAR(90) NOT NULL,
  `postalCode` MEDIUMINT NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `idState` INT NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC),
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC),
  INDEX `fk_user_state1_idx` (`idState` ASC),
  CONSTRAINT `fk_user_state1`
    FOREIGN KEY (`idState`)
    REFERENCES `bankoomuser`.`state` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoomuser`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`account` (
  `idAccount` INT NOT NULL AUTO_INCREMENT,
  `idStatusOfAccount` TINYINT NOT NULL,
  `dateOfCreation` DATE NOT NULL,
  `idUser` VARCHAR(15) NOT NULL,
  `balance` DECIMAL(9,2) NOT NULL DEFAULT '0.00',
  `idTypeOfAccount` TINYINT NOT NULL,
  PRIMARY KEY (`idAccount`),
  UNIQUE INDEX `idAccount_UNIQUE` (`idAccount` ASC),
  INDEX `fk_account_user1_idx` (`idUser` ASC) VISIBLE,
  INDEX `fk_account_typeOfAccount1_idx` (`idTypeOfAccount` ASC),
  CONSTRAINT `fk_account_typeOfAccount1`
    FOREIGN KEY (`idTypeOfAccount`)
    REFERENCES `bankoomuser`.`typeofaccount` (`idTypeOfAccount`),
  CONSTRAINT `fk_account_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `bankoomuser`.`user` (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoomuser`.`periodicpayment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`periodicpayment` (
  `idPeriodicPayment` INT NOT NULL auto_increment,
  `paymentDay` TINYINT NOT NULL,
  `ammount` DECIMAL(18,2) NOT NULL,
  `idOrganizationAccount` INT NOT NULL,
  `idUser` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idPeriodicPayment`),
  INDEX `fk_periodicPayment_user1_idx` (`idUser` ASC),
  CONSTRAINT `fk_periodicPayment_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `bankoomuser`.`user` (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoomuser`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`payment` (
  `idPayment` INT NOT NULL auto_increment,
  `idOrganizationAccount` VARCHAR(45) NOT NULL,
  `idAccount` INT NOT NULL,
  `ammount` DECIMAL(18,2) NOT NULL,
  `idPeriodicPayment` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idPayment`),
  INDEX `fk_payment_account1_idx` (`idAccount` ASC),
  INDEX `fk_payment_periodicPayment1_idx` (`idPeriodicPayment` ASC),
  CONSTRAINT `fk_payment_account1`
    FOREIGN KEY (`idAccount`)
    REFERENCES `bankoomuser`.`account` (`idAccount`),
  CONSTRAINT `fk_payment_periodicPayment1`
    FOREIGN KEY (`idPeriodicPayment`)
    REFERENCES `bankoomuser`.`periodicpayment` (`idPeriodicPayment`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoomuser`.`transfer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomuser`.`transfer` (
  `idTransfer` INT NOT NULL AUTO_INCREMENT,
  `concept` VARCHAR(20) NULL DEFAULT NULL,
  `idAccountSender` INT NOT NULL,
  `idAccountReciever` INT NOT NULL,
  `ammount` DECIMAL(7,2) NOT NULL,
  `dateOfTransfer` DATETIME NOT NULL,
  PRIMARY KEY (`idTransfer`),
  UNIQUE INDEX `idTransfer_UNIQUE` (`idTransfer` ASC),
  INDEX `fk_transaction_account1_idx` (`idAccountSender` ASC),
  INDEX `fk_transaction_account2_idx` (`idAccountReciever` ASC),
  CONSTRAINT `fk_transaction_account1`
    FOREIGN KEY (`idAccountSender`)
    REFERENCES `bankoomuser`.`account` (`idAccount`),
  CONSTRAINT `fk_transaction_account2`
    FOREIGN KEY (`idAccountReciever`)
    REFERENCES `bankoomuser`.`account` (`idAccount`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
