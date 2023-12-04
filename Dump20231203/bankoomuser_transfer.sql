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
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `idTransfer` int NOT NULL AUTO_INCREMENT,
  `concept` varchar(20) DEFAULT NULL,
  `idAccountSender` int NOT NULL,
  `idAccountReceiver` int NOT NULL,
  `amount` decimal(7,2) NOT NULL,
  `dateOfTransfer` datetime NOT NULL,
  PRIMARY KEY (`idTransfer`),
  UNIQUE KEY `idTransfer_UNIQUE` (`idTransfer`),
  KEY `fk_transaction_account1_idx` (`idAccountSender`),
  KEY `fk_transaction_account2_idx` (`idAccountReceiver`),
  CONSTRAINT `fk_transaction_account1` FOREIGN KEY (`idAccountSender`) REFERENCES `account` (`idAccount`),
  CONSTRAINT `fk_transaction_account2` FOREIGN KEY (`idAccountReceiver`) REFERENCES `account` (`idAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (1,'Call of duty points',1,2,500.00,'2023-11-21 00:00:00'),(2,'Call of duty points',1,2,20000.00,'2023-11-21 00:00:00'),(3,'Para los CP (callOfD',2,1,18500.00,'2023-11-21 00:00:00'),(4,'',1,2,0.00,'2023-12-03 16:39:51'),(5,'Prueba',1,2,0.00,'2023-12-03 16:52:00'),(6,'ConceptoPrueba',1,2,0.00,'2023-12-03 16:53:24'),(7,'Pago Pal cherko',1,2,0.00,'2023-12-03 17:40:12'),(8,'OtroTest',1,2,0.00,'2023-12-03 17:40:54'),(9,'Tesste',1,2,0.00,'2023-12-03 17:41:26'),(10,'Cien pesitos',1,2,100.00,'2023-12-03 17:43:30'),(11,'Ahí te van de vuelta',2,1,100.00,'2023-12-03 17:44:33'),(12,'asd',1,2,100.00,'2023-12-03 17:48:48'),(13,'Q no puto no',2,1,100.00,'2023-12-03 17:49:15'),(14,'Ahora si puto',2,1,100.00,'2023-12-03 17:55:49'),(15,'Ahora si puto',2,1,100.00,'2023-12-03 17:57:34'),(16,'Ultima',2,1,100.00,'2023-12-03 17:57:59'),(17,'Un dosientos',2,1,200.00,'2023-12-03 18:00:13'),(18,'Tresientos',2,1,1.00,'2023-12-03 18:00:39'),(19,'Pa mi',2,2,1.00,'2023-12-03 18:01:09'),(20,'Chingue su madre, ah',2,1,99.00,'2023-12-03 18:01:33'),(21,'One dolar',4,1,18.00,'2023-12-03 19:04:09'),(22,'Para una putita cach',1,4,18.00,'2023-12-03 19:09:09'),(23,'Pago',18,1,1.00,'2023-12-03 20:09:04'),(24,'5 dollars',4,1,90.00,'2023-12-03 20:11:00');
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
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
