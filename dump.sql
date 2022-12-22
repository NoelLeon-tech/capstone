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
INSERT INTO `auth_group` VALUES (4,'admins'),(3,'guardians'),(1,'students'),(2,'teachers');
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
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_user'),(2,'Can change user',1,'change_user'),(3,'Can delete user',1,'delete_user'),(4,'Can view user',1,'view_user'),(5,'Can add class',2,'add_class'),(6,'Can change class',2,'change_class'),(7,'Can delete class',2,'delete_class'),(8,'Can view class',2,'view_class'),(9,'Can add course',3,'add_course'),(10,'Can change course',3,'change_course'),(11,'Can delete course',3,'delete_course'),(12,'Can view course',3,'view_course'),(13,'Can add department',4,'add_department'),(14,'Can change department',4,'change_department'),(15,'Can delete department',4,'delete_department'),(16,'Can view department',4,'view_department'),(17,'Can add subject',5,'add_subject'),(18,'Can change subject',5,'change_subject'),(19,'Can delete subject',5,'delete_subject'),(20,'Can view subject',5,'view_subject'),(21,'Can add track',6,'add_track'),(22,'Can change track',6,'change_track'),(23,'Can delete track',6,'delete_track'),(24,'Can view track',6,'view_track'),(25,'Can add student_ guardian',7,'add_student_guardian'),(26,'Can change student_ guardian',7,'change_student_guardian'),(27,'Can delete student_ guardian',7,'delete_student_guardian'),(28,'Can view student_ guardian',7,'view_student_guardian'),(29,'Can add strand',8,'add_strand'),(30,'Can change strand',8,'change_strand'),(31,'Can delete strand',8,'delete_strand'),(32,'Can view strand',8,'view_strand'),(33,'Can add class_ schedule',9,'add_class_schedule'),(34,'Can change class_ schedule',9,'change_class_schedule'),(35,'Can delete class_ schedule',9,'delete_class_schedule'),(36,'Can view class_ schedule',9,'view_class_schedule'),(37,'Can add teacher',10,'add_teacher'),(38,'Can change teacher',10,'change_teacher'),(39,'Can delete teacher',10,'delete_teacher'),(40,'Can view teacher',10,'view_teacher'),(41,'Can add student',11,'add_student'),(42,'Can change student',11,'change_student'),(43,'Can delete student',11,'delete_student'),(44,'Can view student',11,'view_student'),(45,'Can add class_ student',12,'add_class_student'),(46,'Can change class_ student',12,'change_class_student'),(47,'Can delete class_ student',12,'delete_class_student'),(48,'Can view class_ student',12,'view_class_student'),(49,'Can add attendance',13,'add_attendance'),(50,'Can change attendance',13,'change_attendance'),(51,'Can delete attendance',13,'delete_attendance'),(52,'Can view attendance',13,'view_attendance'),(53,'Can add log entry',14,'add_logentry'),(54,'Can change log entry',14,'change_logentry'),(55,'Can delete log entry',14,'delete_logentry'),(56,'Can view log entry',14,'view_logentry'),(57,'Can add permission',15,'add_permission'),(58,'Can change permission',15,'change_permission'),(59,'Can delete permission',15,'delete_permission'),(60,'Can view permission',15,'view_permission'),(61,'Can add group',16,'add_group'),(62,'Can change group',16,'change_group'),(63,'Can delete group',16,'delete_group'),(64,'Can view group',16,'view_group'),(65,'Can add content type',17,'add_contenttype'),(66,'Can change content type',17,'change_contenttype'),(67,'Can delete content type',17,'delete_contenttype'),(68,'Can view content type',17,'view_contenttype'),(69,'Can add session',18,'add_session'),(70,'Can change session',18,'change_session'),(71,'Can delete session',18,'delete_session'),(72,'Can view session',18,'view_session'),(73,'Can add student_ attendance',19,'add_student_attendance'),(74,'Can change student_ attendance',19,'change_student_attendance'),(75,'Can delete student_ attendance',19,'delete_student_attendance'),(76,'Can view student_ attendance',19,'view_student_attendance'),(77,'Can add teacher_ attendance',20,'add_teacher_attendance'),(78,'Can change teacher_ attendance',20,'change_teacher_attendance'),(79,'Can delete teacher_ attendance',20,'delete_teacher_attendance'),(80,'Can view teacher_ attendance',20,'view_teacher_attendance'),(81,'Can add employee_ attendance',21,'add_employee_attendance'),(82,'Can change employee_ attendance',21,'change_employee_attendance'),(83,'Can delete employee_ attendance',21,'delete_employee_attendance'),(84,'Can view employee_ attendance',21,'view_employee_attendance'),(85,'Can add message',22,'add_message'),(86,'Can change message',22,'change_message'),(87,'Can delete message',22,'delete_message'),(88,'Can view message',22,'view_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-12-05 07:55:47.002476','9','Entrepreneurship - Scott Lepage',3,'',2,1),(2,'2022-12-05 07:55:47.006191','8','Physical Science - Zachary Baker',3,'',2,1),(3,'2022-12-05 07:55:47.009175','7','21st Century Literature - Zachary Baker',3,'',2,1),(4,'2022-12-05 07:55:47.013148','6','Entrepreneurship - Zachary Baker',3,'',2,1),(5,'2022-12-05 07:55:47.016129','5','Entrepreneurship - Zachary Baker',3,'',2,1),(6,'2022-12-05 07:56:32.193518','10','English - Brandon Boyd',1,'[{\"added\": {}}]',2,1),(7,'2022-12-05 07:57:04.616058','11','English - Brandon Boyd',1,'[{\"added\": {}}]',2,1),(8,'2022-12-05 07:57:41.377990','12','Algebra - Brandon Boyd',1,'[{\"added\": {}}]',2,1),(9,'2022-12-05 07:58:24.818589','13','General Mathematics - Brandon Boyd',1,'[{\"added\": {}}]',2,1),(10,'2022-12-05 07:59:51.089890','23','English - Brandon Boyd - Tim Henson',1,'[{\"added\": {}}]',12,1),(11,'2022-12-05 08:00:03.770114','24','English - Brandon Boyd - Scott Lepage',1,'[{\"added\": {}}]',12,1),(12,'2022-12-05 08:00:17.976846','25','English - Brandon Boyd - Arin Illejay',1,'[{\"added\": {}}]',12,1),(13,'2022-12-05 08:00:29.361256','26','English - Brandon Boyd - Zachary Baker',1,'[{\"added\": {}}]',12,1),(14,'2022-12-05 08:00:51.378420','27','English - Brandon Boyd - James Sullivan',1,'[{\"added\": {}}]',12,1),(15,'2022-12-05 08:01:00.935770','28','General Mathematics - Brandon Boyd - Eren Yeager',1,'[{\"added\": {}}]',12,1),(16,'2022-12-05 08:03:32.909591','6','Wednesday: 08:00 AM - 09:30 AM',1,'[{\"added\": {}}]',9,1),(17,'2022-12-05 14:06:01.383269','21','Erwin Smirh',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Block\"]}}]',11,1),(18,'2022-12-05 14:06:13.369279','20','Annie Leonhart',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Block\"]}}]',11,1),(19,'2022-12-05 14:06:23.623440','19','Jean Kirstein',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Block\"]}}]',11,1),(20,'2022-12-05 14:06:35.467711','18','Eren Yeager',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Block\"]}}]',11,1),(21,'2022-12-05 14:06:59.476383','17','Sebas Chan',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Strand\", \"Block\"]}}]',11,1),(22,'2022-12-05 14:07:25.332609','12','Scott Lepage',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Block\"]}}]',11,1),(23,'2022-12-05 14:07:36.850293','11','Tim Henson',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Block\"]}}]',11,1),(24,'2022-12-05 14:07:47.715264','8','Arin Illejay',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Block\"]}}]',11,1),(25,'2022-12-05 14:07:59.381878','4','Zachary Baker',2,'[{\"changed\": {\"fields\": [\"Student type\", \"Block\"]}}]',11,1),(26,'2022-12-05 14:08:27.110063','21','Erwin Smith',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',1,1),(27,'2022-12-05 14:08:33.184301','21','Erwin Smith',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',11,1),(28,'2022-12-05 14:08:38.950121','20','Annie Leonhart',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',11,1),(29,'2022-12-05 14:08:45.258412','19','Jean Kirstein',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',11,1),(30,'2022-12-05 14:08:54.338591','18','Eren Yeager',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',11,1),(31,'2022-12-05 14:09:02.124682','17','Sebas Chan',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',11,1),(32,'2022-12-05 14:09:10.608124','12','Scott Lepage',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',11,1),(33,'2022-12-05 14:09:24.857851','11','Tim Henson',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',11,1),(34,'2022-12-05 14:12:42.641202','11','Tim Henson',2,'[]',11,1),(35,'2022-12-05 14:25:47.314521','14','Artificial Intelligence - Jonathan Seward',1,'[{\"added\": {}}]',2,1),(36,'2022-12-05 14:26:06.961886','15','Data Structures and Algorithms - Matthew Sanders',1,'[{\"added\": {}}]',2,1),(37,'2022-12-05 14:27:00.564438','29','Artificial Intelligence - Jonathan Seward - James Sullivan',1,'[{\"added\": {}}]',12,1),(38,'2022-12-05 14:27:17.212091','30','Artificial Intelligence - Jonathan Seward - Zachary Baker',1,'[{\"added\": {}}]',12,1),(39,'2022-12-05 14:27:24.191957','31','Artificial Intelligence - Jonathan Seward - Tim Henson',1,'[{\"added\": {}}]',12,1),(40,'2022-12-05 14:27:34.961914','32','Artificial Intelligence - Jonathan Seward - Scott Lepage',1,'[{\"added\": {}}]',12,1),(41,'2022-12-05 14:30:46.789394','33','Artificial Intelligence - Jonathan Seward - Arin Illejay',1,'[{\"added\": {}}]',12,1),(42,'2022-12-06 05:43:51.645881','1','John Doe',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',1,1),(43,'2022-12-08 14:24:16.779119','1','Kel Ancelo',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',1,1),(44,'2022-12-08 15:46:56.967613','7','Saturday: 03:00 PM - 04:00 PM',1,'[{\"added\": {}}]',9,1),(45,'2022-12-08 17:08:03.113191','1','Employee_Attendance object (1)',3,'',21,1),(46,'2022-12-08 17:11:54.761352','2','Employee_Attendance object (2)',3,'',21,1),(47,'2022-12-08 17:13:46.569127','3','Employee_Attendance object (3)',3,'',21,1),(48,'2022-12-10 10:36:31.574419','34','English - Brandon Boyd - Brian Haner',1,'[{\"added\": {}}]',12,1),(49,'2022-12-10 10:37:05.109779','35','English - Brandon Boyd - Myles Kennedy',1,'[{\"added\": {}}]',12,1),(50,'2022-12-10 10:37:14.966594','36','English - Brandon Boyd - Ferris Eris',1,'[{\"added\": {}}]',12,1),(51,'2022-12-10 10:40:58.665423','1','Student_Guardian object (1)',1,'[{\"added\": {}}]',7,1),(52,'2022-12-12 14:11:50.692267','16','Vladimir Putin',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\"]}}]',1,1),(53,'2022-12-12 14:12:27.484898','1','Student_Guardian object (1)',2,'[{\"changed\": {\"fields\": [\"Student\"]}}]',7,1),(54,'2022-12-13 14:51:22.758404','16','Algebra - Brandon Boyd',1,'[{\"added\": {}}]',2,1),(55,'2022-12-13 14:52:38.936259','37','Algebra - Brandon Boyd - James Sullivan',1,'[{\"added\": {}}]',12,1),(56,'2022-12-13 14:52:46.582229','38','Algebra - Brandon Boyd - Scott Lepage',1,'[{\"added\": {}}]',12,1),(57,'2022-12-13 14:52:55.049150','39','Algebra - Brandon Boyd - Tim Henson',1,'[{\"added\": {}}]',12,1),(58,'2022-12-13 14:53:06.398938','40','Algebra - Brandon Boyd - Arin Illejay',1,'[{\"added\": {}}]',12,1),(59,'2022-12-13 14:53:13.291436','41','Algebra - Brandon Boyd - Zachary Baker',1,'[{\"added\": {}}]',12,1),(60,'2022-12-14 04:50:24.080725','9','Message object (9)',3,'',22,1),(61,'2022-12-14 04:50:24.096353','8','Message object (8)',3,'',22,1),(62,'2022-12-14 04:50:24.111973','7','Message object (7)',3,'',22,1),(63,'2022-12-14 04:50:24.111973','6','Message object (6)',3,'',22,1),(64,'2022-12-14 04:50:24.111973','5','Message object (5)',3,'',22,1),(65,'2022-12-14 04:50:24.111973','4','Message object (4)',3,'',22,1),(66,'2022-12-14 04:50:24.111973','3','Message object (3)',3,'',22,1),(67,'2022-12-14 04:50:24.127594','2','Message object (2)',3,'',22,1),(68,'2022-12-14 04:50:24.127594','1','Message object (1)',3,'',22,1),(69,'2022-12-14 04:53:16.789377','13','Message object (13)',3,'',22,1),(70,'2022-12-14 04:53:16.799451','12','Message object (12)',3,'',22,1),(71,'2022-12-14 04:53:16.801485','11','Message object (11)',3,'',22,1),(72,'2022-12-14 04:53:16.801485','10','Message object (10)',3,'',22,1),(73,'2022-12-14 05:28:21.816613','17','Message object (17)',3,'',22,1),(74,'2022-12-14 05:28:21.844312','16','Message object (16)',3,'',22,1),(75,'2022-12-14 05:28:21.892569','15','Message object (15)',3,'',22,1),(76,'2022-12-14 05:28:21.895706','14','Message object (14)',3,'',22,1),(77,'2022-12-15 07:55:59.386515','2','Student_Guardian object (2)',1,'[{\"added\": {}}]',7,1),(78,'2022-12-19 08:02:36.567667','6','Student_Attendance object (6)',3,'',19,1),(79,'2022-12-19 08:12:28.143978','8','Student_Attendance object (8)',3,'',19,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'admin','logentry'),(16,'auth','group'),(15,'auth','permission'),(17,'contenttypes','contenttype'),(13,'e_attendance','attendance'),(2,'e_attendance','class'),(9,'e_attendance','class_schedule'),(12,'e_attendance','class_student'),(3,'e_attendance','course'),(4,'e_attendance','department'),(21,'e_attendance','employee_attendance'),(22,'e_attendance','message'),(8,'e_attendance','strand'),(11,'e_attendance','student'),(19,'e_attendance','student_attendance'),(7,'e_attendance','student_guardian'),(5,'e_attendance','subject'),(10,'e_attendance','teacher'),(20,'e_attendance','teacher_attendance'),(6,'e_attendance','track'),(1,'e_attendance','user'),(18,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-05 07:52:31.852161'),(2,'contenttypes','0002_remove_content_type_name','2022-12-05 07:52:32.115111'),(3,'auth','0001_initial','2022-12-05 07:52:32.553801'),(4,'auth','0002_alter_permission_name_max_length','2022-12-05 07:52:32.685281'),(5,'auth','0003_alter_user_email_max_length','2022-12-05 07:52:32.700903'),(6,'auth','0004_alter_user_username_opts','2022-12-05 07:52:32.723032'),(7,'auth','0005_alter_user_last_login_null','2022-12-05 07:52:32.723032'),(8,'auth','0006_require_contenttypes_0002','2022-12-05 07:52:32.738662'),(9,'auth','0007_alter_validators_add_error_messages','2022-12-05 07:52:32.754283'),(10,'auth','0008_alter_user_username_max_length','2022-12-05 07:52:32.754283'),(11,'auth','0009_alter_user_last_name_max_length','2022-12-05 07:52:32.769903'),(12,'auth','0010_alter_group_name_max_length','2022-12-05 07:52:32.801142'),(13,'auth','0011_update_proxy_permissions','2022-12-05 07:52:32.816763'),(14,'auth','0012_alter_user_first_name_max_length','2022-12-05 07:52:32.823272'),(15,'e_attendance','0001_initial','2022-12-05 07:52:35.344959'),(16,'admin','0001_initial','2022-12-05 07:52:35.529802'),(17,'admin','0002_logentry_remove_auto_add','2022-12-05 07:52:35.545433'),(18,'admin','0003_logentry_add_action_flag_choices','2022-12-05 07:52:35.576675'),(19,'sessions','0001_initial','2022-12-05 07:52:35.630042'),(20,'e_attendance','0002_student_attendance_teacher_attendance_and_more','2022-12-05 08:25:31.215456'),(21,'e_attendance','0003_alter_student_attendance_cls','2022-12-05 08:33:10.352274'),(22,'e_attendance','0004_employee_attendance_delete_teacher_attendance','2022-12-08 14:18:48.996349'),(23,'e_attendance','0005_alter_employee_attendance_time_out','2022-12-08 17:05:58.989247'),(24,'e_attendance','0006_alter_student_guardian_guardian','2022-12-10 12:33:16.240938'),(25,'e_attendance','0007_message','2022-12-13 17:13:04.360222'),(26,'e_attendance','0008_alter_class_student_cls_alter_class_student_student_and_more','2022-12-17 16:02:07.349299'),(27,'e_attendance','0009_alter_class_schedule_cls_and_more','2022-12-18 14:17:50.881973');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3dg0k51uixn3zddy5int0t2d9nbxith3','.eJxVjEEOwiAQRe_C2hDoAIJL9z0DGWBGqoYmpV0Z765NutDtf-_9l4i4rTVunZY4FXER2onT75gwP6jtpNyx3WaZ57YuU5K7Ig_a5TgXel4P9--gYq_fOmQC0IqdycDGD9kj-6w1WgBw1hlHgcCH5I0qZ5WYSZXBpAJkmZUV7w_9dTgP:1p56VR:EZDEeMsKmKfDHyBxQPtHN871iEp2c6M3jH8XVE1H27g','2022-12-27 14:43:41.022911'),('6rq0vo0u0aqb76ug7b4j1kuhz04lqesh','.eJxVjEEOwiAQRe_C2hDoAIJL9z0DGWBGqoYmpV0Z765NutDtf-_9l4i4rTVunZY4FXER2onT75gwP6jtpNyx3WaZ57YuU5K7Ig_a5TgXel4P9--gYq_fOmQC0IqdycDGD9kj-6w1WgBw1hlHgcCH5I0qZ5WYSZXBpAJkmZUV7w_9dTgP:1p7aB0:L_QRErcOpN8RaR0H8_ZR6txjopnLHMTdk3cwJ7a-9D8','2023-01-03 10:48:50.079003'),('btjqbcrm231zrdfulg7pexn75a5s9e8o','.eJxVjEEOwiAQRe_C2pCCFgaX7nsGMgMzUjU0Ke3KeHfbpAvd_vfef6uI61Li2niOY1ZXZdTpdyNMT647yA-s90mnqS7zSHpX9EGbHqbMr9vh_h0UbGWrO2OFmcBSEuzRGAQGssb1DiRZF9BhgiDCcO48GvSOUDabsr-EwOrzBQVSOPU:1p3xB6:q3zfTkevkHbO09PsuvOelAhABYt8c59lN1EW-UqLaKQ','2022-12-24 10:33:56.542582'),('e8yea3205c230s07q675qmln4qupf8pt','.eJxVjEEOwiAQRe_C2hDoAIJL9z0DGWBGqoYmpV0Z765NutDtf-_9l4i4rTVunZY4FXER2onT75gwP6jtpNyx3WaZ57YuU5K7Ig_a5TgXel4P9--gYq_fOmQC0IqdycDGD9kj-6w1WgBw1hlHgcCH5I0qZ5WYSZXBpAJkmZUV7w_9dTgP:1p4dMN:Tv8_DSkh5BqcC2e2uRvPfpu4yo_yCifpjZBSBnaAyPc','2022-12-26 07:36:23.277686'),('g2spd3fw7vavexaydvhyzcyjnvepjxyx','.eJxVjEEOwiAQRe_C2hDoAIJL9z0DGWBGqoYmpV0Z765NutDtf-_9l4i4rTVunZY4FXER2onT75gwP6jtpNyx3WaZ57YuU5K7Ig_a5TgXel4P9--gYq_fOmQC0IqdycDGD9kj-6w1WgBw1hlHgcCH5I0qZ5WYSZXBpAJkmZUV7w_9dTgP:1p8DZk:-TTWMGgaavUt2QNKuCHTVHRO2a_hgBoZPtqNV-tZ97M','2023-01-05 04:53:00.159050'),('it84zofill05xl62nkmkpmizomzvpzi5','.eJxVjEEOwiAQRe_C2hCgdACX7nsGMsNQqRqalHZlvLtt0oVu_3vvv0XEbS1xa3mJE4urcOLyuxGmZ64H4AfW-yzTXNdlInko8qRNDjPn1-10_w4KtrLXgawdQRMppRwG8t4a9tqSMqiC8Tqw7gLB2OvgILnkgQGw65PzdjfE5wvBDTbC:1p7XEX:x3Z57mqxCrDNBg-PwVYEowQziWkNQeYWNBn3Oc0opHw','2023-01-03 07:40:17.506029'),('u6cosm71buj9jfgyvgejwqx2vfu9qvsb','.eJxVjEEOwiAQRe_C2hCgdACX7nsGMsNQqRqalHZlvLtt0oVu_3vvv0XEbS1xa3mJE4urcOLyuxGmZ64H4AfW-yzTXNdlInko8qRNDjPn1-10_w4KtrLXgawdQRMppRwG8t4a9tqSMqiC8Tqw7gLB2OvgILnkgQGw65PzdjfE5wvBDTbC:1p26RE:sCuhK11FjoFJNw7E6aPv8vWlDqJUo8yfvEcLsJpOljE','2022-12-19 08:02:56.685273'),('wj9oyu3zvmmfke271q2g6tyvgbecy13u','.eJxVjEEOwiAQRe_C2hDoAIJL9z0DGWBGqoYmpV0Z765NutDtf-_9l4i4rTVunZY4FXER2onT75gwP6jtpNyx3WaZ57YuU5K7Ig_a5TgXel4P9--gYq_fOmQC0IqdycDGD9kj-6w1WgBw1hlHgcCH5I0qZ5WYSZXBpAJkmZUV7w_9dTgP:1p4IZK:5I94N2JMVlHsuD7UbJZDZFto_Ilx4kZobybKY3bsZTU','2022-12-25 09:24:22.188748'),('y4eseakopr6tkvcvys3437bt107sqjgy','.eJxVjEEOwiAQRe_C2pCCFgaX7nsGMgMzUjU0Ke3KeHfbpAvd_vfef6uI61Li2niOY1ZXZdTpdyNMT647yA-s90mnqS7zSHpX9EGbHqbMr9vh_h0UbGWrO2OFmcBSEuzRGAQGssb1DiRZF9BhgiDCcO48GvSOUDabsr-EwOrzBQVSOPU:1p6uUo:41RB5MsB3eEVY7uq-2o5-G9XQPAHNv7UlSayVCJgLlM','2023-01-01 14:18:30.941170');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class`
--

LOCK TABLES `e_attendance_class` WRITE;
/*!40000 ALTER TABLE `e_attendance_class` DISABLE KEYS */;
INSERT INTO `e_attendance_class` VALUES (10,4,1,2022,1,1,NULL,1,7),(11,4,1,2022,1,2,NULL,1,7),(12,4,1,2022,1,3,NULL,2,7),(13,12,1,2022,1,NULL,7,9,7),(14,4,1,2022,2,1,NULL,4,6),(15,4,1,2022,2,1,NULL,3,5),(16,4,1,2022,2,1,NULL,2,7);
/*!40000 ALTER TABLE `e_attendance_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class_schedule`
--

LOCK TABLES `e_attendance_class_schedule` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_schedule` DISABLE KEYS */;
INSERT INTO `e_attendance_class_schedule` VALUES (6,'08:00:00.000000','09:30:00.000000','Wednesday',13),(7,'15:00:00.000000','16:00:00.000000','Saturday',10);
/*!40000 ALTER TABLE `e_attendance_class_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_class_student`
--

LOCK TABLES `e_attendance_class_student` WRITE;
/*!40000 ALTER TABLE `e_attendance_class_student` DISABLE KEYS */;
INSERT INTO `e_attendance_class_student` VALUES (27,10,2),(26,10,4),(25,10,8),(23,10,11),(24,10,12),(34,11,3),(35,11,10),(36,11,13),(28,13,18),(29,14,2),(30,14,4),(33,14,8),(31,14,11),(32,14,12),(37,16,2),(41,16,4),(40,16,8),(39,16,11),(38,16,12);
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
-- Dumping data for table `e_attendance_employee_attendance`
--

LOCK TABLES `e_attendance_employee_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_employee_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_employee_attendance` VALUES (4,'20:59:52.226070','21:00:21.223000','2022-12-10','Late',1),(5,'22:57:16.068078','22:58:06.295347','2022-12-18','Late',1);
/*!40000 ALTER TABLE `e_attendance_employee_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_message`
--

LOCK TABLES `e_attendance_message` WRITE;
/*!40000 ALTER TABLE `e_attendance_message` DISABLE KEYS */;
INSERT INTO `e_attendance_message` VALUES (18,'hello','2022-12-15 08:20:10.646439',1,7,16),(19,'hi','2022-12-15 09:00:10.677604',1,16,7),(20,'ho','2022-12-15 09:00:26.757684',1,7,16),(21,'sup','2022-12-15 09:11:19.920147',1,7,16),(22,'good 2:46 pm','2022-12-20 06:46:10.304537',1,7,16),(23,'?','2022-12-20 06:46:31.236759',1,16,7),(24,'sup shorty?','2022-12-20 06:47:25.282066',1,6,16),(25,'./.','2022-12-20 06:47:55.794477',1,16,6),(26,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, perspiciatis, consequuntur aliquid, commodi culpa in porro nobis reiciendis debitis dolor distinctio exercitationem? Iste incidunt molestiae minus voluptates fuga rem obcaecati! Temporibus excepturi perspiciatis recusandae dolorem quo repellendus vitae ratione voluptas possimus est exercitationem dolore quisquam iusto veniam quae, explicabo omnis. Enim dolore sequi eius accusamus animi non excepturi nulla voluptas.','2022-12-20 06:53:45.007046',1,6,16),(27,'seize the day','2022-12-20 11:07:26.645099',1,6,16);
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
-- Dumping data for table `e_attendance_student_attendance`
--

LOCK TABLES `e_attendance_student_attendance` WRITE;
/*!40000 ALTER TABLE `e_attendance_student_attendance` DISABLE KEYS */;
INSERT INTO `e_attendance_student_attendance` VALUES (1,'16:36:59.076761','2022-12-05','Late',6,13,18),(4,'23:48:05.155496','2022-12-08','Late',7,10,4);
/*!40000 ALTER TABLE `e_attendance_student_attendance` ENABLE KEYS */;
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
-- Dumping data for table `e_attendance_teacher`
--

LOCK TABLES `e_attendance_teacher` WRITE;
/*!40000 ALTER TABLE `e_attendance_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_attendance_teacher` ENABLE KEYS */;
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
INSERT INTO `e_attendance_user` VALUES (1,'pbkdf2_sha256$390000$lvAkI6OxiQoyddylYHVDoX$ue/R2IOIJaTyENh+khe30pURAJ90VDEJlKyCuIonSs8=','2022-12-18 14:55:32.278234',1,'admin','Kel','Ancelo','',1,1,'2022-11-20 06:21:35.000000',NULL),(2,'pbkdf2_sha256$390000$9m0I2NxlZ0aMO68z16Hb1X$1VRvHnJVXvl9++u/ceAYujd4z6QWoM9B3YmO1JCNqZU=','2022-12-07 15:30:47.817714',0,'the_rev','James','Sullivan','',0,1,'2022-11-20 06:23:55.000000',NULL),(3,'pbkdf2_sha256$390000$eH98rYxeaLoicLcrL8k57B$ZIhg/MWjHphlb5ZlSboVIKEOX4SBiad9hPDp7rthNko=','2022-12-10 10:40:09.435202',0,'syn_gates','Brian','Haner','',0,1,'2022-11-20 06:24:36.000000',NULL),(4,'pbkdf2_sha256$390000$DbNw7KLsQGMzNVimyRRoml$8rEFgAOniNcnSnVI1ENpF+DUnGNtSFT0Bouj9XSHvD0=','2022-12-19 07:40:33.564770',0,'zacky_v','Zachary','Baker','',0,1,'2022-11-20 06:25:21.000000',NULL),(5,'pbkdf2_sha256$390000$loV7XuJZeUc5P66BNi26XG$vuFsP2Jfr1SEa6R2chcwb8TvLaaaw/T9rWoPHz7TIjE=','2022-11-24 10:36:36.000000',0,'m_shadows','Matthew','Sanders','',1,1,'2022-11-20 06:25:59.000000',NULL),(6,'pbkdf2_sha256$390000$xo2mwqLVRoSBHAif9fGbPg$fv/hXpOeDjFOBdFBnJFqAIpHb6oR8C03WBar09nzrPU=','2022-12-20 11:06:13.904930',0,'johnny','Jonathan','Seward','',1,1,'2022-11-20 06:27:10.000000',NULL),(7,'pbkdf2_sha256$390000$08jhj6XGPJ7f7O4aL7JsB0$E5kPvDECwzwYkrigyYo1d1Rc7t9Gn/pxif9XdZXC3/c=','2022-12-20 11:02:57.157621',0,'brandon','Brandon','Boyd','',1,1,'2022-11-20 12:28:34.000000',NULL),(8,'pbkdf2_sha256$390000$ja4pwVqqfUpXgvQvaSysCJ$jo0mfBltmbaFtemrTYKHs+Q/xMADZx2hwQp2Tv8hFRQ=',NULL,0,'arin','Arin','Illejay','',0,1,'2022-11-20 15:26:29.000000',NULL),(9,'pbkdf2_sha256$390000$PqOsUt9HRQdPkVZePkdGJg$QIhKDBjG+7Uz8AmLXMj+AQ3q3Q2eDO2nGpMFARQd8IM=',NULL,0,'slash','Saul','Hudson','',0,1,'2022-11-22 07:32:18.000000',NULL),(10,'pbkdf2_sha256$390000$7VlMZJLqUUCZY8AoDrCR5Q$Y8NM+zde8XK/k2PBuNF7/Xj6vcWDt6Mpzv5LzFBecZ4=',NULL,0,'myles_kennedy','Myles','Kennedy','',0,1,'2022-11-22 07:33:34.000000',NULL),(11,'pbkdf2_sha256$390000$ZaaoDMLHTKqHszlC74vnmZ$FWr47iz38nHTj0xF1/F6XlTEJSaoRZw+5U2WalHSyGo=',NULL,0,'tim_henson','Tim','Henson','',0,1,'2022-11-24 04:22:34.000000',NULL),(12,'pbkdf2_sha256$390000$ZxHxkhPN0V0cf52VKf5q79$wn8kuihw8vYKzfAklxgakp+OMsFA6cnUiy4CoQW4MQA=',NULL,0,'scott_lepage','Scott','Lepage','',0,1,'2022-11-24 04:26:38.000000',NULL),(13,'pbkdf2_sha256$390000$bU0DZ5tzTRAUqghdC62wOC$5E/+KY2ZGTV0rVeGo8G/qho6K/5HyceQVTzMNbzKYXc=',NULL,0,'ferris_eris','Ferris','Eris','',0,1,'2022-11-24 04:28:26.000000',NULL),(14,'pbkdf2_sha256$390000$qIctpV4fMiqMOGL67S6JYN$1LOZbB+MYJa98BWJLGcfP5dM120PfxmJj47XiL4ne8A=',NULL,0,'layton','Layfon','Alseif','',0,1,'2022-11-24 04:29:18.000000',NULL),(15,'pbkdf2_sha256$390000$nP79u6j4PGeI8FrRhyJp4F$59AaDJcsalkWyWaGbjje5syJQCoAEQCc9WwnOn4Aa0g=',NULL,0,'nina_antalk','Nina','Antalk','',0,1,'2022-11-24 04:30:11.000000',NULL),(16,'pbkdf2_sha256$390000$V3Se67URqItsvVMtc5iU3K$Aqcoqcs/tH1IGJzCvk6YCXL5hDmNOXINRoJI2C85V1A=','2022-12-22 04:53:00.159050',0,'vlad_putin','Vladimir','Putin','',0,1,'2022-11-24 04:43:45.000000',NULL),(17,'pbkdf2_sha256$390000$PjZre8FZXk1wrnSX7Aj7Bu$0RBwtWmVPM48wfHoIaYnYphWWoAvQ5Exxci/y7NbdjE=',NULL,0,'sebas_chan','Sebas','Chan','',0,1,'2022-12-03 05:16:53.000000',NULL),(18,'pbkdf2_sha256$390000$Y3LAJr1Cr1UKfHqXrj6NG6$DRkOQPVPEj5Oti0MR+7CXCdFyX0t9lQOKCTX52CTE2o=','2022-12-05 08:54:43.469023',0,'ereh','Eren','Yeager','',0,1,'2022-12-04 17:47:51.000000',NULL),(19,'pbkdf2_sha256$390000$9tPN9zxvEJ2T8jdX6GhHpp$Vtw56/4Iju+E64EiwYQ3EvlagklXBYKeY5o7Y1ryR5g=',NULL,0,'jean_k','Jean','Kirstein','',0,1,'2022-12-04 17:49:10.000000',NULL),(20,'pbkdf2_sha256$390000$t4F20mOU7e819qeQ8GWeYz$G6vzcDkBfI9OxrlG0jvBZvGzChLOwwrg8tf9DIgio90=',NULL,0,'leonhart','Annie','Leonhart','',0,1,'2022-12-04 17:50:49.000000',NULL),(21,'pbkdf2_sha256$390000$D8fiTOi6fCwIBQmfwhBihg$RtUzmPIYZux0wCqkW0Kdx/PGJNRp7JPDcRz0Zb9uEQQ=',NULL,0,'e_smith','Erwin','Smith','',0,1,'2022-12-04 17:52:28.000000',NULL);
/*!40000 ALTER TABLE `e_attendance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `e_attendance_user_groups`
--

LOCK TABLES `e_attendance_user_groups` WRITE;
/*!40000 ALTER TABLE `e_attendance_user_groups` DISABLE KEYS */;
INSERT INTO `e_attendance_user_groups` VALUES (1,1,4),(14,2,1),(13,3,1),(16,4,1),(9,5,2),(8,6,2),(6,7,2),(5,8,1),(12,9,1),(10,10,1),(15,11,1),(11,12,1),(4,13,1),(3,14,1),(2,15,1),(7,16,3),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1);
/*!40000 ALTER TABLE `e_attendance_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2022-12-22 14:20:08
