-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'admins'),(3,'faculty'),(4,'guardians'),(1,'students');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `e_attendance_campus_attendance`
--

LOCK TABLES `e_attendance_campus_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_campus_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_campus_attendance` VALUES (9,'07:42:01.000000',NULL,'2023-01-14',24),(10,'08:03:35.120082','08:04:08.119597','2023-01-14',4),(11,'08:08:39.809110',NULL,'2023-01-14',11),(12,'08:12:19.722530',NULL,'2023-01-14',12),(13,'08:13:56.968641',NULL,'2023-01-14',8),(14,'08:25:02.762854',NULL,'2023-01-14',26),(15,'08:37:30.000000','10:00:00.000000','2023-01-17',27),(16,'08:40:22.000000','09:00:00.000000','2023-01-16',27),(17,'08:42:29.000000','10:30:00.000000','2023-01-18',27),(18,'08:44:36.000000','11:00:00.000000','2023-01-19',27),(19,'08:46:43.000000','12:00:00.000000','2023-01-20',27),(24,'23:27:30.351422','23:27:57.093217','2023-01-22',2),(25,'23:28:17.535091','23:37:16.592431','2023-01-22',2),(29,'23:37:59.816248','23:38:17.338502','2023-01-22',2),(30,'23:38:30.488101','23:38:43.717462','2023-01-22',2),(31,'18:33:56.282560','18:34:01.374176','2023-01-23',2),(32,'18:34:09.088468','18:34:13.601860','2023-01-23',2),(33,'09:15:05.163439','10:58:07.502753','2023-01-24',2),(34,'10:58:19.121172','10:58:29.324643','2023-01-24',2),(35,'11:09:30.122437','14:11:17.138224','2023-01-24',2),(36,'14:16:37.969043','14:19:25.188784','2023-01-24',2),(37,'21:46:58.762996','21:47:05.230795','2023-01-24',2),(38,'21:47:54.134038',NULL,'2023-01-24',2);
/*!40000 ALTER TABLE `e_attendance_campus_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class`
--

LOCK TABLES `e_attendance_class` WRITE;
/*!40000 ALTER TABLE `e_attendance_class` DISABLE KEYS */;
INSERT INTO `e_attendance_class` VALUES (17,4,1,2022,2,1,7,NULL,2,24),(20,4,1,2022,1,1,7,NULL,1,24),(21,4,1,2023,1,1,7,NULL,10,20),(22,11,2,2023,1,NULL,7,6,10,21),(23,12,3,2023,1,2,5,7,2,18),(24,4,1,2023,1,1,30,NULL,12,24),(25,4,1,2023,1,1,28,NULL,11,24),(26,4,1,2023,1,1,30,NULL,13,24),(27,4,1,2023,1,1,30,NULL,11,24),(28,4,1,2023,1,1,44,NULL,10,24);
/*!40000 ALTER TABLE `e_attendance_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class_attendance`
--

LOCK TABLES `e_attendance_class_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_class_attendance` VALUES (5,'22:08:39.700080','22:10:43.777699','Late',5,2),(6,'21:00:00.000000','23:00:00.000000','On time',5,4),(7,'21:15:00.000000','23:05:00.000000','Late',5,8),(8,NULL,NULL,'Absent',5,11),(9,'21:10:00.000000',NULL,'Absent',5,12),(10,'13:04:00.000000','14:30:00.000000','On time',6,12),(11,'13:10:00.000000',NULL,'Absent',6,11),(12,'13:10:00.000000','14:32:00.000000','On time',6,8),(13,'13:00:00.000000','14:30:00.000000','On time',6,4),(14,'13:05:00.000000','14:35:00.000000','On time',6,2),(15,'13:00:00.000000','14:30:00.000000','On time',7,2),(16,'13:05:00.000000',NULL,'Absent',7,4),(17,'13:15:00.000000','14:30:00.000000','Late',7,8),(18,'13:14:00.000000',NULL,'Absent',7,11),(19,'13:08:00.000000','14:33:00.000000','On time',7,12),(31,'22:11:47.898972','22:12:24.484049','On time',14,2),(32,NULL,NULL,'Absent',14,4),(33,NULL,NULL,'Absent',14,8),(34,NULL,NULL,'Absent',14,11),(35,NULL,NULL,'Absent',14,12),(38,'22:21:39.000000','22:31:48.000000','On time',19,2),(39,'22:39:53.000000',NULL,'Absent',20,2),(40,'22:52:03.000000','22:57:17.000000','On time',21,2),(41,'07:40:22.000000',NULL,'Absent',22,24),(42,'07:48:43.000000','07:49:43.000000','On time',23,24),(43,'07:52:15.000000',NULL,'Absent',24,24),(46,'08:36:57.000000','10:00:00.000000','On time',28,27),(48,'08:42:00.000000','10:30:00.000000','On time',30,27),(49,'08:44:05.000000','11:00:00.000000','On time',31,27),(50,'08:46:15.000000','12:00:00.000000','On time',32,27),(51,'09:00:34.000000',NULL,'Absent',33,27),(52,'09:02:32.000000',NULL,'Absent',34,27),(53,'09:03:53.000000',NULL,'Absent',35,27),(54,'09:04:55.000000',NULL,'Absent',36,27),(55,'09:05:47.000000',NULL,'Absent',37,27),(56,'09:10:14.000000',NULL,'Absent',38,27),(57,NULL,NULL,'Absent',22,27),(58,NULL,NULL,'Absent',23,2),(59,NULL,NULL,'Absent',23,4),(60,NULL,NULL,'Absent',23,8),(61,NULL,NULL,'Absent',23,11),(62,NULL,NULL,'Absent',23,12),(63,NULL,NULL,'Absent',23,15),(64,NULL,NULL,'Absent',23,27),(65,NULL,NULL,'Absent',24,2),(66,NULL,NULL,'Absent',24,4),(67,NULL,NULL,'Absent',24,8),(68,NULL,NULL,'Absent',24,11),(69,NULL,NULL,'Absent',24,12),(70,NULL,NULL,'Absent',24,15),(71,NULL,NULL,'Absent',24,27),(93,'11:21:17.000000','11:21:19.000000','On time',41,31),(94,'11:27:46.000000','01:00:00.000000','On time',42,32),(95,'11:28:18.000000','01:00:00.000000','On time',42,33),(96,'11:29:50.000000','01:00:00.000000','On time',43,34),(97,'11:30:54.000000','01:00:00.000000','On time',44,35),(98,'11:31:50.000000','01:00:00.000000','On time',45,36),(99,'11:32:38.000000','01:00:00.000000','On time',46,37),(100,NULL,NULL,'Absent',47,2),(101,'11:39:58.000000','11:40:00.000000','On time',47,11),(102,NULL,NULL,'Absent',47,12),(103,'11:42:34.000000','11:42:36.000000','On time',47,4),(104,'11:43:23.000000','11:43:24.000000','On time',47,26),(105,'11:44:52.000000','11:44:54.000000','On time',48,11),(106,NULL,NULL,'Absent',48,12),(107,NULL,NULL,'Absent',48,8),(108,'11:59:17.000000','11:59:18.000000','On time',48,31),(109,'12:01:24.000000','12:01:25.000000','On time',48,32),(110,'12:02:35.000000','12:02:36.000000','On time',48,34),(111,NULL,NULL,'Absent',48,43),(112,NULL,NULL,'Absent',48,42),(113,NULL,NULL,'Absent',48,40),(114,NULL,NULL,'Absent',5,24),(115,NULL,NULL,'Absent',6,24),(116,NULL,NULL,'Absent',7,24),(118,NULL,NULL,'Absent',14,15),(119,NULL,NULL,'Absent',14,24),(120,NULL,NULL,'Absent',14,27),(127,NULL,NULL,'Absent',17,2),(128,NULL,NULL,'Absent',17,4),(129,NULL,NULL,'Absent',17,8),(130,NULL,NULL,'Absent',17,11),(131,NULL,NULL,'Absent',17,12),(132,NULL,NULL,'Absent',17,15),(133,NULL,NULL,'Absent',17,24),(134,NULL,NULL,'Absent',17,27),(135,NULL,NULL,'Absent',18,2),(136,NULL,NULL,'Absent',18,4),(137,NULL,NULL,'Absent',18,8),(138,NULL,NULL,'Absent',18,11),(139,NULL,NULL,'Absent',18,12),(140,NULL,NULL,'Absent',18,24),(141,NULL,NULL,'Absent',19,22),(142,NULL,NULL,'Absent',19,26),(143,NULL,NULL,'Absent',19,27),(144,NULL,NULL,'Absent',20,22),(145,NULL,NULL,'Absent',20,26),(146,NULL,NULL,'Absent',20,27),(147,NULL,NULL,'Absent',30,2),(148,NULL,NULL,'Absent',30,4),(149,NULL,NULL,'Absent',30,8),(150,NULL,NULL,'Absent',30,11),(151,NULL,NULL,'Absent',30,12),(152,NULL,NULL,'Absent',30,15),(153,NULL,NULL,'Absent',30,24),(154,NULL,NULL,'Absent',31,2),(155,NULL,NULL,'Absent',31,22),(156,NULL,NULL,'Absent',31,26),(157,NULL,NULL,'Absent',32,24),(158,NULL,NULL,'Absent',38,2),(159,NULL,NULL,'Absent',38,4),(160,NULL,NULL,'Absent',38,8),(161,NULL,NULL,'Absent',38,11),(162,NULL,NULL,'Absent',38,12),(163,NULL,NULL,'Absent',38,15),(164,NULL,NULL,'Absent',38,24),(177,NULL,NULL,'Absent',41,2),(178,NULL,NULL,'Absent',41,4),(179,NULL,NULL,'Absent',41,8),(180,NULL,NULL,'Absent',41,11),(181,NULL,NULL,'Absent',41,12),(182,NULL,NULL,'Absent',41,18),(183,NULL,NULL,'Absent',41,26),(184,NULL,NULL,'Absent',41,32),(185,NULL,NULL,'Absent',41,33),(186,NULL,NULL,'Absent',41,34),(187,NULL,NULL,'Absent',41,35),(188,NULL,NULL,'Absent',41,36),(189,NULL,NULL,'Absent',41,37),(190,NULL,NULL,'Absent',41,38),(191,NULL,NULL,'Absent',42,2),(192,NULL,NULL,'Absent',42,4),(193,NULL,NULL,'Absent',42,8),(194,NULL,NULL,'Absent',42,11),(195,NULL,NULL,'Absent',42,12),(196,NULL,NULL,'Absent',42,18),(197,NULL,NULL,'Absent',42,26),(198,NULL,NULL,'Absent',42,31),(199,NULL,NULL,'Absent',42,34),(200,NULL,NULL,'Absent',42,35),(201,NULL,NULL,'Absent',42,36),(202,NULL,NULL,'Absent',42,37),(203,NULL,NULL,'Absent',42,38),(204,NULL,NULL,'Absent',43,2),(205,NULL,NULL,'Absent',43,4),(206,NULL,NULL,'Absent',43,8),(207,NULL,NULL,'Absent',43,11),(208,NULL,NULL,'Absent',43,12),(209,NULL,NULL,'Absent',43,18),(210,NULL,NULL,'Absent',43,26),(211,NULL,NULL,'Absent',43,31),(212,NULL,NULL,'Absent',43,32),(213,NULL,NULL,'Absent',43,33),(214,NULL,NULL,'Absent',43,35),(215,NULL,NULL,'Absent',43,36),(216,NULL,NULL,'Absent',43,37),(217,NULL,NULL,'Absent',43,38),(218,NULL,NULL,'Absent',44,2),(219,NULL,NULL,'Absent',44,4),(220,NULL,NULL,'Absent',44,8),(221,NULL,NULL,'Absent',44,11),(222,NULL,NULL,'Absent',44,12),(223,NULL,NULL,'Absent',44,18),(224,NULL,NULL,'Absent',44,26),(225,NULL,NULL,'Absent',44,31),(226,NULL,NULL,'Absent',44,32),(227,NULL,NULL,'Absent',44,33),(228,NULL,NULL,'Absent',44,34),(229,NULL,NULL,'Absent',44,36),(230,NULL,NULL,'Absent',44,37),(231,NULL,NULL,'Absent',44,38),(232,NULL,NULL,'Absent',45,2),(233,NULL,NULL,'Absent',45,4),(234,NULL,NULL,'Absent',45,8),(235,NULL,NULL,'Absent',45,11),(236,NULL,NULL,'Absent',45,12),(237,NULL,NULL,'Absent',45,18),(238,NULL,NULL,'Absent',45,26),(239,NULL,NULL,'Absent',45,31),(240,NULL,NULL,'Absent',45,32),(241,NULL,NULL,'Absent',45,33),(242,NULL,NULL,'Absent',45,34),(243,NULL,NULL,'Absent',45,35),(244,NULL,NULL,'Absent',45,37),(245,NULL,NULL,'Absent',45,38),(246,NULL,NULL,'Absent',46,2),(247,NULL,NULL,'Absent',46,4),(248,NULL,NULL,'Absent',46,8),(249,NULL,NULL,'Absent',46,11),(250,NULL,NULL,'Absent',46,12),(251,NULL,NULL,'Absent',46,18),(252,NULL,NULL,'Absent',46,26),(253,NULL,NULL,'Absent',46,31),(254,NULL,NULL,'Absent',46,32),(255,NULL,NULL,'Absent',46,33),(256,NULL,NULL,'Absent',46,34),(257,NULL,NULL,'Absent',46,35),(258,NULL,NULL,'Absent',46,36),(259,NULL,NULL,'Absent',46,38),(260,NULL,NULL,'Absent',48,4),(261,NULL,NULL,'Absent',21,22),(262,NULL,NULL,'Absent',21,26),(263,NULL,NULL,'Absent',21,27),(264,NULL,NULL,'Absent',49,2),(265,NULL,NULL,'Absent',49,4),(266,NULL,NULL,'Absent',49,8),(267,NULL,NULL,'Absent',49,11),(268,NULL,NULL,'Absent',49,12),(269,NULL,NULL,'Absent',49,15),(270,NULL,NULL,'Absent',49,24),(271,NULL,NULL,'Absent',49,27),(272,NULL,NULL,'Absent',50,2),(273,NULL,NULL,'Absent',50,4),(274,NULL,NULL,'Absent',50,8),(275,NULL,NULL,'Absent',50,11),(276,NULL,NULL,'Absent',50,12),(277,NULL,NULL,'Absent',50,24),(279,'11:15:27.908019','11:23:40.881878','On time',55,12),(280,NULL,NULL,'Absent',54,12),(281,NULL,NULL,'Absent',51,4),(282,NULL,NULL,'Absent',51,8),(283,NULL,NULL,'Absent',51,11),(284,NULL,NULL,'Absent',51,12),(285,NULL,NULL,'Absent',51,31),(286,NULL,NULL,'Absent',51,32),(287,NULL,NULL,'Absent',51,34),(288,NULL,NULL,'Absent',51,40),(289,NULL,NULL,'Absent',51,42),(290,NULL,NULL,'Absent',51,43),(291,NULL,NULL,'Absent',56,2),(292,NULL,NULL,'Absent',56,4),(293,NULL,NULL,'Absent',56,8),(294,NULL,NULL,'Absent',56,11),(295,NULL,NULL,'Absent',56,12),(296,NULL,NULL,'Absent',56,24),(297,NULL,NULL,'Absent',57,2),(298,NULL,NULL,'Absent',57,4),(299,NULL,NULL,'Absent',57,8),(300,NULL,NULL,'Absent',57,11),(301,NULL,NULL,'Absent',57,12),(302,NULL,NULL,'Absent',57,24);
/*!40000 ALTER TABLE `e_attendance_class_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class_meeting`
--

LOCK TABLES `e_attendance_class_meeting` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_meeting` DISABLE KEYS */;
INSERT INTO `e_attendance_class_meeting` VALUES (5,'21:00:00.000000','23:00:00.000000','Thursday','2023-01-05',17),(6,'13:00:00.000000','14:30:00.000000','Monday','2023-01-02',17),(7,'13:00:00.000000','14:30:00.000000','Monday','2023-01-09',17),(14,'22:00:00.000000','23:00:00.000000','Wednesday','2023-01-11',20),(17,'21:53:34.000000','22:00:00.000000','Friday','2023-01-13',20),(18,'21:58:12.000000','23:00:00.000000','Friday','2023-01-13',17),(19,'22:02:59.000000','23:03:09.000000','Friday','2023-01-13',21),(20,'22:33:05.000000','23:30:00.000000','Saturday','2023-01-13',21),(21,'22:51:15.000000','23:45:00.000000','Friday','2023-01-13',21),(22,'07:37:08.000000','08:00:00.000000','Saturday','2023-01-14',22),(23,'07:47:15.000000','09:00:00.000000','Saturday','2023-01-14',20),(24,'07:51:12.000000','09:00:00.000000','Saturday','2023-01-14',20),(28,'08:36:07.000000','09:00:00.000000','Tuesday','2023-01-17',23),(30,'08:40:58.000000','10:30:00.000000','Wednesday','2023-01-18',20),(31,'08:43:13.000000','11:00:00.000000','Thursday','2023-01-19',21),(32,'08:45:27.000000','12:00:00.000000','Friday','2023-01-20',22),(33,'08:59:50.000000','10:30:00.000000','Saturday','2023-01-14',23),(34,'09:01:38.000000','09:00:00.000000','Monday','2023-01-16',23),(35,'09:02:48.000000','11:00:00.000000','Tuesday','2023-01-17',23),(36,'09:04:10.000000','12:00:00.000000','Wednesday','2023-01-18',23),(37,'09:05:09.000000','01:00:00.000000','Thursday','2023-01-19',23),(38,'09:08:47.000000','10:30:00.000000','Saturday','2023-01-14',20),(41,'11:45:00.000000','01:00:00.000000','Saturday','2023-01-14',27),(42,'11:26:40.000000','01:00:00.000000','Saturday','2023-01-14',27),(43,'11:28:57.000000','01:00:00.000000','Saturday','2023-01-14',27),(44,'11:30:18.000000','01:00:00.000000','Saturday','2023-01-14',27),(45,'11:31:19.000000','01:00:00.000000','Saturday','2023-01-14',27),(46,'11:32:12.000000','01:00:00.000000','Saturday','2023-01-14',27),(47,'11:36:28.000000','01:00:00.000000','Saturday','2023-01-14',26),(48,'11:38:36.000000','01:00:00.000000','Saturday','2023-01-14',24),(49,'10:12:00.000000','11:12:00.000000','Tuesday','2023-01-24',20),(50,'19:00:00.000000','21:58:00.000000','Wednesday','2023-01-25',17),(51,'21:00:00.000000','22:00:00.000000','Tuesday','2023-01-31',24),(54,'11:09:47.000000','12:00:00.000000','Wednesday','2023-02-01',28),(55,'11:13:00.000000','13:13:00.000000','Wednesday','2023-02-01',28),(56,'12:26:00.000000','13:27:00.000000','Saturday','2023-02-04',17),(57,'12:26:00.000000','14:27:00.000000','Saturday','2023-02-04',17);
/*!40000 ALTER TABLE `e_attendance_class_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class_student`
--

LOCK TABLES `e_attendance_class_student` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_student` DISABLE KEYS */;
INSERT INTO `e_attendance_class_student` VALUES (46,17,2),(45,17,4),(44,17,8),(43,17,11),(42,17,12),(67,17,24),(57,20,2),(58,20,4),(60,20,8),(61,20,11),(59,20,12),(62,20,15),(66,20,24),(71,20,27),(63,21,2),(64,21,22),(68,21,26),(72,21,27),(65,22,24),(73,22,27),(69,23,27),(99,24,4),(96,24,8),(94,24,11),(95,24,12),(97,24,31),(98,24,32),(100,24,34),(103,24,40),(102,24,42),(101,24,43),(74,26,2),(92,26,4),(90,26,11),(91,26,12),(93,26,26),(75,27,2),(78,27,4),(80,27,8),(77,27,11),(76,27,12),(81,27,18),(79,27,26),(82,27,31),(83,27,32),(84,27,33),(85,27,34),(86,27,35),(87,27,36),(88,27,37),(89,27,38),(104,28,12);
/*!40000 ALTER TABLE `e_attendance_class_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_course`
--

LOCK TABLES `e_attendance_course` WRITE;
/*!40000 ALTER TABLE `e_attendance_course` DISABLE KEYS */;
INSERT INTO `e_attendance_course` VALUES (1,'Information Technology'),(2,'Accountancy'),(3,'Civil Engineering');
/*!40000 ALTER TABLE `e_attendance_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_department`
--

LOCK TABLES `e_attendance_department` WRITE;
/*!40000 ALTER TABLE `e_attendance_department` DISABLE KEYS */;
INSERT INTO `e_attendance_department` VALUES (1,'School of Information Technology'),(2,'School of Education'),(3,'School of Engineering');
/*!40000 ALTER TABLE `e_attendance_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_event`
--

LOCK TABLES `e_attendance_event` WRITE;
/*!40000 ALTER TABLE `e_attendance_event` DISABLE KEYS */;
INSERT INTO `e_attendance_event` VALUES (1,'Foundation Day','08:00:00.000000','17:00:00.000000','2023-01-07'),(2,'Mass','21:00:00.000000','22:00:00.000000','2023-01-11'),(3,'Party','07:43:21.000000','05:00:00.000000','2023-01-14');
/*!40000 ALTER TABLE `e_attendance_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_event_attendance`
--

LOCK TABLES `e_attendance_event_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_event_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_event_attendance` VALUES (4,'21:39:38.232876','21:40:00.312484','Late',2,2),(5,'07:43:52.000000',NULL,'On time',3,24),(6,'22:48:15.000000','22:48:16.000000','On time',1,2);
/*!40000 ALTER TABLE `e_attendance_event_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_faculty`
--

LOCK TABLES `e_attendance_faculty` WRITE;
/*!40000 ALTER TABLE `e_attendance_faculty` DISABLE KEYS */;
INSERT INTO `e_attendance_faculty` VALUES (5,1),(6,1),(30,1),(44,1),(7,2);
/*!40000 ALTER TABLE `e_attendance_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_faculty_attendance`
--

LOCK TABLES `e_attendance_faculty_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_faculty_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_faculty_attendance` VALUES (5,'08:05:00.000000','18:00:00.000000','2023-01-09','On time',7),(6,NULL,NULL,'2023-01-11','Absent',7),(7,NULL,NULL,'2023-01-11','Absent',6),(8,NULL,NULL,'2023-01-11','Absent',5),(10,NULL,NULL,'2023-01-14','Absent',7),(11,NULL,NULL,'2023-01-14','Absent',6),(12,NULL,NULL,'2023-01-14','Absent',5),(13,NULL,NULL,'2023-01-14','Absent',23),(14,NULL,NULL,'2023-01-14','Absent',28),(15,NULL,NULL,'2023-01-15','Absent',7),(16,NULL,NULL,'2023-01-15','Absent',6),(17,NULL,NULL,'2023-01-15','Absent',5),(18,NULL,NULL,'2023-01-15','Absent',23),(19,NULL,NULL,'2023-01-15','Absent',28),(20,NULL,NULL,'2023-01-15','Absent',30),(21,NULL,NULL,'2023-01-17','Absent',7),(22,NULL,NULL,'2023-01-17','Absent',6),(23,NULL,NULL,'2023-01-17','Absent',5),(24,NULL,NULL,'2023-01-17','Absent',23),(25,NULL,NULL,'2023-01-17','Absent',28),(26,NULL,NULL,'2023-01-17','Absent',30),(27,NULL,NULL,'2023-01-18','Absent',7),(28,NULL,NULL,'2023-01-18','Absent',6),(29,NULL,NULL,'2023-01-18','Absent',5),(30,NULL,NULL,'2023-01-18','Absent',23),(31,NULL,NULL,'2023-01-18','Absent',28),(32,NULL,NULL,'2023-01-18','Absent',30),(33,NULL,NULL,'2023-01-19','Absent',7),(34,NULL,NULL,'2023-01-19','Absent',6),(35,NULL,NULL,'2023-01-19','Absent',5),(36,NULL,NULL,'2023-01-19','Absent',23),(37,NULL,NULL,'2023-01-19','Absent',28),(38,NULL,NULL,'2023-01-19','Absent',30),(39,NULL,NULL,'2023-01-21','Absent',7),(40,NULL,NULL,'2023-01-21','Absent',6),(41,NULL,NULL,'2023-01-21','Absent',5),(42,NULL,NULL,'2023-01-21','Absent',23),(43,NULL,NULL,'2023-01-21','Absent',28),(44,NULL,NULL,'2023-01-21','Absent',30),(45,NULL,NULL,'2023-01-23','Absent',7),(46,NULL,NULL,'2023-01-23','Absent',6),(47,NULL,NULL,'2023-01-23','Absent',5),(48,NULL,NULL,'2023-01-23','Absent',23),(49,NULL,NULL,'2023-01-23','Absent',28),(50,NULL,NULL,'2023-01-23','Absent',30),(51,NULL,NULL,'2023-01-24','Absent',7),(52,NULL,NULL,'2023-01-24','Absent',6),(53,NULL,NULL,'2023-01-24','Absent',5),(54,NULL,NULL,'2023-01-24','Absent',23),(55,NULL,NULL,'2023-01-24','Absent',28),(56,NULL,NULL,'2023-01-24','Absent',30),(57,NULL,NULL,'2023-01-25','Absent',7),(58,NULL,NULL,'2023-01-25','Absent',6),(59,NULL,NULL,'2023-01-25','Absent',5),(60,NULL,NULL,'2023-01-25','Absent',23),(61,NULL,NULL,'2023-01-25','Absent',28),(62,NULL,NULL,'2023-01-25','Absent',30),(63,NULL,NULL,'2023-01-27','Absent',7),(64,NULL,NULL,'2023-01-27','Absent',6),(65,NULL,NULL,'2023-01-27','Absent',5),(66,NULL,NULL,'2023-01-27','Absent',23),(67,NULL,NULL,'2023-01-27','Absent',28),(68,NULL,NULL,'2023-01-27','Absent',30),(69,NULL,NULL,'2023-01-28','Absent',7),(70,NULL,NULL,'2023-01-28','Absent',6),(71,NULL,NULL,'2023-01-28','Absent',5),(72,NULL,NULL,'2023-01-28','Absent',23),(73,NULL,NULL,'2023-01-28','Absent',28),(74,NULL,NULL,'2023-01-28','Absent',30),(75,NULL,NULL,'2023-01-29','Absent',7),(76,NULL,NULL,'2023-01-29','Absent',6),(77,NULL,NULL,'2023-01-29','Absent',5),(78,NULL,NULL,'2023-01-29','Absent',23),(79,NULL,NULL,'2023-01-29','Absent',28),(80,NULL,NULL,'2023-01-29','Absent',30),(81,NULL,NULL,'2023-01-30','Absent',7),(82,NULL,NULL,'2023-01-30','Absent',6),(83,NULL,NULL,'2023-01-30','Absent',5),(84,NULL,NULL,'2023-01-30','Absent',23),(85,NULL,NULL,'2023-01-30','Absent',28),(86,NULL,NULL,'2023-01-30','Absent',30),(87,NULL,NULL,'2023-02-02','Absent',7),(88,NULL,NULL,'2023-02-02','Absent',6),(89,NULL,NULL,'2023-02-02','Absent',5),(90,NULL,NULL,'2023-02-02','Absent',23),(91,NULL,NULL,'2023-02-02','Absent',28),(92,NULL,NULL,'2023-02-02','Absent',30),(93,NULL,NULL,'2023-02-02','Absent',44),(94,NULL,NULL,'2023-02-03','Absent',7),(95,NULL,NULL,'2023-02-03','Absent',6),(96,NULL,NULL,'2023-02-03','Absent',5),(97,NULL,NULL,'2023-02-03','Absent',23),(98,NULL,NULL,'2023-02-03','Absent',28),(99,NULL,NULL,'2023-02-03','Absent',30),(100,NULL,NULL,'2023-02-03','Absent',44),(101,NULL,NULL,'2023-02-05','Absent',7),(102,NULL,NULL,'2023-02-05','Absent',6),(103,NULL,NULL,'2023-02-05','Absent',5),(104,NULL,NULL,'2023-02-05','Absent',23),(105,NULL,NULL,'2023-02-05','Absent',28),(106,NULL,NULL,'2023-02-05','Absent',30),(107,NULL,NULL,'2023-02-05','Absent',44);
/*!40000 ALTER TABLE `e_attendance_faculty_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_message`
--

LOCK TABLES `e_attendance_message` WRITE;
/*!40000 ALTER TABLE `e_attendance_message` DISABLE KEYS */;
INSERT INTO `e_attendance_message` VALUES (18,'hello','2022-12-15 08:20:10.646439',1,7,16),(19,'hi','2022-12-15 09:00:10.677604',1,16,7),(20,'ho','2022-12-15 09:00:26.757684',1,7,16),(21,'sup','2022-12-15 09:11:19.920147',1,7,16),(22,'good 2:46 pm','2022-12-20 06:46:10.304537',1,7,16),(23,'?','2022-12-20 06:46:31.236759',1,16,7),(24,'sup shorty?','2022-12-20 06:47:25.282066',1,6,16),(25,'./.','2022-12-20 06:47:55.794477',1,16,6),(26,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, perspiciatis, consequuntur aliquid, commodi culpa in porro nobis reiciendis debitis dolor distinctio exercitationem? Iste incidunt molestiae minus voluptates fuga rem obcaecati! Temporibus excepturi perspiciatis recusandae dolorem quo repellendus vitae ratione voluptas possimus est exercitationem dolore quisquam iusto veniam quae, explicabo omnis. Enim dolore sequi eius accusamus animi non excepturi nulla voluptas.','2022-12-20 06:53:45.007046',1,6,16),(27,'seize the day','2022-12-20 11:07:26.645099',1,6,16),(28,'hi','2023-01-06 07:09:33.489851',1,16,7),(29,'hi','2023-01-12 00:06:31.404958',1,16,7),(30,'hi','2023-01-12 00:14:38.184218',1,16,7),(31,'8:14 am','2023-01-12 00:14:44.477781',1,16,7),(32,'hi','2023-01-13 11:41:00.916423',1,16,7),(33,'dsddssd','2023-01-13 11:41:03.583666',1,16,7),(34,'hi','2023-01-15 05:04:35.538039',1,16,30),(35,'dsd','2023-01-20 15:16:56.459496',1,16,7),(36,'dsdasdasdad','2023-01-20 15:18:28.749195',1,16,7),(37,'hi','2023-01-20 15:18:30.401657',1,16,7),(38,'hello','2023-01-20 15:18:33.859444',1,16,7),(39,'sdsad','2023-01-20 15:21:40.714089',1,16,7),(40,'djkbdjdffjhdhadf','2023-01-20 15:21:42.303481',1,16,7),(41,'kjkbdfbjdffjkjbbdfjksdffdf','2023-01-20 15:21:43.791713',1,16,7),(42,'jksdfnjdfldfljksdsfljsdflkdfdd','2023-01-20 15:21:46.057611',1,16,7),(43,'lklsdfjsdkjsdfkjdlkjsdfsdfkjsdfjjds  sdjfkdsfsd','2023-01-20 15:21:52.298304',1,16,7),(44,'11:22 pm','2023-01-20 15:22:57.494945',1,7,16),(45,'ggwp','2023-01-20 15:23:03.991228',1,7,16),(46,'XD','2023-01-20 15:23:05.382662',1,7,16),(47,'fksdskdjs','2023-01-20 15:23:26.275369',1,25,7),(48,'dfjksjdjsdjs','2023-01-20 15:23:27.828125',1,25,7),(49,'hi','2023-01-24 00:56:11.298422',1,25,7),(50,'sssss','2023-01-25 12:08:42.699492',1,16,7),(51,'dsd','2023-01-25 13:33:04.509318',1,7,16),(52,'kjasdkjdjkadskjasdkjasdkjasdkjjasdskjjasdkjjasdsj','2023-01-25 13:33:13.362563',1,7,16),(53,'sdkjjadkjasdkjadjkasdkajsdjasdsd','2023-01-25 13:33:23.741565',1,7,16),(54,'adasds','2023-01-25 13:52:47.949171',1,7,16),(55,'adsds','2023-01-25 13:52:53.790230',0,30,16),(56,'dsd','2023-01-25 13:53:26.468158',1,16,7),(57,'adsdsknds','2023-01-25 13:54:38.612136',0,30,16),(58,'asdskds','2023-01-25 13:55:23.997722',0,30,16),(59,'adasdaskdns','2023-01-25 13:55:58.706068',1,7,16),(60,'','2023-01-25 13:55:59.029242',1,7,16),(61,'','2023-01-25 13:56:01.371886',1,7,16),(62,'','2023-01-25 13:56:08.392878',1,7,16),(63,'sdfdf','2023-01-25 13:59:23.968780',1,7,16),(64,'asdsds','2023-01-25 14:19:36.069007',1,7,16),(65,'whats ur name','2023-01-25 14:21:12.938589',0,30,16),(66,'hi im urs','2023-01-25 14:21:16.562081',0,30,16),(67,'asdasd','2023-01-26 10:52:16.176155',1,16,7),(68,'adasdadsasd','2023-01-26 10:52:21.579675',0,25,7),(69,'dsds','2023-01-27 02:12:12.864868',1,16,7),(70,'addas','2023-01-27 02:58:02.511716',1,16,7),(71,'hi vlad','2023-01-30 07:01:13.570698',1,16,7),(72,'hi putchin','2023-01-30 07:01:43.752558',1,7,16),(73,'wag ka naaang','2023-01-30 07:02:34.075008',1,7,16),(74,'mawalaaaa','2023-01-30 07:02:42.473478',1,16,7),(75,'teresa lim','2023-02-01 07:21:32.070972',0,44,16);
/*!40000 ALTER TABLE `e_attendance_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_strand`
--

LOCK TABLES `e_attendance_strand` WRITE;
/*!40000 ALTER TABLE `e_attendance_strand` DISABLE KEYS */;
INSERT INTO `e_attendance_strand` VALUES (1,'Information and Communications Technology',2),(2,'Industrial Arts',2),(3,'Home Economics',2),(4,'Agricultural-Fishery Arts',2),(5,'General Academic Strand',1),(6,'Humanities and Social Science',1),(7,'Science, Technology, Engineering, and Mathematics',1),(8,'Accountancy, Business and Management Strand',1);
/*!40000 ALTER TABLE `e_attendance_strand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_student`
--

LOCK TABLES `e_attendance_student` WRITE;
/*!40000 ALTER TABLE `e_attendance_student` DISABLE KEYS */;
INSERT INTO `e_attendance_student` VALUES (2,'college student',4,1,1,NULL),(3,'college student',4,1,2,NULL),(4,'college student',4,1,1,NULL),(8,'college student',4,1,1,NULL),(9,'college student',4,1,3,NULL),(10,'college student',4,1,2,NULL),(11,'college student',4,1,1,NULL),(12,'college student',4,1,1,NULL),(13,'college student',4,1,2,NULL),(14,'college student',4,1,3,NULL),(15,'college student',4,1,3,NULL),(17,'senior high student',12,1,NULL,7),(18,'senior high student',12,1,NULL,7),(19,'senior high student',12,1,NULL,7),(20,'senior high student',12,1,NULL,7),(21,'senior high student',12,1,NULL,7),(24,'senior high student',11,2,NULL,6),(26,'college student',4,1,1,NULL),(31,'college student',4,1,1,NULL),(32,'college student',4,1,1,NULL),(33,'college student',4,1,1,NULL),(34,'college student',4,1,1,NULL),(35,'college student',4,1,1,NULL),(36,'college student',4,1,1,NULL),(37,'college student',4,1,1,NULL),(38,'college student',4,1,1,NULL),(39,'college student',4,1,1,NULL),(40,'college student',4,1,1,NULL),(41,'college student',4,1,1,NULL),(42,'college student',4,1,1,NULL),(43,'college student',4,1,1,NULL);
/*!40000 ALTER TABLE `e_attendance_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_student_guardian`
--

LOCK TABLES `e_attendance_student_guardian` WRITE;
/*!40000 ALTER TABLE `e_attendance_student_guardian` DISABLE KEYS */;
INSERT INTO `e_attendance_student_guardian` VALUES (1,'Father',16,2),(2,'Father',16,4),(3,'Father',16,22),(4,'Father',25,24),(5,'father',16,12);
/*!40000 ALTER TABLE `e_attendance_student_guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_subject`
--

LOCK TABLES `e_attendance_subject` WRITE;
/*!40000 ALTER TABLE `e_attendance_subject` DISABLE KEYS */;
INSERT INTO `e_attendance_subject` VALUES (1,'English'),(2,'Algebra'),(3,'Data Structures and Algorithms'),(4,'Artificial Intelligence'),(5,'21st Century Literature'),(6,'Physical Science'),(7,'Entrepreneurship'),(8,'Business Finance'),(9,'General Mathematics'),(10,'CISCO'),(11,'Capstone'),(12,'Programming'),(13,'Seminar and Industry');
/*!40000 ALTER TABLE `e_attendance_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_track`
--

LOCK TABLES `e_attendance_track` WRITE;
/*!40000 ALTER TABLE `e_attendance_track` DISABLE KEYS */;
INSERT INTO `e_attendance_track` VALUES (1,'Academic'),(2,'Technical-Vocational-Livelihood');
/*!40000 ALTER TABLE `e_attendance_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_user`
--

LOCK TABLES `e_attendance_user` WRITE;
/*!40000 ALTER TABLE `e_attendance_user` DISABLE KEYS */;
INSERT INTO `e_attendance_user` VALUES (1,'pbkdf2_sha256$390000$lvAkI6OxiQoyddylYHVDoX$ue/R2IOIJaTyENh+khe30pURAJ90VDEJlKyCuIonSs8=','2023-02-04 09:20:23.049658',1,'admin','Laurence','Delos Reyes','',1,1,'2022-11-20 06:21:35.000000',NULL,NULL),(2,'pbkdf2_sha256$390000$88mSMEf6l4i64kSrylzHyu$MSUVotn8zVMVtMYSxMXA8RB8e9+8OitgiBo6oz1bqUo=','2023-02-04 03:04:06.724847',0,'noel','Noel Laurence','Delos Reyes','delosreyesnl.159.stud@cdd.edu.ph',0,1,'2022-11-20 06:23:55.000000',NULL,NULL),(3,'pbkdf2_sha256$390000$eH98rYxeaLoicLcrL8k57B$ZIhg/MWjHphlb5ZlSboVIKEOX4SBiad9hPDp7rthNko=','2022-12-10 10:40:09.435202',0,'syn_gates','Brian','Haner','',0,1,'2022-11-20 06:24:36.000000',NULL,NULL),(4,'pbkdf2_sha256$390000$DbNw7KLsQGMzNVimyRRoml$8rEFgAOniNcnSnVI1ENpF+DUnGNtSFT0Bouj9XSHvD0=','2023-01-14 00:04:35.000000',0,'garcia_rea','Rea','Garcia','reagarcia64@gmail.com',0,1,'2022-11-20 06:25:21.000000',NULL,NULL),(5,'pbkdf2_sha256$390000$loV7XuJZeUc5P66BNi26XG$vuFsP2Jfr1SEa6R2chcwb8TvLaaaw/T9rWoPHz7TIjE=','2022-11-24 10:36:36.000000',0,'m_shadows','Matthew','Sanders','',1,1,'2022-11-20 06:25:59.000000',NULL,NULL),(6,'pbkdf2_sha256$390000$xo2mwqLVRoSBHAif9fGbPg$fv/hXpOeDjFOBdFBnJFqAIpHb6oR8C03WBar09nzrPU=','2022-12-20 11:06:13.000000',0,'johnny','Jonathan','Seward','',1,1,'2022-11-20 06:27:10.000000',NULL,NULL),(7,'pbkdf2_sha256$390000$08jhj6XGPJ7f7O4aL7JsB0$E5kPvDECwzwYkrigyYo1d1Rc7t9Gn/pxif9XdZXC3/c=','2023-02-04 04:26:24.991495',0,'brandon','Brandon','Boyd','',1,1,'2022-11-20 12:28:34.000000',NULL,NULL),(8,'pbkdf2_sha256$390000$ja4pwVqqfUpXgvQvaSysCJ$jo0mfBltmbaFtemrTYKHs+Q/xMADZx2hwQp2Tv8hFRQ=','2023-01-14 00:13:33.000000',0,'hasad_jenelyn','Jenelyn','Hasad','hasadjc.799.stud@cdd.edu.ph',0,1,'2022-11-20 15:26:29.000000',NULL,NULL),(9,'pbkdf2_sha256$390000$PqOsUt9HRQdPkVZePkdGJg$QIhKDBjG+7Uz8AmLXMj+AQ3q3Q2eDO2nGpMFARQd8IM=',NULL,0,'slash','Saul','Hudson','',0,1,'2022-11-22 07:32:18.000000',NULL,NULL),(10,'pbkdf2_sha256$390000$7VlMZJLqUUCZY8AoDrCR5Q$Y8NM+zde8XK/k2PBuNF7/Xj6vcWDt6Mpzv5LzFBecZ4=',NULL,0,'myles_kennedy','Myles','Kennedy','',0,1,'2022-11-22 07:33:34.000000',NULL,NULL),(11,'pbkdf2_sha256$390000$ZaaoDMLHTKqHszlC74vnmZ$FWr47iz38nHTj0xF1/F6XlTEJSaoRZw+5U2WalHSyGo=','2023-01-14 00:07:08.000000',0,'dalaten_aljon','Aljon','Dalaten','dalatenaa.349stud@cdd.edu.ph',0,1,'2022-11-24 04:22:34.000000',NULL,NULL),(12,'pbkdf2_sha256$390000$ZxHxkhPN0V0cf52VKf5q79$wn8kuihw8vYKzfAklxgakp+OMsFA6cnUiy4CoQW4MQA=','2023-02-01 03:11:47.000000',0,'ejanda_justin','Justin','Ejanda','ejandajustin45@gmail.com',0,1,'2022-11-24 04:26:38.000000',NULL,NULL),(13,'pbkdf2_sha256$390000$bU0DZ5tzTRAUqghdC62wOC$5E/+KY2ZGTV0rVeGo8G/qho6K/5HyceQVTzMNbzKYXc=',NULL,0,'ferris_eris','Ferris','Eris','',0,1,'2022-11-24 04:28:26.000000',NULL,NULL),(14,'pbkdf2_sha256$390000$qIctpV4fMiqMOGL67S6JYN$1LOZbB+MYJa98BWJLGcfP5dM120PfxmJj47XiL4ne8A=',NULL,0,'layton','Layfon','Alseif','',0,1,'2022-11-24 04:29:18.000000','Wolfstein',NULL),(15,'pbkdf2_sha256$390000$nP79u6j4PGeI8FrRhyJp4F$59AaDJcsalkWyWaGbjje5syJQCoAEQCc9WwnOn4Aa0g=',NULL,0,'nina_antalk','Nina','Antalk','',0,1,'2022-11-24 04:30:11.000000',NULL,NULL),(16,'pbkdf2_sha256$390000$V3Se67URqItsvVMtc5iU3K$Aqcoqcs/tH1IGJzCvk6YCXL5hDmNOXINRoJI2C85V1A=','2023-02-01 07:21:51.341298',0,'vlad_puchin','Vladimir','Puchin','',0,1,'2022-11-24 04:43:45.000000',NULL,NULL),(17,'pbkdf2_sha256$390000$PjZre8FZXk1wrnSX7Aj7Bu$0RBwtWmVPM48wfHoIaYnYphWWoAvQ5Exxci/y7NbdjE=',NULL,0,'sebas_chan','Sebas','Chan','',0,1,'2022-12-03 05:16:53.000000',NULL,NULL),(18,'pbkdf2_sha256$390000$Y3LAJr1Cr1UKfHqXrj6NG6$DRkOQPVPEj5Oti0MR+7CXCdFyX0t9lQOKCTX52CTE2o=','2023-01-19 13:45:02.076310',0,'ereh','Eren','Yeager','',0,1,'2022-12-04 17:47:51.000000',NULL,NULL),(19,'pbkdf2_sha256$390000$9tPN9zxvEJ2T8jdX6GhHpp$Vtw56/4Iju+E64EiwYQ3EvlagklXBYKeY5o7Y1ryR5g=',NULL,0,'jean_k','Jean','Kirstein','',0,1,'2022-12-04 17:49:10.000000',NULL,NULL),(20,'pbkdf2_sha256$390000$t4F20mOU7e819qeQ8GWeYz$G6vzcDkBfI9OxrlG0jvBZvGzChLOwwrg8tf9DIgio90=',NULL,0,'leonhart','Annie','Leonhart','',0,1,'2022-12-04 17:50:49.000000',NULL,NULL),(21,'pbkdf2_sha256$390000$D8fiTOi6fCwIBQmfwhBihg$RtUzmPIYZux0wCqkW0Kdx/PGJNRp7JPDcRz0Zb9uEQQ=',NULL,0,'e_smith','Erwin','Smith','',0,1,'2022-12-04 17:52:28.000000',NULL,NULL),(22,'pbkdf2_sha256$390000$pr5tq5qN9Jb5dyDKi7iuji$wzoU/s+O4gK0NIA2KX9Dq5GB+IGdChfFrTkHXsdYnEE=',NULL,0,'bea','bea','delos reyes','',0,1,'2023-01-12 13:48:34.000000',NULL,NULL),(23,'pbkdf2_sha256$390000$9puDeBgB3ie56o9t9X53SX$3jU/60YeNeuIUGyKkPLmmqmWj6xAVnjKLvgsflkONNc=','2023-01-13 06:51:05.076117',0,'biala','biala','','',1,1,'2023-01-13 06:47:35.000000',NULL,NULL),(24,'pbkdf2_sha256$390000$mTVzBfbMc3nykr0i43Cuxm$7eLjR6K/kPriXxodpjefLHvsbO1JkHL4VCDOF/x/lag=','2023-01-13 23:40:54.778412',0,'rolando','Rolando','Visperas','',0,1,'2023-01-13 23:27:32.000000','M.',NULL),(25,'pbkdf2_sha256$390000$3C9h65rYv74E07D3JjtDuB$038tMGQMaFLTObaXdaJswxcdT31WlZPI5lAQqEssBwY=',NULL,0,'berhilyo','berhilyo','Ejanda','',0,1,'2023-01-13 23:31:32.000000','E.','L.A'),(26,'pbkdf2_sha256$390000$uShh1oydtlFQ04xypiKkVg$bbWQ0/lYk2C/bc71kQTohETkz6pPVgwo4ul4OwFfzzM=','2023-01-14 00:23:46.000000',0,'ricky','Ricky','Quindara','rquindara5@gmail.com',0,1,'2023-01-14 00:18:05.000000','A.',NULL),(27,'pbkdf2_sha256$390000$eefjFirTaCRReHdsYSUGxr$LLqsl6fLd7fnOYHSy7cGdw83fiNJt310y0xadVP9Xww=','2023-01-14 00:51:40.434374',0,'Britney','Britney','Fernandez','',0,1,'2023-01-14 00:28:22.000000','G','Lingayen'),(28,'pbkdf2_sha256$390000$XNtBNg1EzRKNhopbIHw0aX$WdUKxJwpbpZjOB2TKRS2BrVyxJ0u+iSXSFWcovGB0H4=',NULL,0,'engel','Engelbert','Cruz','engel@gmail.com',0,1,'2023-01-14 01:11:10.000000','Q','Bonuan'),(30,'pbkdf2_sha256$390000$tXmP9X8rAbxOPGH1Jg73Nz$DljkDY82HngvxE9Hl2EYJqWbdgEu17qccQ7uyatdyPg=','2023-01-31 12:38:49.160475',0,'Lachica','Evangeline','Lachica','lachica@gmail.com',0,1,'2023-01-14 02:20:12.000000','Nones','pantal'),(31,'pbkdf2_sha256$390000$lc6rTLpZB3KAQt6c0EM27y$orhCQZpUQTCw9Gm6H5qbSVxbG6k3DFQA+hepeGJfgsg=',NULL,0,'richard','Richard','Aquino','richard@gmail.com',0,1,'2023-01-14 02:33:29.000000','Maramba','Bonuan'),(32,'pbkdf2_sha256$390000$XYHiJf71whzyHd7riM5NtL$VK1r+q97gz7yhwqEavACIqZBHjrqRviwDY/sIvqufwE=',NULL,0,'oliver','Oliver','Rocafor','oliver@gmail.com',0,1,'2023-01-14 02:35:37.000000','Li','San Fabian'),(33,'pbkdf2_sha256$390000$k3TZdL3gDWgnOskbtLHVUi$tROB1xroJMfQIBKDPxp73SGE3lnzJkJZT05SzFG6IM4=',NULL,0,'Fernand','Fernand','Dellave','fernand@gmail.com',0,1,'2023-01-14 02:47:50.000000','G.','mangin'),(34,'pbkdf2_sha256$390000$x9TcsPKNXXCPqxjjWqVulG$tSXzHx1okryo+k9enPJJR/rcDQsagbnjO29zXnqIGJE=',NULL,0,'Benjie','Benjie','Zarate','benjie@gmail.com',0,1,'2023-01-14 02:52:02.000000','F.','Mangin'),(35,'pbkdf2_sha256$390000$VxveKqKeGKGjqsBP5Ijn2y$VuTAa2HhFUegeqCto68SaqpIAVeNDznUVD55GkTp9BQ=',NULL,0,'Nethalia','Nethalia','Villacorte','nethalia@gmail.com',0,1,'2023-01-14 03:02:56.000000','Q.','Bacayao'),(36,'pbkdf2_sha256$390000$CHLs4yxDTk2DY4NJSn3DQ8$oDfUG9ocQADO1nrglSapGcYJuXnfQ7EWKSjtxGk1ECI=',NULL,0,'Mae','Mae','Garcia','mae@gmail.com',0,1,'2023-01-14 03:07:27.000000','C.','San Fabian'),(37,'pbkdf2_sha256$390000$tnBUXeVG8w7QsepK7dc7ZH$lDx24cpz8uBTKAGwOQsrY6WzcZI/rIhAD9eDR1A9rQE=',NULL,0,'tricia','Tricia','Cericos','tricia@gmail.com',0,1,'2023-01-14 03:09:09.000000','S.','San Fabian'),(38,'pbkdf2_sha256$390000$0yFKqNewpuQP0UphooDrQs$fiCorHDCtBJEIFu8B5I5RBm7WCiOpytJ4nMZR0Poq4g=',NULL,0,'Rica','Rica','Salayog','rica@gmail.com',0,1,'2023-01-14 03:10:33.000000','M.','Dagupan City'),(39,'pbkdf2_sha256$390000$ttJGVwOr6Wi5GQg1edqhhv$1OzemURVEEXs+9SU3qDveDsQiwECI5UfxYTZZgMdvc8=',NULL,0,'Krisa','Krisa','Erasquin','krisa@gmail.com',0,1,'2023-01-14 03:12:36.000000','E.','Dagupan City'),(40,'pbkdf2_sha256$390000$isxcT621joJMM7nu2EgHoL$s+YKx5l4VkCCd8jAej/sHA6dVa/RqVH5mmkVg1ifU+E=',NULL,0,'Jham','Jham','Bravo','jham@gmail.com',0,1,'2023-01-14 03:13:47.000000','A.','San Carlos'),(41,'pbkdf2_sha256$390000$VVHhYOX3oLb67bYLm9wDmB$+GmT1voCaHagmllzdB671qmeTKokA38SjDeFx3j6ic8=',NULL,0,'Lizel','Lizel','Lu','lizel@gmail.com',0,1,'2023-01-14 03:14:59.000000','L.','Dagupan City'),(42,'pbkdf2_sha256$390000$Ux91vJ32qxrcDLLepJxEHw$9cS35WMy69BZloiyuAx6XdfqimSjF4NZkL53Hi6Ep5c=',NULL,0,'Dana','Dana','Carrera','dana@gmail.com',0,1,'2023-01-14 03:16:17.000000','G.','San Fabian'),(43,'pbkdf2_sha256$390000$yFUDXrHOPXpOcqRvnJdpJx$ePARfWKn5yLT36h2Xff+P+UsNI4m/gCS41FEb7GvN5g=',NULL,0,'Andrea','Andrea','Orande','andrea@gmail.com',0,1,'2023-01-14 03:17:23.000000','A.','Dagupan City'),(44,'pbkdf2_sha256$390000$ZmFUqxbesl6bnep4OUKtHZ$rfSgsEwzLaHxe615WqN+A0Q63qXlGrJ8D+NrcYzc4t8=','2023-02-01 03:52:04.385053',0,'maria','maria','teresa','',0,1,'2023-02-01 03:06:50.000000','L.',NULL);
/*!40000 ALTER TABLE `e_attendance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_user_groups`
--

LOCK TABLES `e_attendance_user_groups` WRITE;
/*!40000 ALTER TABLE `e_attendance_user_groups` DISABLE KEYS */;
INSERT INTO `e_attendance_user_groups` VALUES (22,1,2),(14,2,1),(13,3,1),(16,4,1),(25,5,3),(24,6,3),(23,7,3),(5,8,1),(12,9,1),(10,10,1),(15,11,1),(11,12,1),(4,13,1),(3,14,1),(2,15,1),(26,16,4),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(27,22,1),(28,23,3),(29,24,1),(30,25,4),(31,26,1),(32,27,1),(33,28,3),(35,30,3),(36,31,1),(37,32,1),(38,33,1),(39,34,1),(40,35,1),(41,36,1),(42,37,1),(43,38,1),(44,39,1),(45,40,1),(46,41,1),(47,42,1),(48,43,1),(49,44,3);
/*!40000 ALTER TABLE `e_attendance_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_user_user_permissions`
--

LOCK TABLES `e_attendance_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `e_attendance_user_user_permissions` DISABLE KEYS */;
INSERT INTO `e_attendance_user_user_permissions` VALUES (1,23,66);
/*!40000 ALTER TABLE `e_attendance_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-08 21:04:26
