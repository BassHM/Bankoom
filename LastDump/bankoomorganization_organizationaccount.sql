-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bankoomorganization
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
-- Table structure for table `organizationaccount`
--

DROP TABLE IF EXISTS `organizationaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizationaccount` (
  `idOrganizationAccount` int NOT NULL AUTO_INCREMENT,
  `idOrganization` varchar(45) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `balance` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idOrganizationAccount`),
  KEY `fk_organizationAccount_organization1_idx` (`idOrganization`),
  CONSTRAINT `organizationaccount_ibfk_1` FOREIGN KEY (`idOrganization`) REFERENCES `organization` (`idOrganization`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizationaccount`
--

LOCK TABLES `organizationaccount` WRITE;
/*!40000 ALTER TABLE `organizationaccount` DISABLE KEYS */;
INSERT INTO `organizationaccount` VALUES (4,'7','Activision',0.00,1),(5,'7','CandyCrush',0.00,1),(8,'7','Papas',0.00,1),(9,'Ahora si ','Activision EA Pass',12.00,1),(10,'Ahora si ','Papanter',0.00,1),(11,'LAst','Papanter',0.00,1),(12,'Ahora si ','Papanter',23.00,1),(13,'LAst','Papucha',0.00,1),(14,'Pasota','Noactiva',213.00,0);
/*!40000 ALTER TABLE `organizationaccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04  2:51:14
