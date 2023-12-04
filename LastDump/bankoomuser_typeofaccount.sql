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
-- Table structure for table `typeofaccount`
--

DROP TABLE IF EXISTS `typeofaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeofaccount` (
  `idTypeOfAccount` tinyint NOT NULL AUTO_INCREMENT,
  `typeOfAccountDescription` varchar(45) NOT NULL,
  `minimumAmount` decimal(9,2) NOT NULL,
  `maximumAmount` decimal(9,2) NOT NULL,
  `maximumAmountInTransactions` decimal(9,2) NOT NULL,
  `idCurrencyIso4217` varchar(3) NOT NULL,
  PRIMARY KEY (`idTypeOfAccount`),
  UNIQUE KEY `idTypeOfAccount_UNIQUE` (`idTypeOfAccount`),
  KEY `fk_typeOfAccount_currency1_idx` (`idCurrencyIso4217`),
  CONSTRAINT `fk_typeOfAccount_currency1` FOREIGN KEY (`idCurrencyIso4217`) REFERENCES `currency` (`idCurrencyIso4217`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeofaccount`
--

LOCK TABLES `typeofaccount` WRITE;
/*!40000 ALTER TABLE `typeofaccount` DISABLE KEYS */;
INSERT INTO `typeofaccount` VALUES (1,'Cuenta corriente',0.00,150000.00,300000.00,'MXN'),(2,'Cuenta en dólares',0.00,20000.00,3000.00,'USD');
/*!40000 ALTER TABLE `typeofaccount` ENABLE KEYS */;
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
