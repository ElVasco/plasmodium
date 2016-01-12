CREATE DATABASE  IF NOT EXISTS `plasmodium` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `plasmodium`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: plasmodium
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `case_of_patient`
--

DROP TABLE IF EXISTS `case_of_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_of_patient` (
  `id` int(11) NOT NULL,
  `id_patient` int(11) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `diagnostic_date` date DEFAULT NULL,
  `id_plasmodium` int(11) DEFAULT NULL,
  `classification` varchar(45) DEFAULT NULL,
  `sample` varchar(45) DEFAULT NULL,
  `id_user_register` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk` (`id`),
  KEY `fk_case_of_patient_patient_data_idx` (`id_patient`),
  KEY `fk_case_of_patient_user_idx` (`id_user_register`),
  KEY `fk_case_of_patient_plasmodioum_type_idx` (`id_plasmodium`),
  CONSTRAINT `fk_case_of_patient_patient_data` FOREIGN KEY (`id_patient`) REFERENCES `patient_data` (`id_patient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_of_patient_plasmodioum_type` FOREIGN KEY (`id_plasmodium`) REFERENCES `plasmodium_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_of_patient_user` FOREIGN KEY (`id_user_register`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_of_patient`
--

LOCK TABLES `case_of_patient` WRITE;
/*!40000 ALTER TABLE `case_of_patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_of_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_origin`
--

DROP TABLE IF EXISTS `case_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_origin` (
  `id` int(11) NOT NULL,
  `origin_type` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_origin`
--

LOCK TABLES `case_origin` WRITE;
/*!40000 ALTER TABLE `case_origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demarcaciones`
--

DROP TABLE IF EXISTS `demarcaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demarcaciones` (
  `id` int(11) NOT NULL,
  `demarcacion` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demarcaciones`
--

LOCK TABLES `demarcaciones` WRITE;
/*!40000 ALTER TABLE `demarcaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `demarcaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_time`
--

DROP TABLE IF EXISTS `dim_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_time` (
  `id_time` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_time`
--

LOCK TABLES `dim_time` WRITE;
/*!40000 ALTER TABLE `dim_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `id_institution` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `id_location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_institution`),
  KEY `pk` (`id_institution`),
  KEY `fk_institution_location_gps_idx` (`id_location`),
  CONSTRAINT `fk_institution_location_gps` FOREIGN KEY (`id_location`) REFERENCES `location_gps` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_gps`
--

DROP TABLE IF EXISTS `location_gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_gps` (
  `id_location` int(11) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `municipality` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `demarcation` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_gps`
--

LOCK TABLES `location_gps` WRITE;
/*!40000 ALTER TABLE `location_gps` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_data`
--

DROP TABLE IF EXISTS `patient_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_data` (
  `id_patient` int(11) NOT NULL,
  `name_lastname` varchar(45) DEFAULT NULL,
  `identified` varchar(45) DEFAULT NULL,
  `responsible_name_lastname` varchar(45) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `id_location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_data`
--

LOCK TABLES `patient_data` WRITE;
/*!40000 ALTER TABLE `patient_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plasmodium_fact`
--

DROP TABLE IF EXISTS `plasmodium_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plasmodium_fact` (
  `id_date` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  `id_origin` int(11) NOT NULL,
  `id_plasmodium_type` int(11) NOT NULL,
  `id_demarcacion` int(11) NOT NULL,
  `total_case` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_date`,`id_location`,`id_origin`,`id_plasmodium_type`,`id_demarcacion`),
  KEY `pk` (`id_date`,`id_location`,`id_origin`,`id_plasmodium_type`,`id_demarcacion`),
  KEY `fk_plasmodium_fact_case_origin_idx` (`id_origin`),
  KEY `fk_plasmodium_fact_location_gps_idx` (`id_location`),
  KEY `fk_plasmodium_fact_demarcacion_idx` (`id_demarcacion`),
  KEY `fk_plasmodium_fact_plasmodium_type_idx` (`id_plasmodium_type`),
  CONSTRAINT `fk_plasmodium_fact_case_origin` FOREIGN KEY (`id_origin`) REFERENCES `case_origin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_plasmodium_fact_demarcacion` FOREIGN KEY (`id_demarcacion`) REFERENCES `demarcaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_plasmodium_fact_dim_time` FOREIGN KEY (`id_date`) REFERENCES `dim_time` (`id_time`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_plasmodium_fact_location_gps` FOREIGN KEY (`id_location`) REFERENCES `location_gps` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_plasmodium_fact_plasmodium_type` FOREIGN KEY (`id_plasmodium_type`) REFERENCES `plasmodium_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plasmodium_fact`
--

LOCK TABLES `plasmodium_fact` WRITE;
/*!40000 ALTER TABLE `plasmodium_fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `plasmodium_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plasmodium_type`
--

DROP TABLE IF EXISTS `plasmodium_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plasmodium_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plasmodium_type`
--

LOCK TABLES `plasmodium_type` WRITE;
/*!40000 ALTER TABLE `plasmodium_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `plasmodium_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_level`
--

DROP TABLE IF EXISTS `sec_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_level` (
  `level` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`level`),
  KEY `pk` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_level`
--

LOCK TABLES `sec_level` WRITE;
/*!40000 ALTER TABLE `sec_level` DISABLE KEYS */;
INSERT INTO `sec_level` VALUES (1,'administrador'),(99,'root');
/*!40000 ALTER TABLE `sec_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_level_profile`
--

DROP TABLE IF EXISTS `sec_level_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_level_profile` (
  `level` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  KEY `fk_sec_level_profile_level_idx` (`level`),
  KEY `fk_sec_level_profile_profile_idx` (`profile`),
  CONSTRAINT `fk_sec_level_profile_level` FOREIGN KEY (`level`) REFERENCES `sec_level` (`level`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sec_level_profile_profile` FOREIGN KEY (`profile`) REFERENCES `sec_profile` (`profile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_level_profile`
--

LOCK TABLES `sec_level_profile` WRITE;
/*!40000 ALTER TABLE `sec_level_profile` DISABLE KEYS */;
INSERT INTO `sec_level_profile` VALUES (99,1);
/*!40000 ALTER TABLE `sec_level_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_profile`
--

DROP TABLE IF EXISTS `sec_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_profile` (
  `profile` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profile`),
  KEY `pk` (`profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_profile`
--

LOCK TABLES `sec_profile` WRITE;
/*!40000 ALTER TABLE `sec_profile` DISABLE KEYS */;
INSERT INTO `sec_profile` VALUES (1,'basico');
/*!40000 ALTER TABLE `sec_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_profile_rol`
--

DROP TABLE IF EXISTS `sec_profile_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_profile_rol` (
  `profile` int(11) NOT NULL,
  `rol` int(11) NOT NULL,
  KEY `fk_profile_rol_profile_idx` (`profile`),
  KEY `fk_profile_rol_rol_idx` (`rol`),
  CONSTRAINT `fk_profile_rol_sec_profile` FOREIGN KEY (`profile`) REFERENCES `sec_profile` (`profile`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_rol_sec_rol` FOREIGN KEY (`rol`) REFERENCES `sec_rol` (`rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_profile_rol`
--

LOCK TABLES `sec_profile_rol` WRITE;
/*!40000 ALTER TABLE `sec_profile_rol` DISABLE KEYS */;
INSERT INTO `sec_profile_rol` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `sec_profile_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_rol`
--

DROP TABLE IF EXISTS `sec_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_rol` (
  `rol` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `rol_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rol`),
  KEY `pk` (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_rol`
--

LOCK TABLES `sec_rol` WRITE;
/*!40000 ALTER TABLE `sec_rol` DISABLE KEYS */;
INSERT INTO `sec_rol` VALUES (1,'login','LOGIN'),(2,'logout','LOGOUT'),(3,'menu inicial','MAIN_MENU');
/*!40000 ALTER TABLE `sec_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `second_name` varchar(45) DEFAULT NULL,
  `fist_last_name` varchar(45) DEFAULT NULL,
  `second_last_name` varchar(45) DEFAULT NULL,
  `num_ident` varchar(45) DEFAULT NULL,
  `phone_1` varchar(45) DEFAULT NULL,
  `phone_2` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `active` binary(1) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `pk` (`id_user`),
  KEY `fk_user_sec_level_idx` (`id_level`),
  CONSTRAINT `fk_user_sec_level` FOREIGN KEY (`id_level`) REFERENCES `sec_level` (`level`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'txomin',NULL,'Gutierrez','Rivoal','v15164921','04165279893',NULL,'txomin.gutierrez@gmail.com',99,'root','2015-12-15','1','txo','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_institution`
--

DROP TABLE IF EXISTS `user_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_institution` (
  `user` int(11) DEFAULT NULL,
  `institution` int(11) DEFAULT NULL,
  KEY `fk_user_institution_idx` (`user`),
  KEY `fk_user_institution_institution_idx` (`institution`),
  CONSTRAINT `fk_user_institution_institution` FOREIGN KEY (`institution`) REFERENCES `institution` (`id_institution`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_institution_user` FOREIGN KEY (`user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_institution`
--

LOCK TABLES `user_institution` WRITE;
/*!40000 ALTER TABLE `user_institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'plasmodium'
--

--
-- Dumping routines for database 'plasmodium'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-11 21:01:50
