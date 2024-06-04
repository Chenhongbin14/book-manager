-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  `category_id` int NOT NULL,
  `publish_time` date NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `publish_name` varchar(200) NOT NULL,
  `self_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_categor` (`category_id`),
  CONSTRAINT `fk_book_categor` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'机械制图',3,'2019-09-09',39.90,'机械工业出版社','2024-04-26 16:29:42'),(2,'武器大全',2,'2018-09-09',40.90,'清华大学出版社','2024-04-26 16:29:42'),(3,'财务管理01',1,'2017-10-09',79.90,'北京大学出版社','2024-04-26 16:29:42'),(4,'财务管理02',1,'2009-10-09',79.90,'北京大学出版社','2024-04-26 16:29:42'),(5,'财务管理03',1,'2014-10-09',79.90,'北京大学出版社','2024-04-26 16:29:42'),(6,'财务管理04',1,'2017-10-09',79.90,'北京大学出版社','2024-04-26 16:29:42'),(7,'财务管理05',1,'2009-10-09',79.90,'北京大学出版社','2024-04-26 16:29:42'),(8,'财务管理06',1,'2014-10-09',79.90,'北京大学出版社','2024-04-26 16:29:42'),(9,'模具设计01',3,'2015-09-09',39.90,'机械工业出版社','2024-04-26 16:29:42'),(10,'模具设计02',3,'2018-09-09',40.90,'清华大学出版社','2024-04-26 16:29:42'),(11,'模具设计03',3,'2016-10-09',79.90,'北京大学出版社','2024-04-26 16:29:42'),(18,'计算机英语',2,'2024-04-03',666.00,'新华出版社','2024-04-29 08:00:00');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (1,'经济'),(2,'军事'),(3,'工业');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 23:26:00
