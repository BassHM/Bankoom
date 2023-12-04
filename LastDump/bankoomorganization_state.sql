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
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `idState` tinyint NOT NULL AUTO_INCREMENT,
  `stateName` varchar(25) DEFAULT NULL,
  `idCountry` int NOT NULL,
  PRIMARY KEY (`idState`),
  UNIQUE KEY `idState_UNIQUE` (`idState`),
  KEY `idCountry_idx` (`idCountry`),
  CONSTRAINT `idCountry` FOREIGN KEY (`idCountry`) REFERENCES `country` (`idCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (2,'Aguascalientes',1),(3,'Baja California',1),(4,'Baja California Sur',1),(5,'Campeche',1),(6,'Coahuila',1),(7,'Colima',1),(8,'Chiapas',1),(9,'Chihuahua',1),(10,'Distrito Federal',1),(11,'CDMX',1),(12,'Durango',1),(13,'Guanajuato',1),(14,'Guerrero',1),(15,'Hidalgo',1),(16,'Jalisco',1),(17,'Estado de Mexico',1),(18,'Michoacan',1),(19,'Morelos',1),(20,'Nayarit',1),(21,'Nuevo Leon',1),(22,'Oaxaca',1),(23,'Puebla',1),(24,'Queretaro',1),(25,'Quintana Roo',1),(26,'San Luis Potosi',1),(27,'Sinaloa',1),(28,'Sonora',1),(29,'Tabasco',1),(30,'Tamaulipas',1),(31,'Tlaxcala',1),(32,'Veracruz',1),(33,'Yucatan',1),(34,'Zacatecas',1);
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

-- Dump completed on 2023-12-04  2:51:14
