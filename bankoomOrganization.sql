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
-- Table `bankoom`.`currency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`currency` (
  `idCurrencyIso4217` VARCHAR(3) NOT NULL,
  `currencyName` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`idCurrencyIso4217`),
  UNIQUE INDEX `idCurrency_UNIQUE` (`idCurrencyIso4217` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoom`.`typeofaccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`typeofaccount` (
  `idTypeOfAccount` TINYINT NOT NULL AUTO_INCREMENT,
  `typeOfAccountDescription` VARCHAR(45) NOT NULL,
  `minimumAmmount` DECIMAL(9,2) NOT NULL,
  `maximumAmmount` DECIMAL(9,2) NOT NULL,
  `maximumAmmountInTransactions` DECIMAL(9,2) NOT NULL,
  `idCurrencyIso4217` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`idTypeOfAccount`),
  UNIQUE INDEX `idTypeOfAccount_UNIQUE` (`idTypeOfAccount` ASC) VISIBLE,
  INDEX `fk_typeOfAccount_currency1_idx` (`idCurrencyIso4217` ASC) VISIBLE,
  CONSTRAINT `fk_typeOfAccount_currency1`
    FOREIGN KEY (`idCurrencyIso4217`)
    REFERENCES `bankoomOrganization`.`currency` (`idCurrencyIso4217`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoom`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`user` (
  `idUser` VARCHAR(15) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `secondLastName` VARCHAR(45) NOT NULL,
  `idStateOfResidence` TINYINT NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `curp` VARCHAR(18) NOT NULL,
  `rfc` VARCHAR(45) NULL DEFAULT NULL,
  `phoneNumber` INT NOT NULL,
  `adress` VARCHAR(90) NOT NULL,
  `postalCode` MEDIUMINT NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC) VISIBLE,
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC) VISIBLE,
  INDEX `fk_user_state1_idx` (`idStateOfResidence` ASC) VISIBLE,
  CONSTRAINT `fk_user_state1`
    FOREIGN KEY (`idStateOfResidence`)
    REFERENCES `bankoomOrganization`.`state` (`idState`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoom`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`account` (
  `idAccount` INT NOT NULL AUTO_INCREMENT,
  `idStatusOfAccount` TINYINT NOT NULL,
  `dateOfCreation` DATE NOT NULL,
  `idUser` VARCHAR(15) NOT NULL,
  `balance` DECIMAL(9,2) NOT NULL DEFAULT 0,
  `idTypeOfAccount` TINYINT NOT NULL,
  PRIMARY KEY (`idAccount`),
  UNIQUE INDEX `idAccount_UNIQUE` (`idAccount` ASC) VISIBLE,
  INDEX `fk_account_user1_idx` (`idUser` ASC) VISIBLE,
  INDEX `fk_account_typeOfAccount1_idx` (`idTypeOfAccount` ASC) VISIBLE,
  CONSTRAINT `fk_account_typeOfAccount1`
    FOREIGN KEY (`idTypeOfAccount`)
    REFERENCES `bankoomOrganization`.`typeofaccount` (`idTypeOfAccount`),
  CONSTRAINT `fk_account_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `bankoomOrganization`.`user` (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoom`.`transfer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`transfer` (
  `idTransfer` INT NOT NULL AUTO_INCREMENT,
  `concept` VARCHAR(20) NULL DEFAULT NULL,
  `idAccountSender` INT NOT NULL,
  `idAccountReciever` INT NOT NULL,
  `ammount` DECIMAL(7,2) NOT NULL,
  `dateOfTransfer` DATETIME NOT NULL,
  PRIMARY KEY (`idTransfer`),
  UNIQUE INDEX `idTransfer_UNIQUE` (`idTransfer` ASC) VISIBLE,
  INDEX `fk_transaction_account1_idx` (`idAccountSender` ASC) VISIBLE,
  INDEX `fk_transaction_account2_idx` (`idAccountReciever` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_account1`
    FOREIGN KEY (`idAccountSender`)
    REFERENCES `bankoomOrganization`.`account` (`idAccount`),
  CONSTRAINT `fk_transaction_account2`
    FOREIGN KEY (`idAccountReciever`)
    REFERENCES `bankoomOrganization`.`account` (`idAccount`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bankoom`.`periodicPayment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`periodicPayment` (
  `idPeriodicPayment` INT NOT NULL,
  `paymentDay` TINYINT NOT NULL,
  `ammount` DECIMAL(18,2) NOT NULL,
  `idOrganizationAccount` INT NOT NULL,
  `idUser` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idPeriodicPayment`),
  INDEX `fk_periodicPayment_user1_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `fk_periodicPayment_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `bankoomOrganization`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bankoom`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankoomOrganization`.`payment` (
  `idPayment` INT NOT NULL,
  `idOrganizationAccount` VARCHAR(45) NOT NULL,
  `idAccount` INT NOT NULL,
  `ammount` DECIMAL(18,2) NOT NULL,
  `idPeriodicPayment` INT NULL,
  PRIMARY KEY (`idPayment`),
  INDEX `fk_payment_account1_idx` (`idAccount` ASC) VISIBLE,
  INDEX `fk_payment_periodicPayment1_idx` (`idPeriodicPayment` ASC) VISIBLE,
  CONSTRAINT `fk_payment_account1`
    FOREIGN KEY (`idAccount`)
    REFERENCES `bankoomOrganization`.`account` (`idAccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_periodicPayment1`
    FOREIGN KEY (`idPeriodicPayment`)
    REFERENCES `bankoomOrganization`.`periodicPayment` (`idPeriodicPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
