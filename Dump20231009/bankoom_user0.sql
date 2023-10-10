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

-- Dump completed on 2023-10-09 20:39:40
