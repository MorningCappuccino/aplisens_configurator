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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-12 15:00:06
