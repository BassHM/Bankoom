-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bankoom
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `idAccount` int NOT NULL,
  `active` varchar(45) DEFAULT NULL,
  `idStatusOfAccount` tinyint NOT NULL,
  `dateOfCreation` date NOT NULL,
  `idUser` int DEFAULT NULL,
  `idOrganization` int DEFAULT NULL,
  `balance` decimal(9,2) NOT NULL,
  `idTypeOfAccount` tinyint NOT NULL,
  PRIMARY KEY (`idAccount`),
  UNIQUE KEY `idAccount_UNIQUE` (`idAccount`),
  KEY `fk_account_statusOfAccount1_idx` (`idStatusOfAccount`),
  KEY `fk_account_user1_idx` (`idUser`),
  KEY `fk_account_organization1_idx` (`idOrganization`),
  KEY `fk_account_typeOfAccount1_idx` (`idTypeOfAccount`),
  CONSTRAINT `fk_account_organization1` FOREIGN KEY (`idOrganization`) REFERENCES `organization` (`idOrganization`),
  CONSTRAINT `fk_account_statusOfAccount1` FOREIGN KEY (`idStatusOfAccount`) REFERENCES `statusofaccount` (`idStatusOfAccount`),
  CONSTRAINT `fk_account_typeOfAccount1` FOREIGN KEY (`idTypeOfAccount`) REFERENCES `typeofaccount` (`idTypeOfAccount`),
  CONSTRAINT `fk_account_user1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `idCountry` tinyint NOT NULL,
  `countryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCountry`),
  UNIQUE KEY `idCountry_UNIQUE` (`idCountry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `userName` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`userName`,`idUser`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  KEY `fk_UserCredentials_user_idx` (`idUser`),
  CONSTRAINT `fk_UserCredentials_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `idCurrency` tinyint NOT NULL,
  `currencyName` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idCurrency`),
  UNIQUE KEY `idCurrency_UNIQUE` (`idCurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `idGender` tinyint NOT NULL,
  `genderName` varchar(15) NOT NULL,
  PRIMARY KEY (`idGender`),
  UNIQUE KEY `idGender_UNIQUE` (`idGender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `idOrganization` int NOT NULL AUTO_INCREMENT,
  `organizationName` varchar(45) NOT NULL,
  `comercialName` varchar(45) NOT NULL,
  `adress` varchar(90) NOT NULL,
  `postalCode` mediumint NOT NULL,
  `email` varchar(30) NOT NULL,
  `dateOfCreation` date NOT NULL,
  `country_idCountry` tinyint NOT NULL,
  `state_idState` tinyint NOT NULL,
  `status_idStatus` tinyint NOT NULL,
  `phoneNumber` int DEFAULT NULL,
  PRIMARY KEY (`idOrganization`),
  UNIQUE KEY `idOrganization_UNIQUE` (`idOrganization`),
  KEY `fk_organization_country1_idx` (`country_idCountry`),
  KEY `fk_organization_state1_idx` (`state_idState`),
  KEY `fk_organization_status1_idx` (`status_idStatus`),
  CONSTRAINT `fk_organization_country1` FOREIGN KEY (`country_idCountry`) REFERENCES `country` (`idCountry`),
  CONSTRAINT `fk_organization_state1` FOREIGN KEY (`state_idState`) REFERENCES `state` (`idState`),
  CONSTRAINT `fk_organization_status1` FOREIGN KEY (`status_idStatus`) REFERENCES `statusofclient` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profession` (
  `idProfession` tinyint NOT NULL,
  `professionName` varchar(25) NOT NULL,
  PRIMARY KEY (`idProfession`),
  UNIQUE KEY `idProfession_UNIQUE` (`idProfession`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `idState` tinyint NOT NULL,
  `stateName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idState`),
  UNIQUE KEY `idState_UNIQUE` (`idState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusofaccount`
--

DROP TABLE IF EXISTS `statusofaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusofaccount` (
  `idStatusOfAccount` tinyint NOT NULL,
  `statusName` varchar(45) DEFAULT NULL,
  `statusDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStatusOfAccount`),
  UNIQUE KEY `idStatusOfAccount_UNIQUE` (`idStatusOfAccount`),
  UNIQUE KEY `statusName_UNIQUE` (`statusName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusofaccount`
--

LOCK TABLES `statusofaccount` WRITE;
/*!40000 ALTER TABLE `statusofaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `statusofaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusofclient`
--

DROP TABLE IF EXISTS `statusofclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusofclient` (
  `idStatus` tinyint NOT NULL,
  `statusName` varchar(30) DEFAULT NULL,
  `statusDescripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusofclient`
--

LOCK TABLES `statusofclient` WRITE;
/*!40000 ALTER TABLE `statusofclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `statusofclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `idTransfer` int NOT NULL,
  `concept` varchar(20) DEFAULT NULL,
  `idAccountSender` int NOT NULL,
  `idAccountReciever` int NOT NULL,
  `ammount` decimal(7,2) NOT NULL,
  `dateOfTransfer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTransfer`),
  KEY `fk_transaction_account1_idx` (`idAccountSender`),
  KEY `fk_transaction_account2_idx` (`idAccountReciever`),
  CONSTRAINT `fk_transaction_account1` FOREIGN KEY (`idAccountSender`) REFERENCES `account` (`idAccount`),
  CONSTRAINT `fk_transaction_account2` FOREIGN KEY (`idAccountReciever`) REFERENCES `account` (`idAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeofaccount`
--

DROP TABLE IF EXISTS `typeofaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeofaccount` (
  `idTypeOfAccount` tinyint NOT NULL,
  `typeOfAccountDescription` varchar(45) DEFAULT NULL,
  `minimumAmmount` decimal(9,2) DEFAULT NULL,
  `maximumAmmount` decimal(9,2) DEFAULT NULL,
  `maximumAmmountInTransactions` decimal(9,2) DEFAULT NULL,
  `idCurrency` tinyint NOT NULL,
  PRIMARY KEY (`idTypeOfAccount`),
  KEY `fk_typeOfAccount_currency1_idx` (`idCurrency`),
  CONSTRAINT `fk_typeOfAccount_currency1` FOREIGN KEY (`idCurrency`) REFERENCES `currency` (`idCurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeofaccount`
--

LOCK TABLES `typeofaccount` WRITE;
/*!40000 ALTER TABLE `typeofaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeofaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `secondLastName` varchar(45) NOT NULL,
  `idStateOfBirth` tinyint NOT NULL,
  `idCountryOfBirth` tinyint NOT NULL,
  `idGender` tinyint NOT NULL,
  `idProfession` tinyint NOT NULL,
  `dateOfBirth` date NOT NULL,
  `curp` varchar(18) NOT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `phoneNumber` int NOT NULL,
  `adress` varchar(90) NOT NULL,
  `postalCode` mediumint NOT NULL,
  `email` varchar(30) NOT NULL,
  `dateOfCreation` date NOT NULL,
  `status_idStatus` tinyint NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`),
  KEY `fk_user_state1_idx` (`idStateOfBirth`),
  KEY `fk_user_country1_idx` (`idCountryOfBirth`),
  KEY `fk_user_gender1_idx` (`idGender`),
  KEY `fk_user_profession1_idx` (`idProfession`),
  KEY `fk_user_status1_idx` (`status_idStatus`),
  CONSTRAINT `fk_user_country1` FOREIGN KEY (`idCountryOfBirth`) REFERENCES `country` (`idCountry`),
  CONSTRAINT `fk_user_gender1` FOREIGN KEY (`idGender`) REFERENCES `gender` (`idGender`),
  CONSTRAINT `fk_user_profession1` FOREIGN KEY (`idProfession`) REFERENCES `profession` (`idProfession`),
  CONSTRAINT `fk_user_state1` FOREIGN KEY (`idStateOfBirth`) REFERENCES `state` (`idState`),
  CONSTRAINT `fk_user_status1` FOREIGN KEY (`status_idStatus`) REFERENCES `statusofclient` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-29  9:51:14
