-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: fish
-- ------------------------------------------------------
-- Server version	5.5.41-0+wheezy1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ambient_temp` float(255,2) DEFAULT NULL,
  `aquarium_temp` float(255,2) DEFAULT NULL,
  `aquarium_ph` float(255,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time` (`timestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,'2015-02-19 10:00:01',29.85,29.49,NULL),(2,'2015-02-19 10:30:42',29.85,29.68,NULL),(3,'2015-02-19 11:00:02',29.92,29.82,NULL),(4,'2015-02-19 11:30:42',30.06,29.96,NULL),(5,'2015-02-19 12:00:41',29.99,29.97,NULL),(6,'2015-02-19 12:30:01',29.81,30.02,NULL),(7,'2015-02-19 13:00:42',29.93,30.16,NULL),(8,'2015-02-19 13:30:02',29.88,30.16,NULL),(9,'2015-02-19 14:00:42',29.94,30.22,NULL),(10,'2015-02-19 14:30:41',29.51,30.27,NULL),(11,'2015-02-19 15:00:01',29.48,30.24,NULL),(12,'2015-02-19 15:30:42',29.56,30.32,NULL),(13,'2015-02-19 16:00:01',29.61,30.34,NULL),(14,'2015-02-19 16:30:42',29.58,30.34,NULL),(15,'2015-02-19 17:00:02',29.58,30.34,NULL),(16,'2015-02-19 17:30:42',29.58,30.38,NULL),(17,'2015-02-19 18:00:41',29.52,30.36,NULL),(18,'2015-02-19 18:30:01',29.53,30.33,NULL),(19,'2015-02-19 19:00:42',29.51,30.34,NULL),(20,'2015-02-19 19:30:01',29.49,30.33,NULL),(21,'2015-02-19 20:00:42',29.55,30.35,NULL),(22,'2015-02-19 20:30:02',29.43,30.34,NULL),(23,'2015-02-19 21:00:42',29.37,30.39,NULL),(24,'2015-02-19 21:30:42',29.27,30.52,NULL),(25,'2015-02-19 22:00:01',29.20,30.56,NULL),(26,'2015-02-19 22:30:42',29.35,30.52,NULL),(27,'2015-02-19 23:00:02',29.23,30.59,NULL),(28,'2015-02-19 23:30:42',29.24,30.64,NULL),(29,'2015-02-20 00:00:42',29.32,30.71,NULL),(30,'2015-02-20 00:30:01',29.37,30.77,NULL),(31,'2015-02-20 01:00:42',29.42,30.81,NULL),(32,'2015-02-20 01:30:02',29.54,30.89,NULL),(33,'2015-02-20 02:00:42',29.82,30.98,NULL),(34,'2015-02-20 02:30:42',30.10,31.07,NULL),(35,'2015-02-20 03:00:01',30.14,31.37,NULL),(36,'2015-02-20 03:30:42',30.34,31.61,NULL),(37,'2015-02-20 04:00:02',30.44,31.67,NULL),(38,'2015-02-20 04:30:42',30.72,31.58,NULL),(39,'2015-02-20 05:00:41',30.87,31.66,NULL),(40,'2015-02-20 05:30:01',30.95,31.66,NULL),(41,'2015-02-20 06:00:42',31.04,31.65,NULL),(42,'2015-02-20 06:30:02',31.29,31.63,NULL),(43,'2015-02-20 07:00:42',31.46,31.07,NULL),(44,'2015-02-20 07:30:41',31.47,30.27,NULL),(45,'2015-02-20 08:00:01',31.25,30.27,NULL),(46,'2015-02-20 08:30:42',30.94,30.52,NULL),(47,'2015-02-20 09:00:02',31.08,30.21,NULL),(48,'2015-02-20 09:30:42',31.08,30.10,NULL),(49,'2015-02-20 10:00:41',30.90,29.88,NULL),(50,'2015-02-20 10:30:01',31.15,29.57,NULL),(51,'2015-02-20 11:00:42',30.92,29.34,NULL),(52,'2015-02-20 11:30:02',30.88,30.38,NULL),(53,'2015-02-20 12:00:42',30.89,29.91,NULL),(54,'2015-02-20 12:30:41',31.00,29.49,NULL),(55,'2015-02-20 13:00:01',30.69,29.09,NULL),(56,'2015-02-20 13:30:42',30.35,29.35,NULL),(57,'2015-02-20 14:00:02',30.28,29.73,NULL),(58,'2015-02-20 14:30:42',30.28,29.88,NULL),(59,'2015-02-20 15:00:41',30.22,29.94,NULL),(60,'2015-02-20 15:30:01',30.07,29.90,NULL),(61,'2015-02-20 16:00:42',29.84,29.89,NULL),(62,'2015-02-20 16:30:02',29.69,29.85,NULL),(63,'2015-02-20 17:00:42',29.65,29.82,NULL),(64,'2015-02-20 17:30:42',29.55,29.76,NULL),(65,'2015-02-20 18:00:01',29.49,29.70,NULL),(66,'2015-02-20 18:30:42',29.42,29.62,NULL),(67,'2015-02-20 19:00:02',29.43,29.63,NULL),(68,'2015-02-20 19:30:02',29.32,29.56,NULL),(69,'2015-02-20 20:00:01',29.26,29.50,NULL),(70,'2015-02-20 20:30:41',29.26,29.47,NULL),(71,'2015-02-20 21:00:01',29.17,29.41,NULL),(72,'2015-02-20 21:30:42',29.13,29.37,NULL),(73,'2015-02-20 22:00:02',29.10,29.38,NULL),(74,'2015-02-20 22:30:42',28.97,29.44,NULL),(75,'2015-02-20 23:00:41',28.78,29.55,NULL),(76,'2015-02-20 23:30:01',28.86,29.66,NULL),(77,'2015-02-21 00:00:41',28.96,29.77,NULL),(78,'2015-02-21 00:30:01',28.87,29.91,NULL),(79,'2015-02-21 01:00:42',28.81,30.07,NULL),(80,'2015-02-21 01:30:02',29.10,30.06,NULL),(81,'2015-02-21 02:00:42',29.36,30.24,NULL),(82,'2015-02-21 02:30:42',29.50,30.52,NULL),(83,'2015-02-21 03:00:01',29.80,30.67,NULL),(84,'2015-02-21 03:30:42',29.82,30.58,NULL),(85,'2015-02-21 04:00:02',30.04,30.46,NULL),(86,'2015-02-21 04:30:42',30.23,30.43,NULL),(87,'2015-02-21 05:00:41',30.24,30.44,NULL),(88,'2015-02-21 05:30:01',30.25,30.41,NULL),(89,'2015-02-21 06:00:42',30.43,30.63,NULL),(90,'2015-02-21 06:30:02',30.44,30.64,NULL),(91,'2015-02-21 07:00:42',30.62,30.85,NULL),(92,'2015-02-21 07:30:41',30.77,31.01,NULL),(93,'2015-02-21 08:00:01',30.90,31.13,NULL),(94,'2015-02-21 08:30:02',30.76,30.85,NULL),(95,'2015-02-21 09:00:42',31.04,30.69,NULL),(96,'2015-02-21 09:30:42',30.99,30.60,NULL),(97,'2015-02-21 10:00:01',31.00,30.57,NULL),(98,'2015-02-21 10:30:42',31.00,30.54,NULL),(99,'2015-02-21 11:00:02',31.21,30.49,NULL),(100,'2015-02-21 11:30:42',31.10,30.49,NULL),(101,'2015-02-21 12:00:41',30.96,30.49,NULL),(102,'2015-02-21 12:30:01',30.99,30.45,NULL),(103,'2015-02-21 13:00:42',30.87,30.48,NULL),(104,'2015-02-21 13:30:02',30.83,30.44,NULL),(105,'2015-02-21 14:00:42',30.81,30.45,NULL),(106,'2015-02-21 14:30:41',30.75,30.44,NULL),(107,'2015-02-21 15:00:01',30.68,30.37,NULL),(108,'2015-02-21 15:30:41',30.53,30.36,NULL),(109,'2015-02-21 16:00:01',30.43,30.34,NULL),(110,'2015-02-21 16:30:42',30.28,30.48,NULL),(111,'2015-02-21 17:00:01',30.01,30.13,NULL),(112,'2015-02-21 17:30:42',29.96,30.05,NULL),(113,'2015-02-21 18:00:02',29.83,29.96,NULL),(114,'2015-02-21 18:30:42',29.82,29.98,NULL),(115,'2015-02-21 19:00:41',29.85,30.05,NULL),(116,'2015-02-21 19:30:02',29.86,30.10,NULL),(117,'2015-02-21 20:00:01',29.82,30.17,NULL),(118,'2015-02-21 20:30:41',29.66,30.20,NULL),(119,'2015-02-21 21:00:01',29.47,30.23,NULL),(120,'2015-02-21 21:30:42',29.52,30.32,NULL),(121,'2015-02-21 22:00:02',29.54,30.34,NULL),(122,'2015-02-21 22:30:42',29.55,30.39,NULL),(123,'2015-02-21 23:00:41',29.60,30.47,NULL),(124,'2015-02-21 23:30:01',29.61,30.52,NULL),(125,'2015-02-22 00:00:42',29.45,30.66,NULL),(126,'2015-02-22 00:30:02',29.27,30.62,NULL),(127,'2015-02-22 01:00:42',29.46,30.85,NULL),(128,'2015-02-22 01:30:41',29.70,31.09,NULL),(129,'2015-02-22 02:00:01',29.96,31.34,NULL),(130,'2015-02-22 02:30:42',30.15,31.52,NULL),(131,'2015-02-22 03:00:01',30.45,31.87,NULL),(132,'2015-02-22 03:30:42',30.70,32.23,NULL),(133,'2015-02-22 04:00:02',30.82,32.79,NULL),(134,'2015-02-22 04:30:42',31.27,32.76,NULL),(135,'2015-02-22 05:00:41',31.30,32.64,NULL),(136,'2015-02-22 05:30:01',31.67,32.50,NULL),(137,'2015-02-22 06:00:42',31.56,32.23,NULL),(138,'2015-02-22 06:30:02',31.88,32.12,NULL),(139,'2015-02-22 07:00:42',31.92,32.12,NULL),(140,'2015-02-22 07:30:02',31.92,32.12,NULL),(141,'2015-02-22 08:00:42',32.00,32.16,NULL),(142,'2015-02-22 08:30:42',32.27,32.21,NULL),(143,'2015-02-22 09:00:01',32.39,32.26,NULL),(144,'2015-02-22 09:30:42',32.46,32.25,NULL),(145,'2015-02-22 10:00:02',32.56,32.20,NULL),(146,'2015-02-22 10:30:42',32.54,32.15,NULL),(147,'2015-02-22 11:00:41',32.72,32.33,NULL),(148,'2015-02-22 11:30:01',32.74,32.42,NULL),(149,'2015-02-22 12:00:42',32.69,32.34,NULL),(150,'2015-02-22 12:30:02',32.45,32.06,NULL),(151,'2015-02-22 13:00:42',32.25,31.86,NULL),(152,'2015-02-22 13:30:02',32.13,31.74,NULL),(153,'2015-02-22 14:00:42',31.99,31.60,NULL),(154,'2015-02-22 14:30:42',31.85,31.46,NULL),(155,'2015-02-22 15:00:01',31.72,31.33,NULL),(156,'2015-02-22 15:30:42',31.57,31.18,NULL),(157,'2015-02-22 16:00:02',31.42,31.03,NULL),(158,'2015-02-22 16:30:42',31.33,30.94,NULL),(159,'2015-02-22 17:00:41',31.18,30.79,NULL),(160,'2015-02-22 17:30:01',31.05,30.66,NULL),(161,'2015-02-22 18:00:42',31.00,30.61,NULL),(162,'2015-02-22 18:30:01',30.90,30.51,NULL),(163,'2015-02-22 19:00:42',30.74,30.35,NULL),(164,'2015-02-22 19:30:02',30.62,30.08,NULL),(165,'2015-02-22 20:00:42',30.58,30.27,NULL),(166,'2015-02-22 20:30:41',30.29,30.45,NULL),(167,'2015-02-22 21:00:01',30.25,30.41,NULL),(168,'2015-02-22 21:30:42',30.13,30.88,NULL),(169,'2015-02-22 22:00:02',30.41,31.23,NULL),(170,'2015-02-22 22:30:42',30.07,31.30,NULL),(171,'2015-02-22 23:00:41',30.11,31.45,NULL),(172,'2015-02-22 23:30:01',30.08,31.46,NULL),(173,'2015-02-23 00:00:42',30.08,31.46,NULL),(174,'2015-02-23 00:30:02',30.15,31.53,NULL),(175,'2015-02-23 01:00:42',30.14,31.52,NULL),(176,'2015-02-23 01:30:02',30.36,31.48,NULL),(177,'2015-02-23 02:00:42',30.55,31.41,NULL),(178,'2015-02-23 02:30:42',30.53,31.32,NULL),(179,'2015-02-23 03:00:01',30.52,31.23,NULL),(180,'2015-02-23 03:30:42',30.78,31.16,NULL),(181,'2015-02-23 04:00:02',30.89,31.12,NULL),(182,'2015-02-23 04:30:42',30.93,31.13,NULL),(183,'2015-02-23 05:00:41',30.89,31.09,NULL),(184,'2015-02-23 05:30:01',30.87,31.07,NULL),(185,'2015-02-23 06:00:42',30.95,31.11,NULL),(186,'2015-02-23 06:30:01',30.93,31.02,NULL),(187,'2015-02-23 07:00:42',31.32,31.04,NULL),(188,'2015-02-23 07:30:02',31.04,30.46,NULL),(189,'2015-02-23 08:00:42',31.05,30.51,NULL),(190,'2015-02-23 08:30:41',31.04,30.69,NULL),(191,'2015-02-23 09:00:01',31.15,30.87,NULL),(193,'2015-02-23 10:02:29',31.13,30.89,NULL),(194,'2015-02-23 10:01:30',31.08,30.98,6.62),(195,'2015-02-23 10:30:01',31.16,30.80,6.65),(196,'2015-02-23 11:00:02',31.24,30.88,6.67),(197,'2015-02-23 11:30:42',31.24,31.00,6.69),(198,'2015-02-23 12:00:41',30.90,30.88,6.65),(199,'2015-02-23 12:30:01',30.90,30.51,6.65),(200,'2015-02-23 13:00:42',30.62,30.16,6.11),(201,'2015-02-23 13:30:01',30.60,29.95,6.70),(202,'2015-02-23 14:00:42',30.36,29.82,6.67),(203,'2015-02-23 14:30:02',30.26,29.72,6.68),(204,'2015-02-23 15:00:42',30.03,29.59,6.68),(205,'2015-02-23 15:30:02',29.97,29.49,6.68),(206,'2015-02-23 16:00:42',29.84,29.40,6.74),(207,'2015-02-23 16:30:42',29.63,29.23,6.75),(208,'2015-02-23 17:00:01',29.55,29.15,6.77),(209,'2015-02-23 17:30:42',29.44,29.04,6.82),(210,'2015-02-23 18:00:01',29.33,28.93,6.82),(211,'2015-02-23 18:30:42',29.19,28.80,6.79),(212,'2015-02-23 19:00:01',29.10,28.71,6.79),(213,'2015-02-23 19:30:42',29.04,28.65,6.75),(214,'2015-02-23 20:00:02',28.96,28.57,6.77),(215,'2015-02-23 20:30:42',28.80,29.00,6.77),(216,'2015-02-23 21:00:41',28.58,29.38,6.77),(217,'2015-02-23 21:30:01',28.49,29.25,6.77),(218,'2015-02-23 22:00:42',28.52,29.32,6.79),(219,'2015-02-23 22:30:01',28.49,29.29,6.79),(220,'2015-02-23 23:00:42',28.50,29.30,6.77),(221,'2015-02-23 23:30:02',28.51,29.30,6.77),(222,'2015-02-24 00:00:42',28.48,29.31,6.77),(223,'2015-02-24 00:30:02',28.53,29.33,6.74),(224,'2015-02-24 01:00:42',28.51,29.30,6.72),(225,'2015-02-24 01:30:02',28.42,29.21,6.72),(226,'2015-02-24 02:00:42',28.65,29.27,6.72),(227,'2015-02-24 02:30:41',28.72,29.37,6.75),(228,'2015-02-24 03:00:01',28.82,29.44,6.72),(229,'2015-02-24 03:30:42',29.04,29.55,6.72),(230,'2015-02-24 04:00:01',29.09,29.56,6.70),(231,'2015-02-24 04:30:42',29.31,29.52,6.70),(232,'2015-02-24 05:00:01',29.34,29.54,6.70),(233,'2015-02-24 05:30:42',29.34,29.55,6.65),(234,'2015-02-24 06:00:01',29.33,29.53,6.65),(235,'2015-02-24 06:30:42',29.31,29.52,6.53),(236,'2015-02-24 07:00:02',29.42,29.51,6.65),(237,'2015-02-24 07:30:42',29.44,29.49,6.65),(238,'2015-02-24 08:00:41',29.77,29.41,6.65),(239,'2015-02-24 08:30:01',29.49,29.09,6.65),(240,'2015-02-24 09:00:42',29.49,29.09,6.63),(241,'2015-02-24 09:30:01',29.48,29.05,6.63),(242,'2015-02-24 10:00:42',29.61,29.21,6.68),(243,'2015-02-24 10:30:02',29.71,29.31,6.65),(244,'2015-02-24 11:00:42',29.74,29.34,6.60),(245,'2015-02-24 11:30:02',29.49,29.09,6.68),(246,'2015-02-24 12:00:42',29.41,29.01,6.70),(247,'2015-02-24 12:30:41',29.44,29.04,6.70),(248,'2015-02-24 13:00:01',29.16,29.18,6.70),(249,'2015-02-24 13:30:42',29.01,29.22,6.74),(250,'2015-02-24 14:00:01',28.89,29.09,6.72),(251,'2015-02-24 14:30:42',28.70,28.86,6.72),(252,'2015-02-24 15:00:01',28.67,28.72,6.74),(253,'2015-02-24 15:30:42',28.65,28.59,6.74),(254,'2015-02-24 16:00:02',28.62,28.49,6.75),(255,'2015-02-24 16:30:42',28.43,28.38,6.74),(256,'2015-02-24 17:00:02',28.21,28.27,6.77),(257,'2015-02-24 17:30:42',28.09,28.21,6.75),(258,'2015-02-24 18:00:41',27.94,28.07,6.77),(259,'2015-02-24 18:30:01',27.92,28.01,6.77),(260,'2015-02-24 19:00:42',27.73,27.93,6.77),(261,'2015-02-24 19:30:01',27.65,27.85,6.79),(262,'2015-02-24 20:00:42',27.65,27.85,6.79),(263,'2015-02-24 20:30:02',27.75,27.95,6.79);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-25  7:50:22