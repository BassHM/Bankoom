-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bankoomuser
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
  `idAccount` int NOT NULL AUTO_INCREMENT,
  `idStatusOfAccount` tinyint NOT NULL,
  `dateOfCreation` date NOT NULL,
  `idUser` varchar(15) NOT NULL,
  `balance` decimal(9,2) NOT NULL DEFAULT '0.00',
  `idTypeOfAccount` tinyint NOT NULL,
  `accountName` varchar(30) NOT NULL,
  PRIMARY KEY (`idAccount`),
  UNIQUE KEY `idAccount_UNIQUE` (`idAccount`),
  KEY `fk_account_user1_idx` (`idUser`),
  KEY `fk_account_typeOfAccount1_idx` (`idTypeOfAccount`),
  CONSTRAINT `fk_account_typeOfAccount1` FOREIGN KEY (`idTypeOfAccount`) REFERENCES `typeofaccount` (`idTypeOfAccount`),
  CONSTRAINT `fk_account_user1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,'2023-11-13','Rixon22',2691.00,1,''),(2,1,'2023-11-14','ZombieNerfBoy',1400.00,1,''),(3,1,'2023-12-03','Rixon22',123.00,1,'putotas'),(4,1,'2023-12-03','Rixon22',5.00,2,'Putitas'),(5,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(6,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(7,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(8,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(9,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(10,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(11,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(12,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(13,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(14,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(15,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(16,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(17,1,'2023-12-03','Rixon22',3000.00,2,'PatTransexual'),(18,1,'2023-12-03','Rixon22',0.00,1,'Pat');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03 20:27:59
