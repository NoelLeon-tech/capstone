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
-- Table structure for table `e_attendance_admin`
--

DROP TABLE IF EXISTS `e_attendance_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_admin` (
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `e_attendance_admin_user_id_2c0da20a_fk_e_attendance_user_id` FOREIGN KEY (`user_id`) REFERENCES `e_attendance_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_admin`
--

LOCK TABLES `e_attendance_admin` WRITE;
/*!40000 ALTER TABLE `e_attendance_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_attendance_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_class`
--

DROP TABLE IF EXISTS `e_attendance_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `school_year` int NOT NULL,
  `semester` int NOT NULL,
  `subject_id` bigint DEFAULT NULL,
  `instructor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `e_attendance_class_subject_id_1bc92e8e_fk_e_attenda` (`subject_id`),
  KEY `e_attendance_class_instructor_id_6dba0b59_fk_e_attenda` (`instructor_id`),
  CONSTRAINT `e_attendance_class_instructor_id_6dba0b59_fk_e_attenda` FOREIGN KEY (`instructor_id`) REFERENCES `e_attendance_instructor` (`user_id`),
  CONSTRAINT `e_attendance_class_subject_id_1bc92e8e_fk_e_attenda` FOREIGN KEY (`subject_id`) REFERENCES `e_attendance_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_class`
--

LOCK TABLES `e_attendance_class` WRITE;
/*!40000 ALTER TABLE `e_attendance_class` DISABLE KEYS */;
INSERT INTO `e_attendance_class` VALUES (1,2022,2,1,2),(2,2022,1,2,3);
/*!40000 ALTER TABLE `e_attendance_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_class_students`
--

DROP TABLE IF EXISTS `e_attendance_class_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_class_students` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e_attendance_class_students_class_id_student_id_73c85416_uniq` (`class_id`,`student_id`),
  KEY `e_attendance_class_s_student_id_4c5c9e32_fk_e_attenda` (`student_id`),
  CONSTRAINT `e_attendance_class_s_class_id_376c9c61_fk_e_attenda` FOREIGN KEY (`class_id`) REFERENCES `e_attendance_class` (`id`),
  CONSTRAINT `e_attendance_class_s_student_id_4c5c9e32_fk_e_attenda` FOREIGN KEY (`student_id`) REFERENCES `e_attendance_student` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_class_students`
--

LOCK TABLES `e_attendance_class_students` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_students` DISABLE KEYS */;
INSERT INTO `e_attendance_class_students` VALUES (1,1,4),(2,1,6),(3,2,4),(4,2,6);
/*!40000 ALTER TABLE `e_attendance_class_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_course`
--

DROP TABLE IF EXISTS `e_attendance_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_course`
--

LOCK TABLES `e_attendance_course` WRITE;
/*!40000 ALTER TABLE `e_attendance_course` DISABLE KEYS */;
INSERT INTO `e_attendance_course` VALUES (1,'Computer Science');
/*!40000 ALTER TABLE `e_attendance_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_department`
--

DROP TABLE IF EXISTS `e_attendance_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_department`
--

LOCK TABLES `e_attendance_department` WRITE;
/*!40000 ALTER TABLE `e_attendance_department` DISABLE KEYS */;
INSERT INTO `e_attendance_department` VALUES (1,'SITE');
/*!40000 ALTER TABLE `e_attendance_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_guardian`
--

DROP TABLE IF EXISTS `e_attendance_guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_guardian` (
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `e_attendance_guardian_user_id_a75eb48d_fk_e_attendance_user_id` FOREIGN KEY (`user_id`) REFERENCES `e_attendance_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_guardian`
--

LOCK TABLES `e_attendance_guardian` WRITE;
/*!40000 ALTER TABLE `e_attendance_guardian` DISABLE KEYS */;
INSERT INTO `e_attendance_guardian` VALUES (5);
/*!40000 ALTER TABLE `e_attendance_guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_instructor`
--

DROP TABLE IF EXISTS `e_attendance_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_instructor` (
  `user_id` bigint NOT NULL,
  `department_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `e_attendance_instruc_department_id_0d92f569_fk_e_attenda` (`department_id`),
  CONSTRAINT `e_attendance_instruc_department_id_0d92f569_fk_e_attenda` FOREIGN KEY (`department_id`) REFERENCES `e_attendance_department` (`id`),
  CONSTRAINT `e_attendance_instructor_user_id_ff154128_fk_e_attendance_user_id` FOREIGN KEY (`user_id`) REFERENCES `e_attendance_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_instructor`
--

LOCK TABLES `e_attendance_instructor` WRITE;
/*!40000 ALTER TABLE `e_attendance_instructor` DISABLE KEYS */;
INSERT INTO `e_attendance_instructor` VALUES (2,1),(3,1);
/*!40000 ALTER TABLE `e_attendance_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_student`
--

DROP TABLE IF EXISTS `e_attendance_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_student` (
  `user_id` bigint NOT NULL,
  `year` int NOT NULL,
  `block` int NOT NULL,
  `course_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `e_attendance_student_course_id_14efb02e_fk_e_attenda` (`course_id`),
  CONSTRAINT `e_attendance_student_course_id_14efb02e_fk_e_attenda` FOREIGN KEY (`course_id`) REFERENCES `e_attendance_course` (`id`),
  CONSTRAINT `e_attendance_student_user_id_944a0035_fk_e_attendance_user_id` FOREIGN KEY (`user_id`) REFERENCES `e_attendance_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_student`
--

LOCK TABLES `e_attendance_student` WRITE;
/*!40000 ALTER TABLE `e_attendance_student` DISABLE KEYS */;
INSERT INTO `e_attendance_student` VALUES (4,4,1,1),(6,4,1,1);
/*!40000 ALTER TABLE `e_attendance_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_student_guardian`
--

DROP TABLE IF EXISTS `e_attendance_student_guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_student_guardian` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `relationship_to_student` varchar(20) NOT NULL,
  `guardian_id` bigint DEFAULT NULL,
  `student_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `e_attendance_student_guardian_id_577bac78_fk_e_attenda` (`guardian_id`),
  KEY `e_attendance_student_student_id_835295be_fk_e_attenda` (`student_id`),
  CONSTRAINT `e_attendance_student_guardian_id_577bac78_fk_e_attenda` FOREIGN KEY (`guardian_id`) REFERENCES `e_attendance_guardian` (`user_id`),
  CONSTRAINT `e_attendance_student_student_id_835295be_fk_e_attenda` FOREIGN KEY (`student_id`) REFERENCES `e_attendance_student` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_student_guardian`
--

LOCK TABLES `e_attendance_student_guardian` WRITE;
/*!40000 ALTER TABLE `e_attendance_student_guardian` DISABLE KEYS */;
INSERT INTO `e_attendance_student_guardian` VALUES (1,'Father',5,4);
/*!40000 ALTER TABLE `e_attendance_student_guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_subject`
--

DROP TABLE IF EXISTS `e_attendance_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_subject`
--

LOCK TABLES `e_attendance_subject` WRITE;
/*!40000 ALTER TABLE `e_attendance_subject` DISABLE KEYS */;
INSERT INTO `e_attendance_subject` VALUES (1,'Web Programming'),(2,'Data Structures and Algorithms');
/*!40000 ALTER TABLE `e_attendance_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_user`
--

DROP TABLE IF EXISTS `e_attendance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_user`
--

LOCK TABLES `e_attendance_user` WRITE;
/*!40000 ALTER TABLE `e_attendance_user` DISABLE KEYS */;
INSERT INTO `e_attendance_user` VALUES (1,'pbkdf2_sha256$390000$3su54RZaYa1rdL1imspO66$U0Wlxuh41JHeLkuU4CMtrRDc3NEZ1fxqbjsuyNyAybg=','2022-11-14 14:24:15.000000',1,'the_rev','James','Sullivan','',1,1,'2022-11-14 14:24:06.000000',NULL),(2,'pbkdf2_sha256$390000$vDcQwZ8KJcHMSgaH3XcpMl$luOnKjeIr2RVp+MWcyTOIh5XZ8scPED6JMqmsUDgVp8=','2022-11-14 14:34:35.039687',0,'zacky_v','Zachary','Baker','',1,1,'2022-11-14 14:26:01.000000',NULL),(3,'pbkdf2_sha256$390000$5RZgNRTdXGQOfcm62p2nsE$2vFDFgLeSDZgW+l17Z1wxQdUeVVsnMnXdDQM+/YbQ28=',NULL,0,'m_shadows','Matthew','Sanders','',0,1,'2022-11-14 14:26:36.000000',NULL),(4,'pbkdf2_sha256$390000$OjzOUfg5KPQGK0XzEeis4s$oAxnd3XJY+Exf8AcSZSh9fYNz59EF5xMEaBigP8yvUo=',NULL,0,'syn_gates','Brian','Haner jr.','',0,1,'2022-11-14 14:28:03.000000',NULL),(5,'pbkdf2_sha256$390000$l4OazoOZEsWo4jvK3BZXQf$IcyG7Pajhs7wZ4I/Yn3doFYNNpFnVvy83C3GuCmroxk=',NULL,0,'papa_gates','Brian','Haner sr.','',0,1,'2022-11-14 14:28:31.000000',NULL),(6,'pbkdf2_sha256$390000$jgYKa6NN9uKykBOf9DPLkq$OBDL9lZGqRAZN0yw2mrNHMALVOUwheKmBcSvtaq4V8c=','2022-11-14 14:38:06.160078',0,'johnny','Jonathan','Seward','',0,1,'2022-11-14 14:30:21.000000',NULL);
/*!40000 ALTER TABLE `e_attendance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_user_groups`
--

DROP TABLE IF EXISTS `e_attendance_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e_attendance_user_groups_user_id_group_id_6e95051a_uniq` (`user_id`,`group_id`),
  KEY `e_attendance_user_groups_group_id_619fbf47_fk_auth_group_id` (`group_id`),
  CONSTRAINT `e_attendance_user_gr_user_id_72ffcb9f_fk_e_attenda` FOREIGN KEY (`user_id`) REFERENCES `e_attendance_user` (`id`),
  CONSTRAINT `e_attendance_user_groups_group_id_619fbf47_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_user_groups`
--

LOCK TABLES `e_attendance_user_groups` WRITE;
/*!40000 ALTER TABLE `e_attendance_user_groups` DISABLE KEYS */;
INSERT INTO `e_attendance_user_groups` VALUES (1,2,1),(2,3,1);
/*!40000 ALTER TABLE `e_attendance_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_user_user_permissions`
--

DROP TABLE IF EXISTS `e_attendance_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e_attendance_user_user_p_user_id_permission_id_59fb35c7_uniq` (`user_id`,`permission_id`),
  KEY `e_attendance_user_us_permission_id_469efe66_fk_auth_perm` (`permission_id`),
  CONSTRAINT `e_attendance_user_us_permission_id_469efe66_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `e_attendance_user_us_user_id_8760c3c8_fk_e_attenda` FOREIGN KEY (`user_id`) REFERENCES `e_attendance_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_user_user_permissions`
--

LOCK TABLES `e_attendance_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `e_attendance_user_user_permissions` DISABLE KEYS */;
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

-- Dump completed on 2022-11-15 10:38:43
