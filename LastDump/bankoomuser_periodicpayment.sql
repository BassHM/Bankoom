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
-- Table structure for table `periodicpayment`
--

DROP TABLE IF EXISTS `periodicpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodicpayment` (
  `idPeriodicPayment` int NOT NULL AUTO_INCREMENT,
  `paymentDay` tinyint NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `idOrganizationAccount` int NOT NULL,
  `idAccount` int NOT NULL,
  PRIMARY KEY (`idPeriodicPayment`),
  KEY `fk_idOrganizationAccount_user1` (`idOrganizationAccount`),
  KEY `fk_idAccount_idx` (`idAccount`),
  CONSTRAINT `fk_idAccount` FOREIGN KEY (`idAccount`) REFERENCES `account` (`idAccount`),
  CONSTRAINT `fk_idOrganizationAccount_user1` FOREIGN KEY (`idOrganizationAccount`) REFERENCES `organizationaccount` (`idOrganizationAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodicpayment`
--

LOCK TABLES `periodicpayment` WRITE;
/*!40000 ALTER TABLE `periodicpayment` DISABLE KEYS */;
INSERT INTO `periodicpayment` VALUES (1,3,100.00,1,1),(7,3,91.00,1,1),(8,3,12.00,1,1),(9,3,8.00,1,1),(10,3,123.00,1,1);
/*!40000 ALTER TABLE `periodicpayment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04  2:51:13
