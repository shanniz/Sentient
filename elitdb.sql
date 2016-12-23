-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: elitedb
-- ------------------------------------------------------
-- Server version	5.6.27-0ubuntu0.15.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_transaction_history`
--

DROP TABLE IF EXISTS `class_transaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_transaction_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_transaction_history`
--

LOCK TABLES `class_transaction_history` WRITE;
/*!40000 ALTER TABLE `class_transaction_history` DISABLE KEYS */;
INSERT INTO `class_transaction_history` VALUES (10,1,1,5,NULL,'2016-07-21 23:53:42'),(11,1,1,20,NULL,'2016-07-21 23:56:51'),(12,1,1,-2,NULL,'2016-07-21 23:57:07'),(13,1,1,-2,NULL,'2016-07-22 00:00:27'),(14,1,1,-2,NULL,'2016-07-22 00:03:03'),(15,1,2,10,NULL,'2016-07-22 00:04:01'),(16,1,2,10,NULL,'2016-07-22 00:04:39'),(17,1,2,-1,NULL,'2016-07-22 00:05:10'),(18,2,2,-1,NULL,'2016-07-22 00:05:33'),(19,2,2,11,NULL,'2016-07-22 00:06:00'),(20,2,2,11,NULL,'2016-07-22 00:39:20');
/*!40000 ALTER TABLE `class_transaction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud`
--

DROP TABLE IF EXISTS `cloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cloud_id` varchar(60) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud`
--

LOCK TABLES `cloud` WRITE;
/*!40000 ALTER TABLE `cloud` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `redeemed` datetime DEFAULT NULL,
  `redeemed_by` int(11) DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codes`
--

LOCK TABLES `codes` WRITE;
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;
INSERT INTO `codes` VALUES (9,'FED4201',10,'2016-07-09 01:34:46','2016-07-09 01:35:29',NULL,2),(10,'499EAA2',150,'2016-07-09 01:37:28','2016-07-09 01:39:21',NULL,2),(11,'6B28B3A',50,'2016-07-09 01:37:38','2016-07-09 01:40:12',NULL,2),(12,'0DA4522',10,'2016-07-09 01:38:20','2016-07-15 14:07:02',2,2),(13,'1BE77AB',10,'2016-07-09 01:38:21','2016-07-09 01:42:25',1,2),(14,'7E761A8',10,'2016-07-09 01:38:21','2016-07-15 14:07:18',2,2),(15,'475B8D5',10,'2016-07-09 01:38:21','2016-07-15 14:07:30',2,2),(16,'403A6AE',10,'2016-07-09 01:38:21','2016-07-15 14:07:43',2,2),(17,'D58C6D7',10,'2016-07-09 01:38:22','2016-07-15 14:52:38',1,2),(18,'EB0A778',10,'2016-07-09 01:38:22','2016-07-15 14:52:56',1,2),(19,'6206943',10,'2016-07-09 01:38:22','2016-07-15 14:53:09',1,2),(20,'A965823',10,'2016-07-09 01:38:22','2016-07-15 14:53:18',1,2),(21,'03B0D8D',10,'2016-07-09 01:38:23','2016-07-15 14:53:29',1,2),(22,'BF3A4BC',200,'2016-07-15 15:02:36','2016-07-15 15:02:53',1,1),(23,'18E9B90',10,'2016-07-15 15:12:50','2016-07-15 15:14:27',2,1),(24,'6D88211',10,'2016-07-15 15:12:52','2016-07-15 15:15:12',2,1),(25,'844A95B',10,'2016-07-15 15:12:53',NULL,NULL,1),(26,'66F0F4A',10,'2016-07-15 15:12:53',NULL,NULL,1),(27,'D4CEB85',10,'2016-07-15 15:12:53',NULL,NULL,1),(28,'CAD56A5',10,'2016-07-15 15:12:53',NULL,NULL,1),(29,'38CF206',10,'2016-07-15 15:12:53',NULL,NULL,1),(30,'616A9E3',10,'2016-07-15 15:12:54',NULL,NULL,1),(31,'6C5117D',10,'2016-07-15 15:12:54',NULL,NULL,1),(32,'F1A77C7',10,'2016-07-15 15:12:54','2016-07-17 14:01:18',1,1),(33,'DA15ADF',10,'2016-07-15 15:12:54',NULL,NULL,1),(34,'D7313C9',300,'2016-07-15 15:14:03','2016-07-17 14:09:40',6,1),(35,'1D38E0A',213,'2016-07-17 10:14:04','2016-07-17 10:15:08',3,1),(36,'44DD3E5',337,'2016-07-17 10:14:04','2016-07-17 10:17:34',3,1),(37,'674A997',700,'2016-07-25 18:51:18','2016-07-25 18:52:41',1,0);
/*!40000 ALTER TABLE `codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Bill Nye The Scinece Guy',NULL),(2,'Vocabulary Builder',NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,1,'chen7david@me.com','2016-07-05 18:41:38'),(2,1,'chen7david@gmail.com',NULL),(5,4,'1533391067@qq.com',NULL),(6,5,'sunxn107@nenu.edu.cn',NULL),(7,6,'1198802730@qq.com',NULL),(8,7,'tieyingzhu@hotmail.com',NULL),(9,8,'897136040@qq.com',NULL),(10,9,'1853222518@qq.com',NULL),(11,10,'2642039952@qq.com',NULL),(12,11,'819087833@qq.com',NULL),(13,12,'coco@qq.com',NULL),(14,13,'bit_lixiang@icloud.com',NULL),(15,14,'1053684718@qq.com',NULL),(16,15,'mary@qq.com',NULL),(17,3,'2324221174@qq.com',NULL),(18,2,'17483471@qq.com',NULL);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `edition` varchar(60) DEFAULT NULL,
  `product_code` varchar(32) DEFAULT NULL,
  `product_description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Ant Farm','blue','4161231','Modern ant farms are filled with a space-age gel. This type of ant habitat is the product of a NASA experiment to see if ants could survive in zero gravity. The gel is designed to provide all the water and nutrients required to sustain the ants for their normal lifespan. ');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_id` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rank` int(1) DEFAULT NULL,
  `login` datetime DEFAULT NULL,
  `logout` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
INSERT INTO `login_history` VALUES (52,'adb706b68c832f152476c9fb613814a1',1,1,'2016-07-09 01:46:07',NULL,0),(53,'7a2934ad5f402752b0446d16f634147a',1,1,'2016-07-09 01:47:50','2016-07-09 01:48:30',1),(54,'796afce462bd1aefc1522ae3e9a540d1',2,0,'2016-07-09 01:48:38','2016-07-09 01:53:03',1),(55,'e3ccd1155e230725c48cd0582fcce1dc',1,1,'2016-07-09 18:01:03','2016-07-09 18:01:05',0),(56,'6ba9d5895e7f6f8664866f76fa4ea838',2,0,'2016-07-15 13:52:36','2016-07-15 13:53:27',1),(57,'b22d231263a5634f4140781288e84fff',2,0,'2016-07-15 14:00:50','2016-07-15 14:06:09',1),(58,'2126986a60089c0e7e56e72c8553361e',2,0,'2016-07-15 14:06:25','2016-07-15 14:50:42',1),(59,'c6e902e0c5cda4802f36b69ee803a6ab',1,1,'2016-07-15 14:50:58','2016-07-15 15:13:46',1),(60,'6cce95c0a59807986b647aa8fc1f6a64',2,0,'2016-07-15 15:13:57',NULL,1),(61,'a18a0d2e43533b00053041825860f281',3,0,'2016-07-17 10:12:58','2016-07-17 13:54:21',0),(62,'040314f5ea2df502693be051c70bfb45',1,1,'2016-07-17 14:00:45','2016-07-17 14:04:16',0),(63,'4692269aba9fbec9ac3ad5e75e7d3089',6,0,'2016-07-17 14:05:21','2016-07-17 14:12:46',0),(64,'4f1cc90788560636057b2e98626afade',6,0,'2016-07-17 14:13:28','2016-07-17 14:31:19',0),(65,'d40c68f6ab530aedd7a13bb448ecebab',1,1,'2016-07-17 14:31:30','2016-07-17 14:32:04',0),(66,'e241d64cebb5502ffd164d71759724ba',2,0,'2016-07-17 14:32:10','2016-07-17 14:41:47',0),(67,'cfbeb8f16e206f90776bc5a070e0c13d',1,1,'2016-07-17 14:41:54',NULL,0),(68,'be8f11d8fc5722d8881f553a77d7a563',2,0,'2016-07-21 13:58:48','2016-07-21 14:05:52',0),(69,'51db3dd8224d00ffd3fe52d389a43851',1,1,'2016-07-21 14:05:59','2016-07-21 22:27:56',0),(70,'e37bfa67765a516a9b3be65150dfd599',2,0,'2016-07-21 22:28:01','2016-07-21 22:28:34',0),(71,'b2e44741ebf2c9f499988c4273d64ee6',6,0,'2016-07-21 22:28:40','2016-07-21 23:46:54',0),(72,'8a66131e545240789ccb7335d6aad35e',1,1,'2016-07-21 23:47:42','2016-07-22 00:05:22',0),(73,'df56628c66429fdf2891df4515bc1d2e',2,0,'2016-07-22 00:05:28','2016-07-22 00:12:18',0),(74,'d90cb97865c2dbb65a3174138af5b6d6',1,1,'2016-07-22 00:12:27','2016-07-22 00:37:29',0),(75,'98adc719ee9d1b2f9fc44b207d30f2e3',2,0,'2016-07-22 00:37:34','2016-07-23 16:09:27',0),(76,'1e7b48cb13d271d5c2c610a2bb4dc987',1,1,'2016-07-23 16:09:32',NULL,0),(77,'ad492417a4c38004f86d951e9ac000bb',1,1,'2016-07-25 18:51:55',NULL,0),(78,'4957ad4ac097c43118a93f87249e4000',6,0,'2016-07-27 20:45:22','2016-07-28 21:27:01',0),(79,'64fde9948316b32bb1e233d7f1cc20ed',2,0,'2016-08-02 21:05:34',NULL,0),(80,'9b8da05ce073e02a4c10e8f6c6254eed',2,0,'2016-08-02 21:08:00',NULL,0),(81,'208f89a9809ebdf3fbeab7ca09f01322',2,0,'2016-08-02 21:24:33','2016-08-02 21:30:22',0),(82,'262dd673b5f313fdaa0cba51a78ec911',2,0,'2016-08-02 21:30:41','2016-08-02 21:30:55',0),(83,'44e16f0c6c69252819bbfd3cef940501',2,0,'2016-08-02 21:31:08',NULL,0),(84,'bc65d7c91dd0be635b7753cb685be331',2,0,'2016-08-02 21:38:32','2016-08-02 21:39:25',0),(85,'bc65d7c91dd0be635b7753cb685be331',1,1,'2016-08-02 21:39:18','2016-08-02 21:39:25',0);
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `owner` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
INSERT INTO `numbers` VALUES (1,1,'18500290402','2016-07-05 18:47:08','user'),(2,2,'18043003011',NULL,NULL),(3,3,'13331640753',NULL,NULL),(4,4,'13756563782',NULL,NULL),(5,5,'13125808724',NULL,NULL),(6,6,'13756103933',NULL,NULL),(7,7,'13009127797',NULL,NULL),(8,8,'13321588707',NULL,NULL),(9,9,'13331747318',NULL,NULL),(10,10,'18243005939',NULL,NULL),(11,11,'13039000485',NULL,NULL),(12,12,'13128621999',NULL,NULL),(13,13,'13311017629',NULL,NULL),(14,14,'15104439191',NULL,NULL),(15,15,'18686525518',NULL,NULL),(16,15,'13843136518','2016-07-09 02:23:08','user');
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwords` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
INSERT INTO `passwords` VALUES (1,1,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(2,2,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(3,3,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(4,4,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(5,5,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(6,6,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(7,7,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(8,8,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(9,9,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(10,10,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(11,11,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(12,12,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(13,13,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(14,14,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(15,15,'202cb962ac59075b964b07152d234b70',NULL,'2016-07-05 18:44:00'),(16,2,'ggdgdgdgdg','dfsdfasdfasd','2016-07-06 18:44:00');
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (1,1,1,'2016-07-05 18:44:00'),(2,2,0,'2016-07-05 18:44:00'),(3,3,0,'2016-07-05 18:44:00'),(4,4,0,'2016-07-05 18:44:00'),(5,5,0,'2016-07-05 18:44:00'),(6,6,0,'2016-07-05 18:44:00'),(7,7,0,'2016-07-05 18:44:00'),(8,8,0,'2016-07-05 18:44:00'),(9,9,0,'2016-07-05 18:44:00'),(10,10,0,'2016-07-05 18:44:00'),(11,11,0,'2016-07-05 18:44:00'),(12,12,0,'2016-07-05 18:44:00'),(13,13,0,'2016-07-05 18:44:00'),(14,14,0,'2016-07-05 18:44:00'),(15,15,0,'2016-07-05 18:44:00');
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `expiration` varchar(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,'2018-07-22',700,'2016-07-22 18:06:46');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_transaction_history`
--

DROP TABLE IF EXISTS `stock_transaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_transaction_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `purchase_user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_transaction_history`
--

LOCK TABLES `stock_transaction_history` WRITE;
/*!40000 ALTER TABLE `stock_transaction_history` DISABLE KEYS */;
INSERT INTO `stock_transaction_history` VALUES (1,1,1,5,1,'2016-07-22 18:10:19'),(2,1,1,-1,6,'2016-07-22 18:11:17');
/*!40000 ALTER TABLE `stock_transaction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `amount` int(30) DEFAULT NULL,
  `balance` int(30) DEFAULT NULL,
  `transaction_type` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_history`
--

LOCK TABLES `transaction_history` WRITE;
/*!40000 ALTER TABLE `transaction_history` DISABLE KEYS */;
INSERT INTO `transaction_history` VALUES (35,2,10,0,1,'2016-07-09 01:35:29'),(36,2,150,0,1,'2016-07-09 01:39:21'),(37,1,50,0,1,'2016-07-09 01:40:12'),(38,1,-10,0,1,'2016-07-09 01:42:25'),(39,2,-10,0,1,'2016-07-15 14:07:02'),(40,2,10,0,1,'2016-07-15 14:07:18'),(41,2,10,0,1,'2016-07-15 14:07:30'),(42,2,10,0,1,'2016-07-15 14:07:43'),(47,1,10,0,1,'2016-07-15 14:52:38'),(48,1,10,0,1,'2016-07-15 14:52:56'),(49,1,10,0,1,'2016-07-15 14:53:09'),(50,1,10,0,1,'2016-07-15 14:53:18'),(51,1,10,0,1,'2016-07-15 14:53:29'),(52,1,200,0,1,'2016-07-15 15:02:53'),(53,2,10,0,1,'2016-07-15 15:14:27'),(54,2,10,0,1,'2016-07-15 15:15:12'),(55,3,213,0,1,'2016-07-17 10:15:08'),(56,3,337,0,1,'2016-07-17 10:17:34'),(57,1,10,0,1,'2016-07-17 14:01:18'),(58,6,300,0,1,'2016-07-17 14:09:40'),(59,1,700,0,1,'2016-07-25 18:52:41'),(60,2,50,0,1,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `transaction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'redemption'),(2,'purchase'),(3,'transfer_send'),(4,'transfer_receive');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernames`
--

DROP TABLE IF EXISTS `usernames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usernames` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernames`
--

LOCK TABLES `usernames` WRITE;
/*!40000 ALTER TABLE `usernames` DISABLE KEYS */;
INSERT INTO `usernames` VALUES (1,1,'chen7david','2016-07-05 19:32:53'),(2,2,'bunny',NULL),(3,3,'shitou',NULL),(4,4,NULL,NULL),(5,5,NULL,NULL),(6,6,'handsome',NULL),(7,7,NULL,NULL),(8,8,NULL,NULL),(9,9,NULL,NULL),(10,10,NULL,NULL),(11,11,NULL,NULL),(12,12,NULL,NULL),(13,13,NULL,NULL),(14,14,NULL,NULL),(15,15,NULL,NULL),(16,1,'aoxchen','2016-08-05 19:32:58');
/*!40000 ALTER TABLE `usernames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `m_name` varchar(30) DEFAULT NULL,
  `f_name_cn` varchar(5) DEFAULT NULL,
  `l_name_cn` varchar(5) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discontinued` datetime DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'David','Chen','Matthew','大卫','陈','1','1990-09-23','2016-07-05 18:42:17',NULL,NULL,'','',NULL),(2,'Sandra','Dai',NULL,'舒羽','戴','0','2007-04-03','2014-04-17 16:30:00',NULL,'2016-08-20 20:30:00','','',NULL),(3,'Michael ','Dong',NULL,'钢时','董','1','2009-10-10','2015-10-20 13:00:00',NULL,NULL,'','',NULL),(4,'Jamie','Li',NULL,'嘉明','李','1','2006-12-24','2014-07-22 14:30:00',NULL,'2016-08-25 22:30:00','','',NULL),(5,'Daisy','Cui',NULL,NULL,'崔','0','2007-02-15',NULL,NULL,'2016-08-25 22:30:00','','',NULL),(6,'Leo','Tong',NULL,'其远','佟','1','2002-08-26','2014-01-25 09:00:00',NULL,NULL,'','',NULL),(7,'Jessa','Liu',NULL,NULL,'刘','0','2007-05-08','2014-07-22 14:30:00',NULL,'2016-08-25 22:30:00','','',NULL),(8,'Ziqi','Han',NULL,NULL,NULL,'0','2001-01-26','2015-03-10 09:00:00',NULL,NULL,'','',NULL),(9,'Rui','Zhao',NULL,NULL,NULL,'0','2001-01-19','2015-03-10 09:00:00',NULL,NULL,'','',NULL),(10,'yu','shuang',NULL,NULL,NULL,'0','1999-07-23','2015-03-10 09:00:00',NULL,NULL,'','',NULL),(11,'Zhou','Le',NULL,NULL,NULL,'1','1998-10-08','2015-03-10 09:00:00',NULL,NULL,'','',NULL),(12,'Coco','Tao',NULL,'艺涵','陶','0','2007-03-08','2016-05-10 07:30:00',NULL,NULL,'','',NULL),(13,'Hanna','Liu',NULL,NULL,NULL,'0','2009-04-28','2016-04-18 16:00:00',NULL,NULL,'','',NULL),(14,'Ian','Luan',NULL,'恩熙','栾','1','2001-11-17','2016-05-23 15:30:00',NULL,NULL,'','',NULL),(15,'Melody','Tao',NULL,'姿潆','陶','0','2004-08-04','2016-05-10 07:30:00',NULL,NULL,'','',NULL),(16,'Minnie','Chao',NULL,NULL,NULL,'0',NULL,'2016-09-30 09:54:44',NULL,NULL,'','',NULL),(19,'Ftest','Ltest','',NULL,NULL,'M','2002-08-26','2016-09-30 09:54:44',NULL,NULL,'a@a.c','123',NULL),(20,'Ftest11','Ltest11','sdf',NULL,NULL,'F','2002-08-26','2016-09-30 09:54:44',NULL,NULL,'a@a.c','123',NULL),(21,'Ftest11','Ltest11','sdf',NULL,NULL,'F','2002-08-26','2016-12-21 13:27:44',NULL,NULL,'a@a.c','123',NULL),(27,'testFname','testLname','',NULL,NULL,'male','2000-01-01','2016-12-22 12:35:28',NULL,NULL,'email@domain.com','$2y$10$LisccWeLnvrdgzd3wyTI4uzBxYvhNHv7l5DhdI',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat`
--

DROP TABLE IF EXISTS `wechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `wechat` varchar(60) DEFAULT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat`
--

LOCK TABLES `wechat` WRITE;
/*!40000 ALTER TABLE `wechat` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-22 13:32:45
