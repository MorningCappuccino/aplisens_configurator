-- MySQL dump 10.16  Distrib 10.1.8-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: rainbow
-- ------------------------------------------------------
-- Server version	10.1.8-MariaDB

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
-- Current Database: `rainbow`
--

/*!40000 DROP DATABASE IF EXISTS `rainbow`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

--
-- Table structure for table `accuracy`
--

DROP TABLE IF EXISTS `accuracy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accuracy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accuracy`
--

LOCK TABLES `accuracy` WRITE;
/*!40000 ALTER TABLE `accuracy` DISABLE KEYS */;
INSERT INTO `accuracy` VALUES (1,0.075),(2,0.200),(3,0.250),(4,0.100),(5,0.300),(6,0.400),(7,0.500),(8,0.800),(9,1.000);
/*!40000 ALTER TABLE `accuracy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_type`
--

DROP TABLE IF EXISTS `body_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_name` varchar(45) NOT NULL,
  `descr` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Исполнение корпуса';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_type`
--

LOCK TABLES `body_type` WRITE;
/*!40000 ALTER TABLE `body_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `body_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_code`
--

DROP TABLE IF EXISTS `country_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_code`
--

LOCK TABLES `country_code` WRITE;
/*!40000 ALTER TABLE `country_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_mode`
--

DROP TABLE IF EXISTS `equipment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_mode` (
  `eq_mode_id` int(11) NOT NULL AUTO_INCREMENT,
  `eq_mode_name` varchar(45) NOT NULL,
  `eq_type_id` int(11) NOT NULL,
  `descr` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`eq_mode_id`),
  KEY `fk_equipment_mode_equipment_type_idx` (`eq_type_id`),
  CONSTRAINT `fk_equipment_mode_equipment_type` FOREIGN KEY (`eq_type_id`) REFERENCES `equipment_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Модификация обородувания';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_mode`
--

LOCK TABLES `equipment_mode` WRITE;
/*!40000 ALTER TABLE `equipment_mode` DISABLE KEYS */;
INSERT INTO `equipment_mode` VALUES (1,'APC-2000 (AL)',1,NULL),(2,'APC-2000',1,NULL),(3,'PC-28',1,NULL);
/*!40000 ALTER TABLE `equipment_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_type`
--

DROP TABLE IF EXISTS `equipment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eq_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Тип оборудования';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_type`
--

LOCK TABLES `equipment_type` WRITE;
/*!40000 ALTER TABLE `equipment_type` DISABLE KEYS */;
INSERT INTO `equipment_type` VALUES (1,'Преобразователи давления измерительные'),(2,'Преобразователи температуры'),(3,'Измерители-регуляторы');
/*!40000 ALTER TABLE `equipment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_accuracy_measurement_range`
--

DROP TABLE IF EXISTS `link_accuracy_measurement_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_accuracy_measurement_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_accuracy_id` int(11) NOT NULL,
  `fk_measurement_range_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_link_accuracy_measurement_range_accuracy1_idx` (`fk_accuracy_id`),
  KEY `fk_link_accuracy_measurement_range_measurement_range1_idx` (`fk_measurement_range_id`),
  CONSTRAINT `fk_link_accuracy_measurement_range_accuracy1` FOREIGN KEY (`fk_accuracy_id`) REFERENCES `accuracy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_link_accuracy_measurement_range_measurement_range1` FOREIGN KEY (`fk_measurement_range_id`) REFERENCES `measurement_range` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_accuracy_measurement_range`
--

LOCK TABLES `link_accuracy_measurement_range` WRITE;
/*!40000 ALTER TABLE `link_accuracy_measurement_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_accuracy_measurement_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_eq_mode_accuracy`
--

DROP TABLE IF EXISTS `link_eq_mode_accuracy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_eq_mode_accuracy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_eq_mode_id` int(11) NOT NULL,
  `fk_accuracy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`fk_eq_mode_id`,`fk_accuracy_id`),
  KEY `fk_link_eq_mode_accuracy_equipment_mode1_idx` (`fk_eq_mode_id`),
  KEY `fk_link_eq_mode_accuracy_accuracy1_idx` (`fk_accuracy_id`),
  CONSTRAINT `fk_link_eq_mode_accuracy_accuracy1` FOREIGN KEY (`fk_accuracy_id`) REFERENCES `accuracy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_link_eq_mode_accuracy_equipment_mode1` FOREIGN KEY (`fk_eq_mode_id`) REFERENCES `equipment_mode` (`eq_mode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_eq_mode_accuracy`
--

LOCK TABLES `link_eq_mode_accuracy` WRITE;
/*!40000 ALTER TABLE `link_eq_mode_accuracy` DISABLE KEYS */;
INSERT INTO `link_eq_mode_accuracy` VALUES (1,1,1),(2,1,3),(3,1,4),(4,2,3),(5,2,4),(6,3,2),(7,3,3);
/*!40000 ALTER TABLE `link_eq_mode_accuracy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_eq_mode_body_type`
--

DROP TABLE IF EXISTS `link_eq_mode_body_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_eq_mode_body_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_eq_mode_id` int(11) NOT NULL,
  `fk_body_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_link_eq_mode_body_type_equipment_mode1_idx` (`fk_eq_mode_id`),
  KEY `fk_link_eq_mode_body_type_body_type1_idx` (`fk_body_type_id`),
  CONSTRAINT `fk_link_eq_mode_body_type_body_type1` FOREIGN KEY (`fk_body_type_id`) REFERENCES `body_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_link_eq_mode_body_type_equipment_mode1` FOREIGN KEY (`fk_eq_mode_id`) REFERENCES `equipment_mode` (`eq_mode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_eq_mode_body_type`
--

LOCK TABLES `link_eq_mode_body_type` WRITE;
/*!40000 ALTER TABLE `link_eq_mode_body_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_eq_mode_body_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_eq_mode_measurement_range`
--

DROP TABLE IF EXISTS `link_eq_mode_measurement_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_eq_mode_measurement_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_eq_mode_id` int(11) NOT NULL,
  `fk_measurement_range_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_link_eq_mode_measurement_range_equipment_mode1_idx` (`fk_eq_mode_id`),
  KEY `fk_link_eq_mode_measurement_range_measurement_range1_idx` (`fk_measurement_range_id`),
  CONSTRAINT `fk_link_eq_mode_measurement_range_equipment_mode1` FOREIGN KEY (`fk_eq_mode_id`) REFERENCES `equipment_mode` (`eq_mode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_link_eq_mode_measurement_range_measurement_range1` FOREIGN KEY (`fk_measurement_range_id`) REFERENCES `measurement_range` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_eq_mode_measurement_range`
--

LOCK TABLES `link_eq_mode_measurement_range` WRITE;
/*!40000 ALTER TABLE `link_eq_mode_measurement_range` DISABLE KEYS */;
INSERT INTO `link_eq_mode_measurement_range` VALUES (1,3,1),(2,3,2),(3,3,3),(4,3,4),(5,3,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,3,16),(17,3,17),(18,3,18),(19,3,19),(20,3,20),(21,1,8),(22,1,12);
/*!40000 ALTER TABLE `link_eq_mode_measurement_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_eq_mode_process_connection`
--

DROP TABLE IF EXISTS `link_eq_mode_process_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_eq_mode_process_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_eq_mode_id` int(11) NOT NULL,
  `fk_process_connection` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_link_eq_mode_process_connection_equipment_mode1_idx` (`fk_eq_mode_id`),
  KEY `fk_link_eq_mode_process_connection_process_connection1_idx` (`fk_process_connection`),
  CONSTRAINT `fk_link_eq_mode_process_connection_equipment_mode1` FOREIGN KEY (`fk_eq_mode_id`) REFERENCES `equipment_mode` (`eq_mode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_link_eq_mode_process_connection_process_connection1` FOREIGN KEY (`fk_process_connection`) REFERENCES `process_connection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_eq_mode_process_connection`
--

LOCK TABLES `link_eq_mode_process_connection` WRITE;
/*!40000 ALTER TABLE `link_eq_mode_process_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_eq_mode_process_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_eq_mode_special_version`
--

DROP TABLE IF EXISTS `link_eq_mode_special_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_eq_mode_special_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_eq_mode_id` int(11) NOT NULL,
  `fk_special_version_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`fk_eq_mode_id`,`fk_special_version_id`),
  KEY `fk_link_eq_mode_special_vesion_equipment_mode1_idx` (`fk_eq_mode_id`),
  KEY `fk_link_eq_mode_special_vesion_special_version1_idx` (`fk_special_version_id`),
  CONSTRAINT `fk_link_eq_mode_special_vesion_equipment_mode1` FOREIGN KEY (`fk_eq_mode_id`) REFERENCES `equipment_mode` (`eq_mode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_link_eq_mode_special_vesion_special_version1` FOREIGN KEY (`fk_special_version_id`) REFERENCES `special_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_eq_mode_special_version`
--

LOCK TABLES `link_eq_mode_special_version` WRITE;
/*!40000 ALTER TABLE `link_eq_mode_special_version` DISABLE KEYS */;
INSERT INTO `link_eq_mode_special_version` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,2,1),(15,2,3),(16,2,4),(17,2,6),(18,2,7),(19,2,9),(20,2,10),(21,2,11),(22,2,12),(23,3,1),(24,3,3),(25,3,4);
/*!40000 ALTER TABLE `link_eq_mode_special_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement_range`
--

DROP TABLE IF EXISTS `measurement_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range` varchar(45) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_measurement_range_units1_idx` (`unit_id`),
  CONSTRAINT `fk_measurement_range_units1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Диапазоные измерения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement_range`
--

LOCK TABLES `measurement_range` WRITE;
/*!40000 ALTER TABLE `measurement_range` DISABLE KEYS */;
INSERT INTO `measurement_range` VALUES (1,'0 - 1,0',2),(2,'0 - 1,6',2),(3,'0 - 2,5',2),(4,'0  - 4,0',2),(5,'0 - 6,0',2),(6,'0 - 10,0',2),(7,'0 - 40',2),(8,'0 - 100',2),(9,'0 - 250',2),(10,'0 - 600',2),(11,'0 - 1,0',3),(12,'0 - 1,6',3),(13,'0 - 2,5',3),(14,'0 - 4,0',3),(15,'0 - 6,0',3),(16,'0 - 10,0',3),(17,'0 - 16',3),(18,'0 - 25',3),(19,'0 - 40',3),(20,'0 - 60',3);
/*!40000 ALTER TABLE `measurement_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mounting_part`
--

DROP TABLE IF EXISTS `mounting_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mounting_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mounting_part_name` varchar(45) NOT NULL,
  `descr` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mounting_part`
--

LOCK TABLES `mounting_part` WRITE;
/*!40000 ALTER TABLE `mounting_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `mounting_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_connection`
--

DROP TABLE IF EXISTS `process_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_connection_name` varchar(45) NOT NULL,
  `descr` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Тип штуцера или разделителя сред';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_connection`
--

LOCK TABLES `process_connection` WRITE;
/*!40000 ALTER TABLE `process_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pulse_pipe`
--

DROP TABLE IF EXISTS `pulse_pipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pulse_pipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `length` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Импульсные трубки (тип штуцера или разделителя сред)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pulse_pipe`
--

LOCK TABLES `pulse_pipe` WRITE;
/*!40000 ALTER TABLE `pulse_pipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `pulse_pipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_version`
--

DROP TABLE IF EXISTS `special_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_version_name` varchar(45) NOT NULL,
  `descr` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Спец. исполнение';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_version`
--

LOCK TABLES `special_version` WRITE;
/*!40000 ALTER TABLE `special_version` DISABLE KEYS */;
INSERT INTO `special_version` VALUES (1,'Ex',NULL),(2,'Exd',NULL),(3,'Кислород',NULL),(4,'Hastelloy',NULL),(5,'SN',NULL),(6,'HS',NULL),(7,'H',NULL),(8,'IP67',NULL),(9,'(-40)',NULL),(10,'Q',NULL),(11,'Au',NULL),(12,'TS',NULL),(13,'W',NULL);
/*!40000 ALTER TABLE `special_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Единицы измерения диапазонов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'Па'),(2,'кПа'),(3,'МПа');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-13 11:05:45
