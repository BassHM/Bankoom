CREATE DATABASE  IF NOT EXISTS `bankoom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bankoom`;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-09 20:37:20
