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
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `idState` int NOT NULL AUTO_INCREMENT,
  `stateName` varchar(45) DEFAULT NULL,
  `idCountry` int NOT NULL,
  `stateForCurp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idState`),
  KEY `fk_state_country1_idx` (`idCountry`),
  CONSTRAINT `fk_state_country1` FOREIGN KEY (`idCountry`) REFERENCES `country` (`idCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Aguascalientes',1,'AS'),(4,'Baja California',1,'BC'),(5,'Baja California Sur',1,'BS'),(6,'Campeche',1,'CC'),(7,'Coahuila',1,'CL'),(8,'Colima',1,'CM'),(9,'Chiapas',1,'CS'),(10,'Chihuahua',1,'CH'),(11,'Distrito Federal',1,'DF'),(12,'CDMX',1,'DF'),(13,'Durango',1,'DG'),(14,'Guanajuato',1,'GT'),(15,'Guerrero',1,'GR'),(16,'Hidalgo',1,'HG'),(17,'Jalisco',1,'JC'),(18,'Estado de Mexico',1,'MC'),(20,'Michoacan',1,'MN'),(21,'Morelos',1,'MS'),(22,'Nayarit',1,'NT'),(23,'Nuevo Leon',1,'NL'),(24,'Oaxaca',1,'OC'),(25,'Puebla',1,'PL'),(26,'Queretaro',1,'QT'),(27,'Quintana Roo',1,'QR'),(28,'San Luis Potosi',1,'SP'),(29,'Sinaloa',1,'SL'),(30,'Sonora',1,'SR'),(31,'Tabasco',1,'TC'),(32,'Tamaulipas',1,'TS'),(33,'Tlaxcala',1,'TL'),(34,'Veracruz',1,'VZ'),(35,'Yucatan',1,'YN'),(36,'Zacatecas',1,'ZS');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
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
