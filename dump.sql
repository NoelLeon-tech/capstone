-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'guardians'),(2,'instructors'),(1,'students');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,2,41),(2,2,42),(3,2,44);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_user'),(2,'Can change user',1,'change_user'),(3,'Can delete user',1,'delete_user'),(4,'Can view user',1,'view_user'),(5,'Can add course',2,'add_course'),(6,'Can change course',2,'change_course'),(7,'Can delete course',2,'delete_course'),(8,'Can view course',2,'view_course'),(9,'Can add department',3,'add_department'),(10,'Can change department',3,'change_department'),(11,'Can delete department',3,'delete_department'),(12,'Can view department',3,'view_department'),(13,'Can add subject',4,'add_subject'),(14,'Can change subject',4,'change_subject'),(15,'Can delete subject',4,'delete_subject'),(16,'Can view subject',4,'view_subject'),(17,'Can add admin',5,'add_admin'),(18,'Can change admin',5,'change_admin'),(19,'Can delete admin',5,'delete_admin'),(20,'Can view admin',5,'view_admin'),(21,'Can add guardian',6,'add_guardian'),(22,'Can change guardian',6,'change_guardian'),(23,'Can delete guardian',6,'delete_guardian'),(24,'Can view guardian',6,'view_guardian'),(25,'Can add student',7,'add_student'),(26,'Can change student',7,'change_student'),(27,'Can delete student',7,'delete_student'),(28,'Can view student',7,'view_student'),(29,'Can add student_ guardian',8,'add_student_guardian'),(30,'Can change student_ guardian',8,'change_student_guardian'),(31,'Can delete student_ guardian',8,'delete_student_guardian'),(32,'Can view student_ guardian',8,'view_student_guardian'),(33,'Can add instructor',9,'add_instructor'),(34,'Can change instructor',9,'change_instructor'),(35,'Can delete instructor',9,'delete_instructor'),(36,'Can view instructor',9,'view_instructor'),(37,'Can add class',10,'add_class'),(38,'Can change class',10,'change_class'),(39,'Can delete class',10,'delete_class'),(40,'Can view class',10,'view_class'),(41,'Can add attendance',11,'add_attendance'),(42,'Can change attendance',11,'change_attendance'),(43,'Can delete attendance',11,'delete_attendance'),(44,'Can view attendance',11,'view_attendance'),(45,'Can add class_ student',12,'add_class_student'),(46,'Can change class_ student',12,'change_class_student'),(47,'Can delete class_ student',12,'delete_class_student'),(48,'Can view class_ student',12,'view_class_student'),(49,'Can add log entry',13,'add_logentry'),(50,'Can change log entry',13,'change_logentry'),(51,'Can delete log entry',13,'delete_logentry'),(52,'Can view log entry',13,'view_logentry'),(53,'Can add permission',14,'add_permission'),(54,'Can change permission',14,'change_permission'),(55,'Can delete permission',14,'delete_permission'),(56,'Can view permission',14,'view_permission'),(57,'Can add group',15,'add_group'),(58,'Can change group',15,'change_group'),(59,'Can delete group',15,'delete_group'),(60,'Can view group',15,'view_group'),(61,'Can add content type',16,'add_contenttype'),(62,'Can change content type',16,'change_contenttype'),(63,'Can delete content type',16,'delete_contenttype'),(64,'Can view content type',16,'view_contenttype'),(65,'Can add session',17,'add_session'),(66,'Can change session',17,'change_session'),(67,'Can delete session',17,'delete_session'),(68,'Can view session',17,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_e_attendance_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_e_attendance_user_id` FOREIGN KEY (`user_id`) REFERENCES `e_attendance_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-11-20 06:22:37.986703','1','students',1,'[{\"added\": {}}]',15,1),(2,'2022-11-20 06:22:59.501326','2','instructors',1,'[{\"added\": {}}]',15,1),(3,'2022-11-20 06:23:09.229352','3','guardians',1,'[{\"added\": {}}]',15,1),(4,'2022-11-20 06:23:55.800017','2',' ',1,'[{\"added\": {}}]',1,1),(5,'2022-11-20 06:24:15.937147','2','James Sullivan',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]',1,1),(6,'2022-11-20 06:24:37.334678','3',' ',1,'[{\"added\": {}}]',1,1),(7,'2022-11-20 06:25:09.777177','3','Brian Haner',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]',1,1),(8,'2022-11-20 06:25:21.703618','4',' ',1,'[{\"added\": {}}]',1,1),(9,'2022-11-20 06:25:42.929703','4','Zachary Baker',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]',1,1),(10,'2022-11-20 06:25:47.662887','4','Zachary Baker',2,'[]',1,1),(11,'2022-11-20 06:25:59.618828','5',' ',1,'[{\"added\": {}}]',1,1),(12,'2022-11-20 06:26:26.833634','5','Matthew Sanders',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Staff status\", \"Groups\"]}}]',1,1),(13,'2022-11-20 06:27:10.807527','6',' ',1,'[{\"added\": {}}]',1,1),(14,'2022-11-20 06:27:35.758747','6','Jonathan Seward',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Staff status\", \"Groups\"]}}]',1,1),(15,'2022-11-20 06:27:54.036630','1','Computer Science',1,'[{\"added\": {}}]',2,1),(16,'2022-11-20 06:28:18.407808','2','Accountancy',1,'[{\"added\": {}}]',2,1),(17,'2022-11-20 06:28:48.591311','3','Civil Engineering',1,'[{\"added\": {}}]',2,1),(18,'2022-11-20 06:29:15.405191','1','Information Technology',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',2,1),(19,'2022-11-20 06:29:37.575294','1','English',1,'[{\"added\": {}}]',4,1),(20,'2022-11-20 06:29:48.814307','2','Algebra',1,'[{\"added\": {}}]',4,1),(21,'2022-11-20 06:30:24.954071','3','Web Programming',1,'[{\"added\": {}}]',4,1),(22,'2022-11-20 06:30:37.427843','4','Artificial Intelligence',1,'[{\"added\": {}}]',4,1),(23,'2022-11-20 06:31:46.943520','1','SITE',1,'[{\"added\": {}}]',3,1),(24,'2022-11-20 06:31:58.076554','2','SBA',1,'[{\"added\": {}}]',3,1),(25,'2022-11-20 06:32:06.114652','3','SOE',1,'[{\"added\": {}}]',3,1),(26,'2022-11-20 06:32:33.441557','6','Jonathan Seward',1,'[{\"added\": {}}]',9,1),(27,'2022-11-20 06:32:41.141325','5','Matthew Sanders',1,'[{\"added\": {}}]',9,1),(28,'2022-11-20 07:05:12.928755','3','Brian Haner',1,'[{\"added\": {}}]',7,1),(29,'2022-11-20 07:05:31.324951','2','James Sullivan',1,'[{\"added\": {}}]',7,1),(30,'2022-11-20 07:05:42.091405','4','Zachary Baker',1,'[{\"added\": {}}]',7,1),(31,'2022-11-20 12:28:34.916475','7',' ',1,'[{\"added\": {}}]',1,1),(32,'2022-11-20 12:28:53.747073','7','Brandon Boyd',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Staff status\", \"Groups\"]}}]',1,1),(33,'2022-11-20 12:29:13.486996','7','Brandon Boyd',1,'[{\"added\": {}}]',9,1),(34,'2022-11-20 12:32:43.444256','1','Algebra - Brandon Boyd',1,'[{\"added\": {}}]',10,1),(35,'2022-11-20 12:32:59.215333','2','Web Programming - Jonathan Seward',1,'[{\"added\": {}}]',10,1),(36,'2022-11-20 12:33:23.699979','3','Artificial Intelligence - Matthew Sanders',1,'[{\"added\": {}}]',10,1),(37,'2022-11-20 12:35:57.663714','2','Education',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',2,1),(38,'2022-11-20 12:36:55.047674','2','Accountancy',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',2,1),(39,'2022-11-20 12:37:45.632533','3','School of Engineering',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(40,'2022-11-20 12:37:57.354984','2','School of Accountancy',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(41,'2022-11-20 12:38:14.055829','1','School of Information Technology',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(42,'2022-11-20 12:38:22.527869','2','School of Education',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(43,'2022-11-20 12:39:05.185769','4','English - Jonathan Seward',1,'[{\"added\": {}}]',10,1),(44,'2022-11-20 12:39:26.278005','2','Web Programming - Matthew Sanders',2,'[{\"changed\": {\"fields\": [\"Instructor\"]}}]',10,1),(45,'2022-11-20 12:39:43.310318','1','Algebra - Brandon Boyd',2,'[{\"changed\": {\"fields\": [\"Semester\"]}}]',10,1),(46,'2022-11-20 12:40:13.391078','1','Class_Student object (1)',1,'[{\"added\": {}}]',12,1),(47,'2022-11-20 12:40:59.600042','2','Class_Student object (2)',1,'[{\"added\": {}}]',12,1),(48,'2022-11-20 12:41:20.332099','1','Class_Student object (1)',3,'',12,1),(49,'2022-11-20 12:42:15.955403','3','Class_Student object (3)',1,'[{\"added\": {}}]',12,1),(50,'2022-11-20 12:42:38.173966','4','Class_Student object (4)',1,'[{\"added\": {}}]',12,1),(51,'2022-11-20 12:43:55.141193','5','Class_Student object (5)',1,'[{\"added\": {}}]',12,1),(52,'2022-11-20 12:44:02.542126','6','Class_Student object (6)',1,'[{\"added\": {}}]',12,1),(53,'2022-11-20 12:44:09.464313','7','Class_Student object (7)',1,'[{\"added\": {}}]',12,1),(54,'2022-11-20 12:44:37.052989','8','Class_Student object (8)',1,'[{\"added\": {}}]',12,1),(55,'2022-11-20 12:44:44.516148','9','Class_Student object (9)',1,'[{\"added\": {}}]',12,1),(56,'2022-11-20 15:25:06.904436','10','Artificial Intelligence - Matthew Sanders - Brian Haner',1,'[{\"added\": {}}]',12,1),(57,'2022-11-20 15:25:53.505622','10','Artificial Intelligence - Matthew Sanders - Brian Haner',3,'',12,1),(58,'2022-11-20 15:26:29.639247','8',' ',1,'[{\"added\": {}}]',1,1),(59,'2022-11-20 15:26:41.920951','8','Arin Illejay',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]',1,1),(60,'2022-11-20 15:26:58.753960','8','Arin Illejay',1,'[{\"added\": {}}]',7,1),(61,'2022-11-20 15:27:16.421980','11','Artificial Intelligence - Matthew Sanders - Arin Illejay',1,'[{\"added\": {}}]',12,1),(62,'2022-11-22 07:33:17.083415','9','Saul Hudson',1,'[{\"added\": {}}]',1,1),(63,'2022-11-22 07:33:30.850585','9','Saul Hudson',1,'[{\"added\": {}}]',7,1),(64,'2022-11-22 07:34:14.023010','10','Myles Kennedy',1,'[{\"added\": {}}]',1,1),(65,'2022-11-22 07:34:24.233858','10','Myles Kennedy',1,'[{\"added\": {}}]',7,1),(66,'2022-11-22 07:35:02.646202','12','Artificial Intelligence - Matthew Sanders - Saul Hudson',1,'[{\"added\": {}}]',12,1),(67,'2022-11-22 07:35:15.219848','13','Artificial Intelligence - Matthew Sanders - Myles Kennedy',1,'[{\"added\": {}}]',12,1),(68,'2022-11-22 07:37:06.893773','9','Saul Hudson',2,'[{\"changed\": {\"fields\": [\"Block\"]}}]',7,1),(69,'2022-11-22 07:37:14.370113','10','Myles Kennedy',2,'[{\"changed\": {\"fields\": [\"Block\"]}}]',7,1),(70,'2022-11-24 04:23:20.079380','11','Tim Henson',1,'[{\"added\": {}}]',1,1),(71,'2022-11-24 04:25:44.796324','11','Tim Henson',1,'[{\"added\": {}}]',7,1),(72,'2022-11-24 04:25:58.686632','9','Saul Hudson',2,'[{\"changed\": {\"fields\": [\"Block\"]}}]',7,1),(73,'2022-11-24 04:27:12.997745','12','Scott Lepage',1,'[{\"added\": {}}]',1,1),(74,'2022-11-24 04:27:24.060858','12','Scott Lepage',1,'[{\"added\": {}}]',7,1),(75,'2022-11-24 04:28:57.833508','13','Ferris Eris',1,'[{\"added\": {}}]',1,1),(76,'2022-11-24 04:29:04.461493','13','Ferris Eris',1,'[{\"added\": {}}]',7,1),(77,'2022-11-24 04:29:45.652413','14','Layfon Alseif',1,'[{\"added\": {}}]',1,1),(78,'2022-11-24 04:29:56.172762','14','Layfon Alseif',1,'[{\"added\": {}}]',7,1),(79,'2022-11-24 04:31:11.639749','15','Nina Antalk',1,'[{\"added\": {}}]',1,1),(80,'2022-11-24 04:31:19.147154','15','Nina Antalk',1,'[{\"added\": {}}]',7,1),(81,'2022-11-24 04:32:34.612206','6','Jonathan Seward',2,'[{\"changed\": {\"fields\": [\"Department\"]}}]',9,1),(82,'2022-11-24 04:44:23.477362','16','Braun Haner',1,'[{\"added\": {}}]',1,1),(83,'2022-11-24 04:44:26.377158','16','Braun Haner',1,'[{\"added\": {}}]',6,1),(84,'2022-11-24 04:44:48.828662','1','Student_Guardian object (1)',1,'[{\"added\": {}}]',8,1),(85,'2022-11-24 04:53:55.591432','14','Artificial Intelligence - Matthew Sanders - Tim Henson',1,'[{\"added\": {}}]',12,1),(86,'2022-11-24 04:54:55.041735','15','Web Programming - Matthew Sanders - Arin Illejay',1,'[{\"added\": {}}]',12,1),(87,'2022-11-24 04:55:22.677994','16','Web Programming - Matthew Sanders - Tim Henson',1,'[{\"added\": {}}]',12,1),(88,'2022-11-24 04:55:31.249541','17','Web Programming - Matthew Sanders - Myles Kennedy',1,'[{\"added\": {}}]',12,1),(89,'2022-11-24 04:55:39.339014','18','Web Programming - Matthew Sanders - Saul Hudson',1,'[{\"added\": {}}]',12,1),(90,'2022-11-24 04:56:19.235378','19','English - Jonathan Seward - Tim Henson',1,'[{\"added\": {}}]',12,1),(91,'2022-11-24 04:56:29.396170','20','English - Jonathan Seward - Myles Kennedy',1,'[{\"added\": {}}]',12,1),(92,'2022-11-24 04:56:37.485216','21','English - Jonathan Seward - Saul Hudson',1,'[{\"added\": {}}]',12,1),(93,'2022-11-24 04:56:48.244310','22','English - Jonathan Seward - Arin Illejay',1,'[{\"added\": {}}]',12,1),(94,'2022-11-24 04:57:11.531352','23','English - Jonathan Seward - Ferris Eris',1,'[{\"added\": {}}]',12,1),(95,'2022-11-24 04:57:21.273886','24','English - Jonathan Seward - Scott Lepage',1,'[{\"added\": {}}]',12,1),(96,'2022-11-24 04:58:18.195692','25','English - Jonathan Seward - Layfon Alseif',1,'[{\"added\": {}}]',12,1),(97,'2022-11-24 04:58:24.582705','26','English - Jonathan Seward - Nina Antalk',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'admin','logentry'),(15,'auth','group'),(14,'auth','permission'),(16,'contenttypes','contenttype'),(5,'e_attendance','admin'),(11,'e_attendance','attendance'),(10,'e_attendance','class'),(12,'e_attendance','class_student'),(2,'e_attendance','course'),(3,'e_attendance','department'),(6,'e_attendance','guardian'),(9,'e_attendance','instructor'),(7,'e_attendance','student'),(8,'e_attendance','student_guardian'),(4,'e_attendance','subject'),(1,'e_attendance','user'),(17,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-20 06:21:10.821016'),(2,'contenttypes','0002_remove_content_type_name','2022-11-20 06:21:10.923017'),(3,'auth','0001_initial','2022-11-20 06:21:11.329016'),(4,'auth','0002_alter_permission_name_max_length','2022-11-20 06:21:11.418017'),(5,'auth','0003_alter_user_email_max_length','2022-11-20 06:21:11.434016'),(6,'auth','0004_alter_user_username_opts','2022-11-20 06:21:11.446015'),(7,'auth','0005_alter_user_last_login_null','2022-11-20 06:21:11.457017'),(8,'auth','0006_require_contenttypes_0002','2022-11-20 06:21:11.463016'),(9,'auth','0007_alter_validators_add_error_messages','2022-11-20 06:21:11.475016'),(10,'auth','0008_alter_user_username_max_length','2022-11-20 06:21:11.491017'),(11,'auth','0009_alter_user_last_name_max_length','2022-11-20 06:21:11.502016'),(12,'auth','0010_alter_group_name_max_length','2022-11-20 06:21:11.526016'),(13,'auth','0011_update_proxy_permissions','2022-11-20 06:21:11.538016'),(14,'auth','0012_alter_user_first_name_max_length','2022-11-20 06:21:11.552017'),(15,'e_attendance','0001_initial','2022-11-20 06:21:12.997671'),(16,'admin','0001_initial','2022-11-20 06:21:13.218672'),(17,'admin','0002_logentry_remove_auto_add','2022-11-20 06:21:13.240673'),(18,'admin','0003_logentry_add_action_flag_choices','2022-11-20 06:21:13.257671'),(19,'e_attendance','0002_alter_attendance__class','2022-11-20 06:21:13.408671'),(20,'e_attendance','0003_alter_attendance_time_in','2022-11-20 06:21:13.425672'),(21,'e_attendance','0004_alter_attendance_unique_together','2022-11-20 06:21:13.464673'),(22,'e_attendance','0005_remove_class_students_class_student','2022-11-20 06:21:13.691672'),(23,'e_attendance','0006_rename__class_attendance_classs_and_more','2022-11-20 06:21:13.905672'),(24,'sessions','0001_initial','2022-11-20 06:21:13.955409'),(25,'e_attendance','0007_rename_classs_attendance_cls_and_more','2022-11-21 05:42:16.952211'),(26,'e_attendance','0008_alter_attendance_day','2022-11-22 07:58:57.984295'),(27,'e_attendance','0009_alter_student_guardian_guardian_and_more','2022-11-24 11:08:53.457893');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6w8wtj0q3c8xjgauiouxozhm76g6frw0','.eJxVjDsOwyAQBe9CHSFgWbykTO8zIH4OTiKQjF1FuXtsyUXSvpl5b-b8tha39by4ObErM-zyuwUfn7keID18vTceW12XOfBD4SftfGwpv26n-3dQfC97HUAQWSPzJBGDkDKAVahwANQGKYJApUVWViMYaSyRSkA7DUOiSSb2-QKRoDWm:1oy9bo:z40a0ss6CnnXli1FbzgYevAB9N3QNy2pUb6E4W_liFs','2022-12-08 10:37:32.688282'),('9auv3qbon2mmaqz6q84fw6e9tdkko0lt','.eJxVjEEOwiAQRe_C2pCCFgaX7nsGMgMzUjU0Ke3KeHfbpAvd_vfef6uI61Li2niOY1ZXZdTpdyNMT647yA-s90mnqS7zSHpX9EGbHqbMr9vh_h0UbGWrO2OFmcBSEuzRGAQGssb1DiRZF9BhgiDCcO48GvSOUDabsr-EwOrzBQVSOPU:1oy9ty:RUAjJ55zzurGZRdnmNqkoSTRFVLszmbhzF7WqIfDb1g','2022-12-08 10:56:18.981569'),('lomnkksznjdngvhavap79osq5vwcjv3p','.eJxVjEEOwiAQRe_C2hDoAIJL9z0DGWBGqoYmpV0Z765NutDtf-_9l4i4rTVunZY4FXER2onT75gwP6jtpNyx3WaZ57YuU5K7Ig_a5TgXel4P9--gYq_fOmQC0IqdycDGD9kj-6w1WgBw1hlHgcCH5I0qZ5WYSZXBpAJkmZUV7w_9dTgP:1oyA0M:2vD4s-zg586XECH3v9AYfh3qfgLgHH1eu_5_ea1sxdw','2022-12-08 11:02:54.544663');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `e_attendance_attendance`
--

DROP TABLE IF EXISTS `e_attendance_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time_in` time(6) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `day` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `class_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e_attendance_attendance_class_id_student_id_date_2af46cb7_uniq` (`class_id`,`student_id`,`date`),
  KEY `e_attendance_attenda_student_id_d19d50bb_fk_e_attenda` (`student_id`),
  CONSTRAINT `e_attendance_attenda_class_id_76905aae_fk_e_attenda` FOREIGN KEY (`class_id`) REFERENCES `e_attendance_class` (`id`),
  CONSTRAINT `e_attendance_attenda_student_id_d19d50bb_fk_e_attenda` FOREIGN KEY (`student_id`) REFERENCES `e_attendance_student` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_attendance`
--

LOCK TABLES `e_attendance_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_attendance` VALUES (122,'18:42:41.989843','08:00:00.000000','09:30:00.000000','Thursday','2022-11-24',4,4),(124,'19:02:01.482854','08:00:00.000000','09:30:00.000000','Thursday','2022-11-24',4,3);
/*!40000 ALTER TABLE `e_attendance_attendance` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_class`
--

LOCK TABLES `e_attendance_class` WRITE;
/*!40000 ALTER TABLE `e_attendance_class` DISABLE KEYS */;
INSERT INTO `e_attendance_class` VALUES (1,2021,2,2,7),(2,2022,1,3,5),(3,2022,1,4,5),(4,2021,1,1,6);
/*!40000 ALTER TABLE `e_attendance_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_attendance_class_student`
--

DROP TABLE IF EXISTS `e_attendance_class_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_attendance_class_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `class_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e_attendance_class_student_class_id_student_id_6e29641b_uniq` (`class_id`,`student_id`),
  KEY `e_attendance_class_s_student_id_bf721002_fk_e_attenda` (`student_id`),
  CONSTRAINT `e_attendance_class_s_class_id_875fe4da_fk_e_attenda` FOREIGN KEY (`class_id`) REFERENCES `e_attendance_class` (`id`),
  CONSTRAINT `e_attendance_class_s_student_id_bf721002_fk_e_attenda` FOREIGN KEY (`student_id`) REFERENCES `e_attendance_student` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_class_student`
--

LOCK TABLES `e_attendance_class_student` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_student` DISABLE KEYS */;
INSERT INTO `e_attendance_class_student` VALUES (5,2,1),(6,3,1),(7,4,1),(8,4,2),(15,8,2),(18,9,2),(17,10,2),(16,11,2),(9,4,3),(11,8,3),(12,9,3),(13,10,3),(14,11,3),(2,2,4),(3,3,4),(4,4,4),(22,8,4),(21,9,4),(20,10,4),(19,11,4),(24,12,4),(23,13,4),(25,14,4),(26,15,4);
/*!40000 ALTER TABLE `e_attendance_class_student` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_course`
--

LOCK TABLES `e_attendance_course` WRITE;
/*!40000 ALTER TABLE `e_attendance_course` DISABLE KEYS */;
INSERT INTO `e_attendance_course` VALUES (1,'Information Technology'),(2,'Accountancy'),(3,'Civil Engineering');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_department`
--

LOCK TABLES `e_attendance_department` WRITE;
/*!40000 ALTER TABLE `e_attendance_department` DISABLE KEYS */;
INSERT INTO `e_attendance_department` VALUES (1,'School of Information Technology'),(2,'School of Education'),(3,'School of Engineering');
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
INSERT INTO `e_attendance_guardian` VALUES (16);
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
INSERT INTO `e_attendance_instructor` VALUES (5,1),(6,2),(7,3);
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
INSERT INTO `e_attendance_student` VALUES (2,4,1,2),(3,4,1,3),(4,4,1,1),(8,4,1,1),(9,4,1,1),(10,4,4,1),(11,4,4,1),(12,4,1,2),(13,4,1,2),(14,4,1,3),(15,4,1,3);
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
INSERT INTO `e_attendance_student_guardian` VALUES (1,'Father',16,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_subject`
--

LOCK TABLES `e_attendance_subject` WRITE;
/*!40000 ALTER TABLE `e_attendance_subject` DISABLE KEYS */;
INSERT INTO `e_attendance_subject` VALUES (1,'English'),(2,'Algebra'),(3,'Web Programming'),(4,'Artificial Intelligence');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_user`
--

LOCK TABLES `e_attendance_user` WRITE;
/*!40000 ALTER TABLE `e_attendance_user` DISABLE KEYS */;
INSERT INTO `e_attendance_user` VALUES (1,'pbkdf2_sha256$390000$lvAkI6OxiQoyddylYHVDoX$ue/R2IOIJaTyENh+khe30pURAJ90VDEJlKyCuIonSs8=','2022-11-24 10:56:18.977411',1,'admin','','','',1,1,'2022-11-20 06:21:35.255352',NULL),(2,'pbkdf2_sha256$390000$9m0I2NxlZ0aMO68z16Hb1X$1VRvHnJVXvl9++u/ceAYujd4z6QWoM9B3YmO1JCNqZU=',NULL,0,'the_rev','James','Sullivan','',0,1,'2022-11-20 06:23:55.000000',NULL),(3,'pbkdf2_sha256$390000$eH98rYxeaLoicLcrL8k57B$ZIhg/MWjHphlb5ZlSboVIKEOX4SBiad9hPDp7rthNko=','2022-11-24 10:54:43.899257',0,'syn_gates','Brian','Haner','',0,1,'2022-11-20 06:24:36.000000',NULL),(4,'pbkdf2_sha256$390000$DbNw7KLsQGMzNVimyRRoml$8rEFgAOniNcnSnVI1ENpF+DUnGNtSFT0Bouj9XSHvD0=','2022-11-24 07:29:45.518196',0,'zacky_v','Zachary','Baker','',0,1,'2022-11-20 06:25:21.000000',NULL),(5,'pbkdf2_sha256$390000$loV7XuJZeUc5P66BNi26XG$vuFsP2Jfr1SEa6R2chcwb8TvLaaaw/T9rWoPHz7TIjE=','2022-11-24 10:36:36.600029',0,'m_shadows','Matthew','Sanders','',1,1,'2022-11-20 06:25:59.000000',NULL),(6,'pbkdf2_sha256$390000$xo2mwqLVRoSBHAif9fGbPg$fv/hXpOeDjFOBdFBnJFqAIpHb6oR8C03WBar09nzrPU=','2022-11-24 10:37:32.684658',0,'johnny','Jonathan','Seward','',1,1,'2022-11-20 06:27:10.000000',NULL),(7,'pbkdf2_sha256$390000$08jhj6XGPJ7f7O4aL7JsB0$E5kPvDECwzwYkrigyYo1d1Rc7t9Gn/pxif9XdZXC3/c=',NULL,0,'brandon','Brandon','Boyd','',1,1,'2022-11-20 12:28:34.000000',NULL),(8,'pbkdf2_sha256$390000$ja4pwVqqfUpXgvQvaSysCJ$jo0mfBltmbaFtemrTYKHs+Q/xMADZx2hwQp2Tv8hFRQ=',NULL,0,'arin','Arin','Illejay','',0,1,'2022-11-20 15:26:29.000000',NULL),(9,'pbkdf2_sha256$390000$PqOsUt9HRQdPkVZePkdGJg$QIhKDBjG+7Uz8AmLXMj+AQ3q3Q2eDO2nGpMFARQd8IM=',NULL,0,'slash','Saul','Hudson','',0,1,'2022-11-22 07:32:18.000000',NULL),(10,'pbkdf2_sha256$390000$7VlMZJLqUUCZY8AoDrCR5Q$Y8NM+zde8XK/k2PBuNF7/Xj6vcWDt6Mpzv5LzFBecZ4=',NULL,0,'myles_kennedy','Myles','Kennedy','',0,1,'2022-11-22 07:33:34.000000',NULL),(11,'pbkdf2_sha256$390000$ZaaoDMLHTKqHszlC74vnmZ$FWr47iz38nHTj0xF1/F6XlTEJSaoRZw+5U2WalHSyGo=',NULL,0,'tim_henson','Tim','Henson','',0,1,'2022-11-24 04:22:34.000000',NULL),(12,'pbkdf2_sha256$390000$ZxHxkhPN0V0cf52VKf5q79$wn8kuihw8vYKzfAklxgakp+OMsFA6cnUiy4CoQW4MQA=',NULL,0,'scott_lepage','Scott','Lepage','',0,1,'2022-11-24 04:26:38.000000',NULL),(13,'pbkdf2_sha256$390000$bU0DZ5tzTRAUqghdC62wOC$5E/+KY2ZGTV0rVeGo8G/qho6K/5HyceQVTzMNbzKYXc=',NULL,0,'ferris_eris','Ferris','Eris','',0,1,'2022-11-24 04:28:26.000000',NULL),(14,'pbkdf2_sha256$390000$qIctpV4fMiqMOGL67S6JYN$1LOZbB+MYJa98BWJLGcfP5dM120PfxmJj47XiL4ne8A=',NULL,0,'layton','Layfon','Alseif','',0,1,'2022-11-24 04:29:18.000000',NULL),(15,'pbkdf2_sha256$390000$nP79u6j4PGeI8FrRhyJp4F$59AaDJcsalkWyWaGbjje5syJQCoAEQCc9WwnOn4Aa0g=',NULL,0,'nina_antalk','Nina','Antalk','',0,1,'2022-11-24 04:30:11.000000',NULL),(16,'pbkdf2_sha256$390000$V3Se67URqItsvVMtc5iU3K$Aqcoqcs/tH1IGJzCvk6YCXL5hDmNOXINRoJI2C85V1A=','2022-11-24 11:02:54.539663',0,'braun_haner','Braun','Haner','',0,1,'2022-11-24 04:43:45.000000',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_attendance_user_groups`
--

LOCK TABLES `e_attendance_user_groups` WRITE;
/*!40000 ALTER TABLE `e_attendance_user_groups` DISABLE KEYS */;
INSERT INTO `e_attendance_user_groups` VALUES (1,2,1),(2,3,1),(3,4,1),(4,5,2),(5,6,2),(6,7,2),(7,8,1),(8,9,1),(9,10,1),(10,11,1),(11,12,1),(12,13,1),(13,14,1),(14,15,1),(15,16,3);
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

-- Dump completed on 2022-11-24 19:10:35
