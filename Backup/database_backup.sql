-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: music_store
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `idcity` int NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`idcity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Kitchener'),(2,'Waterloo'),(3,'Cambridge');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `idcountry` int NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`idcountry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Canada'),(2,'USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idcustomer` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `mobileNumber` varchar(200) NOT NULL,
  `emailAddress` varchar(200) NOT NULL,
  `city` int NOT NULL,
  `province` int NOT NULL,
  `gender` int DEFAULT NULL,
  PRIMARY KEY (`idcustomer`),
  KEY `city_fk_idx` (`city`),
  KEY `province_fk_idx` (`province`),
  KEY `gender_customer_fk_idx_idx` (`gender`),
  CONSTRAINT `city_fk` FOREIGN KEY (`city`) REFERENCES `city` (`idcity`),
  CONSTRAINT `gender_customer_fk_idx` FOREIGN KEY (`gender`) REFERENCES `gender` (`idgender`),
  CONSTRAINT `province_fk` FOREIGN KEY (`province`) REFERENCES `province` (`idprovince`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'sanjana','123456789','sjnjsdnjsdb@gail.com',1,1,2),(2,'wqewqeqwe','112121212','sdasdasdas@gmail.co',2,2,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `iddiscount` int NOT NULL,
  `product` int NOT NULL,
  `promocode` varchar(200) NOT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `discountAmount` decimal(9,2) NOT NULL,
  PRIMARY KEY (`iddiscount`),
  KEY `product_discount_fk_idx` (`product`),
  CONSTRAINT `product_discount_fk` FOREIGN KEY (`product`) REFERENCES `products` (`idproducts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,1,'1212',1,'2021-01-01 00:00:00','2021-12-12 00:00:00',30.00);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `idgender` int NOT NULL,
  `genderName` varchar(45) NOT NULL,
  PRIMARY KEY (`idgender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'male'),(2,'female');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `idgenre` int NOT NULL,
  `genreName` varchar(200) NOT NULL,
  PRIMARY KEY (`idgenre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Pop'),(2,'Rock'),(3,'Jazz');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `idlanguage` int NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`idlanguage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English'),(2,'Spanish'),(3,'Hindi');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idorder` int NOT NULL,
  `customerID` int NOT NULL,
  `product` int NOT NULL,
  `purchaseAmount` decimal(9,2) NOT NULL,
  `discount` int DEFAULT NULL,
  `purchaseDate` datetime NOT NULL,
  PRIMARY KEY (`idorder`),
  KEY `client_order_fk_idx` (`customerID`),
  KEY `product_order_fk_idx` (`product`),
  KEY `discount_order_fk_idx` (`discount`),
  CONSTRAINT `customer_order_fk` FOREIGN KEY (`customerID`) REFERENCES `customer` (`idcustomer`),
  CONSTRAINT `discount_order_fk` FOREIGN KEY (`discount`) REFERENCES `discount` (`iddiscount`),
  CONSTRAINT `product_order_fk` FOREIGN KEY (`product`) REFERENCES `products` (`idproducts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,10000.00,1,'2021-11-22 23:58:14'),(2,1,1,12000.00,1,'2021-11-22 23:58:36'),(3,2,1,12000.00,1,'2021-11-22 23:58:51');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_pending_copies` AFTER INSERT ON `order` FOR EACH ROW BEGIN
   UPDATE music_store.products
   SET availableCopies = availableCopies - 1
   WHERE idproduct = music_store.order.product;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_Audit`
--

DROP TABLE IF EXISTS `product_Audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_Audit` (
  `idproduct_Audit` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `albumName` varchar(200) NOT NULL,
  `genre` int NOT NULL,
  `price` int NOT NULL,
  `singer` int NOT NULL,
  `language` int NOT NULL,
  `avaliableCopies` int NOT NULL,
  `modifiedBy` varchar(200) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`idproduct_Audit`),
  KEY `product_audit_fk_idx` (`product`),
  CONSTRAINT `product_audit_fk` FOREIGN KEY (`product`) REFERENCES `products` (`idproducts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_Audit`
--

LOCK TABLES `product_Audit` WRITE;
/*!40000 ALTER TABLE `product_Audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_Audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idproducts` int NOT NULL,
  `albumName` varchar(200) NOT NULL,
  `genre` int NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `singer` int NOT NULL,
  `language` int NOT NULL,
  `avaliableCopies` int NOT NULL,
  `isActive` bit(1) NOT NULL,
  `createdBy` varchar(200) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idproducts`),
  KEY `singer_fk_idx` (`singer`),
  KEY `language_fk_idx` (`language`),
  KEY `genre_fk_idx` (`genre`),
  CONSTRAINT `genre_fk` FOREIGN KEY (`genre`) REFERENCES `genre` (`idgenre`),
  CONSTRAINT `language_fk` FOREIGN KEY (`language`) REFERENCES `language` (`idlanguage`),
  CONSTRAINT `singer_fk` FOREIGN KEY (`singer`) REFERENCES `singer` (`idsinger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'firstalbum',1,1222.00,1,1,1111,_binary '','sdfsdsfsf','2020-10-10 00:00:00','2021-10-10 00:00:00','dfsdfsdfdfs'),(2,'secondalbum',3,1302.00,2,2,100,_binary '\0','sdfsdsdvvvv','2020-03-10 00:00:00','2021-03-10 00:00:00','vvvvvsdfdfs');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_product_audit_table` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
    INSERT INTO product_Audit
    (product, albumName, genre, price, singer, language, avaliableCopies, modifiedBy, modifiedDate)VALUES
    (NEW.idproducts, NEW.albumName, NEW.genre, NEW.price, NEW.singer, NEW.language, 
    NEW.avaliableCopies, NOW(), NEW.modifiedBy);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `idprovince` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `country` int NOT NULL,
  PRIMARY KEY (`idprovince`),
  KEY `country_fk_idx` (`country`),
  CONSTRAINT `country_fk` FOREIGN KEY (`country`) REFERENCES `country` (`idcountry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Ontario',1),(2,'BC',1),(3,'NS',1);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singer`
--

DROP TABLE IF EXISTS `singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `singer` (
  `idsinger` int NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `gender` int NOT NULL,
  PRIMARY KEY (`idsinger`),
  KEY `gender_fk_idx_idx` (`gender`),
  CONSTRAINT `gender_fk_idx` FOREIGN KEY (`gender`) REFERENCES `gender` (`idgender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singer`
--

LOCK TABLES `singer` WRITE;
/*!40000 ALTER TABLE `singer` DISABLE KEYS */;
INSERT INTO `singer` VALUES (1,'qwerty','asdf',1),(2,'asdf','qwerty',2);
/*!40000 ALTER TABLE `singer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 21:29:12
