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
-- Dumping data for table `e_attendance_campus_attendance`
--

LOCK TABLES `e_attendance_campus_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_campus_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_campus_attendance` VALUES (3,'17:28:14.026689','17:28:26.846315','2023-01-07',1),(4,'08:00:00.000000','12:00:00.000000','2023-01-09',2),(5,'08:10:00.000000','05:00:00.000000','2023-01-09',7);
/*!40000 ALTER TABLE `e_attendance_campus_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class`
--

LOCK TABLES `e_attendance_class` WRITE;
/*!40000 ALTER TABLE `e_attendance_class` DISABLE KEYS */;
INSERT INTO `e_attendance_class` VALUES (17,4,1,2022,2,1,7,NULL,2),(18,4,1,2022,1,1,7,NULL,1),(19,12,1,2021,1,NULL,7,7,9);
/*!40000 ALTER TABLE `e_attendance_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class_attendance`
--

LOCK TABLES `e_attendance_class_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_class_attendance` VALUES (5,'22:08:39.700080','22:10:43.777699','Late',5,2),(6,'21:00:00.000000','23:00:00.000000','On time',5,4),(7,'21:15:00.000000','23:05:00.000000','Late',5,8),(8,NULL,NULL,'Absent',5,11),(9,'21:10:00.000000',NULL,'Absent',5,12),(10,'13:04:00.000000','14:30:00.000000','On time',6,12),(11,'13:10:00.000000',NULL,'Absent',6,11),(12,'13:10:00.000000','14:32:00.000000','On time',6,8),(13,'13:00:00.000000','14:30:00.000000','On time',6,4),(14,'13:05:00.000000','14:35:00.000000','On time',6,2),(15,'13:00:00.000000','14:30:00.000000','On time',7,2),(16,'13:05:00.000000',NULL,'Absent',7,4),(17,'13:15:00.000000','14:30:00.000000','Late',7,8),(18,'13:14:00.000000',NULL,'Absent',7,11),(19,'13:08:00.000000','14:33:00.000000','On time',7,12),(20,'08:00:00.000000','09:00:00.000000','On time',8,4),(21,'08:10:00.000000',NULL,'Absent',8,8),(22,'08:05:00.000000','09:00:00.000000','On time',8,12),(23,NULL,NULL,'Absent',8,2),(24,NULL,NULL,'Absent',8,11),(25,'09:00:00.000000','10:30:00.000000','On time',9,17),(26,'09:05:00.000000','10:35:00.000000','On time',9,18),(27,'09:15:00.000000','10:30:00.000000','Late',9,19),(28,'09:00:00.000000',NULL,'Absent',9,20),(29,NULL,NULL,'Absent',9,21);
/*!40000 ALTER TABLE `e_attendance_class_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class_meeting`
--

LOCK TABLES `e_attendance_class_meeting` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_meeting` DISABLE KEYS */;
INSERT INTO `e_attendance_class_meeting` VALUES (5,'21:00:00.000000','23:00:00.000000','Thursday','2023-01-05',17),(6,'13:00:00.000000','14:30:00.000000','Monday','2023-01-02',17),(7,'13:00:00.000000','14:30:00.000000','Monday','2023-01-09',17),(8,'08:00:00.000000','09:00:00.000000','Monday','2023-01-09',18),(9,'09:00:00.000000','10:30:00.000000','Monday','2021-06-14',19),(10,'20:00:00.000000','21:30:00.000000','Wednesday','2023-01-11',17);
/*!40000 ALTER TABLE `e_attendance_class_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class_student`
--

LOCK TABLES `e_attendance_class_student` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_student` DISABLE KEYS */;
INSERT INTO `e_attendance_class_student` VALUES (46,17,2),(45,17,4),(44,17,8),(43,17,11),(42,17,12),(47,18,2),(48,18,4),(49,18,8),(50,18,11),(51,18,12),(56,19,17),(55,19,18),(54,19,19),(53,19,20),(52,19,21);
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
INSERT INTO `e_attendance_event` VALUES (1,'Foundation Day','08:00:00.000000','17:00:00.000000','2023-01-07');
/*!40000 ALTER TABLE `e_attendance_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_event_attendance`
--

LOCK TABLES `e_attendance_event_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_event_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_event_attendance` VALUES (2,'08:10:00.000000','00:00:00.000000','1',2,17);
/*!40000 ALTER TABLE `e_attendance_event_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_faculty`
--

LOCK TABLES `e_attendance_faculty` WRITE;
/*!40000 ALTER TABLE `e_attendance_faculty` DISABLE KEYS */;
INSERT INTO `e_attendance_faculty` VALUES (5,1),(6,1),(7,2);
/*!40000 ALTER TABLE `e_attendance_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_faculty_attendance`
--

LOCK TABLES `e_attendance_faculty_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_faculty_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_faculty_attendance` VALUES (5,'08:05:00.000000','18:00:00.000000','2023-01-09','On time',7),(6,NULL,NULL,'2023-01-11','Absent',7),(7,NULL,NULL,'2023-01-11','Absent',6),(8,NULL,NULL,'2023-01-11','Absent',5);
/*!40000 ALTER TABLE `e_attendance_faculty_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_message`
--

LOCK TABLES `e_attendance_message` WRITE;
/*!40000 ALTER TABLE `e_attendance_message` DISABLE KEYS */;
INSERT INTO `e_attendance_message` VALUES (18,'hello','2022-12-15 08:20:10.646439',1,7,16),(19,'hi','2022-12-15 09:00:10.677604',1,16,7),(20,'ho','2022-12-15 09:00:26.757684',1,7,16),(21,'sup','2022-12-15 09:11:19.920147',1,7,16),(22,'good 2:46 pm','2022-12-20 06:46:10.304537',1,7,16),(23,'?','2022-12-20 06:46:31.236759',1,16,7),(24,'sup shorty?','2022-12-20 06:47:25.282066',1,6,16),(25,'./.','2022-12-20 06:47:55.794477',1,16,6),(26,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, perspiciatis, consequuntur aliquid, commodi culpa in porro nobis reiciendis debitis dolor distinctio exercitationem? Iste incidunt molestiae minus voluptates fuga rem obcaecati! Temporibus excepturi perspiciatis recusandae dolorem quo repellendus vitae ratione voluptas possimus est exercitationem dolore quisquam iusto veniam quae, explicabo omnis. Enim dolore sequi eius accusamus animi non excepturi nulla voluptas.','2022-12-20 06:53:45.007046',1,6,16),(27,'seize the day','2022-12-20 11:07:26.645099',1,6,16),(28,'hi','2023-01-06 07:09:33.489851',1,16,7);
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
INSERT INTO `e_attendance_student` VALUES (2,'college student',4,1,1,NULL),(3,'college student',4,1,2,NULL),(4,'college student',4,1,1,NULL),(8,'college student',4,1,1,NULL),(9,'college student',4,1,3,NULL),(10,'college student',4,1,2,NULL),(11,'college student',4,1,1,NULL),(12,'college student',4,1,1,NULL),(13,'college student',4,1,2,NULL),(14,'college student',4,1,3,NULL),(15,'college student',4,1,3,NULL),(17,'senior high student',12,1,NULL,7),(18,'senior high student',12,1,NULL,7),(19,'senior high student',12,1,NULL,7),(20,'senior high student',12,1,NULL,7),(21,'senior high student',12,1,NULL,7);
/*!40000 ALTER TABLE `e_attendance_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_student_guardian`
--

LOCK TABLES `e_attendance_student_guardian` WRITE;
/*!40000 ALTER TABLE `e_attendance_student_guardian` DISABLE KEYS */;
INSERT INTO `e_attendance_student_guardian` VALUES (1,'Father',16,2),(2,'Father',16,4);
/*!40000 ALTER TABLE `e_attendance_student_guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_subject`
--

LOCK TABLES `e_attendance_subject` WRITE;
/*!40000 ALTER TABLE `e_attendance_subject` DISABLE KEYS */;
INSERT INTO `e_attendance_subject` VALUES (1,'English'),(2,'Algebra'),(3,'Data Structures and Algorithms'),(4,'Artificial Intelligence'),(5,'21st Century Literature'),(6,'Physical Science'),(7,'Entrepreneurship'),(8,'Business Finance'),(9,'General Mathematics');
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
INSERT INTO `e_attendance_user` VALUES (1,'pbkdf2_sha256$390000$lvAkI6OxiQoyddylYHVDoX$ue/R2IOIJaTyENh+khe30pURAJ90VDEJlKyCuIonSs8=','2023-01-10 12:00:53.737992',1,'admin','Kel','Ancelo','',1,1,'2022-11-20 06:21:35.000000',NULL,NULL),(2,'pbkdf2_sha256$390000$9m0I2NxlZ0aMO68z16Hb1X$1VRvHnJVXvl9++u/ceAYujd4z6QWoM9B3YmO1JCNqZU=','2023-01-11 05:16:55.135331',0,'the_rev','James','Sullivan','',0,1,'2022-11-20 06:23:55.000000',NULL,NULL),(3,'pbkdf2_sha256$390000$eH98rYxeaLoicLcrL8k57B$ZIhg/MWjHphlb5ZlSboVIKEOX4SBiad9hPDp7rthNko=','2022-12-10 10:40:09.435202',0,'syn_gates','Brian','Haner','',0,1,'2022-11-20 06:24:36.000000',NULL,NULL),(4,'pbkdf2_sha256$390000$DbNw7KLsQGMzNVimyRRoml$8rEFgAOniNcnSnVI1ENpF+DUnGNtSFT0Bouj9XSHvD0=','2022-12-19 07:40:33.564770',0,'zacky_v','Zachary','Baker','',0,1,'2022-11-20 06:25:21.000000',NULL,NULL),(5,'pbkdf2_sha256$390000$loV7XuJZeUc5P66BNi26XG$vuFsP2Jfr1SEa6R2chcwb8TvLaaaw/T9rWoPHz7TIjE=','2022-11-24 10:36:36.000000',0,'m_shadows','Matthew','Sanders','',1,1,'2022-11-20 06:25:59.000000',NULL,NULL),(6,'pbkdf2_sha256$390000$xo2mwqLVRoSBHAif9fGbPg$fv/hXpOeDjFOBdFBnJFqAIpHb6oR8C03WBar09nzrPU=','2022-12-20 11:06:13.000000',0,'johnny','Jonathan','Seward','',1,1,'2022-11-20 06:27:10.000000',NULL,NULL),(7,'pbkdf2_sha256$390000$08jhj6XGPJ7f7O4aL7JsB0$E5kPvDECwzwYkrigyYo1d1Rc7t9Gn/pxif9XdZXC3/c=','2023-01-11 11:43:25.689575',0,'brandon','Brandon','Boyd','',1,1,'2022-11-20 12:28:34.000000',NULL,NULL),(8,'pbkdf2_sha256$390000$ja4pwVqqfUpXgvQvaSysCJ$jo0mfBltmbaFtemrTYKHs+Q/xMADZx2hwQp2Tv8hFRQ=',NULL,0,'arin','Arin','Illejay','',0,1,'2022-11-20 15:26:29.000000',NULL,NULL),(9,'pbkdf2_sha256$390000$PqOsUt9HRQdPkVZePkdGJg$QIhKDBjG+7Uz8AmLXMj+AQ3q3Q2eDO2nGpMFARQd8IM=',NULL,0,'slash','Saul','Hudson','',0,1,'2022-11-22 07:32:18.000000',NULL,NULL),(10,'pbkdf2_sha256$390000$7VlMZJLqUUCZY8AoDrCR5Q$Y8NM+zde8XK/k2PBuNF7/Xj6vcWDt6Mpzv5LzFBecZ4=',NULL,0,'myles_kennedy','Myles','Kennedy','',0,1,'2022-11-22 07:33:34.000000',NULL,NULL),(11,'pbkdf2_sha256$390000$ZaaoDMLHTKqHszlC74vnmZ$FWr47iz38nHTj0xF1/F6XlTEJSaoRZw+5U2WalHSyGo=',NULL,0,'tim_henson','Tim','Henson','',0,1,'2022-11-24 04:22:34.000000',NULL,NULL),(12,'pbkdf2_sha256$390000$ZxHxkhPN0V0cf52VKf5q79$wn8kuihw8vYKzfAklxgakp+OMsFA6cnUiy4CoQW4MQA=',NULL,0,'scott_lepage','Scott','Lepage','',0,1,'2022-11-24 04:26:38.000000',NULL,NULL),(13,'pbkdf2_sha256$390000$bU0DZ5tzTRAUqghdC62wOC$5E/+KY2ZGTV0rVeGo8G/qho6K/5HyceQVTzMNbzKYXc=',NULL,0,'ferris_eris','Ferris','Eris','',0,1,'2022-11-24 04:28:26.000000',NULL,NULL),(14,'pbkdf2_sha256$390000$qIctpV4fMiqMOGL67S6JYN$1LOZbB+MYJa98BWJLGcfP5dM120PfxmJj47XiL4ne8A=',NULL,0,'layton','Layfon','Alseif','',0,1,'2022-11-24 04:29:18.000000',NULL,NULL),(15,'pbkdf2_sha256$390000$nP79u6j4PGeI8FrRhyJp4F$59AaDJcsalkWyWaGbjje5syJQCoAEQCc9WwnOn4Aa0g=',NULL,0,'nina_antalk','Nina','Antalk','',0,1,'2022-11-24 04:30:11.000000',NULL,NULL),(16,'pbkdf2_sha256$390000$V3Se67URqItsvVMtc5iU3K$Aqcoqcs/tH1IGJzCvk6YCXL5hDmNOXINRoJI2C85V1A=','2023-01-11 05:17:54.429829',0,'vlad_puchin','Vladimir','Puchin','',0,1,'2022-11-24 04:43:45.000000',NULL,NULL),(17,'pbkdf2_sha256$390000$PjZre8FZXk1wrnSX7Aj7Bu$0RBwtWmVPM48wfHoIaYnYphWWoAvQ5Exxci/y7NbdjE=',NULL,0,'sebas_chan','Sebas','Chan','',0,1,'2022-12-03 05:16:53.000000',NULL,NULL),(18,'pbkdf2_sha256$390000$Y3LAJr1Cr1UKfHqXrj6NG6$DRkOQPVPEj5Oti0MR+7CXCdFyX0t9lQOKCTX52CTE2o=','2022-12-05 08:54:43.469023',0,'ereh','Eren','Yeager','',0,1,'2022-12-04 17:47:51.000000',NULL,NULL),(19,'pbkdf2_sha256$390000$9tPN9zxvEJ2T8jdX6GhHpp$Vtw56/4Iju+E64EiwYQ3EvlagklXBYKeY5o7Y1ryR5g=',NULL,0,'jean_k','Jean','Kirstein','',0,1,'2022-12-04 17:49:10.000000',NULL,NULL),(20,'pbkdf2_sha256$390000$t4F20mOU7e819qeQ8GWeYz$G6vzcDkBfI9OxrlG0jvBZvGzChLOwwrg8tf9DIgio90=',NULL,0,'leonhart','Annie','Leonhart','',0,1,'2022-12-04 17:50:49.000000',NULL,NULL),(21,'pbkdf2_sha256$390000$D8fiTOi6fCwIBQmfwhBihg$RtUzmPIYZux0wCqkW0Kdx/PGJNRp7JPDcRz0Zb9uEQQ=',NULL,0,'e_smith','Erwin','Smith','',0,1,'2022-12-04 17:52:28.000000',NULL,NULL);
/*!40000 ALTER TABLE `e_attendance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_user_groups`
--

LOCK TABLES `e_attendance_user_groups` WRITE;
/*!40000 ALTER TABLE `e_attendance_user_groups` DISABLE KEYS */;
INSERT INTO `e_attendance_user_groups` VALUES (22,1,2),(14,2,1),(13,3,1),(16,4,1),(25,5,3),(24,6,3),(23,7,3),(5,8,1),(12,9,1),(10,10,1),(15,11,1),(11,12,1),(4,13,1),(3,14,1),(2,15,1),(26,16,4),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1);
/*!40000 ALTER TABLE `e_attendance_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-11 20:33:24
