-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: weddingdb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add dishes and drink',6,'add_dishesanddrink'),(22,'Can change dishes and drink',6,'change_dishesanddrink'),(23,'Can delete dishes and drink',6,'delete_dishesanddrink'),(24,'Can view dishes and drink',6,'view_dishesanddrink'),(25,'Can add menu',7,'add_menu'),(26,'Can change menu',7,'change_menu'),(27,'Can delete menu',7,'delete_menu'),(28,'Can view menu',7,'view_menu'),(29,'Can add service',8,'add_service'),(30,'Can change service',8,'change_service'),(31,'Can delete service',8,'delete_service'),(32,'Can view service',8,'view_service'),(33,'Can add wedding hall',9,'add_weddinghall'),(34,'Can change wedding hall',9,'change_weddinghall'),(35,'Can delete wedding hall',9,'delete_weddinghall'),(36,'Can view wedding hall',9,'view_weddinghall'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add wedding',11,'add_wedding'),(42,'Can change wedding',11,'change_wedding'),(43,'Can delete wedding',11,'delete_wedding'),(44,'Can view wedding',11,'view_wedding'),(45,'Can add receipt',12,'add_receipt'),(46,'Can change receipt',12,'change_receipt'),(47,'Can delete receipt',12,'delete_receipt'),(48,'Can view receipt',12,'view_receipt'),(49,'Can add application',13,'add_application'),(50,'Can change application',13,'change_application'),(51,'Can delete application',13,'delete_application'),(52,'Can view application',13,'view_application'),(53,'Can add access token',14,'add_accesstoken'),(54,'Can change access token',14,'change_accesstoken'),(55,'Can delete access token',14,'delete_accesstoken'),(56,'Can view access token',14,'view_accesstoken'),(57,'Can add grant',15,'add_grant'),(58,'Can change grant',15,'change_grant'),(59,'Can delete grant',15,'delete_grant'),(60,'Can view grant',15,'view_grant'),(61,'Can add refresh token',16,'add_refreshtoken'),(62,'Can change refresh token',16,'change_refreshtoken'),(63,'Can delete refresh token',16,'delete_refreshtoken'),(64,'Can view refresh token',16,'view_refreshtoken'),(65,'Can add id token',17,'add_idtoken'),(66,'Can change id token',17,'change_idtoken'),(67,'Can delete id token',17,'delete_idtoken'),(68,'Can view id token',17,'view_idtoken'),(69,'Can add cors model',18,'add_corsmodel'),(70,'Can change cors model',18,'change_corsmodel'),(71,'Can delete cors model',18,'delete_corsmodel'),(72,'Can view cors model',18,'view_corsmodel'),(73,'Can add comment',19,'add_comment'),(74,'Can change comment',19,'change_comment'),(75,'Can delete comment',19,'delete_comment'),(76,'Can view comment',19,'view_comment'),(77,'Can add action',20,'add_action'),(78,'Can change action',20,'change_action'),(79,'Can delete action',20,'delete_action'),(80,'Can view action',20,'view_action'),(81,'Can add rating',21,'add_rating'),(82,'Can change rating',21,'change_rating'),(83,'Can delete rating',21,'delete_rating'),(84,'Can view rating',21,'view_rating'),(85,'Can add wedding cart',22,'add_weddingcart'),(86,'Can change wedding cart',22,'change_weddingcart'),(87,'Can delete wedding cart',22,'delete_weddingcart'),(88,'Can view wedding cart',22,'view_weddingcart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_WeddingApp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_WeddingApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-10 07:40:53.331251','1','Wedding hall 1',1,'[{\"added\": {}}]',9,1),(2,'2021-09-10 07:41:21.838076','2','Wedding hall 1',1,'[{\"added\": {}}]',9,1),(3,'2021-09-10 07:41:40.514790','3','Wedding hall 1',1,'[{\"added\": {}}]',9,1),(4,'2021-09-13 11:53:16.847712','1','Menu 1',1,'[{\"added\": {}}]',7,1),(5,'2021-09-13 11:53:37.439324','2','Menu 2',1,'[{\"added\": {}}]',7,1),(6,'2021-09-13 11:54:11.632152','1','Service 1',1,'[{\"added\": {}}]',8,1),(7,'2021-09-13 11:54:29.401937','2','Service 2',1,'[{\"added\": {}}]',8,1),(8,'2021-09-13 11:57:07.361412','1','Dishes drinks 1',1,'[{\"added\": {}}]',6,1),(9,'2021-09-13 11:57:18.318255','2','Dishes drinks 2',1,'[{\"added\": {}}]',6,1),(10,'2021-09-13 11:57:28.955657','3','Dishes drinks 3',1,'[{\"added\": {}}]',6,1),(11,'2021-09-13 11:57:54.659646','1','Menu 1',2,'[{\"changed\": {\"fields\": [\"Dishes and drink\"]}}]',7,1),(12,'2021-09-13 11:58:06.352651','2','Menu 2',2,'[{\"changed\": {\"fields\": [\"Dishes and drink\"]}}]',7,1),(13,'2021-10-07 14:47:44.151397','3','Wedding hall 1',2,'[]',9,17),(14,'2021-10-08 15:10:24.019483','3','Wedding hall 1',2,'[{\"changed\": {\"fields\": [\"Time wedding\"]}}]',9,17),(15,'2021-10-08 15:10:36.297418','2','Wedding hall 1',2,'[{\"changed\": {\"fields\": [\"Time wedding\"]}}]',9,17),(16,'2021-10-08 15:10:43.243954','1','Wedding hall 1',2,'[{\"changed\": {\"fields\": [\"Time wedding\"]}}]',9,17),(17,'2021-10-11 15:43:45.447014','2','Menu 2',2,'[]',7,17),(18,'2021-10-11 15:43:58.356587','1','Menu 1',2,'[]',7,17),(19,'2021-10-11 15:52:22.403369','1','Menu 1',2,'[{\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}]',7,17),(20,'2021-10-11 15:52:38.388173','1','Menu 1',2,'[]',7,17),(21,'2021-10-11 15:52:49.998466','1','Menu 1',2,'[{\"added\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (7)\"}}]',7,17),(22,'2021-10-11 15:52:56.546816','1','Menu 1',2,'[]',7,17),(23,'2021-10-11 15:54:35.654403','1','Dishes drinks 1',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',6,17),(24,'2021-10-11 15:54:46.874081','1','Menu 1',2,'[]',7,17),(25,'2021-10-11 15:54:49.879335','2','Menu 2',2,'[]',7,17),(26,'2021-10-11 16:07:52.686271','2','Menu 2',2,'[{\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}]',7,17),(27,'2021-10-11 16:07:58.554361','2','Menu 2',2,'[]',7,17),(28,'2021-10-11 16:08:09.873734','2','Menu 2',2,'[{\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}, {\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}]',7,17),(29,'2021-10-11 16:08:14.023775','2','Menu 2',2,'[]',7,17),(30,'2021-10-11 16:08:21.062495','2','Menu 2',2,'[{\"added\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (8)\"}}, {\"added\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (9)\"}}, {\"added\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (10)\"}}]',7,17),(31,'2021-10-11 16:08:24.666164','2','Menu 2',2,'[]',7,17),(32,'2021-10-11 16:08:27.746894','2','Menu 2',2,'[]',7,17),(33,'2021-10-11 16:12:22.132603','1','Menu 1',2,'[{\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}]',7,17),(34,'2021-10-11 16:12:59.645159','1','Menu 1',2,'[{\"added\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (11)\"}}]',7,17),(35,'2021-10-11 16:19:40.335346','1','Menu 1',2,'[]',7,17),(36,'2021-10-11 16:19:50.960615','2','Menu 2',2,'[]',7,17),(37,'2021-10-11 16:20:36.502935','1','Dishes drinks 1',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',6,17),(38,'2021-10-11 16:20:39.858080','1','Menu 1',2,'[]',7,17),(39,'2021-10-11 16:22:55.279869','2','Menu 2',2,'[]',7,17),(40,'2021-10-11 16:26:01.781954','1','Menu 1',2,'[{\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}]',7,17),(41,'2021-10-11 16:26:27.043352','1','Menu 1',2,'[]',7,17),(42,'2021-10-11 16:26:36.656483','1','Menu 1',2,'[{\"changed\": {\"fields\": [\"Dishes and drink\"]}}]',7,17),(43,'2021-10-11 16:26:45.482644','1','Menu 1',2,'[{\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}]',7,17),(44,'2021-10-11 16:26:51.237158','1','Menu 1',2,'[]',7,17),(45,'2021-10-11 16:27:02.853387','1','Menu 1',2,'[{\"changed\": {\"fields\": [\"Dishes and drink\"]}}]',7,17),(46,'2021-10-11 16:27:07.467459','1','Menu 1',2,'[]',7,17),(47,'2021-10-11 16:42:20.505325','2','Menu 2',2,'[{\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}]',7,17),(48,'2021-10-11 16:42:28.441385','2','Menu 2',2,'[{\"added\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (16)\"}}]',7,17),(49,'2021-10-11 16:42:35.338758','2','Menu 2',2,'[{\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}, {\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}, {\"deleted\": {\"name\": \"menu-dishesanddrink relationship\", \"object\": \"Menu_dishes_and_drink object (None)\"}}]',7,17),(50,'2021-10-11 16:43:08.281515','2','Menu 2',2,'[]',7,17),(51,'2021-10-11 16:44:48.815559','2','Menu 2',2,'[{\"changed\": {\"fields\": [\"Dishes and drink\"]}}]',7,17),(52,'2021-10-12 10:26:53.106457','3','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,17),(53,'2021-10-12 10:55:52.324593','3','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,17),(54,'2021-10-12 10:56:02.040519','2','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,17),(55,'2021-10-12 10:56:17.590797','2','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,17),(56,'2021-10-12 10:56:29.332506','1','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,17),(57,'2021-10-12 10:56:38.526910','1','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,17),(58,'2021-10-12 10:58:09.751444','3','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Wedding hall images\"]}}]',9,17),(59,'2021-10-12 10:58:40.282150','2','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Wedding hall images\"]}}]',9,17),(60,'2021-10-12 10:58:48.550790','1','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Wedding hall images\"]}}]',9,17),(61,'2021-10-12 10:59:36.012618','3','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Location\"]}}]',9,17),(62,'2021-10-12 10:59:58.679645','2','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Location\"]}}]',9,17),(63,'2021-10-12 11:00:04.776391','1','Riverside Palace',2,'[{\"changed\": {\"fields\": [\"Location\"]}}]',9,17),(64,'2021-10-12 11:04:39.511486','4','White Palace',1,'[{\"added\": {}}]',9,17),(65,'2021-10-12 11:05:12.605509','5','White Palace',1,'[{\"added\": {}}]',9,17),(66,'2021-10-12 11:05:38.556666','6','White Palace',1,'[{\"added\": {}}]',9,17),(67,'2021-10-12 11:07:59.098424','7','Diamond Place',1,'[{\"added\": {}}]',9,17),(68,'2021-10-12 11:08:33.329626','8','Diamond Place',1,'[{\"added\": {}}]',9,17),(69,'2021-10-12 11:09:12.009181','9','Diamond Place',1,'[{\"added\": {}}]',9,17),(70,'2021-10-12 11:20:04.055020','10','Intercontinental Asiana Sài Gòn',1,'[{\"added\": {}}]',9,17),(71,'2021-10-12 11:20:35.446950','11','Intercontinental Asiana Sài Gòn',1,'[{\"added\": {}}]',9,17),(72,'2021-10-12 11:21:01.197060','12','Intercontinental Asiana Sài Gòn',1,'[{\"added\": {}}]',9,17),(73,'2021-10-12 11:26:22.381812','13','Metropole',1,'[{\"added\": {}}]',9,17),(74,'2021-10-12 11:26:48.366719','14','Metropole',1,'[{\"added\": {}}]',9,17),(75,'2021-10-12 11:27:13.169920','15','Metropole',1,'[{\"added\": {}}]',9,17),(76,'2021-10-12 11:31:47.503905','3','Phim ảnh cưới',2,'[{\"changed\": {\"fields\": [\"Service images\", \"Description\"]}}]',8,17),(77,'2021-10-12 11:33:20.397525','6','Thuê trang phục cưới',1,'[{\"added\": {}}]',8,17),(78,'2021-10-12 11:36:37.215843','4','Trang trí tiệc cưới',2,'[{\"changed\": {\"fields\": [\"Service images\", \"Description\"]}}]',8,17),(79,'2021-10-12 11:38:57.362753','5','Vũ đoàn nhảy múa, Mc dẫn chương trình',2,'[{\"changed\": {\"fields\": [\"Service images\", \"Description\"]}}]',8,17),(80,'2021-10-12 11:40:20.727377','2','Trang điểm ngày cưới',2,'[{\"changed\": {\"fields\": [\"Service images\", \"Description\"]}}]',8,17),(81,'2021-10-12 11:41:23.877044','1','Thiết kế thiệp cưới',2,'[{\"changed\": {\"fields\": [\"Service images\", \"Description\"]}}]',8,17),(82,'2021-10-12 11:42:35.140876','7','Phụ kiện cưới',1,'[{\"added\": {}}]',8,17),(83,'2021-10-12 11:47:29.975612','1','Súp tuyết nhĩ thịt gà xé',2,'[{\"changed\": {\"fields\": [\"Name\", \"Dishes drinks images\"]}}]',6,17),(84,'2021-10-12 11:48:17.464491','2','Nộm thập cẩm',2,'[{\"changed\": {\"fields\": [\"Name\", \"Dishes drinks images\", \"Price\"]}}]',6,17),(85,'2021-10-12 11:48:52.275491','3','Ba chỉ quay giòn bánh hỏi',2,'[{\"changed\": {\"fields\": [\"Name\", \"Dishes drinks images\", \"Price\"]}}]',6,17),(86,'2021-10-12 11:49:39.510210','4','Gà ta rang muối',1,'[{\"added\": {}}]',6,17),(87,'2021-10-12 11:51:33.585422','5','Tôm sú nướng tiêu',1,'[{\"added\": {}}]',6,17),(88,'2021-10-12 11:52:20.241292','6','Vịt nấu tiêu xanh – bánh mì',1,'[{\"added\": {}}]',6,17),(89,'2021-10-12 11:53:02.186231','7','Cơm Thố Bào Ngư Quay',1,'[{\"added\": {}}]',6,17),(90,'2021-10-12 11:53:40.342813','8','Canh bóng thập cẩm',1,'[{\"added\": {}}]',6,17),(91,'2021-10-12 11:54:16.658956','9','Chè hồ đào',1,'[{\"added\": {}}]',6,17),(92,'2021-10-12 11:54:45.651404','1','Thực đơn cổ điển',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,17),(93,'2021-10-12 11:54:56.099410','2','Thực đơn hiện đại',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,17),(94,'2021-10-12 11:56:12.190418','3','Thực đơn Hàn Quốc',1,'[{\"added\": {}}]',7,17),(95,'2021-10-12 11:56:40.225632','2','Thực đơn hiện đại',2,'[{\"changed\": {\"fields\": [\"Menu images\", \"Dishes and drink\"]}}]',7,17),(96,'2021-10-12 11:56:52.594353','1','Thực đơn cổ điển',2,'[{\"changed\": {\"fields\": [\"Dishes and drink\"]}}]',7,17),(97,'2021-10-12 11:57:43.321667','4','Thực đơn Trung Quốc',1,'[{\"added\": {}}]',7,17),(98,'2021-10-12 15:06:07.521814','4','Thực đơn Trung Quốc',2,'[{\"changed\": {\"fields\": [\"Dishes and drink\"]}}]',7,17),(99,'2021-10-12 15:06:51.750920','4','Thực đơn Trung Quốc',2,'[{\"changed\": {\"fields\": [\"Menu images\"]}}]',7,17),(100,'2021-10-12 15:07:11.300917','4','Thực đơn Trung Quốc',2,'[{\"changed\": {\"fields\": [\"Menu images\"]}}]',7,17),(101,'2021-10-12 15:07:20.978495','3','Thực đơn Hàn Quốc',2,'[{\"changed\": {\"fields\": [\"Menu images\"]}}]',7,17),(102,'2021-10-12 15:07:36.656452','3','Thực đơn Hàn Quốc',2,'[{\"changed\": {\"fields\": [\"Menu images\"]}}]',7,17),(103,'2021-11-14 07:40:31.037901','1','Wedding object (1)',2,'[{\"changed\": {\"fields\": [\"Services\"]}}]',11,21),(104,'2021-11-14 07:40:46.096396','1','Wedding object (1)',2,'[{\"changed\": {\"fields\": [\"Services\"]}}]',11,21),(105,'2021-11-14 07:40:53.908724','1','Wedding object (1)',2,'[{\"changed\": {\"fields\": [\"Total price\"]}}]',11,21),(106,'2021-11-14 07:41:01.667254','1','Wedding object (1)',2,'[{\"changed\": {\"fields\": [\"Total price\"]}}]',11,21);
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
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(18,'corsheaders','corsmodel'),(14,'oauth2_provider','accesstoken'),(13,'oauth2_provider','application'),(15,'oauth2_provider','grant'),(17,'oauth2_provider','idtoken'),(16,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(20,'WeddingApp','action'),(19,'WeddingApp','comment'),(6,'WeddingApp','dishesanddrink'),(7,'WeddingApp','menu'),(21,'WeddingApp','rating'),(12,'WeddingApp','receipt'),(8,'WeddingApp','service'),(10,'WeddingApp','user'),(11,'WeddingApp','wedding'),(22,'WeddingApp','weddingcart'),(9,'WeddingApp','weddinghall');
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
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-10 07:34:29.335470'),(2,'contenttypes','0002_remove_content_type_name','2021-09-10 07:34:32.387382'),(3,'auth','0001_initial','2021-09-10 07:34:45.250431'),(4,'auth','0002_alter_permission_name_max_length','2021-09-10 07:34:48.138141'),(5,'auth','0003_alter_user_email_max_length','2021-09-10 07:34:48.391582'),(6,'auth','0004_alter_user_username_opts','2021-09-10 07:34:48.550996'),(7,'auth','0005_alter_user_last_login_null','2021-09-10 07:34:48.656313'),(8,'auth','0006_require_contenttypes_0002','2021-09-10 07:34:48.747919'),(9,'auth','0007_alter_validators_add_error_messages','2021-09-10 07:34:49.162692'),(10,'auth','0008_alter_user_username_max_length','2021-09-10 07:34:49.393381'),(11,'auth','0009_alter_user_last_name_max_length','2021-09-10 07:34:49.543968'),(12,'auth','0010_alter_group_name_max_length','2021-09-10 07:34:52.316500'),(13,'auth','0011_update_proxy_permissions','2021-09-10 07:34:52.464686'),(14,'auth','0012_alter_user_first_name_max_length','2021-09-10 07:34:52.585551'),(15,'WeddingApp','0001_initial','2021-09-10 07:35:54.332989'),(16,'admin','0001_initial','2021-09-10 07:36:04.118385'),(17,'admin','0002_logentry_remove_auto_add','2021-09-10 07:36:04.365932'),(18,'admin','0003_logentry_add_action_flag_choices','2021-09-10 07:36:04.617831'),(19,'oauth2_provider','0001_initial','2021-09-10 07:37:03.561503'),(20,'oauth2_provider','0002_auto_20190406_1805','2021-09-10 07:37:08.934384'),(21,'oauth2_provider','0003_auto_20201211_1314','2021-09-10 07:37:14.820907'),(22,'oauth2_provider','0004_auto_20200902_2022','2021-09-10 07:37:46.628778'),(23,'sessions','0001_initial','2021-09-10 07:37:52.565527'),(24,'WeddingApp','0002_remove_wedding_price_rent','2021-09-10 15:07:50.228297'),(25,'corsheaders','0001_initial','2021-09-10 15:07:52.039802'),(26,'corsheaders','0002_alter_corsmodel_id','2021-09-10 15:07:55.879506'),(27,'WeddingApp','0003_auto_20210913_1638','2021-09-13 09:39:05.669004'),(28,'WeddingApp','0004_menu_menu_images','2021-09-13 11:51:56.205511'),(29,'WeddingApp','0005_remove_menu_total_money','2021-09-14 16:10:41.529242'),(30,'WeddingApp','0006_menu_total_money','2021-09-14 16:21:37.884394'),(31,'WeddingApp','0007_remove_weddinghall_date_time_rent','2021-09-15 16:37:19.389584'),(32,'WeddingApp','0008_comment','2021-09-22 08:30:44.124514'),(33,'WeddingApp','0009_remove_wedding_wedding_name','2021-09-23 09:27:27.005718'),(34,'WeddingApp','0010_action_rating','2021-09-24 09:43:07.663944'),(35,'WeddingApp','0011_wedding_organize_date','2021-09-24 10:40:43.484222'),(36,'WeddingApp','0012_wedding_wedding_images','2021-09-24 11:07:23.133323'),(37,'WeddingApp','0013_remove_weddinghall_capacity','2021-09-24 14:43:20.522675'),(38,'WeddingApp','0014_auto_20210926_2054','2021-09-26 13:54:49.115941'),(39,'WeddingApp','0015_auto_20210929_1705','2021-09-29 10:07:37.871131'),(40,'WeddingApp','0016_weddingcart','2021-10-01 08:29:45.156986'),(41,'WeddingApp','0017_delete_weddingcart','2021-10-01 10:01:53.597627'),(42,'WeddingApp','0018_auto_20211002_2219','2021-10-02 15:19:57.428482'),(43,'WeddingApp','0019_auto_20211010_1855','2021-10-10 11:57:09.861991'),(44,'WeddingApp','0020_alter_menu_options','2021-10-11 16:19:03.336195'),(45,'WeddingApp','0021_remove_menu_total_money','2021-10-11 16:32:52.208759'),(46,'WeddingApp','0022_alter_wedding_wedding_images','2021-10-12 10:25:07.275977'),(47,'WeddingApp','0023_remove_service_time_rent','2021-10-16 15:29:29.280796'),(48,'WeddingApp','0024_wedding_created_date','2021-11-01 09:38:57.498879');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ffcceyvtrcsn30mst1mhwm4j6wxkdv8','.eJxVjEEOgjAQRe_StWko7UzBpXvPQKYzU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMIo5GxfN6XdMxA-ddiJ3mm6z5XlalzHZXbEHrfY6iz4vh_t3UKiWb-2ZsnjfKZNrEqMCIXZBgubsgEOLERAzN8wNuNYl0KR9lh4yRxE07w8vWDkr:1maDzJ:woC62UoeQ9SQCre72rlAXkjix65wfD_ewUd8uadafJM','2021-10-26 09:22:21.937422'),('1jrdu1a00wmr3d5qf6gouzfy5ib6a6yl','.eJxVjMsOwiAQRf-FtSFSysule7-BzDCDVA0kpV0Z_92QdKHbe865bxFh30rcO69xIXERSpx-N4T05DoAPaDem0ytbuuCcijyoF3eGvHrerh_BwV6GbVCE0CZQFkHcmpSyXA2kwab3dmDctYa4qCJtPXsrdbeA5BDhDDPKD5f3l435g:1mSEkb:suv8yHimcIr0o7dR0z5g3B_yQ2772PuotEvhDRKLK8k','2021-10-04 08:34:09.489725'),('g3dza8u8gevgj14ow86wk69c1wjcuoaa','.eJxVjEEOgjAQRe_StWko7UzBpXvPQKYzU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMIo5GxfN6XdMxA-ddiJ3mm6z5XlalzHZXbEHrfY6iz4vh_t3UKiWb-2ZsnjfKZNrEqMCIXZBgubsgEOLERAzN8wNuNYl0KR9lh4yRxE07w8vWDkr:1mhZSd:7ku4yLgTFZgD2NKtkQggO8j0vA8IopI50YOaFAPeGc4','2021-11-15 15:42:59.909529'),('qannimh3gw7gyv5qxf0a1k2cbrajeccl','.eJxVjMsOwiAQRf-FtSFSysule7-BzDCDVA0kpV0Z_92QdKHbe865bxFh30rcO69xIXERSpx-N4T05DoAPaDem0ytbuuCcijyoF3eGvHrerh_BwV6GbVCE0CZQFkHcmpSyXA2kwab3dmDctYa4qCJtPXsrdbeA5BDhDDPKD5f3l435g:1mQ9ct:Pryf2hj7idsjDcfzXoxoSj5tJfnKLSfxHNP-LbqDyAQ','2021-09-28 14:41:35.827840'),('v7jg3wq5smozyqidzn8wuyqwtcgjxe3h','.eJxVjMsOwiAQRf-FtSFSysule7-BzDCDVA0kpV0Z_92QdKHbe865bxFh30rcO69xIXERSpx-N4T05DoAPaDem0ytbuuCcijyoF3eGvHrerh_BwV6GbVCE0CZQFkHcmpSyXA2kwab3dmDctYa4qCJtPXsrdbeA5BDhDDPKD5f3l435g:1mSEOm:oYKQz0QXVMq7J6TmmzEjcKVe6lutc5cTylIbhIOydxE','2021-10-04 08:11:36.893577'),('xk8jro33tg73fazmlrz0tsijkxoch2ji','.eJxVjDsOwjAQBe_iGlnrOP4sJT1nsLzeNQmgRIqTCnF3iJQC2jcz76VS3tYhbU2WNLI6q86o0-9IuTxk2gnf83SbdZmndRlJ74o-aNPXmeV5Ody_gyG34Vv3oaAQCkQbQ-c9c8ba9aVnqGiQrLcmeoDiwBAECUyuIlTng40UUL0_9t03Xw:1mmC4Z:p9Kj4ZugjDO03CjM1OkEzmxSNPenkh5vOvLFmz3LdSk','2021-11-28 09:45:15.529929');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_acce_user_id_6e4c9a65_fk_WeddingAp` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_user_id_6e4c9a65_fk_WeddingAp` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'96xJdBp2zYRS3lyYlrwC42xWxCla3f','2021-09-15 00:45:15.820413','read write',3,1,'2021-09-14 14:45:15.821412','2021-09-14 14:45:15.821412',NULL,NULL),(2,'aMLBOyufIcj2aHyEZvzYJ5NMsmVLtX','2021-09-25 21:36:32.160041','read write',3,1,'2021-09-25 11:36:32.160041','2021-09-25 11:36:32.160041',NULL,NULL),(3,'G9DfocVr7GheBBBJv7jkWqctgmZjVm','2021-09-25 21:37:25.851758','read write',3,1,'2021-09-25 11:37:25.851758','2021-09-25 11:37:25.851758',NULL,NULL),(4,'vGnxTrPaZ9raVLDzSRFTcGVvYckl50','2021-09-25 21:39:51.621655','read write',3,1,'2021-09-25 11:39:51.621655','2021-09-25 11:39:51.621655',NULL,NULL),(5,'IZRDzJqRSyk4biFj6dXtsukRXh1j4c','2021-09-25 21:41:47.484573','read write',3,1,'2021-09-25 11:41:47.484573','2021-09-25 11:41:47.484573',NULL,NULL),(6,'y6ORNauC2lxoUwsBIPUXgfLfVgPx0O','2021-09-25 21:42:22.803432','read write',3,1,'2021-09-25 11:42:22.803432','2021-09-25 11:42:22.803432',NULL,NULL),(7,'fiw9NUbDXpApvU4pwt3Xj8LEUy1yS1','2021-09-25 21:47:35.854730','read write',3,1,'2021-09-25 11:47:35.854730','2021-09-25 11:47:35.854730',NULL,NULL),(8,'gsciVVlAv6yW0RWW03vuXmnKG6LEQH','2021-09-25 21:48:21.665057','read write',3,1,'2021-09-25 11:48:21.665057','2021-09-25 11:48:21.665057',NULL,NULL),(9,'1lgObw9djuB7VMC3dxNbAg2Siu4s6V','2021-09-25 21:49:52.773259','read write',3,1,'2021-09-25 11:49:52.773259','2021-09-25 11:49:52.773259',NULL,NULL),(10,'WgGAwaCtlfW1nAxHbInMaiZgMbLEt9','2021-09-25 21:51:37.990888','read write',3,1,'2021-09-25 11:51:37.990888','2021-09-25 11:51:37.990888',NULL,NULL),(11,'dGA342dFi4R0ixU2xxbwRHX5UdBcE9','2021-09-25 21:52:05.766226','read write',3,1,'2021-09-25 11:52:05.766226','2021-09-25 11:52:05.766226',NULL,NULL),(12,'l4muEvN9O90gYGIAn7y6th3FDcaSbh','2021-09-25 23:07:18.604695','read write',3,1,'2021-09-25 13:07:18.605694','2021-09-25 13:07:18.605694',NULL,NULL),(13,'dcztxGQZ60FfAHSXtGAhkj6z6145B7','2021-09-25 23:07:43.843874','read write',3,1,'2021-09-25 13:07:43.843874','2021-09-25 13:07:43.843874',NULL,NULL),(14,'BkVC0U2eYBl1QlB1L8g58RBFd6iMI1','2021-09-25 23:46:03.440254','read write',3,1,'2021-09-25 13:46:03.440254','2021-09-25 13:46:03.440254',NULL,NULL),(15,'0KrluPGqZbcKR1XsUKhSdTiKmOCMMo','2021-09-25 23:46:14.659236','read write',3,1,'2021-09-25 13:46:14.659236','2021-09-25 13:46:14.659236',NULL,NULL),(16,'nEDhsCygfJM2q0pvZhg1AbuQAOmrAL','2021-09-25 23:51:26.965402','read write',3,1,'2021-09-25 13:51:26.965402','2021-09-25 13:51:26.965402',NULL,NULL),(17,'41sbAH8oVSzhNco54e4NqpXzCMzDvd','2021-09-25 23:57:09.522078','read write',3,1,'2021-09-25 13:57:09.522078','2021-09-25 13:57:09.522078',NULL,NULL),(18,'0EpTDfJaNC7VVsCsu44S3bGdUM65mM','2021-09-26 00:06:41.315807','read write',3,1,'2021-09-25 14:06:41.315807','2021-09-25 14:06:41.315807',NULL,NULL),(19,'fyc9TuNH6S8dO6YrLDy64RCd46XUIS','2021-09-26 00:07:08.301521','read write',3,1,'2021-09-25 14:07:08.302519','2021-09-25 14:07:08.302519',NULL,NULL),(20,'2GSoUlDaJfPV3HJ40Wl7umzDRkqr2l','2021-09-26 00:20:16.563058','read write',3,1,'2021-09-25 14:20:16.564022','2021-09-25 14:20:16.564022',NULL,NULL),(21,'bgmOcefB7Rfwnyp1GnjShOFBG7NPFV','2021-09-26 00:20:40.167318','read write',3,1,'2021-09-25 14:20:40.167318','2021-09-25 14:20:40.167318',NULL,NULL),(22,'HVpMTJrUP72gSWkEA9LCQI3KOPnsUR','2021-09-26 00:22:30.197491','read write',3,1,'2021-09-25 14:22:30.197491','2021-09-25 14:22:30.197491',NULL,NULL),(23,'26ZX15kiWQ7nGaNlQhsnyOVX31OPXQ','2021-09-26 00:22:43.153139','read write',3,1,'2021-09-25 14:22:43.154136','2021-09-25 14:22:43.154136',NULL,NULL),(24,'vefvsXq4wNjSGQvheAnzFbYISC2YIy','2021-09-26 00:57:03.368560','read write',3,1,'2021-09-25 14:57:03.369559','2021-09-25 14:57:03.369559',NULL,NULL),(25,'kX2ep1FeMYon2lbtADoMNg0M3YiQj5','2021-09-26 01:01:28.912232','read write',3,3,'2021-09-25 15:01:28.912232','2021-09-25 15:01:28.912232',NULL,NULL),(26,'tn0YMqucHlkGWpK1YDeD9KRdh79JJO','2021-09-27 01:36:29.443495','read write',3,1,'2021-09-26 15:36:29.444494','2021-09-26 15:36:29.444494',NULL,NULL),(27,'9OwDXD1V3zShxlDxG0kFCbzyKnlI9C','2021-09-27 01:51:44.060276','read write',3,1,'2021-09-26 15:51:44.060276','2021-09-26 15:51:44.060276',NULL,NULL),(28,'PD0fCaa3Ham8QwKzNxaCnxXCufGWqF','2021-09-27 01:53:33.522555','read write',3,1,'2021-09-26 15:53:33.522555','2021-09-26 15:53:33.522555',NULL,NULL),(29,'aAyJHYdgbXguE5JhCDLAdPF49vQRv7','2021-09-27 18:40:38.909875','read write',3,1,'2021-09-27 08:40:38.910872','2021-09-27 08:40:38.910872',NULL,NULL),(30,'1w4bypmkhtsIS4AyaaywpIK5drtiXA','2021-09-28 00:28:33.495954','read write',3,3,'2021-09-27 14:28:33.496954','2021-09-27 14:28:33.496954',NULL,NULL),(31,'mpUPW8D9xvylJwsydQ08RnpAnrdn07','2021-09-28 01:21:28.142737','read write',3,1,'2021-09-27 15:21:28.143702','2021-09-27 15:21:28.143702',NULL,NULL),(32,'s9hl3CEgfWZ0DxGKj803lcy0jafW8P','2021-09-28 02:00:48.288742','read write',3,1,'2021-09-27 16:00:48.288742','2021-09-27 16:00:48.288742',NULL,NULL),(33,'wN8gd47XQYeTGDZvcmcmrLFxCZyykX','2021-09-28 02:39:41.881957','read write',3,1,'2021-09-27 16:39:41.881957','2021-09-27 16:39:41.881957',NULL,NULL),(34,'BUMUMRDRDL7rj0yy9o6ET9mnjfVPeY','2021-09-28 19:38:57.219211','read write',4,8,'2021-09-28 09:38:57.219211','2021-09-28 09:38:57.219211',NULL,NULL),(35,'QIhvUg6JS4V16Ps0wKUdFGLEDkRfkj','2021-09-28 23:10:30.959990','read write',4,8,'2021-09-28 13:10:30.960988','2021-09-28 13:10:30.960988',NULL,NULL),(36,'kPQthricOGSjFran61ASb2iye6BYBy','2021-09-28 23:51:19.715662','read write',4,8,'2021-09-28 13:51:19.715662','2021-09-28 13:51:19.715662',NULL,NULL),(40,'7XTm5g1nQ1HcNOqt7daog9eQ8juKvv','2021-09-29 01:15:17.895339','read write',4,17,'2021-09-28 15:15:17.895339','2021-09-28 15:15:17.895339',NULL,NULL),(43,'gHVfkgxw9maYC3RfCJTg9QWcxa6Q6U','2021-09-29 01:21:47.655353','read write',4,3,'2021-09-28 15:21:47.655353','2021-09-28 15:21:47.655353',NULL,NULL),(44,'MMT26PjUYOckf1uBFkNGKNlBQ1lg0y','2021-09-29 18:51:08.772854','read write',4,17,'2021-09-29 08:51:08.773852','2021-09-29 08:51:08.773852',NULL,NULL),(45,'6VW4RzCkpxQV9x5yjDKRWEyNDrNkzf','2021-09-29 18:51:48.317610','read write',4,17,'2021-09-29 08:51:48.317610','2021-09-29 08:51:48.317610',NULL,NULL),(46,'wYGnFrVfm8uhh2RzwjPa5faWyerqmh','2021-09-29 22:20:43.880855','read write',4,17,'2021-09-29 12:20:43.958578','2021-09-29 12:20:43.958578',NULL,NULL),(47,'RkwdZlEkW9JKmmRBX61hMg7YusIQvV','2021-09-29 22:21:18.924343','read write',4,17,'2021-09-29 12:21:18.924343','2021-09-29 12:21:18.924343',NULL,NULL),(48,'QgoDlYWGtHpGif2rGgOShIGSOyYInu','2021-10-01 21:56:00.817295','read write',5,17,'2021-10-01 11:56:00.818295','2021-10-01 11:56:00.818295',NULL,NULL),(49,'xhxVMAJSRDTYhLftGFrVW0IPgbEZgW','2021-10-01 23:54:32.454379','read write',5,17,'2021-10-01 13:54:32.454379','2021-10-01 13:54:32.454379',NULL,NULL),(50,'O7zwryCoJZ04NiIUHul0IiMlhvUHix','2021-10-02 17:48:20.554695','read write',5,17,'2021-10-02 07:48:20.555694','2021-10-02 07:48:20.556691',NULL,NULL),(51,'vSTRexwBmAL5DBwETWsN0chJxwIAtw','2021-10-02 23:32:50.092212','read write',5,17,'2021-10-02 13:32:50.093210','2021-10-02 13:32:50.093210',NULL,NULL),(52,'9xcU8ARuJiX2D4UfpifnYd4RgBenr8','2021-10-02 23:36:09.283029','read write',5,17,'2021-10-02 13:36:09.284059','2021-10-02 13:36:09.284059',NULL,NULL),(53,'fLeZs4Ufpe8XKZjqLRkU8xkBjzlSPx','2021-10-03 00:12:11.030404','read write',5,17,'2021-10-02 14:12:11.031404','2021-10-02 14:12:11.031404',NULL,NULL),(54,'4CE3APMMwr4Vq27viep0o8hPzbCqvi','2021-10-03 03:12:53.186812','read write',5,17,'2021-10-02 17:12:53.186812','2021-10-02 17:12:53.186812',NULL,NULL),(55,'4iSNr82LCjTfUE0ci8A4MESdGI0yq8','2021-10-03 22:09:31.979812','read write',5,17,'2021-10-03 12:09:31.979812','2021-10-03 12:09:31.979812',NULL,NULL),(56,'wpw6l2yj1W0xNqwOTquQXGBhlZxyVv','2021-10-03 23:12:58.152300','read write',5,17,'2021-10-03 13:12:58.153299','2021-10-03 13:12:58.153299',NULL,NULL),(57,'CEPpDKRe24yvjf62xzjxg1fgtrfyea','2021-10-08 02:52:48.083968','read write',5,17,'2021-10-07 16:52:48.084965','2021-10-07 16:52:48.084965',NULL,NULL),(58,'7oH48FEYYofW5zBOSsyrN976mnQytE','2021-10-08 03:08:02.237867','read write',5,17,'2021-10-07 17:08:02.237867','2021-10-07 17:08:02.237867',NULL,NULL),(59,'stE8SuMU4W73qRWkeuZBO7sEeMoHid','2021-10-10 17:34:28.348764','read write',5,17,'2021-10-10 07:34:28.348764','2021-10-10 07:34:28.348764',NULL,NULL),(60,'PJj6gtbqyRdKmNwamaq2pdqwKUlCLe','2021-10-11 01:18:38.818489','read write',5,17,'2021-10-10 15:18:38.818489','2021-10-10 15:18:38.818489',NULL,NULL),(63,'WxjtqNIhLi7Wn8zVHdYMh3ZZyZfhvf','2021-10-11 02:23:00.639520','read write',5,17,'2021-10-10 16:23:00.640486','2021-10-10 16:23:00.640486',NULL,NULL),(64,'Vu2pNlgCbDLqAaM3mhs8CJ0HO90dQ1','2021-10-12 00:05:57.869464','read write',5,17,'2021-10-11 14:05:57.870467','2021-10-11 14:05:57.870467',NULL,NULL),(65,'oHDflyOqCx4ZmH6E6L6QJMb0Chf1Y7','2021-10-12 02:51:22.428633','read write',5,17,'2021-10-11 16:51:22.428633','2021-10-11 16:51:22.428633',NULL,NULL),(66,'Ja9NnGmBmiEex0J4Uyz2BYfeOreT3u','2021-10-12 20:04:20.275497','read write',5,20,'2021-10-12 10:04:20.275497','2021-10-12 10:04:20.275497',NULL,NULL),(67,'SicaSJuGYs6WrJgkXXG9UkkCG3mXeY','2021-10-13 00:38:47.195517','read write',5,17,'2021-10-12 14:38:47.196517','2021-10-12 14:38:47.196517',NULL,NULL),(68,'xyMkzBHwC9POb5SQBsuXRMKqmDfcrP','2021-11-01 18:11:10.308951','read write',5,17,'2021-11-01 08:11:10.309877','2021-11-01 08:11:10.309877',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_WeddingAp` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_WeddingAp` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (3,'5iB25hG9DX8vUtgvUCyQpujwvmbf0wYeHY8pFiLP','','confidential','password','YglZltYsGl6sEAHJIN1Al9y4leOX3iOJ817cFbMsyS1R5tvfDKP1px6kfIdYF8PiMEXlGabuZTA2TsLoUOkFPKsDC3sFX9tdVFQMAmSP2Y85jxsWs0EEeJsBcyKL9NQo','Trọng',1,0,'2021-09-14 14:42:44.933264','2021-09-14 14:42:44.933264',''),(4,'02jF6CODjERFUHc1j3d0ty6qnxLQT90mY4dQYuHu','','confidential','password','t4J3Jl372RfRb6Sud5gBfAB1ehG2LiBiTkDzLfCWCBIQmbGJFC1qcZU1kEiDoWb98c6vgVeOoua666TRhGvtuhj63dF3zJB9aEYhrAqtyRKzUUN64z3YQIAye03D8qQX','Trọng',8,0,'2021-09-28 09:15:35.342248','2021-09-28 09:15:35.342248',''),(5,'o7f0FiWNk8ywTvkEhGMZ0LX5IrtEacYLgDmdc7uw','','confidential','password','PaDrqjkGVsTms5CGSHdYoQ0gdOuncEX8FTZPvRCnp2VfPceAokH8EMsTNLRmXy3BlXqKjkN3Yd7XGCRQ7Gw66GYonAINQiUgcK5CKi011tbyZ5mPDoek1ZxLAnYSDEoj','Trọng',17,0,'2021-10-01 11:52:40.655279','2021-10-01 11:52:40.655279','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_WeddingApp_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_WeddingApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_WeddingApp_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_WeddingApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_WeddingAp` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_WeddingAp` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'bJ6i6bkmJ5uWrfXj1THHfcBXDf1D0U',1,3,1,'2021-09-14 14:45:15.885241','2021-09-14 14:45:15.885241',NULL),(2,'q1sRwAEIC6PvQehOpAM3iUGKbuJ35K',2,3,1,'2021-09-25 11:36:32.394693','2021-09-25 11:36:32.394693',NULL),(3,'fARJ68P0hKwSlikwNmyHeNY3OlKGHp',3,3,1,'2021-09-25 11:37:26.020439','2021-09-25 11:37:26.020439',NULL),(4,'YMOpqQoiEaO0ljm9nRUzE7Xb1b4Yg1',4,3,1,'2021-09-25 11:39:51.633837','2021-09-25 11:39:51.633837',NULL),(5,'qugLPiOTa2JYVF5DdSduA4UJTEjzr6',5,3,1,'2021-09-25 11:41:47.522511','2021-09-25 11:41:47.522511',NULL),(6,'oioKm12jS2DRCItHuYyJ6XHnGBvoyz',6,3,1,'2021-09-25 11:42:22.814559','2021-09-25 11:42:22.814559',NULL),(7,'fS3EMPHt31DPob1BHsHVF2XB2G2BZ7',7,3,1,'2021-09-25 11:47:35.868218','2021-09-25 11:47:35.868218',NULL),(8,'rwSvLJkYjL3kPIgdHK6vo66LL8vbYF',8,3,1,'2021-09-25 11:48:21.714468','2021-09-25 11:48:21.714468',NULL),(9,'Pv2fibGDEnZQtAOlNWE7FrbrAmpILv',9,3,1,'2021-09-25 11:49:52.774793','2021-09-25 11:49:52.774793',NULL),(10,'duRvR9kF7ZDG4gv88nqCi0QIkKzfkO',10,3,1,'2021-09-25 11:51:38.053232','2021-09-25 11:51:38.053232',NULL),(11,'mQfOOqPeFhx6hYku1JWoc3qLydkICP',11,3,1,'2021-09-25 11:52:05.772211','2021-09-25 11:52:05.772211',NULL),(12,'tTGinQBrniKVpo8nkcAskvOfqnUYNV',12,3,1,'2021-09-25 13:07:19.776452','2021-09-25 13:07:19.776452',NULL),(13,'mfdAiLq0Lm4FFoztNA85ZwAJn7eJE0',13,3,1,'2021-09-25 13:07:43.930654','2021-09-25 13:07:43.930654',NULL),(14,'qhZ0u6vCdKkOiZyQ7XaDFfeCK59odM',14,3,1,'2021-09-25 13:46:03.446221','2021-09-25 13:46:03.446221',NULL),(15,'lldUtKJOfeKdWtpYpLWxiorE6fvOv5',15,3,1,'2021-09-25 13:46:14.686178','2021-09-25 13:46:14.686178',NULL),(16,'tedmMkOS8AM3VkekIsY8qQQhQOudEg',16,3,1,'2021-09-25 13:51:26.973621','2021-09-25 13:51:26.973621',NULL),(17,'C5W9B0wpQlS9cmp0Jix4COXgIQmsyN',17,3,1,'2021-09-25 13:57:09.553652','2021-09-25 13:57:09.553652',NULL),(18,'M9dW2WcsIMlRMhG6fzW28YGVWPTZLM',18,3,1,'2021-09-25 14:06:41.323471','2021-09-25 14:06:41.323471',NULL),(19,'qNRzfC9kcc2lp9f88T2MQp2kdPQxV2',19,3,1,'2021-09-25 14:07:08.317044','2021-09-25 14:07:08.317044',NULL),(20,'Z75B5QfSP3SaPvRk8mGhYTFyImECRd',20,3,1,'2021-09-25 14:20:16.575155','2021-09-25 14:20:16.575155',NULL),(21,'8EqeoOjw2u7xLzdbvbtCEXW6j22C0g',21,3,1,'2021-09-25 14:20:40.195769','2021-09-25 14:20:40.195769',NULL),(22,'dclY7zLfZZy472w3HMHusGNbZKzMWu',22,3,1,'2021-09-25 14:22:30.205307','2021-09-25 14:22:30.205307',NULL),(23,'FUCPup3GfwIjzYDWravO5berEI5SUY',23,3,1,'2021-09-25 14:22:43.169935','2021-09-25 14:22:43.169935',NULL),(24,'gywTbnjuaQOSyhP659XZF2Mk1OloAh',24,3,1,'2021-09-25 14:57:03.384458','2021-09-25 14:57:03.384458',NULL),(25,'Lp28JEAn34KJA2Rh6mhoYqkhrALEXW',25,3,3,'2021-09-25 15:01:29.039074','2021-09-25 15:01:29.039074',NULL),(26,'45fbTLQp02Wrwj2jVlmCUME2xKLLYY',26,3,1,'2021-09-26 15:36:29.511122','2021-09-26 15:36:29.511122',NULL),(27,'l8Z3IyN31rt3Yf7iBjvnqNFI0T1qhw',27,3,1,'2021-09-26 15:51:44.202525','2021-09-26 15:51:44.202525',NULL),(28,'NUUbYyh5b8JQMtilfTw9K6npORk4pi',28,3,1,'2021-09-26 15:53:33.532759','2021-09-26 15:53:33.532759',NULL),(29,'Md1o0eZW11F9kOGpbzE4dqgnQce9LI',29,3,1,'2021-09-27 08:40:38.983679','2021-09-27 08:40:38.983679',NULL),(30,'AsvwsKUjcR6kthCyztcLrEpkaztqce',30,3,3,'2021-09-27 14:28:33.767988','2021-09-27 14:28:33.767988',NULL),(31,'wZaG0aS0IuczhIxfXbM8aGGsy6cOsK',31,3,1,'2021-09-27 15:21:28.194789','2021-09-27 15:21:28.194789',NULL),(32,'lcZJ5XbDDteXbIX2Uc3Ry4bthaaw9A',32,3,1,'2021-09-27 16:00:48.338287','2021-09-27 16:00:48.338287',NULL),(33,'tVEbqtHPJQ3dbonB90AfO0VaCHc5hD',33,3,1,'2021-09-27 16:39:41.919303','2021-09-27 16:39:41.919303',NULL),(34,'yCOMUKW9DPKexPA8VCYsFkLu0HKZUy',34,4,8,'2021-09-28 09:38:58.390502','2021-09-28 09:38:58.390502',NULL),(35,'xOASPFbkJ9FSEl3lol6JSuacZfBAS4',35,4,8,'2021-09-28 13:10:31.306627','2021-09-28 13:10:31.306627',NULL),(36,'CJtAFB4WLIcl57qnI5jh88EO49S7Oq',36,4,8,'2021-09-28 13:51:19.744937','2021-09-28 13:51:19.744937',NULL),(40,'w3k0a45OjR64NbxDcCWg9x5xKpKl66',40,4,17,'2021-09-28 15:15:17.913265','2021-09-28 15:15:17.913265',NULL),(43,'PR9ZUxnejsDo3kUcY076IAJ7eQXfMi',43,4,3,'2021-09-28 15:21:47.666759','2021-09-28 15:21:47.666759',NULL),(44,'XOMVbqXPd055d1IssjpACj1WoXllT9',44,4,17,'2021-09-29 08:51:09.112313','2021-09-29 08:51:09.112313',NULL),(45,'ZB8TeJrvkFNqDcCMT5oOriYzK6KWWX',45,4,17,'2021-09-29 08:51:48.363677','2021-09-29 08:51:48.363677',NULL),(46,'MqK2ku92v6cWEGRJM3E2wvnGPmlJDB',46,4,17,'2021-09-29 12:20:44.820018','2021-09-29 12:20:44.820018',NULL),(47,'saYcWeOHJbSqC0qs68Uu2GOEJzWs79',47,4,17,'2021-09-29 12:21:18.941644','2021-09-29 12:21:18.941644',NULL),(48,'WGB6ODMWVNmhMEf5ODjEkQjZbUnQgG',48,5,17,'2021-10-01 11:56:00.925651','2021-10-01 11:56:00.925651',NULL),(49,'m1WhapfLTH6PE0FbWnoT37OQzdMhS2',49,5,17,'2021-10-01 13:54:32.671396','2021-10-01 13:54:32.671396',NULL),(50,'VWsJebkjXLobLW0PSr90u0UFuAstQM',50,5,17,'2021-10-02 07:48:21.289339','2021-10-02 07:48:21.289339',NULL),(51,'o3fpvtRofx8KKJa6KgggGlSPN1DcZZ',51,5,17,'2021-10-02 13:32:50.284309','2021-10-02 13:32:50.284309',NULL),(52,'lWEirSu6Z01fEeXJ5pUlvx72IQU8lL',52,5,17,'2021-10-02 13:36:09.320666','2021-10-02 13:36:09.320666',NULL),(53,'oKiL0TSFxvV0KpuLDv86RRxbv6kWT6',53,5,17,'2021-10-02 14:12:11.131595','2021-10-02 14:12:11.131595',NULL),(54,'LRn9rBcGyGqA6q5CNB3qUhBwAfm0Ec',54,5,17,'2021-10-02 17:12:53.347766','2021-10-02 17:12:53.347766',NULL),(55,'qjTg898M8i1dCcdVHM8aj4ArHNiAnA',55,5,17,'2021-10-03 12:09:32.099337','2021-10-03 12:09:32.099337',NULL),(56,'u6XTrAiVo8pxNxLqFxMuYHEfiH3rgQ',56,5,17,'2021-10-03 13:12:58.189997','2021-10-03 13:12:58.189997',NULL),(57,'6KhNU2B4119kO7103zpEl1CbMDZvpx',57,5,17,'2021-10-07 16:52:48.529947','2021-10-07 16:52:48.529947',NULL),(58,'56kXXRLLA6DHG9KZOYxJPmdCkWApl2',58,5,17,'2021-10-07 17:08:02.274791','2021-10-07 17:08:02.274791',NULL),(59,'vkPcYOkqncTDASf6vsbc02ABMItC6f',59,5,17,'2021-10-10 07:34:28.822192','2021-10-10 07:34:28.822192',NULL),(60,'lMc3obqoJrwLYCBNOHfWhYQJZ7Z0k6',60,5,17,'2021-10-10 15:18:38.922102','2021-10-10 15:18:38.922102',NULL),(63,'3UNtq1GURJptD68aoTB1QJyA3EYU7T',63,5,17,'2021-10-10 16:23:00.655923','2021-10-10 16:23:00.655923',NULL),(64,'tkZffY1St3uat0ZdwPY7CyWwYLd0rG',64,5,17,'2021-10-11 14:05:58.463703','2021-10-11 14:05:58.463703',NULL),(65,'FVJN9BvqMLHUrxpsX2m9rGOwXQ5ZjH',65,5,17,'2021-10-11 16:51:22.482064','2021-10-11 16:51:22.482064',NULL),(66,'41swoaeDO3YPTzrQOEixEGOiu3R7bv',66,5,20,'2021-10-12 10:04:20.388517','2021-10-12 10:04:20.388517',NULL),(67,'saVX5WrWBGflN5T2Dr3Ok7KGmXReZO',67,5,17,'2021-10-12 14:38:47.540843','2021-10-12 14:38:47.540843',NULL),(68,'GIbiUruVySaalpFqkKhQSqQh5WxTrF',68,5,17,'2021-11-01 08:11:10.582906','2021-11-01 08:11:10.582906',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_action`
--

DROP TABLE IF EXISTS `weddingapp_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_action` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `type` smallint unsigned NOT NULL,
  `creator_id` bigint NOT NULL,
  `wedding_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `WeddingApp_action_wedding_id_creator_id_97e534f2_uniq` (`wedding_id`,`creator_id`),
  KEY `WeddingApp_action_creator_id_b757a43b_fk_WeddingApp_user_id` (`creator_id`),
  CONSTRAINT `WeddingApp_action_creator_id_b757a43b_fk_WeddingApp_user_id` FOREIGN KEY (`creator_id`) REFERENCES `weddingapp_user` (`id`),
  CONSTRAINT `WeddingApp_action_wedding_id_63f85023_fk_WeddingApp_wedding_id` FOREIGN KEY (`wedding_id`) REFERENCES `weddingapp_wedding` (`id`),
  CONSTRAINT `weddingapp_action_chk_1` CHECK ((`type` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_action`
--

LOCK TABLES `weddingapp_action` WRITE;
/*!40000 ALTER TABLE `weddingapp_action` DISABLE KEYS */;
INSERT INTO `weddingapp_action` VALUES (1,'2021-09-13 11:54:11.629227','2021-09-13 11:54:11.629227',1,1,1),(2,'2021-09-13 11:54:11.629227','2021-09-13 11:54:11.629227',3,3,1);
/*!40000 ALTER TABLE `weddingapp_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_comment`
--

DROP TABLE IF EXISTS `weddingapp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `creator_id` bigint NOT NULL,
  `wedding_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `WeddingApp_comment_creator_id_9e41ccff_fk_WeddingApp_user_id` (`creator_id`),
  KEY `WeddingApp_comment_wedding_id_a9bf2191_fk_WeddingApp_wedding_id` (`wedding_id`),
  CONSTRAINT `WeddingApp_comment_creator_id_9e41ccff_fk_WeddingApp_user_id` FOREIGN KEY (`creator_id`) REFERENCES `weddingapp_user` (`id`),
  CONSTRAINT `WeddingApp_comment_wedding_id_a9bf2191_fk_WeddingApp_wedding_id` FOREIGN KEY (`wedding_id`) REFERENCES `weddingapp_wedding` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_comment`
--

LOCK TABLES `weddingapp_comment` WRITE;
/*!40000 ALTER TABLE `weddingapp_comment` DISABLE KEYS */;
INSERT INTO `weddingapp_comment` VALUES (1,'Like','2021-09-13 11:54:11.629227','2021-09-13 11:54:11.629227',1,1),(2,'Hay','2021-09-13 11:54:11.629227','2021-09-13 11:54:11.629227',3,1),(11,'Quá tuyệt vời','2021-09-26 15:53:47.576454','2021-09-26 15:53:47.576454',1,1),(12,'Hahahaha','2021-09-26 15:53:55.230963','2021-09-26 15:53:55.230963',1,1),(13,'Quá tệ!!!!','2021-09-27 08:40:57.509527','2021-09-27 08:40:57.509527',1,1),(18,'Chưa tốt','2021-09-27 16:02:32.174053','2021-09-27 16:02:32.174053',1,1),(19,'Rất tốt','2021-10-10 15:18:54.400336','2021-10-10 15:18:54.400336',17,1);
/*!40000 ALTER TABLE `weddingapp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_dishesanddrink`
--

DROP TABLE IF EXISTS `weddingapp_dishesanddrink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_dishesanddrink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dishes_drinks_images` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` bigint NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_dishesanddrink`
--

LOCK TABLES `weddingapp_dishesanddrink` WRITE;
/*!40000 ALTER TABLE `weddingapp_dishesanddrink` DISABLE KEYS */;
INSERT INTO `weddingapp_dishesanddrink` VALUES (1,'Súp tuyết nhĩ thịt gà xé','images/2021/10/Súp_tuyết_nhĩ_thịt_gà_xé.jpg',100000,1),(2,'Nộm thập cẩm','images/2021/10/Nộm_thập_cẩm.jpg',2000000,1),(3,'Ba chỉ quay giòn bánh hỏi','images/2021/10/Ba_chỉ_quay_giòn_bánh_hỏi.jpg',1000000,1),(4,'Gà ta rang muối','images/2021/10/Gà_ta_rang_muối.jpg',2000000,1),(5,'Tôm sú nướng tiêu','images/2021/10/Tôm_sú_nướng_tiêu.jpg',75000,1),(6,'Vịt nấu tiêu xanh – bánh mì','images/2021/10/Vịt_nấu_tiêu_xanh__bánh_mì.png',45000,1),(7,'Cơm Thố Bào Ngư Quay','images/2021/10/Cơm_Thố_Bào_Ngư_Quay.jpg',35000,1),(8,'Canh bóng thập cẩm','images/2021/10/Canh_bóng_thập_cẩm.jpg',37000,1),(9,'Chè hồ đào','images/2021/10/Chè_hồ_đào.jpg',10000,1);
/*!40000 ALTER TABLE `weddingapp_dishesanddrink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_menu`
--

DROP TABLE IF EXISTS `weddingapp_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `menu_images` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_menu`
--

LOCK TABLES `weddingapp_menu` WRITE;
/*!40000 ALTER TABLE `weddingapp_menu` DISABLE KEYS */;
INSERT INTO `weddingapp_menu` VALUES (1,'Thực đơn cổ điển','images/2021/09/1.jpg'),(2,'Thực đơn hiện đại','images/2021/10/thiet-ke-menu-nha-hang-han-quoc-51.jpg'),(3,'Thực đơn Hàn Quốc','images/2021/10/thiet-ke-menu-nha-hang-han-quoc-51_0dyGzZi.jpg'),(4,'Thực đơn Trung Quốc','images/2021/10/thiet-ke-menu-nha-hang-trung-hoa-na-tuong-8_j4nC7G3.jpg');
/*!40000 ALTER TABLE `weddingapp_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_menu_dishes_and_drink`
--

DROP TABLE IF EXISTS `weddingapp_menu_dishes_and_drink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_menu_dishes_and_drink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menu_id` bigint NOT NULL,
  `dishesanddrink_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `WeddingApp_menu_dishes_a_menu_id_dishesanddrink_i_8d3ae44b_uniq` (`menu_id`,`dishesanddrink_id`),
  KEY `WeddingApp_menu_dish_dishesanddrink_id_0195f6df_fk_WeddingAp` (`dishesanddrink_id`),
  CONSTRAINT `WeddingApp_menu_dish_dishesanddrink_id_0195f6df_fk_WeddingAp` FOREIGN KEY (`dishesanddrink_id`) REFERENCES `weddingapp_dishesanddrink` (`id`),
  CONSTRAINT `WeddingApp_menu_dish_menu_id_cd7a1cf2_fk_WeddingAp` FOREIGN KEY (`menu_id`) REFERENCES `weddingapp_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_menu_dishes_and_drink`
--

LOCK TABLES `weddingapp_menu_dishes_and_drink` WRITE;
/*!40000 ALTER TABLE `weddingapp_menu_dishes_and_drink` DISABLE KEYS */;
INSERT INTO `weddingapp_menu_dishes_and_drink` VALUES (13,1,1),(14,1,2),(15,1,3),(30,1,4),(31,1,5),(32,1,6),(33,1,7),(34,1,8),(25,2,4),(26,2,5),(27,2,6),(28,2,7),(29,2,8),(20,3,3),(21,3,4),(22,3,5),(23,3,6),(24,3,7),(35,4,1),(36,4,2),(37,4,3),(38,4,4),(39,4,5);
/*!40000 ALTER TABLE `weddingapp_menu_dishes_and_drink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_rating`
--

DROP TABLE IF EXISTS `weddingapp_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `rate` smallint unsigned NOT NULL,
  `creator_id` bigint NOT NULL,
  `wedding_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `WeddingApp_rating_wedding_id_creator_id_f589bf25_uniq` (`wedding_id`,`creator_id`),
  KEY `WeddingApp_rating_creator_id_ffcfb403_fk_WeddingApp_user_id` (`creator_id`),
  CONSTRAINT `WeddingApp_rating_creator_id_ffcfb403_fk_WeddingApp_user_id` FOREIGN KEY (`creator_id`) REFERENCES `weddingapp_user` (`id`),
  CONSTRAINT `WeddingApp_rating_wedding_id_46cd2817_fk_WeddingApp_wedding_id` FOREIGN KEY (`wedding_id`) REFERENCES `weddingapp_wedding` (`id`),
  CONSTRAINT `weddingapp_rating_chk_1` CHECK ((`rate` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_rating`
--

LOCK TABLES `weddingapp_rating` WRITE;
/*!40000 ALTER TABLE `weddingapp_rating` DISABLE KEYS */;
INSERT INTO `weddingapp_rating` VALUES (1,'2021-09-13 11:54:11.629227','2021-09-27 16:39:49.738349',1,1,1),(2,'2021-09-13 11:54:11.629227','2021-09-13 11:54:11.629227',2,3,1),(3,'2021-09-27 15:21:43.516280','2021-09-27 16:40:10.489174',5,1,2),(4,'2021-09-29 12:20:55.687296','2021-10-10 16:24:34.361048',3,17,1),(5,'2021-10-10 16:36:35.837196','2021-10-10 16:36:35.837196',3,17,2),(6,'2021-10-12 10:09:41.417889','2021-10-12 12:03:10.623204',5,20,1);
/*!40000 ALTER TABLE `weddingapp_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_service`
--

DROP TABLE IF EXISTS `weddingapp_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `service_images` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` bigint NOT NULL,
  `active` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_service`
--

LOCK TABLES `weddingapp_service` WRITE;
/*!40000 ALTER TABLE `weddingapp_service` DISABLE KEYS */;
INSERT INTO `weddingapp_service` VALUES (1,'Thiết kế thiệp cưới','images/2021/10/thiet-ke-thiep-cuoi-1.jpg',500000,1,'Giải tỏa căng thẳng khi tổ chức đám cưới và sáng tạo những tấm thiệp cưới tuyệt đẹp mà mọi người đều yêu thích'),(2,'Trang điểm ngày cưới','images/2021/10/cach-trang-diem-tu-nhien-di-dam-cuoi-2.png',300000,1,'Với dịch vụ đám cưới trọn gói bạn cũng không còn phải lo lắng nên trang điểm cô dâu ở đâu, trang điểm thế nào cho đẹp. Những chuyên gia trang điểm của cửa hàng áo cưới sẽ tư vấn và giúp bạn lựa chọn cách trang điểm phù hợp, tôn lên những nét đẹp của gương mặt, che đi những nhược điểm. Bạn sẽ trở nên xinh đẹp, thật nổi bật trước các vị quan khách.'),(3,'Phim ảnh cưới','images/2021/10/wedding-studio.jpg',700000,1,'Bạn sẽ không cần lo lắng về việc tìm kiếm một studio chụp ảnh cưới nữa khi lựa chọn dịch vụ cưới trọn gói. Những cửa hàng áo cưới sẽ giúp bạn tìm kiếm địa điểm, concept và chọn lựa trang phục chụp ảnh phù hợp với sở thích cũng như yêu cầu của bạn.'),(4,'Trang trí tiệc cưới','images/2021/10/songhuyenhn.jpg',1000000,1,'Tùy từng phong cách mà cửa hàng áo cưới trọn gói sẽ giúp bạn sắp xếp, tổ chức tiệc cưới phù hợp. Từ việc trang trí rạp, cổng đám cưới, sắp xếp chỗ ngồi quan khách, cách để ảnh cưới, bánh kem, sâm banh chúc mừng.. sẽ được chuẩn bị chu đáo'),(5,'Vũ đoàn nhảy múa, Mc dẫn chương trình','images/2021/10/Mẫu-lời-dẫn-chương-trình-hay-dành-cho-MC-đám-cưới-1.png',1500000,1,'Có thể nói nghề MC đám cưới là nghề làm dâu trăm họ và cũng vô cùng cần thiết trong việc tạo không khí cho tiệc cưới. Bởi nếu lời dẫn cưới có hay đến mấy nhưng rơi vào tay MC không chuyên thì mọi chuyện có thể biến thành thảm họa. Thực tế đã có không ít cặp đôi gặp tình huống dở khóc dở cười vì MC đám cưới vô duyên khiến sự trang trọng, ý nghĩa của bữa tiệc sẽ mất hết. Vì vậy, chọn MC dẫn chương trình đám cưới là một trong những khâu vô cùng quan trọng của đám cưới.'),(6,'Thuê trang phục cưới','images/2021/10/Kich-thuoc-tieu-chuan-cua-ke-treo-vay-cuoi-1.jpg',2000000,1,'Bạn thích những chiếc áo cưới lộng lẫy hay những chiếc áo cưới đơn giản mà vẫn sang trọng, thu hút? Bên cạnh việc đem đến những chiếc váy cưới đẹp, đa dạng phong cách, cửa hàng áo cưới trọn gói còn giúp bạn chọn lựa chiếc váy phù hợp với thân hình và phong cách ngày cưới, giúp bạn trở thành cô dâu xinh đẹp nhất trong ngày trọng đại ấy.'),(7,'Phụ kiện cưới','images/2021/10/c1-8859-1395892253.jpg',2000000,1,'Những phụ kiện cưới: hoa cầm tay, hoa cài áo chú rể, trang sức cô dâu… tưởng chừng khá dễ chuẩn bị nhưng nếu lựa chọn không khéo, kết hợp với trang phục không tinh ý, có thể biến bạn thành cô dâu quá lòe loẹt hay nhạt nhòa, không mấy ấn tượng. Những cửa hàng áo cưới trọn gói sẽ giúp bạn chuẩn bị tất cả những phụ kiện phù hợp cho ngày hạnh phúc.');
/*!40000 ALTER TABLE `weddingapp_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_user`
--

DROP TABLE IF EXISTS `weddingapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_user`
--

LOCK TABLES `weddingapp_user` WRITE;
/*!40000 ALTER TABLE `weddingapp_user` DISABLE KEYS */;
INSERT INTO `weddingapp_user` VALUES (1,'pbkdf2_sha256$260000$3QCxgHM1wAaaBCuy7VdEQP$eoBpT2eUan9WWrrZJi7L2U23jvb2Yexmlzuv5X71NBI=','2021-09-25 11:34:17.378863',1,'admin1','huytrongne','huytrongne','huytrongne@gamil.com',1,1,'2021-09-10 07:39:34.893986',''),(3,'pbkdf2_sha256$260000$eQVt6BoKrZ3CtU3SIpBZur$Q3ZJmiIUg2TFmXEruyKcNxAxbbCBbcQzRlmF/y/V184=',NULL,1,'huytrong234','Trọng','Huy','1851050160trong@ou.edu.vn',0,1,'2021-09-25 08:05:03.035654','images/2021/09/download_hUdLEOY.jpg'),(8,'pbkdf2_sha256$260000$BNKlP3Sc9kBItyQCvRsgat$Pp8mfa7S5tIHKjzBbXGb2MFibwGi1YTqXL91YxlrU+E=','2021-09-28 13:50:51.096308',1,'admin','','','abc@gmail.com',1,1,'2021-09-28 09:12:01.485051',''),(17,'pbkdf2_sha256$260000$tUXa710qA7GiGAPb6fMUYg$pS6nil1iZcnyplIsG/84WoSFwV0WMKj9tO8bOGXL55w=','2021-11-01 15:42:59.744630',1,'admin2','','','1851050160trong@ou.edu.vn',1,1,'2021-09-28 15:13:15.550754',''),(20,'pbkdf2_sha256$260000$GhbgFuO7D8OnjOW7rXmZsS$UkSk4xUDWUedrAjfNlq7tcl4qUSY/J2UTdfCnb+67J0=',NULL,0,'usertest','Trọng','Huy','1851050160trong@ou.edu.vn',0,1,'2021-10-12 10:02:44.458486','images/2021/10/unnamed_RuPSVyb.jpg'),(21,'pbkdf2_sha256$260000$dMhXUGVL4kBaJEcalefe7P$3BfI7aEURptEYhvb3eDVR9gLZYLRFMRsRq5q+9EYFcY=','2021-11-14 09:45:15.333038',1,'admin3','','','abc@gmail.com',1,1,'2021-11-14 07:35:01.520103','');
/*!40000 ALTER TABLE `weddingapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_user_groups`
--

DROP TABLE IF EXISTS `weddingapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `WeddingApp_user_groups_user_id_group_id_13f39358_uniq` (`user_id`,`group_id`),
  KEY `WeddingApp_user_groups_group_id_2d4d48ae_fk_auth_group_id` (`group_id`),
  CONSTRAINT `WeddingApp_user_groups_group_id_2d4d48ae_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `WeddingApp_user_groups_user_id_7d645619_fk_WeddingApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_user_groups`
--

LOCK TABLES `weddingapp_user_groups` WRITE;
/*!40000 ALTER TABLE `weddingapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `weddingapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_user_user_permissions`
--

DROP TABLE IF EXISTS `weddingapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `WeddingApp_user_user_per_user_id_permission_id_a092bcb4_uniq` (`user_id`,`permission_id`),
  KEY `WeddingApp_user_user_permission_id_82fc9bf6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `WeddingApp_user_user_permission_id_82fc9bf6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `WeddingApp_user_user_user_id_2396c09e_fk_WeddingAp` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_user_user_permissions`
--

LOCK TABLES `weddingapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `weddingapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `weddingapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_wedding`
--

DROP TABLE IF EXISTS `weddingapp_wedding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_wedding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number_desk` int NOT NULL,
  `total_price` bigint NOT NULL,
  `menu_id` bigint DEFAULT NULL,
  `wedding_hall_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `organize_date` date DEFAULT NULL,
  `wedding_images` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `WeddingApp_wedding_menu_id_5c791f50_fk_WeddingApp_menu_id` (`menu_id`),
  KEY `WeddingApp_wedding_wedding_hall_id_d9c04dd9_fk_WeddingAp` (`wedding_hall_id`),
  KEY `WeddingApp_wedding_user_id_7c10a4e5_fk_WeddingApp_user_id` (`user_id`),
  CONSTRAINT `WeddingApp_wedding_menu_id_5c791f50_fk_WeddingApp_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `weddingapp_menu` (`id`),
  CONSTRAINT `WeddingApp_wedding_user_id_7c10a4e5_fk_WeddingApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `weddingapp_user` (`id`),
  CONSTRAINT `WeddingApp_wedding_wedding_hall_id_d9c04dd9_fk_WeddingAp` FOREIGN KEY (`wedding_hall_id`) REFERENCES `weddingapp_weddinghall` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_wedding`
--

LOCK TABLES `weddingapp_wedding` WRITE;
/*!40000 ALTER TABLE `weddingapp_wedding` DISABLE KEYS */;
INSERT INTO `weddingapp_wedding` VALUES (1,300,500000,1,1,1,'2020-09-24','images/2021/09/dam-cuoi-khao-khat-5.jpg','Tiệc cưới của anh Huy Trọng','2019-10-01 09:38:43.230697'),(2,400,1000000,2,2,1,'2019-10-30','images/2021/09/dam-cuoi-khao-khat-5.jpg',NULL,'2020-09-02 09:38:43.230697'),(3,500,2000000,NULL,NULL,1,'2018-11-12','images/2021/09/dam-cuoi-khao-khat-5.jpg',NULL,'2021-08-03 09:38:43.230697'),(4,600,200000,NULL,NULL,1,'2020-12-28','images/2021/09/dam-cuoi-khao-khat-5.jpg',NULL,'2018-07-04 09:38:43.230697'),(8,200,65000000,1,1,17,'2021-10-01','images/2021/09/dam-cuoi-khao-khat-5.jpg','test','2020-06-03 09:38:43.230697'),(19,300,90008000,1,1,17,'2021-10-14','images/2021/09/dam-cuoi-khao-khat-5.jpg','Test thanh toán','2019-05-05 09:38:43.230697'),(21,300,94500000,1,3,17,'2019-10-16','images/2021/09/dam-cuoi-khao-khat-5.jpg','Ngày cưới của chúng tôi','2020-04-07 09:38:43.230697'),(22,200,39200000,1,1,17,'2018-10-27','images/2021/09/dam-cuoi-khao-khat-5.jpg','test test test','2019-03-10 09:38:43.230697'),(23,300,52800000,2,3,17,'2021-10-01','images/2021/09/dam-cuoi-khao-khat-5.jpg','Tiệc cưới Huy Trọng','2021-02-11 09:38:43.230697'),(24,198,653190000,3,7,17,'2021-10-27','images/2021/09/dam-cuoi-khao-khat-5.jpg','Tiệc Huy Trọng','2021-01-12 09:38:43.230697');
/*!40000 ALTER TABLE `weddingapp_wedding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_wedding_services`
--

DROP TABLE IF EXISTS `weddingapp_wedding_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_wedding_services` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wedding_id` bigint NOT NULL,
  `service_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `WeddingApp_wedding_services_wedding_id_service_id_a46a74e7_uniq` (`wedding_id`,`service_id`),
  KEY `WeddingApp_wedding_s_service_id_50fae875_fk_WeddingAp` (`service_id`),
  CONSTRAINT `WeddingApp_wedding_s_service_id_50fae875_fk_WeddingAp` FOREIGN KEY (`service_id`) REFERENCES `weddingapp_service` (`id`),
  CONSTRAINT `WeddingApp_wedding_s_wedding_id_22e225b6_fk_WeddingAp` FOREIGN KEY (`wedding_id`) REFERENCES `weddingapp_wedding` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_wedding_services`
--

LOCK TABLES `weddingapp_wedding_services` WRITE;
/*!40000 ALTER TABLE `weddingapp_wedding_services` DISABLE KEYS */;
INSERT INTO `weddingapp_wedding_services` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(13,19,1),(14,19,2),(17,21,2),(19,21,3),(18,21,5),(22,22,1),(20,22,4),(21,22,5),(25,23,1),(26,23,2),(27,23,3),(23,23,4),(24,23,5),(28,24,1),(29,24,4),(30,24,7);
/*!40000 ALTER TABLE `weddingapp_wedding_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingapp_weddinghall`
--

DROP TABLE IF EXISTS `weddingapp_weddinghall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingapp_weddinghall` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time_wedding` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wedding_hall_images` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wedding_hall_price` bigint NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingapp_weddinghall`
--

LOCK TABLES `weddingapp_weddinghall` WRITE;
/*!40000 ALTER TABLE `weddingapp_weddinghall` DISABLE KEYS */;
INSERT INTO `weddingapp_weddinghall` VALUES (1,'Riverside Palace','Sáng','images/2021/10/sanh-cuoi-dep-va-tot-nhat-1_kYrdkrF.jpg','362 Nguyen Van Cong, Go Vap, tp.HCM',15000000,'Với diện tích 5.000m2, Riverside Palace mang đến một không gian khoáng đạt nhưng vẫn giữ được nét ấm cúng, thân mật. Sảnh được thiết kế và ngăn nhau bằng kính trong suốt, ánh sáng được bố trí phản chiếu nhẹ nhàng và thanh dịu đã tạo cho nhà hàng tiệc cưới Riverside Palace một hiệu ứng không gian hiện đại, cuốn hút một cách liền mạch với nhau. Đây là sảnh tiệc cưới số 1 ở thành phố Hồ Chí Minh.',1),(2,'Riverside Palace','Chiều','images/2021/10/sanh-cuoi-dep-va-tot-nhat-1_8kBk94Z.jpg','362 Nguyen Van Cong, Go Vap, tp.HCM',16000000,'Với diện tích 5.000m2, Riverside Palace mang đến một không gian khoáng đạt nhưng vẫn giữ được nét ấm cúng, thân mật. Sảnh được thiết kế và ngăn nhau bằng kính trong suốt, ánh sáng được bố trí phản chiếu nhẹ nhàng và thanh dịu đã tạo cho nhà hàng tiệc cưới Riverside Palace một hiệu ứng không gian hiện đại, cuốn hút một cách liền mạch với nhau. Đây là sảnh tiệc cưới số 1 ở thành phố Hồ Chí Minh.',1),(3,'Riverside Palace','Tối','images/2021/10/sanh-cuoi-dep-va-tot-nhat-1.jpg','362 Nguyen Van Cong, Go Vap, tp.HCM',17000000,'Với diện tích 5.000m2, Riverside Palace mang đến một không gian khoáng đạt nhưng vẫn giữ được nét ấm cúng, thân mật. Sảnh được thiết kế và ngăn nhau bằng kính trong suốt, ánh sáng được bố trí phản chiếu nhẹ nhàng và thanh dịu đã tạo cho nhà hàng tiệc cưới Riverside Palace một hiệu ứng không gian hiện đại, cuốn hút một cách liền mạch với nhau. Đây là sảnh tiệc cưới số 1 ở thành phố Hồ Chí Minh.',1),(4,'White Palace','Sáng','images/2021/10/trang-tri-tiec-cuoi-cao-cap-4.jpg','36 To Huu, q2, tp.HCM',20000000,'White Palace là sảnh cưới sang trọng bậc nhất tại Tp.HCM. Với tổng diện tích sàn 8000 m2. White Palace phủ lên mình lớp áo trắng sang trọng và lịch lãm. Ánh đèn chùm lộng lẫy nguy nga khiến cả tòa nhà về đêm mang một vẻ đẹp huyền ảo.White Palace là nhà hàng tiệc cưới nổi tiếng nhất ở Thành phố Hồ Chí Minh.',1),(5,'White Palace','Chiều','images/2021/10/trang-tri-tiec-cuoi-cao-cap-4_02G53mr.jpg','36 To Huu, q2, tp.HCM',22000000,'White Palace là sảnh cưới sang trọng bậc nhất tại Tp.HCM. Với tổng diện tích sàn 8000 m2. White Palace phủ lên mình lớp áo trắng sang trọng và lịch lãm. Ánh đèn chùm lộng lẫy nguy nga khiến cả tòa nhà về đêm mang một vẻ đẹp huyền ảo.White Palace là nhà hàng tiệc cưới nổi tiếng nhất ở Thành phố Hồ Chí Minh.',1),(6,'White Palace','Tối','images/2021/10/trang-tri-tiec-cuoi-cao-cap-4_TAcHvOR.jpg','36 To Huu, q2, tp.HCM',25000000,'White Palace là sảnh cưới sang trọng bậc nhất tại Tp.HCM. Với tổng diện tích sàn 8000 m2. White Palace phủ lên mình lớp áo trắng sang trọng và lịch lãm. Ánh đèn chùm lộng lẫy nguy nga khiến cả tòa nhà về đêm mang một vẻ đẹp huyền ảo.White Palace là nhà hàng tiệc cưới nổi tiếng nhất ở Thành phố Hồ Chí Minh.',1),(7,'Diamond Place','Sáng','images/2021/10/thiet-ke-sanh-nha-hang-tiec-cuoi-4.jpg','q.Phu Nhuan tp.HCM',25000000,'Diamond Place tọa lạc tại quận Phú Nhuận, mặt tiền rộng và đẹp với diện tích hơn 4.000m2 cùng bãi đậu xe rất rộng. Diamond Place sở hữu những khán phòng sang trọng và thanh nhã. Không chỉ vậy, sảnh tiệc của Diamond Place có thể ngăn ra hoặc kết hợp với nhau thành những khán phòng rộng với tầm nhìn thoáng đãng cho những buổi tiệc cưới hay hội nghị quy mô lớn hơn 1000 khách. Đây chính là nhà hàng tiệc cưới đắt đỏ nhất ở thành phố Hồ Chí Minh.',1),(8,'Diamond Place','Chiều','images/2021/10/thiet-ke-sanh-nha-hang-tiec-cuoi-4_r84xEBq.jpg','q.Phu Nhuan tp.HCM',27000000,'Diamond Place tọa lạc tại quận Phú Nhuận, mặt tiền rộng và đẹp với diện tích hơn 4.000m2 cùng bãi đậu xe rất rộng. Diamond Place sở hữu những khán phòng sang trọng và thanh nhã. Không chỉ vậy, sảnh tiệc của Diamond Place có thể ngăn ra hoặc kết hợp với nhau thành những khán phòng rộng với tầm nhìn thoáng đãng cho những buổi tiệc cưới hay hội nghị quy mô lớn hơn 1000 khách. Đây chính là nhà hàng tiệc cưới đắt đỏ nhất ở thành phố Hồ Chí Minh.',1),(9,'Diamond Place','Tối','images/2021/10/thiet-ke-sanh-nha-hang-tiec-cuoi-4_z5qHX72.jpg','q.Phu Nhuan tp.HCM',30000000,'Diamond Place tọa lạc tại quận Phú Nhuận, mặt tiền rộng và đẹp với diện tích hơn 4.000m2 cùng bãi đậu xe rất rộng. Diamond Place sở hữu những khán phòng sang trọng và thanh nhã. Không chỉ vậy, sảnh tiệc của Diamond Place có thể ngăn ra hoặc kết hợp với nhau thành những khán phòng rộng với tầm nhìn thoáng đãng cho những buổi tiệc cưới hay hội nghị quy mô lớn hơn 1000 khách. Đây chính là nhà hàng tiệc cưới đắt đỏ nhất ở thành phố Hồ Chí Minh.',1),(10,'Intercontinental Asiana Sài Gòn','Sáng','images/2021/10/9.jpg','q.Phu Nhuan tp.HCM',19000000,'Khi đến với Intercontinental Asiana Saigon, khách hàng sẽ cảm nhận được sự sang trọng, lịch sự cùng với không gian hiện đại, cao cấp đặc trưng của sảnh cưới 5 sao. Điểm đặc biệt khi tổ chức tiệc cưới tại Intercontinental Asiana Saigon, đội ngũ tư vấn cũng linh động hỗ trợ khách hàng trang trí không gian tiệc theo như ý muốn.',1),(11,'Intercontinental Asiana Sài Gòn','Chiều','images/2021/10/9_P5LxoJk.jpg','q.Phu Nhuan tp.HCM',20000000,'Khi đến với Intercontinental Asiana Saigon, khách hàng sẽ cảm nhận được sự sang trọng, lịch sự cùng với không gian hiện đại, cao cấp đặc trưng của sảnh cưới 5 sao. Điểm đặc biệt khi tổ chức tiệc cưới tại Intercontinental Asiana Saigon, đội ngũ tư vấn cũng linh động hỗ trợ khách hàng trang trí không gian tiệc theo như ý muốn.',1),(12,'Intercontinental Asiana Sài Gòn','Tối','images/2021/10/9_4Nocfgo.jpg','q.Phu Nhuan tp.HCM',21000000,'Khi đến với Intercontinental Asiana Saigon, khách hàng sẽ cảm nhận được sự sang trọng, lịch sự cùng với không gian hiện đại, cao cấp đặc trưng của sảnh cưới 5 sao. Điểm đặc biệt khi tổ chức tiệc cưới tại Intercontinental Asiana Saigon, đội ngũ tư vấn cũng linh động hỗ trợ khách hàng trang trí không gian tiệc theo như ý muốn.',1),(13,'Metropole','Sáng','images/2021/10/P_H-1562.jpg','Ly Chinh Thang street, tp.HCM',20000000,'Nằm trên trục đường giao thông thuận tiện Lý Chính Thắng – Nguyễn Thông, Sảnh cưới Metropole được xây dựng trên khuôn viên rộng rãi, lối kiến trúc theo phong cách sang trọng với sức chứa lên đến hơn 2000 khách cho toàn bộ 5 sảnh tiệc, được thiết kế dựa trên những điểm nhất nổi bật của 5 thành phố lớn trên thế giới đó là Tokyo, Thượng Hải, New York, Paris và Sài Gòn.',1),(14,'Metropole','Chiều','images/2021/10/P_H-1562_D03iwPp.jpg','Ly Chinh Thang street, tp.HCM',21000000,'Nằm trên trục đường giao thông thuận tiện Lý Chính Thắng – Nguyễn Thông, Sảnh cưới Metropole được xây dựng trên khuôn viên rộng rãi, lối kiến trúc theo phong cách sang trọng với sức chứa lên đến hơn 2000 khách cho toàn bộ 5 sảnh tiệc, được thiết kế dựa trên những điểm nhất nổi bật của 5 thành phố lớn trên thế giới đó là Tokyo, Thượng Hải, New York, Paris và Sài Gòn.',1),(15,'Metropole','Tối','images/2021/10/P_H-1562_AIJCM3G.jpg','Ly Chinh Thang street, tp.HCM',22000000,'Nằm trên trục đường giao thông thuận tiện Lý Chính Thắng – Nguyễn Thông, Sảnh cưới Metropole được xây dựng trên khuôn viên rộng rãi, lối kiến trúc theo phong cách sang trọng với sức chứa lên đến hơn 2000 khách cho toàn bộ 5 sảnh tiệc, được thiết kế dựa trên những điểm nhất nổi bật của 5 thành phố lớn trên thế giới đó là Tokyo, Thượng Hải, New York, Paris và Sài Gòn.',1);
/*!40000 ALTER TABLE `weddingapp_weddinghall` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-14 16:54:46
