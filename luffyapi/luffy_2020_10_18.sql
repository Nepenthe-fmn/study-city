-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: luffy
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `codename` varchar(100) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry','add_logentry',1),(2,'Can change log entry','change_logentry',1),(3,'Can delete log entry','delete_logentry',1),(4,'Can view log entry','view_logentry',1),(5,'Can add permission','add_permission',2),(6,'Can change permission','change_permission',2),(7,'Can delete permission','delete_permission',2),(8,'Can view permission','view_permission',2),(9,'Can add group','add_group',3),(10,'Can change group','change_group',3),(11,'Can delete group','delete_group',3),(12,'Can view group','view_group',3),(13,'Can add content type','add_contenttype',4),(14,'Can change content type','change_contenttype',4),(15,'Can delete content type','delete_contenttype',4),(16,'Can view content type','view_contenttype',4),(17,'Can add session','add_session',5),(18,'Can change session','change_session',5),(19,'Can delete session','delete_session',5),(20,'Can view session','view_session',5),(21,'Can add User Widget','add_userwidget',6),(22,'Can change User Widget','change_userwidget',6),(23,'Can delete User Widget','delete_userwidget',6),(24,'Can view User Widget','view_userwidget',6),(25,'Can add User Setting','add_usersettings',7),(26,'Can change User Setting','change_usersettings',7),(27,'Can delete User Setting','delete_usersettings',7),(28,'Can view User Setting','view_usersettings',7),(29,'Can add log entry','add_log',8),(30,'Can change log entry','change_log',8),(31,'Can delete log entry','delete_log',8),(32,'Can view log entry','view_log',8),(33,'Can add Bookmark','add_bookmark',9),(34,'Can change Bookmark','change_bookmark',9),(35,'Can delete Bookmark','delete_bookmark',9),(36,'Can view Bookmark','view_bookmark',9),(37,'Can add revision','add_revision',10),(38,'Can change revision','change_revision',10),(39,'Can delete revision','delete_revision',10),(40,'Can view revision','view_revision',10),(41,'Can add version','add_version',11),(42,'Can change version','change_version',11),(43,'Can delete version','delete_version',11),(44,'Can view version','view_version',11),(45,'Can add 轮播图','add_banner',12),(46,'Can change 轮播图','change_banner',12),(47,'Can delete 轮播图','delete_banner',12),(48,'Can view 轮播图','view_banner',12),(49,'Can add 导航','add_nav',13),(50,'Can change 导航','change_nav',13),(51,'Can delete 导航','delete_nav',13),(52,'Can view 导航','view_nav',13),(53,'Can add 用户','add_user',14),(54,'Can change 用户','change_user',14),(55,'Can delete 用户','delete_user',14),(56,'Can view 用户','view_user',14),(57,'Can add 课程章节','add_coursechapter',15),(58,'Can change 课程章节','change_coursechapter',15),(59,'Can delete 课程章节','delete_coursechapter',15),(60,'Can view 课程章节','view_coursechapter',15),(61,'Can add 课程分类','add_coursecategory',16),(62,'Can change 课程分类','change_coursecategory',16),(63,'Can delete 课程分类','delete_coursecategory',16),(64,'Can view 课程分类','view_coursecategory',16),(65,'Can add 讲师导师','add_teacher',17),(66,'Can change 讲师导师','change_teacher',17),(67,'Can delete 讲师导师','delete_teacher',17),(68,'Can view 讲师导师','view_teacher',17),(69,'Can add 实战课程','add_course',18),(70,'Can change 实战课程','change_course',18),(71,'Can delete 实战课程','delete_course',18),(72,'Can view 实战课程','view_course',18),(73,'Can add 课程课时','add_courselesson',19),(74,'Can change 课程课时','change_courselesson',19),(75,'Can delete 课程课时','delete_courselesson',19),(76,'Can view 课程课时','view_courselesson',19),(77,'Can add 课程分类','add_coursecategory',20),(78,'Can change 课程分类','change_coursecategory',20),(79,'Can delete 课程分类','delete_coursecategory',20),(80,'Can view 课程分类','view_coursecategory',20),(81,'Can add 课程章节','add_coursechapter',21),(82,'Can change 课程章节','change_coursechapter',21),(83,'Can delete 课程章节','delete_coursechapter',21),(84,'Can view 课程章节','view_coursechapter',21),(85,'Can add 实战课程','add_course',22),(86,'Can change 实战课程','change_course',22),(87,'Can delete 实战课程','delete_course',22),(88,'Can view 实战课程','view_course',22),(89,'Can add 课程课时','add_courselesson',23),(90,'Can change 课程课时','change_courselesson',23),(91,'Can delete 课程课时','delete_courselesson',23),(92,'Can view 课程课时','view_courselesson',23),(93,'Can add 讲师导师','add_teacher',24),(94,'Can change 讲师导师','change_teacher',24),(95,'Can delete 讲师导师','delete_teacher',24),(96,'Can view 讲师导师','view_teacher',24),(97,'Can add 课程与有效期','add_courseexpire',25),(98,'Can change 课程与有效期','change_courseexpire',25),(99,'Can delete 课程与有效期','delete_courseexpire',25),(100,'Can view 课程与有效期','view_courseexpire',25),(101,'Can add 活动记录表','add_activity',26),(102,'Can change 活动记录表','change_activity',26),(103,'Can delete 活动记录表','delete_activity',26),(104,'Can view 活动记录表','view_activity',26),(105,'Can add 课程优惠类型','add_coursediscounttype',27),(106,'Can change 课程优惠类型','change_coursediscounttype',27),(107,'Can delete 课程优惠类型','delete_coursediscounttype',27),(108,'Can view 课程优惠类型','view_coursediscounttype',27),(109,'Can add 课程优惠策略','add_coursediscount',28),(110,'Can change 课程优惠策略','change_coursediscount',28),(111,'Can delete 课程优惠策略','delete_coursediscount',28),(112,'Can view 课程优惠策略','view_coursediscount',28),(113,'Can add 课程活动价格表','add_activitydiscount',29),(114,'Can change 课程活动价格表','change_activitydiscount',29),(115,'Can delete 课程活动价格表','delete_activitydiscount',29),(116,'Can view 课程活动价格表','view_activitydiscount',29),(117,'Can add 订单记录','add_order',30),(118,'Can change 订单记录','change_order',30),(119,'Can delete 订单记录','delete_order',30),(120,'Can view 订单记录','view_order',30),(121,'Can add 订单详情','add_orderdetail',31),(122,'Can change 订单详情','change_orderdetail',31),(123,'Can delete 订单详情','delete_orderdetail',31),(124,'Can view 订单详情','view_orderdetail',31),(125,'Can add 优惠券类型','add_coupon',32),(126,'Can change 优惠券类型','change_coupon',32),(127,'Can delete 优惠券类型','delete_coupon',32),(128,'Can view 优惠券类型','view_coupon',32),(129,'Can add 用户的优惠券','add_usercoupon',33),(130,'Can change 用户的优惠券','change_usercoupon',33),(131,'Can delete 用户的优惠券','delete_usercoupon',33),(132,'Can view 用户的优惠券','view_usercoupon',33),(133,'Can add 积分','add_credit',34),(134,'Can change 积分','change_credit',34),(135,'Can delete 积分','delete_credit',34),(136,'Can view 积分','view_credit',34),(137,'Can view 积分','view_credits',34),(138,'Can add 积分','add_credits',34),(139,'Can change 积分','change_credits',34),(140,'Can delete 积分','delete_credits',34),(141,'Can add 用户课程购买记录','add_usercourse',35),(142,'Can change 用户课程购买记录','change_usercourse',35),(143,'Can delete 用户课程购买记录','delete_usercourse',35),(144,'Can view 用户课程购买记录','view_usercourse',35);
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_ly_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(32,'coupon','coupon'),(33,'coupon','usercoupon'),(18,'course','course'),(16,'course','coursecategory'),(15,'course','coursechapter'),(19,'course','courselesson'),(17,'course','teacher'),(26,'courses','activity'),(29,'courses','activitydiscount'),(22,'courses','course'),(20,'courses','coursecategory'),(21,'courses','coursechapter'),(28,'courses','coursediscount'),(27,'courses','coursediscounttype'),(25,'courses','courseexpire'),(23,'courses','courselesson'),(24,'courses','teacher'),(12,'home','banner'),(13,'home','nav'),(30,'orders','order'),(31,'orders','orderdetail'),(10,'reversion','revision'),(11,'reversion','version'),(5,'sessions','session'),(34,'users','credit'),(14,'users','user'),(35,'users','usercourse'),(9,'xadmin','bookmark'),(8,'xadmin','log'),(7,'xadmin','usersettings'),(6,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-09-21 17:56:44.812533'),(2,'contenttypes','0002_remove_content_type_name','2020-09-21 17:56:44.894900'),(3,'auth','0001_initial','2020-09-21 17:56:44.995682'),(4,'users','0001_initial','2020-09-21 17:56:45.175295'),(5,'admin','0001_initial','2020-09-21 17:56:45.354674'),(6,'admin','0002_logentry_user','2020-09-21 17:56:45.419014'),(7,'home','0001_initial','2020-09-21 17:56:45.483578'),(8,'reversion','0001_initial','2020-09-21 17:56:45.531857'),(9,'sessions','0001_initial','2020-09-21 17:56:45.601066'),(10,'xadmin','0001_initial','2020-09-21 17:56:45.733335'),(13,'courses','0001_initial','2020-09-26 04:46:19.434052'),(14,'courses','0002_courseexpire','2020-09-28 13:04:10.549706'),(15,'courses','0003_auto_20200928_2142','2020-09-28 13:42:46.948255'),(16,'courses','0004_auto_20201004_2330','2020-10-04 15:30:43.673268'),(17,'orders','0001_initial','2020-10-04 15:30:43.866296'),(18,'courses','0005_auto_20201004_2354','2020-10-04 15:54:49.010700'),(19,'orders','0002_orderdetail_expire_text','2020-10-04 15:54:49.158884'),(20,'courses','0006_auto_20201005_1034','2020-10-05 02:34:10.703704'),(21,'coupon','0001_initial','2020-10-05 02:34:11.046527'),(39,'coupon','0002_auto_20201013_2040','2020-10-13 13:28:17.316992'),(40,'coupon','0003_auto_20201013_2050','2020-10-13 13:28:17.361092'),(41,'coupon','0004_auto_20201013_2057','2020-10-13 13:28:17.379628'),(42,'coupon','0005_auto_20201013_2108','2020-10-13 13:28:17.400639'),(43,'coupon','0006_auto_20201013_2113','2020-10-13 13:28:17.425355'),(44,'coupon','0007_auto_20201013_2128','2020-10-13 13:28:17.446453'),(45,'courses','0007_auto_20201013_2040','2020-10-13 13:28:17.458179'),(46,'courses','0008_auto_20201013_2050','2020-10-13 13:28:17.566974'),(47,'courses','0009_auto_20201013_2057','2020-10-13 13:28:17.577346'),(48,'courses','0010_auto_20201013_2108','2020-10-13 13:28:17.588541'),(49,'courses','0011_auto_20201013_2113','2020-10-13 13:28:17.600870'),(50,'courses','0012_auto_20201013_2128','2020-10-13 13:28:17.611243'),(51,'home','0002_auto_20201013_2050','2020-10-13 13:28:17.622851'),(52,'orders','0003_auto_20201013_2050','2020-10-13 13:28:17.651220'),(53,'coupon','0008_auto_20201013_2202','2020-10-13 14:03:13.184919'),(54,'courses','0013_auto_20201013_2202','2020-10-13 14:03:13.196543'),(55,'users','0002_auto_20201013_2202','2020-10-13 14:03:23.872815'),(56,'coupon','0009_auto_20201013_2208','2020-10-13 14:08:49.971497'),(57,'courses','0014_auto_20201013_2208','2020-10-13 14:08:49.975484'),(58,'coupon','0010_auto_20201013_2213','2020-10-13 14:13:34.777863'),(59,'courses','0015_auto_20201013_2213','2020-10-13 14:13:34.789289'),(60,'users','0003_user_credit','2020-10-13 14:14:31.641055'),(61,'coupon','0011_auto_20201016_1555','2020-10-16 07:55:48.380358'),(62,'courses','0016_auto_20201016_1555','2020-10-16 07:55:48.401547'),(63,'users','0004_usercourse','2020-10-16 07:55:48.485546');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('euh43uaut9euduqi6ksbgnxfij3g8ppl','OTU5ZjUwODVhYjMxYzU4OTEwNGYyN2RlOTYxYmFmNjRiYTE0MzJiZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudXRpbHMuQXV0aE1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjZiZTc0NmRjMzE4YmQyZThkNzNhY2JmNzgyMzk3NDUxNzM0OGM0YjkiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2UiLCJjb3Vyc2VjYXRlZ29yeSJdLCIiXX0=','2020-10-08 09:39:34.800946'),('mrv56099jjsi06aiu4dhji2tfzcon1xm','YjQ1MjcxMmNiYjVhNTNhMTk0MDg2NjYzNzk0NmU0ZDMwZmFiOGFlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudXRpbHMuQXV0aE1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjZiZTc0NmRjMzE4YmQyZThkNzNhY2JmNzgyMzk3NDUxNzM0OGM0YjkiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2020-10-10 07:52:04.668649'),('naw6vanxmki9aqvu5bbtx88xqx45d59a','NjFkOTQ1MmVjZmIyMzFlZjI2YzJkZTAxOWZjYWQ2ZWU4M2VjODRiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudXRpbHMuQXV0aE1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjZiZTc0NmRjMzE4YmQyZThkNzNhY2JmNzgyMzk3NDUxNzM0OGM0YjkiLCJMSVNUX1FVRVJZIjpbWyJjb3Vwb24iLCJjb3Vwb24iXSwiIl19','2020-10-28 00:31:20.924099');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_activity`
--

DROP TABLE IF EXISTS `ly_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_activity`
--

LOCK TABLES `ly_activity` WRITE;
/*!40000 ALTER TABLE `ly_activity` DISABLE KEYS */;
INSERT INTO `ly_activity` VALUES (1,'五一优惠大放送',0,1,0,'2020-10-03 01:54:42.727523','2020-10-13 11:58:30.031793','2020-10-12 16:00:00.000000','2020-10-19 16:00:00.000000'),(2,'十一金秋大优惠',0,1,0,'2020-10-03 01:55:41.051747','2020-10-13 11:58:19.174560','2020-10-12 16:00:00.000000','2020-10-19 16:00:00.000000');
/*!40000 ALTER TABLE `ly_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_activity_discount`
--

DROP TABLE IF EXISTS `ly_activity_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_activity_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_activity_discount_activity_id_163f8fed_fk_ly_activity_id` (`activity_id`),
  KEY `ly_activity_discount_course_id_b9bb4bf3_fk_ly_course_id` (`course_id`),
  KEY `ly_activity_discount_discount_id_c77bcf5c_fk_ly_course` (`discount_id`),
  CONSTRAINT `ly_activity_discount_activity_id_163f8fed_fk_ly_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `ly_activity` (`id`),
  CONSTRAINT `ly_activity_discount_course_id_b9bb4bf3_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`),
  CONSTRAINT `ly_activity_discount_discount_id_c77bcf5c_fk_ly_course` FOREIGN KEY (`discount_id`) REFERENCES `ly_course_discount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_activity_discount`
--

LOCK TABLES `ly_activity_discount` WRITE;
/*!40000 ALTER TABLE `ly_activity_discount` DISABLE KEYS */;
INSERT INTO `ly_activity_discount` VALUES (1,NULL,0,1,0,'2020-10-03 01:56:33.902200','2020-10-03 02:01:05.967990',1,1,1),(2,NULL,0,1,0,'2020-10-03 02:01:28.391694','2020-10-03 02:01:28.391724',2,2,2),(5,NULL,0,1,0,'2020-10-03 02:02:10.798647','2020-10-03 02:03:59.330944',2,3,5),(7,NULL,0,1,0,'2020-10-03 02:06:23.568709','2020-10-03 02:06:23.568741',2,1,1),(8,NULL,0,1,0,'2020-10-03 03:40:18.634464','2020-10-04 08:58:44.951826',2,4,8);
/*!40000 ALTER TABLE `ly_activity_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_banner`
--

DROP TABLE IF EXISTS `ly_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `note` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_banner`
--

LOCK TABLES `ly_banner` WRITE;
/*!40000 ALTER TABLE `ly_banner` DISABLE KEYS */;
INSERT INTO `ly_banner` VALUES (1,'alex',1,1,0,'2020-09-14 18:00:56.711116','2020-09-14 18:00:56.711159','banner/alex.jpeg','alex','http://www.luffy.com/alex'),(4,'banne',2,1,0,'2020-09-14 18:02:27.942230','2020-09-14 18:02:27.942261','banner/banner1.png','banne','http://www.luffy.com/bann2'),(5,'bann2',3,1,0,'2020-09-14 18:02:46.367044','2020-09-14 18:02:46.367079','banner/banner2.png','bann2','http://www.luffy.com/bann2');
/*!40000 ALTER TABLE `ly_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_coupon`
--

DROP TABLE IF EXISTS `ly_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `coupon_type` smallint(6) NOT NULL,
  `duration` int(11) NOT NULL,
  `condition` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `method` smallint(6) NOT NULL,
  `sale` longtext NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_coupon_course_id_91e7a35a_fk_ly_course_id` (`course_id`),
  CONSTRAINT `ly_coupon_course_id_91e7a35a_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_coupon`
--

LOCK TABLES `ly_coupon` WRITE;
/*!40000 ALTER TABLE `ly_coupon` DISABLE KEYS */;
INSERT INTO `ly_coupon` VALUES (1,'20元优惠券',0,1,0,'2020-10-05 03:02:13.128732','2020-10-05 07:34:10.011496',1,7,100,100,1,'-20',NULL),(6,'八折课程优惠券',0,1,0,'2020-10-05 03:18:53.846847','2020-10-05 08:01:46.601346',2,7,0,100,1,'*0.8',1),(7,'500元优惠券',0,1,0,'2020-10-05 03:25:18.793663','2020-10-05 03:25:18.793704',1,7,20000,100,1,'-500',NULL),(8,'70元优惠券',0,1,0,'2020-10-05 03:25:42.145069','2020-10-14 00:31:20.822121',1,7,700,100,1,'-50',NULL),(9,'限时减免',0,1,0,'2020-10-05 03:54:55.990465','2020-10-05 03:54:55.990509',1,7,500,100,1,'-100',NULL),(10,'C++课程制定券',0,1,0,'2020-10-05 05:11:50.609433','2020-10-05 05:11:50.609474',2,7,0,100,1,'*0.9',4),(11,'50元优惠券',0,1,0,'2020-10-05 07:34:36.443725','2020-10-05 07:34:36.443896',1,7,400,100,1,'-50',NULL);
/*!40000 ALTER TABLE `ly_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course`
--

DROP TABLE IF EXISTS `ly_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `course_img` varchar(255) DEFAULT NULL,
  `course_video` varchar(255) DEFAULT NULL,
  `course_type` smallint(6) NOT NULL,
  `brief` longtext,
  `level` smallint(6) NOT NULL,
  `pub_date` date NOT NULL,
  `period` int(11) NOT NULL,
  `attachment_path` varchar(128) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `students` int(11) NOT NULL,
  `lessons` int(11) NOT NULL,
  `pub_lessons` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `course_category_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_course_category_id_0fae919c_fk_ly_course_category_id` (`course_category_id`),
  KEY `ly_course_teacher_id_1a7162ce_fk_ly_teacher_id` (`teacher_id`),
  CONSTRAINT `ly_course_course_category_id_0fae919c_fk_ly_course_category_id` FOREIGN KEY (`course_category_id`) REFERENCES `ly_course_category` (`id`),
  CONSTRAINT `ly_course_teacher_id_1a7162ce_fk_ly_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `ly_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course`
--

LOCK TABLES `ly_course` WRITE;
/*!40000 ALTER TABLE `ly_course` DISABLE KEYS */;
INSERT INTO `ly_course` VALUES (1,'7天python从入门到放弃',3,1,0,'2020-09-23 07:30:26.966935','2020-10-17 07:10:45.625017','course/wlop.jpg','course_video/Wlop.mp4',0,'<p>Python从入门到入土，终生受益，回味无穷。</p>',2,'2020-09-23',71,'123.jpg',0,906,10,8,1000.00,1,1),(2,'7天java从入门到放弃',3,1,0,'2020-09-23 07:30:26.966935','2020-10-17 07:10:45.628812','course/2.jpeg','course_video/2.jpeg',0,'33333333333333333333333333333333',2,'2020-09-23',71,'123.jpg',0,805,10,8,1600.00,3,1),(3,'7天前端从入门到放弃',3,1,0,'2020-09-23 07:30:26.966935','2020-09-26 13:07:26.733883','course/2.jpeg','course_video/2.jpeg',0,'<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"height:100%; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>2</td>\r\n			<td>3</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td>5</td>\r\n			<td>6</td>\r\n		</tr>\r\n		<tr>\r\n			<td>7</td>\r\n			<td>8</td>\r\n			<td>9</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><img alt=\"\" src=\"/media/course/wlop.jpg\" /></p>',2,'2020-09-23',71,'123.jpg',0,400,10,8,1400.00,2,1),(4,'7天C++从入门到放弃',3,1,0,'2020-09-23 07:30:26.966935','2020-09-26 09:15:02.960011','course/2.jpeg','course_video/2.jpeg',0,'<p>33333333333333333333333333333333</p>',2,'2020-09-23',71,'123.jpg',0,1000,10,8,2000.00,4,1),(5,'数据结构',0,1,0,'2020-10-03 08:07:21.914691','2020-10-17 06:52:51.450515','course/wlop.jpg','course_video/Wlop.mp4',0,'<p>按时发打发大是大非</p>',1,'2020-10-03',7,'',0,101,20,10,6200.00,5,1);
/*!40000 ALTER TABLE `ly_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_category`
--

DROP TABLE IF EXISTS `ly_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_category`
--

LOCK TABLES `ly_course_category` WRITE;
/*!40000 ALTER TABLE `ly_course_category` DISABLE KEYS */;
INSERT INTO `ly_course_category` VALUES (1,'python',1,1,0,'2019-11-11 12:00:00.000000','2020-11-11 12:00:00.000000'),(2,'python进阶',2,1,0,'2019-11-11 12:00:00.000000','2020-11-11 12:00:00.000000'),(3,'java',3,1,0,'2019-11-11 12:00:00.000000','2020-11-11 12:00:00.000000'),(4,'前端开发',4,1,0,'2019-11-11 12:00:00.000000','2020-11-11 12:00:00.000000'),(5,'数据结构',0,1,0,'2020-10-03 08:05:28.769689','2020-10-03 08:05:28.769724');
/*!40000 ALTER TABLE `ly_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_chapter`
--

DROP TABLE IF EXISTS `ly_course_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `number` smallint(6) NOT NULL,
  `summary` longtext,
  `pub_date` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_chapter_course_id_e677b55c_fk_ly_course_id` (`course_id`),
  CONSTRAINT `ly_course_chapter_course_id_e677b55c_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_chapter`
--

LOCK TABLES `ly_course_chapter` WRITE;
/*!40000 ALTER TABLE `ly_course_chapter` DISABLE KEYS */;
INSERT INTO `ly_course_chapter` VALUES (1,'python介绍和环境安装',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',1,'python介绍和发展历史','2020-09-23',1),(2,'python变量',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',2,'python介绍和发展历史','2020-09-23',1),(3,'python语句',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',3,'python介绍和发展历史','2020-09-23',1),(4,'java介绍和环境安装',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',1,'python介绍和发展历史','2020-09-23',2),(5,'java变量',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',2,'python介绍和发展历史','2020-09-23',2),(6,'java语句',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',3,'python介绍和发展历史','2020-09-23',2),(7,'web技术栈',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',1,'python介绍和发展历史','2020-09-23',3),(8,'html基础',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',2,'python介绍和发展历史','2020-09-23',3),(9,'html表单',1,1,0,'2020-09-23 08:27:30.942383','2020-09-23 08:27:30.942420',3,'python介绍和发展历史','2020-09-23',3),(10,'数据结构的历史',0,1,0,'2020-10-03 08:12:12.018625','2020-10-03 08:29:43.800548',1,'案发地方','2020-10-03',5),(11,'数据结构的链表',0,1,0,'2020-10-03 08:12:34.695888','2020-10-03 08:29:39.259463',2,'阿斯顿发顺丰大是大非','2020-10-03',5),(12,'数据结构的树',0,1,0,'2020-10-03 08:13:39.972053','2020-10-03 08:14:02.240791',3,'大沙发沙发','2020-10-03',5);
/*!40000 ALTER TABLE `ly_course_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_discount`
--

DROP TABLE IF EXISTS `ly_course_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `condition` int(11) NOT NULL,
  `sale` longtext NOT NULL,
  `discount_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_discount_discount_type_id_b32ca11c_fk_ly_course` (`discount_type_id`),
  CONSTRAINT `ly_course_discount_discount_type_id_b32ca11c_fk_ly_course` FOREIGN KEY (`discount_type_id`) REFERENCES `ly_course_discount_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_discount`
--

LOCK TABLES `ly_course_discount` WRITE;
/*!40000 ALTER TABLE `ly_course_discount` DISABLE KEYS */;
INSERT INTO `ly_course_discount` VALUES (1,'限时折扣',0,1,0,'2020-10-03 01:46:15.699673','2020-10-03 08:05:04.338142',0,'*0.8',2),(2,'满减',0,0,0,'2020-10-03 01:47:00.420527','2020-10-03 03:00:00.457242',100,'满100-20\r\n满300-50\r\n满1000-200',4),(5,'限时免费',0,1,0,'2020-10-03 01:48:17.966893','2020-10-03 02:00:09.746650',0,'0',3),(8,'限时减免',0,0,0,'2020-10-03 03:38:45.238354','2020-10-03 03:38:45.238577',100,'-20',1),(9,'限时减免',0,0,0,'2020-10-03 03:39:02.779838','2020-10-03 03:39:02.779872',300,'-50',1),(10,'限时减免',0,0,0,'2020-10-03 03:39:16.794702','2020-10-03 03:39:16.794801',1000,'-200',1);
/*!40000 ALTER TABLE `ly_course_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_discount_type`
--

DROP TABLE IF EXISTS `ly_course_discount_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_discount_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_discount_type`
--

LOCK TABLES `ly_course_discount_type` WRITE;
/*!40000 ALTER TABLE `ly_course_discount_type` DISABLE KEYS */;
INSERT INTO `ly_course_discount_type` VALUES (1,'限时减免',0,0,0,'2020-10-03 01:44:25.557714','2020-10-03 01:44:25.557746',NULL),(2,'限时折扣',0,0,0,'2020-10-03 01:44:34.311688','2020-10-03 01:44:34.311726',NULL),(3,'限时免费',0,0,0,'2020-10-03 01:44:48.414904','2020-10-03 01:44:48.414936',NULL),(4,'满减',0,0,0,'2020-10-03 01:44:54.522291','2020-10-03 01:44:54.522395',NULL);
/*!40000 ALTER TABLE `ly_course_discount_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_expire`
--

DROP TABLE IF EXISTS `ly_course_expire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_expire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_expire_course_id_e843fad2_fk_ly_course_id` (`course_id`),
  CONSTRAINT `ly_course_expire_course_id_e843fad2_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_expire`
--

LOCK TABLES `ly_course_expire` WRITE;
/*!40000 ALTER TABLE `ly_course_expire` DISABLE KEYS */;
INSERT INTO `ly_course_expire` VALUES (1,0,1,0,'2020-09-29 13:05:00.606745','2020-09-29 13:05:28.470399','1个月有效',30,199.00,1),(2,0,1,0,'2020-09-29 13:05:54.270380','2020-09-29 13:05:54.271121','2个月有效',60,299.00,1),(3,0,1,0,'2020-09-29 13:06:20.985543','2020-09-29 13:06:20.985600','3个月有效',90,399.00,1),(4,0,1,0,'2020-09-29 13:08:59.454839','2020-09-29 13:08:59.454878','半年有效',182,699.00,1),(6,0,1,0,'2020-09-29 13:05:00.606745','2020-09-29 13:05:28.470399','1个月有效',30,199.00,2),(7,0,1,0,'2020-09-29 13:05:54.270380','2020-09-29 13:05:54.271121','2个月有效',60,299.00,2),(8,0,1,0,'2020-09-29 13:06:20.985543','2020-09-29 13:06:20.985600','3个月有效',90,399.00,2),(9,0,1,0,'2020-09-29 13:08:59.454839','2020-09-29 13:08:59.454878','半年有效',182,699.00,2),(11,0,1,0,'2020-09-29 13:05:00.606745','2020-09-29 13:05:28.470399','1个月有效',30,199.00,3),(12,0,1,0,'2020-09-29 13:05:54.270380','2020-09-29 13:05:54.271121','2个月有效',60,299.00,3),(13,0,1,0,'2020-09-29 13:06:20.985543','2020-09-29 13:06:20.985600','3个月有效',90,399.00,3),(14,0,1,0,'2020-09-29 13:08:59.454839','2020-09-29 13:08:59.454878','半年有效',182,699.00,3),(16,0,1,0,'2020-09-29 13:05:00.606745','2020-10-04 08:26:21.785126','1个月有效',30,189.00,4),(17,0,1,0,'2020-09-29 13:05:54.270380','2020-09-29 13:05:54.271121','2个月有效',60,299.00,4),(18,0,1,0,'2020-09-29 13:06:20.985543','2020-09-29 13:06:20.985600','3个月有效',90,399.00,4),(19,0,1,0,'2020-09-29 13:08:59.454839','2020-09-29 13:08:59.454878','半年有效',182,699.00,4);
/*!40000 ALTER TABLE `ly_course_expire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_lesson`
--

DROP TABLE IF EXISTS `ly_course_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `lesson_type` smallint(6) NOT NULL,
  `lesson_link` varchar(255) DEFAULT NULL,
  `duration` varchar(32) DEFAULT NULL,
  `pub_date` datetime(6) NOT NULL,
  `free_trail` tinyint(1) NOT NULL,
  `recomment` tinyint(1) NOT NULL,
  `number` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_lesson_chapter_id_09ff8644_fk_ly_course_chapter_id` (`chapter_id`),
  KEY `ly_course_lesson_course_id_1e932817_fk_ly_course_id` (`course_id`),
  CONSTRAINT `ly_course_lesson_chapter_id_09ff8644_fk_ly_course_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `ly_course_chapter` (`id`),
  CONSTRAINT `ly_course_lesson_course_id_1e932817_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_lesson`
--

LOCK TABLES `ly_course_lesson` WRITE;
/*!40000 ALTER TABLE `ly_course_lesson` DISABLE KEYS */;
INSERT INTO `ly_course_lesson` VALUES (1,'python发展历史',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,1,1,1),(2,'python的解析器版本',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,2,1,1),(3,'python的开发工具使用',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,3,1,1),(4,'python的环境安装',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,4,1,1),(5,'python的环境配置',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,5,1,1),(6,'什么是变量',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,1,2,1),(7,'变量的声明',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,2,2,1),(8,'变量的使用',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,3,2,1),(9,'变量的ID内存地址',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,4,2,1),(10,'变量的类型',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,5,2,1),(11,'变量的类型转换',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,6,2,1),(12,'分支语句-if',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,1,2,1),(13,'分支语句-if-else',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,2,4,1),(14,'分支语句-if-elif-else',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,3,4,1),(15,'循环语句-while',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,4,4,1),(16,'浏览器版本',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,1,5,2),(17,'web前端开发工具使用',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,2,2,2),(18,'html网页结构',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,3,3,2),(19,'html标签语法',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,4,3,2),(20,'html常用标签',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,5,3,2),(21,'html列表',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,6,3,2),(22,'html表单',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,7,3,2),(23,'html表格',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,8,3,2),(24,'css基础语法',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,1,3,2),(25,'css选择符',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,2,4,2),(26,'css属性',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,3,4,2),(27,'css高级属性',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,4,4,2),(28,'css浮动',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,5,4,2),(29,'css定位',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,6,4,2),(30,'css布局',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,7,4,2),(31,'css弹性布局',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,8,4,2),(32,'循环语句-do-while',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,1,4,1),(33,'循环语句-for',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,2,4,1),(34,'中断语句-continue',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,3,4,1),(35,'中断语句-break',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,4,4,1),(36,'java发展历史',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,1,5,2),(37,'java的解析器版本',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,2,5,2),(38,'java的开发工具使用',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,3,2,1),(39,'java的环境安装',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,4,2,1),(40,'java的环境配置',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,5,2,1),(41,'什么是变量',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,1,3,1),(42,'变量的声明',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,2,3,1),(43,'变量的使用',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,3,3,1),(44,'变量的ID内存地址',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,4,3,1),(45,'变量的类型',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,5,3,1),(46,'变量的类型转换',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,6,3,1),(47,'分支语句-if',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,1,3,1),(48,'分支语句-if-else',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,2,4,1),(49,'分支语句-if-else if-else',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,3,4,1),(50,'循环语句-while',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,4,4,1),(51,'循环语句-do-while',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',1,1,5,4,1),(52,'循环语句-for',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,6,4,1),(53,'中断语句-continue',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,7,4,1),(54,'中断语句-break',0,1,0,'2020-09-23 08:35:23.883132','2020-09-23 08:35:23.883161',2,'http://www.baidu.com','3:00','2020-09-23 08:35:23.883191',0,1,8,4,1),(55,'什么是数据结构',0,1,0,'2020-10-03 08:14:55.792343','2020-10-03 08:27:53.748099',2,NULL,NULL,'2020-10-03 08:14:55.793893',1,1,1,10,5),(56,'数据结构与编程的关系',0,1,0,'2020-10-03 08:15:32.435691','2020-10-03 08:28:02.553836',2,NULL,NULL,'2020-10-03 08:15:32.435824',1,1,2,10,5),(57,'数据结构的基础',0,1,0,'2020-10-03 08:16:01.814373','2020-10-03 08:28:07.921213',2,NULL,NULL,'2020-10-03 08:16:01.814488',1,1,3,10,5),(58,'线性链表',0,1,0,'2020-10-03 08:16:47.168720','2020-10-03 08:28:15.099691',2,NULL,NULL,'2020-10-03 08:16:47.168973',1,1,1,11,5),(59,'双向链表',0,1,0,'2020-10-03 08:17:58.291860','2020-10-03 08:19:00.137255',2,NULL,NULL,'2020-10-03 08:17:58.291949',0,0,2,11,5),(60,'二叉树',0,1,0,'2020-10-03 08:18:49.891531','2020-10-03 08:18:49.891565',2,NULL,NULL,'2020-10-03 08:18:49.891605',0,0,1,12,5);
/*!40000 ALTER TABLE `ly_course_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_credit`
--

DROP TABLE IF EXISTS `ly_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_credit_user_id_41bb3032_fk_ly_users_id` (`user_id`),
  CONSTRAINT `ly_credit_user_id_41bb3032_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_credit`
--

LOCK TABLES `ly_credit` WRITE;
/*!40000 ALTER TABLE `ly_credit` DISABLE KEYS */;
INSERT INTO `ly_credit` VALUES (1,NULL,0,1,0,'2020-10-13 14:19:00.395011','2020-10-13 14:19:00.395057',2,1000,1,NULL),(2,NULL,0,1,0,'2020-10-13 14:19:15.604306','2020-10-13 14:19:15.604335',2,200,1,NULL),(3,NULL,0,1,0,'2020-10-15 08:03:23.930476','2020-10-15 08:03:23.930499',1,-43,1,NULL),(4,NULL,0,1,0,'2020-10-15 23:19:12.189622','2020-10-15 23:19:12.189643',1,-182,1,NULL),(5,NULL,0,1,0,'2020-10-15 23:30:06.545290','2020-10-15 23:30:06.545320',1,-182,1,NULL),(6,NULL,0,1,0,'2020-10-15 23:33:49.701963','2020-10-15 23:33:49.701991',1,-182,1,NULL),(7,NULL,0,1,0,'2020-10-15 23:38:40.046018','2020-10-15 23:38:40.046067',1,-182,1,NULL),(8,NULL,0,1,0,'2020-10-16 00:42:25.964500','2020-10-16 00:42:25.964523',1,-92,1,NULL),(9,NULL,0,1,0,'2020-10-17 01:16:02.600506','2020-10-17 01:16:02.600528',1,-100,1,NULL),(10,NULL,0,1,0,'2020-10-17 01:30:42.831949','2020-10-17 01:30:42.831971',1,-2,1,NULL);
/*!40000 ALTER TABLE `ly_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_nav`
--

DROP TABLE IF EXISTS `ly_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `link` varchar(250) NOT NULL,
  `opt` smallint(6) NOT NULL,
  `is_http` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_nav`
--

LOCK TABLES `ly_nav` WRITE;
/*!40000 ALTER TABLE `ly_nav` DISABLE KEYS */;
INSERT INTO `ly_nav` VALUES (1,'免费课',6,1,0,'2020-09-11 08:03:12.441872','2020-09-11 08:03:12.441910','/course',0,0),(2,'路飞学城',5,1,0,'2020-09-11 08:03:47.584076','2020-09-11 08:03:47.584113','http://www.luffycity.cn',0,1),(3,'实战课',4,1,0,'2020-09-11 08:03:12.441872','2020-09-11 08:03:12.441910','/exam',0,0),(4,'百度',3,1,0,'2020-09-11 08:03:47.584076','2020-09-11 08:03:47.584113','http://www.baidu.com',1,1),(5,'题库',2,1,0,'2020-09-11 08:03:12.441872','2020-09-11 08:03:12.441910','/question',0,0),(6,'老男孩教育',1,1,0,'2020-09-11 08:03:47.584076','2020-09-11 08:03:47.584113','http://www.oldboyedu.com',0,1),(7,'联系我们',7,1,0,'2020-09-11 08:03:12.441872','2020-09-11 08:03:12.441910','/course',1,0),(8,'商务合作',8,1,0,'2020-09-11 08:03:47.584076','2020-09-11 08:20:14.524971','/contact',1,0);
/*!40000 ALTER TABLE `ly_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_order`
--

DROP TABLE IF EXISTS `ly_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `order_title` varchar(150) NOT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `real_price` decimal(6,2) NOT NULL,
  `order_number` varchar(64) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `pay_type` smallint(6) NOT NULL,
  `credit` int(11) NOT NULL,
  `coupon` int(11) NOT NULL,
  `order_desc` longtext NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_order_user_id_ae588b8c_fk_ly_users_id` (`user_id`),
  CONSTRAINT `ly_order_user_id_ae588b8c_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_order`
--

LOCK TABLES `ly_order` WRITE;
/*!40000 ALTER TABLE `ly_order` DISABLE KEYS */;
INSERT INTO `ly_order` VALUES (56,'课程购买',0,1,0,'2020-10-17 06:58:04.896810','2020-10-17 07:10:45.618213','',398.00,338.20,'20201017060604000000000138677077',1,1,0,0,'课程购买','2020-10-17 07:10:45.618032',1),(57,'课程购买',0,1,0,'2020-10-17 09:07:31.911750','2020-10-18 06:48:43.046585','',199.00,179.00,'20201017090931000000000126515149',2,1,0,0,'课程购买',NULL,1);
/*!40000 ALTER TABLE `ly_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_order_detail`
--

DROP TABLE IF EXISTS `ly_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `expire` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `real_price` decimal(6,2) NOT NULL,
  `discount_name` varchar(120) NOT NULL,
  `course_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `expire_text` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_order_detail_course_id_cb34575d_fk_ly_course_id` (`course_id`),
  KEY `ly_order_detail_order_id_735380ae_fk_ly_order_id` (`order_id`),
  CONSTRAINT `ly_order_detail_course_id_cb34575d_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`),
  CONSTRAINT `ly_order_detail_order_id_735380ae_fk_ly_order_id` FOREIGN KEY (`order_id`) REFERENCES `ly_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_order_detail`
--

LOCK TABLES `ly_order_detail` WRITE;
/*!40000 ALTER TABLE `ly_order_detail` DISABLE KEYS */;
INSERT INTO `ly_order_detail` VALUES (72,NULL,0,1,0,'2020-10-17 06:58:04.918283','2020-10-17 06:58:04.919140',30,199.00,159.20,'限时折扣',1,56,'1个月有效'),(73,NULL,0,1,0,'2020-10-17 06:58:04.940572','2020-10-17 06:58:04.942461',30,199.00,179.00,'满减',2,56,'1个月有效'),(74,NULL,0,1,0,'2020-10-17 09:07:31.934455','2020-10-17 09:07:31.935288',30,199.00,179.00,'满减',2,57,'1个月有效');
/*!40000 ALTER TABLE `ly_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_teacher`
--

DROP TABLE IF EXISTS `ly_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `role` smallint(6) NOT NULL,
  `title` varchar(64) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `brief` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_teacher`
--

LOCK TABLES `ly_teacher` WRITE;
/*!40000 ALTER TABLE `ly_teacher` DISABLE KEYS */;
INSERT INTO `ly_teacher` VALUES (1,'Alex',1,1,0,'2020-09-23 07:26:56.493995','2020-09-23 07:26:56.494049',0,'过期网红','金角大王','teacher/timg.png','32132132131232132132');
/*!40000 ALTER TABLE `ly_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_user_coupon`
--

DROP TABLE IF EXISTS `ly_user_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `is_use` tinyint(1) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_coupon_coupon_id_d4690c35_fk_ly_coupon_id` (`coupon_id`),
  KEY `ly_user_coupon_user_id_801e1fee_fk_ly_users_id` (`user_id`),
  CONSTRAINT `ly_user_coupon_coupon_id_d4690c35_fk_ly_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `ly_coupon` (`id`),
  CONSTRAINT `ly_user_coupon_user_id_801e1fee_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_user_coupon`
--

LOCK TABLES `ly_user_coupon` WRITE;
/*!40000 ALTER TABLE `ly_user_coupon` DISABLE KEYS */;
INSERT INTO `ly_user_coupon` VALUES (1,NULL,0,1,0,'2020-10-05 03:19:26.336240','2020-10-15 23:38:40.041350','2020-10-13 16:00:00.000000',1,1,1),(2,NULL,0,1,0,'2020-10-05 03:19:43.421906','2020-10-15 08:03:23.928088','2020-10-13 16:00:00.000000',1,6,1),(3,NULL,0,1,0,'2020-10-05 03:25:57.439300','2020-10-14 00:29:27.748614','2020-10-13 16:00:00.000000',0,7,1),(4,NULL,0,1,0,'2020-10-05 03:26:02.437471','2020-10-14 00:29:20.450952','2020-10-13 16:00:00.000000',0,8,1),(5,NULL,0,1,0,'2020-10-05 03:56:45.825467','2020-10-14 00:29:08.378412','2020-10-13 16:00:00.000000',0,9,1),(6,NULL,0,1,0,'2020-10-05 05:12:01.254539','2020-10-14 00:29:01.765069','2020-10-13 16:00:00.000000',0,10,1),(7,NULL,0,1,0,'2020-10-05 07:35:08.161036','2020-10-14 00:28:49.072665','2020-10-13 16:00:00.000000',0,11,1);
/*!40000 ALTER TABLE `ly_user_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_user_course`
--

DROP TABLE IF EXISTS `ly_user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_user_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `last_time` datetime(6) NOT NULL,
  `has_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_course_course_id_8643fef5_fk_ly_course_id` (`course_id`),
  KEY `ly_user_course_user_id_94018e47_fk_ly_users_id` (`user_id`),
  CONSTRAINT `ly_user_course_course_id_8643fef5_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`),
  CONSTRAINT `ly_user_course_user_id_94018e47_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_user_course`
--

LOCK TABLES `ly_user_course` WRITE;
/*!40000 ALTER TABLE `ly_user_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `ly_user_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_users`
--

DROP TABLE IF EXISTS `ly_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updateed_time` datetime(6) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL,
  `credit` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_users`
--

LOCK TABLES `ly_users` WRITE;
/*!40000 ALTER TABLE `ly_users` DISABLE KEYS */;
INSERT INTO `ly_users` VALUES (1,'pbkdf2_sha256$150000$qtOxgavWtCxc$ZMnIO04WWWKpxYL0Knil5krDje6Ycl7NU/OdNo7RVlI=','2020-09-26 09:14:00.000000',1,'root','两两件','','root@qq.com',1,1,'2020-09-21 17:59:00.000000',0,0,0,'2020-09-21 17:59:31.225647','2020-10-17 01:30:42.830853','root','avatar/member.png','18582324628',NULL,0.00,235),(7,'pbkdf2_sha256$150000$ZZPiChKIMvS7$LPcsziV/A2DKzDWNk4dlXBavf1h71B+6I43AeXgpPJk=',NULL,0,'ly_576fe3c78f2','','','',0,1,'2020-09-23 12:09:25.336608',0,0,0,'2020-09-23 12:09:25.445007','2020-09-23 12:09:25.445022','ly_576fe3c78f2','','17767962834',NULL,0.00,0);
/*!40000 ALTER TABLE `ly_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_users_groups`
--

DROP TABLE IF EXISTS `ly_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ly_users_groups_user_id_group_id_e3b73a35_uniq` (`user_id`,`group_id`),
  KEY `ly_users_groups_group_id_7505a66d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `ly_users_groups_group_id_7505a66d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `ly_users_groups_user_id_b293b4e8_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_users_groups`
--

LOCK TABLES `ly_users_groups` WRITE;
/*!40000 ALTER TABLE `ly_users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ly_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_users_user_permissions`
--

DROP TABLE IF EXISTS `ly_users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ly_users_user_permissions_user_id_permission_id_5b1027ec_uniq` (`user_id`,`permission_id`),
  KEY `ly_users_user_permis_permission_id_14148e4f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `ly_users_user_permis_permission_id_14148e4f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `ly_users_user_permissions_user_id_047a052d_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_users_user_permissions`
--

LOCK TABLES `ly_users_user_permissions` WRITE;
/*!40000 ALTER TABLE `ly_users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ly_users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_revision`
--

DROP TABLE IF EXISTS `reversion_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_ly_users_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_revision`
--

LOCK TABLES `reversion_revision` WRITE;
/*!40000 ALTER TABLE `reversion_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_version`
--

DROP TABLE IF EXISTS `reversion_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `db` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_version`
--

LOCK TABLES `reversion_version` WRITE;
/*!40000 ALTER TABLE `reversion_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_ly_users_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_ly_users_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2020-09-26 07:51:19.802267','127.0.0.1','1','7天python从入门到放弃','change','修改 course_img，course_video 和 brief',22,1),(2,'2020-09-26 07:52:04.541834','127.0.0.1','1','7天python从入门到放弃','change','修改 brief',22,1),(3,'2020-09-26 09:15:02.964045','127.0.0.1','4','7天C++从入门到放弃','change','修改 brief',22,1),(4,'2020-09-26 13:07:26.738078','127.0.0.1','3','7天前端从入门到放弃','change','修改 brief',22,1),(5,'2020-09-29 13:05:00.610743','127.0.0.1','1','7天python从入门到放弃','create','已添加。',25,1),(6,'2020-09-29 13:05:28.472921','127.0.0.1','1','7天python从入门到放弃','change','修改 is_show',25,1),(7,'2020-09-29 13:05:54.272946','127.0.0.1','2','7天python从入门到放弃','create','已添加。',25,1),(8,'2020-09-29 13:06:20.987529','127.0.0.1','3','7天python从入门到放弃','create','已添加。',25,1),(9,'2020-09-29 13:08:59.458017','127.0.0.1','4','7天python从入门到放弃','create','已添加。',25,1),(10,'2020-09-29 13:09:46.909304','127.0.0.1','5','7天python从入门到放弃','create','已添加。',25,1),(11,'2020-10-03 01:44:25.559278','127.0.0.1','1','限时减免','create','已添加。',27,1),(12,'2020-10-03 01:44:34.313466','127.0.0.1','2','限时折扣','create','已添加。',27,1),(13,'2020-10-03 01:44:48.415520','127.0.0.1','3','限时免费','create','已添加。',27,1),(14,'2020-10-03 01:44:54.524237','127.0.0.1','4','满减','create','已添加。',27,1),(15,'2020-10-03 01:46:15.700844','127.0.0.1','1','价格优惠:限时折扣,优惠条件:0,优惠值:*0.8','create','已添加。',28,1),(16,'2020-10-03 01:47:00.422528','127.0.0.1','2','价格优惠:限时减免,优惠条件:0,优惠值:-20','create','已添加。',28,1),(17,'2020-10-03 01:47:36.044478','127.0.0.1','3','价格优惠:限时减免,优惠条件:0,优惠值:-50','create','已添加。',28,1),(18,'2020-10-03 01:48:00.620170','127.0.0.1','4','价格优惠:限时减免,优惠条件:0,优惠值:-200','create','已添加。',28,1),(19,'2020-10-03 01:48:17.968181','127.0.0.1','5','价格优惠:限时免费,优惠条件:0,优惠值:0','create','已添加。',28,1),(20,'2020-10-03 01:48:54.354109','127.0.0.1','4','价格优惠:满减,优惠条件:0,优惠值:-200','change','修改 discount_type',28,1),(21,'2020-10-03 01:49:02.676836','127.0.0.1','3','价格优惠:满减,优惠条件:0,优惠值:-50','change','修改 discount_type',28,1),(22,'2020-10-03 01:49:09.599391','127.0.0.1','2','价格优惠:满减,优惠条件:0,优惠值:-20','change','修改 discount_type',28,1),(23,'2020-10-03 01:49:46.086103','127.0.0.1','6','价格优惠:限时减免,优惠条件:0,优惠值:-200','create','已添加。',28,1),(24,'2020-10-03 01:50:15.961226','127.0.0.1','7','价格优惠:限时免费,优惠条件:0,优惠值:-500','create','已添加。',28,1),(25,'2020-10-03 01:54:42.728604','127.0.0.1','1','五一优惠大放送','create','已添加。',26,1),(26,'2020-10-03 01:55:41.052550','127.0.0.1','2','十一金秋大优惠','create','已添加。',26,1),(27,'2020-10-03 01:56:33.902920','127.0.0.1','1','活动:五一优惠大放送-课程:7天python从入门到放弃-优惠值:*0.8','create','已添加。',29,1),(28,'2020-10-03 01:58:41.952551','127.0.0.1','7','价格优惠:限时免费,优惠条件:0,优惠值:0','change','修改 name 和 sale',28,1),(29,'2020-10-03 01:59:16.671866','127.0.0.1','6','价格优惠:限时减免,优惠条件:1000,优惠值:-200','change','修改 condition',28,1),(30,'2020-10-03 01:59:28.018127','127.0.0.1','4','价格优惠:满减,优惠条件:1000,优惠值:-200','change','修改 condition',28,1),(31,'2020-10-03 01:59:45.367237','127.0.0.1','3','价格优惠:满减,优惠条件:399,优惠值:-50','change','修改 condition',28,1),(32,'2020-10-03 01:59:55.113619','127.0.0.1','3','价格优惠:满减,优惠条件:300,优惠值:-50','change','修改 condition',28,1),(33,'2020-10-03 02:00:00.387236','127.0.0.1','5','价格优惠:限时免费,优惠条件:0,优惠值:0','change','修改 is_show',28,1),(34,'2020-10-03 02:00:04.741690','127.0.0.1','6','价格优惠:限时减免,优惠条件:1000,优惠值:-200','change','修改 is_show',28,1),(35,'2020-10-03 02:00:09.747811','127.0.0.1','5','价格优惠:限时免费,优惠条件:0,优惠值:0','change','没有字段被修改。',28,1),(36,'2020-10-03 02:00:17.949075','127.0.0.1','4','价格优惠:满减,优惠条件:1000,优惠值:-200','change','修改 is_show',28,1),(37,'2020-10-03 02:00:22.657453','127.0.0.1','3','价格优惠:满减,优惠条件:300,优惠值:-50','change','修改 is_show',28,1),(38,'2020-10-03 02:00:29.856716','127.0.0.1','2','价格优惠:满减,优惠条件:100,优惠值:-20','change','修改 condition',28,1),(39,'2020-10-03 02:00:42.111717','127.0.0.1','1','价格优惠:限时折扣,优惠条件:1000,优惠值:*0.8','change','修改 is_show 和 condition',28,1),(40,'2020-10-03 02:01:05.969697','127.0.0.1','1','活动:五一优惠大放送-课程:7天python从入门到放弃-优惠值:*0.8','change','没有字段被修改。',29,1),(41,'2020-10-03 02:01:28.392566','127.0.0.1','2','活动:十一金秋大优惠-课程:7天java从入门到放弃-优惠值:-20','create','已添加。',29,1),(42,'2020-10-03 02:01:38.981783','127.0.0.1','3','活动:十一金秋大优惠-课程:7天java从入门到放弃-优惠值:-50','create','已添加。',29,1),(43,'2020-10-03 02:01:48.010495','127.0.0.1','4','活动:十一金秋大优惠-课程:7天java从入门到放弃-优惠值:-200','create','已添加。',29,1),(44,'2020-10-03 02:02:10.799360','127.0.0.1','5','活动:十一金秋大优惠-课程:7天前端从入门到放弃-优惠值:0','create','已添加。',29,1),(45,'2020-10-03 02:02:30.302617','127.0.0.1','6','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-200','create','已添加。',29,1),(46,'2020-10-03 02:03:33.396733','127.0.0.1',NULL,'','delete','批量删除 1 个 课程优惠策略',NULL,1),(47,'2020-10-03 02:03:59.332206','127.0.0.1','5','活动:十一金秋大优惠-课程:7天前端从入门到放弃-优惠值:0','change','没有字段被修改。',29,1),(48,'2020-10-03 02:06:23.569363','127.0.0.1','7','活动:十一金秋大优惠-课程:7天python从入门到放弃-优惠值:*0.8','create','已添加。',29,1),(49,'2020-10-03 02:56:35.069042','127.0.0.1','4','价格优惠:满减,优惠条件:1000,优惠值:满1000-200','change','修改 sale',28,1),(50,'2020-10-03 02:56:49.655228','127.0.0.1','3','价格优惠:满减,优惠条件:300,优惠值:满300-50','change','修改 sale',28,1),(51,'2020-10-03 02:57:03.922283','127.0.0.1','2','价格优惠:满减,优惠条件:100,优惠值:满100-20','change','修改 sale',28,1),(52,'2020-10-03 02:57:17.539128','127.0.0.1','4','价格优惠:满减,优惠条件:1000,优惠值:满1000-200','change','修改 name',28,1),(53,'2020-10-03 02:57:23.453286','127.0.0.1','3','价格优惠:满减,优惠条件:300,优惠值:满300-50','change','修改 name',28,1),(54,'2020-10-03 02:57:32.604847','127.0.0.1','2','价格优惠:满减,优惠条件:100,优惠值:满100-20','change','修改 name',28,1),(55,'2020-10-03 03:00:00.458589','127.0.0.1','2','价格优惠:满减,优惠条件:100,优惠值:满100-20\r\n满300-50\r\n满1000-200','change','修改 sale',28,1),(56,'2020-10-03 03:00:49.856632','127.0.0.1','4','价格优惠:限时减免,优惠条件:300,优惠值:-50','change','修改 name，discount_type，condition 和 sale',28,1),(57,'2020-10-03 03:01:22.208790','127.0.0.1','3','价格优惠:限时减免,优惠条件:100,优惠值:-20','change','修改 name，discount_type，condition 和 sale',28,1),(58,'2020-10-03 03:03:26.173184','127.0.0.1','3','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-20','change','修改 course',29,1),(59,'2020-10-03 03:03:37.973822','127.0.0.1','4','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-50','change','修改 course',29,1),(60,'2020-10-03 03:34:33.095776','127.0.0.1','3','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-20','change','没有字段被修改。',29,1),(61,'2020-10-03 03:38:25.466270','127.0.0.1',NULL,'','delete','批量删除 3 个 课程优惠策略',NULL,1),(62,'2020-10-03 03:38:45.240879','127.0.0.1','8','价格优惠:限时减免,优惠条件:100,优惠值:-20','create','已添加。',28,1),(63,'2020-10-03 03:39:02.781882','127.0.0.1','9','价格优惠:限时减免,优惠条件:300,优惠值:-50','create','已添加。',28,1),(64,'2020-10-03 03:39:16.797040','127.0.0.1','10','价格优惠:限时减免,优惠条件:1000,优惠值:-200','create','已添加。',28,1),(65,'2020-10-03 03:40:18.635561','127.0.0.1','8','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-20','create','已添加。',29,1),(66,'2020-10-03 03:40:26.839780','127.0.0.1','9','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-50','create','已添加。',29,1),(67,'2020-10-03 03:40:46.590703','127.0.0.1','10','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-200','create','已添加。',29,1),(68,'2020-10-03 03:40:54.415861','127.0.0.1','9','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-50','change','修改 is_show',29,1),(69,'2020-10-03 04:12:17.172664','127.0.0.1','1','价格优惠:限时折扣,优惠条件:0,优惠值:*0.8','change','修改 condition',28,1),(70,'2020-10-03 08:03:07.510912','127.0.0.1','1','价格优惠:限时折扣,优惠条件:1000,优惠值:*0.8','change','修改 condition',28,1),(71,'2020-10-03 08:05:04.343965','127.0.0.1','1','价格优惠:限时折扣,优惠条件:0,优惠值:*0.8','change','修改 condition',28,1),(72,'2020-10-03 08:05:28.773301','127.0.0.1','5','数据结构','create','已添加。',20,1),(73,'2020-10-03 08:07:21.920776','127.0.0.1','5','数据结构','create','已添加。',22,1),(74,'2020-10-03 08:12:12.020935','127.0.0.1','10','课程:数据结构-第1章-数据结构的历史','create','已添加。',21,1),(75,'2020-10-03 08:12:34.697335','127.0.0.1','11','课程:数据结构-第1章-数据结构的链表','create','已添加。',21,1),(76,'2020-10-03 08:13:39.974304','127.0.0.1','12','课程:数据结构-第1章-数据结构的树','create','已添加。',21,1),(77,'2020-10-03 08:13:56.618781','127.0.0.1','11','课程:数据结构-第2章-数据结构的链表','change','修改 number',21,1),(78,'2020-10-03 08:14:02.244270','127.0.0.1','12','课程:数据结构-第3章-数据结构的树','change','修改 number',21,1),(79,'2020-10-03 08:14:55.796562','127.0.0.1','55','课程:数据结构-第1章-数据结构的历史-第1节-什么是数据结构','create','已添加。',23,1),(80,'2020-10-03 08:15:32.437237','127.0.0.1','56','课程:数据结构-第1章-数据结构的历史-第2节-数据结构与编程的关系','create','已添加。',23,1),(81,'2020-10-03 08:16:01.816557','127.0.0.1','57','课程:数据结构-第1章-数据结构的历史-第3节-数据结构的基础','create','已添加。',23,1),(82,'2020-10-03 08:16:47.170262','127.0.0.1','58','课程:数据结构-第2章-数据结构的链表-第1节-数据结构线性链表','create','已添加。',23,1),(83,'2020-10-03 08:17:58.293232','127.0.0.1','59','课程:数据结构-第2章-数据结构的链表-第2节-数据结构双向链表','create','已添加。',23,1),(84,'2020-10-03 08:18:49.893371','127.0.0.1','60','课程:数据结构-第3章-数据结构的树-第1节-二叉树','create','已添加。',23,1),(85,'2020-10-03 08:19:00.140154','127.0.0.1','59','课程:数据结构-第2章-数据结构的链表-第2节-双向链表','change','修改 name',23,1),(86,'2020-10-03 08:19:06.033912','127.0.0.1','58','课程:数据结构-第2章-数据结构的链表-第1节-线性链表','change','修改 name',23,1),(87,'2020-10-03 08:19:11.142615','127.0.0.1','57','课程:数据结构-第1章-数据结构的历史-第3节-数据结构的基础','change','没有字段被修改。',23,1),(88,'2020-10-03 08:27:53.750876','127.0.0.1','55','课程:数据结构-第1章-数据结构的历史-第1节-什么是数据结构','change','修改 recomment',23,1),(89,'2020-10-03 08:28:02.555013','127.0.0.1','56','课程:数据结构-第1章-数据结构的历史-第2节-数据结构与编程的关系','change','修改 recomment',23,1),(90,'2020-10-03 08:28:07.922718','127.0.0.1','57','课程:数据结构-第1章-数据结构的历史-第3节-数据结构的基础','change','修改 recomment',23,1),(91,'2020-10-03 08:28:15.100872','127.0.0.1','58','课程:数据结构-第2章-数据结构的链表-第1节-线性链表','change','修改 recomment',23,1),(92,'2020-10-03 08:29:39.263193','127.0.0.1','11','课程:数据结构-第2章-数据结构的链表','change','修改 is_show',21,1),(93,'2020-10-03 08:29:43.801653','127.0.0.1','10','课程:数据结构-第1章-数据结构的历史','change','修改 is_show',21,1),(94,'2020-10-04 08:26:21.789541','127.0.0.1','16','7天C++从入门到放弃','change','修改 price',25,1),(95,'2020-10-04 08:53:36.119114','127.0.0.1',NULL,'','delete','批量删除 2 个 课程活动价格表',NULL,1),(96,'2020-10-04 08:58:37.546390','127.0.0.1','11','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-50','create','已添加。',29,1),(97,'2020-10-04 08:58:44.954023','127.0.0.1','8','活动:十一金秋大优惠-课程:7天C++从入门到放弃-优惠值:-20','change','没有字段被修改。',29,1),(98,'2020-10-04 09:02:06.901645','127.0.0.1',NULL,'','delete','批量删除 1 个 课程活动价格表',NULL,1),(99,'2020-10-05 03:02:13.130264','127.0.0.1','1','十一黄金周[满100元可以使用]','create','已添加。',32,1),(100,'2020-10-05 03:18:53.849119','127.0.0.1','6','十一黄金周[购买课程<7天python从入门到放弃>可以使用]','create','已添加。',32,1),(101,'2020-10-05 03:19:26.337786','127.0.0.1','1','优惠券:十一黄金周,用户:root','create','已添加。',33,1),(102,'2020-10-05 03:19:43.423570','127.0.0.1','2','优惠券:十一黄金周,用户:root','create','已添加。',33,1),(103,'2020-10-05 03:25:18.794803','127.0.0.1','7','500元优惠券[满20000元可以使用]','create','已添加。',32,1),(104,'2020-10-05 03:25:42.146598','127.0.0.1','8','50元优惠券[满500元可以使用]','create','已添加。',32,1),(105,'2020-10-05 03:25:57.439895','127.0.0.1','3','优惠券:500元优惠券,用户:root','create','已添加。',33,1),(106,'2020-10-05 03:26:02.439776','127.0.0.1','4','优惠券:50元优惠券,用户:root','create','已添加。',33,1),(107,'2020-10-05 03:54:55.992586','127.0.0.1','9','限时减免[满500元可以使用]','create','已添加。',32,1),(108,'2020-10-05 03:56:45.826323','127.0.0.1','5','优惠券:限时减免,用户:root','create','已添加。',33,1),(109,'2020-10-05 04:26:05.234497','127.0.0.1','6','python课程优惠券[购买课程<7天python从入门到放弃>可以使用]','change','修改 name',32,1),(110,'2020-10-05 04:38:31.318715','127.0.0.1','5','优惠券:限时减免,用户:root','change','修改 start_time',33,1),(111,'2020-10-05 04:38:52.556440','127.0.0.1','4','优惠券:50元优惠券,用户:root','change','修改 start_time',33,1),(112,'2020-10-05 05:11:50.618196','127.0.0.1','10','C++课程制定券[购买课程<7天C++从入门到放弃>可以使用]','create','已添加。',32,1),(113,'2020-10-05 05:12:01.257473','127.0.0.1','6','优惠券:C++课程制定券,用户:root','create','已添加。',33,1),(114,'2020-10-05 07:34:10.030504','127.0.0.1','1','20元优惠券[满100元可以使用]','change','修改 name',32,1),(115,'2020-10-05 07:34:36.464195','127.0.0.1','11','50元优惠券[满400元可以使用]','create','已添加。',32,1),(116,'2020-10-05 07:35:08.176159','127.0.0.1','7','优惠券:50元优惠券,用户:root','create','已添加。',33,1),(117,'2020-10-05 08:01:46.605456','127.0.0.1','6','八折课程优惠券[购买课程<7天python从入门到放弃>可以使用]','change','修改 name',32,1),(118,'2020-10-13 11:58:19.175852','127.0.0.1','2','十一金秋大优惠','change','修改 start_time 和 end_time',26,1),(119,'2020-10-13 11:58:30.032977','127.0.0.1','1','五一优惠大放送','change','修改 start_time 和 end_time',26,1),(120,'2020-10-13 14:10:23.397334','127.0.0.1','1','root','change','修改 last_login，first_name 和 mobile',14,1),(121,'2020-10-14 00:26:58.888865','127.0.0.1','7','优惠券:50元优惠券,用户:root','change','修改 start_time',33,1),(122,'2020-10-14 00:27:09.502486','127.0.0.1','6','优惠券:C++课程制定券,用户:root','change','没有字段被修改。',33,1),(123,'2020-10-14 00:27:12.683269','127.0.0.1','5','优惠券:限时减免,用户:root','change','没有字段被修改。',33,1),(124,'2020-10-14 00:27:19.121017','127.0.0.1','6','优惠券:C++课程制定券,用户:root','change','修改 start_time',33,1),(125,'2020-10-14 00:27:23.348153','127.0.0.1','5','优惠券:限时减免,用户:root','change','修改 start_time',33,1),(126,'2020-10-14 00:27:28.470870','127.0.0.1','4','优惠券:50元优惠券,用户:root','change','修改 start_time',33,1),(127,'2020-10-14 00:27:34.453188','127.0.0.1','3','优惠券:500元优惠券,用户:root','change','修改 start_time',33,1),(128,'2020-10-14 00:27:50.522926','127.0.0.1','1','优惠券:20元优惠券,用户:root','change','修改 start_time',33,1),(129,'2020-10-14 00:27:56.812603','127.0.0.1','2','优惠券:八折课程优惠券,用户:root','change','修改 start_time',33,1),(130,'2020-10-14 00:28:49.076170','127.0.0.1','7','优惠券:50元优惠券,用户:root','change','修改 start_time',33,1),(131,'2020-10-14 00:29:01.766300','127.0.0.1','6','优惠券:C++课程制定券,用户:root','change','修改 start_time',33,1),(132,'2020-10-14 00:29:08.380974','127.0.0.1','5','优惠券:限时减免,用户:root','change','修改 start_time',33,1),(133,'2020-10-14 00:29:15.101834','127.0.0.1','4','优惠券:50元优惠券,用户:root','change','修改 start_time',33,1),(134,'2020-10-14 00:29:20.452220','127.0.0.1','4','优惠券:50元优惠券,用户:root','change','没有字段被修改。',33,1),(135,'2020-10-14 00:29:27.750476','127.0.0.1','3','优惠券:500元优惠券,用户:root','change','修改 start_time',33,1),(136,'2020-10-14 00:29:34.108335','127.0.0.1','2','优惠券:八折课程优惠券,用户:root','change','修改 start_time',33,1),(137,'2020-10-14 00:29:46.418299','127.0.0.1','1','优惠券:20元优惠券,用户:root','change','修改 start_time',33,1),(138,'2020-10-14 00:31:20.823446','127.0.0.1','8','70元优惠券[满700元可以使用]','change','修改 name 和 condition',32,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_ly_users_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_ly_users_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-18 15:21:32
