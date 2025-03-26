-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: estateadvance
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `assignmentbuilding`
--

DROP TABLE IF EXISTS `assignmentbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentbuilding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `buildingid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_building` (`staffid`),
  KEY `fk_building_user` (`buildingid`),
  CONSTRAINT `fk_building_user` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_user_building` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
INSERT INTO `assignmentbuilding` VALUES (1,2,1,NULL,NULL,NULL,NULL),(2,2,3,NULL,NULL,NULL,NULL),(3,3,1,NULL,NULL,NULL,NULL),(4,3,4,NULL,NULL,NULL,NULL),(5,1,6,NULL,NULL,NULL,NULL),(30,4,37,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignmentbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcustomer`
--

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentcustomer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_customer` (`staffid`),
  KEY `fk_customer_user` (`customerid`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
INSERT INTO `assignmentcustomer` VALUES (11,2,1,NULL,NULL,NULL,NULL),(12,3,1,NULL,NULL,NULL,NULL),(13,4,1,NULL,NULL,NULL,NULL),(14,3,3,NULL,NULL,NULL,NULL),(15,4,3,NULL,NULL,NULL,NULL),(16,2,11,NULL,NULL,NULL,NULL),(17,3,11,NULL,NULL,NULL,NULL),(28,2,17,NULL,NULL,NULL,NULL),(29,3,17,NULL,NULL,NULL,NULL),(30,4,17,NULL,NULL,NULL,NULL),(31,2,2,NULL,NULL,NULL,NULL),(32,4,2,NULL,NULL,NULL,NULL),(33,2,16,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignmentcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `numberofbasement` int DEFAULT NULL,
  `floorarea` int DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rentprice` int DEFAULT NULL,
  `rentpricedescription` text,
  `servicefee` varchar(255) DEFAULT NULL,
  `carfee` varchar(255) DEFAULT NULL,
  `motofee` varchar(255) DEFAULT NULL,
  `overtimefee` varchar(255) DEFAULT NULL,
  `waterfee` varchar(255) DEFAULT NULL,
  `electricityfee` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `renttime` varchar(255) DEFAULT NULL,
  `decorationtime` varchar(255) DEFAULT NULL,
  `brokeragefee` decimal(13,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `linkofbuilding` varchar(255) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `managername` varchar(255) DEFAULT NULL,
  `managerphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Nam Giao Building Tower','59 phan xích long','Phường 2','QUAN_1','FULL GOLD',2,500,'Nam','1',15,'15 triệu/m2','10000','20000','30000','111111','123','234','345','678',NULL,NULL,678.00,'TANG_TRET,NGUYEN_CAN','Cx ok',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Nam-Chị Linh','0915354727'),(2,'ACM Tower','96 cao thắng','Phường 4','QUAN_2',NULL,2,650,NULL,NULL,18,'18 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chú Thuận','0173546263'),(3,'Alpha 2 Building Tower','153 nguyễn đình chiểu','Phường 6','QUAN_1',NULL,1,200,NULL,NULL,20,'20 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cô Lý','0555532578'),(4,'IDD 1 Building','111 Lý Chính Thắng','Phường 7','QUAN_4',NULL,1,200,NULL,NULL,12,'12 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Long','017345253'),(6,'test',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Long','017345253'),(37,'khoi nguyen','no','sdfa','QUAN_6','',1,NULL,'','',NULL,'',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,0.00,'NOI_THAT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','0334787050');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `demand` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Luc Van Hai','0905671231','hailv@gmail.com','HA NOI','Nhà dưới 10 tỷ','Đã xử lý',1,'2025-02-15 14:09:04','2025-02-15 14:28:52','nguyenvana','nguyenvana'),(2,'Nguyen Xuan Hong','0205671231','hongxuanng@gmail.com','','','',1,'2025-02-15 14:09:08','2025-02-15 14:28:21','nguyenvana','nguyenvana'),(3,'Ta Thi Cuc','0912121231','cucthita1@gmail.com','','Nhà dưới 10 tỷ','Dang xu ly',1,'2025-02-14 21:52:04','2025-02-15 14:14:45','nguyenvana','nguyenvana'),(11,'khoi nguyen','0334787050','','noi','','',1,'2025-02-15 14:01:55','2025-02-15 14:14:49','nguyenvana','nguyenvana'),(16,'khoi nguyen','0334787050','','noi','','Dang xu ly',1,'2025-02-15 14:01:50','2025-02-15 14:28:29','nguyenvana','nguyenvana'),(17,'khoi nguyen','0334787050','','noi','','',1,'2025-02-15 14:01:59','2025-02-15 14:28:01','nguyenvana','nguyenvana');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentarea`
--

DROP TABLE IF EXISTS `rentarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentarea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `buildingid` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rentarea_building` (`buildingid`),
  CONSTRAINT `rentarea_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (1,100,1,NULL,NULL,NULL,NULL),(2,200,1,NULL,NULL,NULL,NULL),(3,200,2,NULL,NULL,NULL,NULL),(4,300,2,NULL,NULL,NULL,NULL),(5,400,2,NULL,NULL,NULL,NULL),(6,300,3,NULL,NULL,NULL,NULL),(7,400,3,NULL,NULL,NULL,NULL),(8,500,3,NULL,NULL,NULL,NULL),(9,100,4,NULL,NULL,NULL,NULL),(10,400,4,NULL,NULL,NULL,NULL),(11,250,4,NULL,NULL,NULL,NULL),(24,700,6,NULL,NULL,NULL,NULL),(35,100,37,NULL,NULL,NULL,NULL),(36,200,37,NULL,NULL,NULL,NULL),(37,3,37,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rentarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản lý','ADMIN',NULL,NULL,NULL,NULL),(2,'Nhân viên','STAFF',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `staffid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_transaction` (`customerid`),
  CONSTRAINT `fk_customer_transaction` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (17,'CSKH','Đi xem nhaaa',17,'2025-02-15 14:27:54','2025-02-15 14:27:54','nguyenvana','nguyenvana',NULL),(18,'DDX','Gọi cho khách',17,'2025-02-15 14:27:59','2025-02-15 14:27:59','nguyenvana','nguyenvana',NULL),(19,'CSKH','Huy đơn',1,'2025-02-15 14:28:40','2025-03-14 18:42:19','nguyenvana','nguyenvanb',NULL),(20,'DDX','Dẫn đi ăn nha',1,'2025-02-15 14:28:44','2025-02-15 14:28:44','nguyenvana','nguyenvana',NULL),(21,'CSKH','Gọi',2,'2025-02-15 14:30:02','2025-02-15 14:30:02','nguyenvana','nguyenvana',NULL),(22,'DDX','Đi xem nhaaa',2,'2025-02-15 14:30:10','2025-02-15 14:30:10','nguyenvana','nguyenvana',NULL),(23,'CSKH','Hủy đơn',1,'2025-03-14 18:42:25','2025-03-14 18:42:29','nguyenvanb','nguyenvanb',NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,'nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van b',NULL,NULL,1,NULL,NULL,NULL,NULL),(3,'nguyenvanc','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van c',NULL,NULL,1,NULL,NULL,NULL,NULL),(4,'nguyenvand','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van d',NULL,NULL,1,NULL,NULL,NULL,NULL),(5,'nguyenvane','123456','nguyen van',NULL,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`user_id`),
  KEY `fk_role_user` (`role_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (3,2,3,NULL,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL,NULL),(7,1,1,NULL,NULL,NULL,NULL),(10,2,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26 21:09:49
