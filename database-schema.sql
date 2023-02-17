-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dbqlct
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
-- Table structure for table `architect`
--

DROP TABLE IF EXISTS `architect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `architect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `birthday` int DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '0' COMMENT '1: Name - 0: Nữ',
  `place` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `architect`
--

LOCK TABLES `architect` WRITE;
/*!40000 ALTER TABLE `architect` DISABLE KEYS */;
INSERT INTO `architect` VALUES (1,'le thanh tung',1956,1,'tp hcm','25 duong 3/2 tp bien hoa'),(2,'le kim dung',1952,0,'ha noi','18/5 phan van tri tp can tho'),(3,'nguyen anh thu',1970,0,'new york','khu 2 dhct tp can tho'),(4,'nguyen song do quyen',1970,0,'can tho','73 tran hung dao tp hcm'),(5,'truong minh thai',1950,1,'paris france','12/2/5 tran phu tp hanoi');
/*!40000 ALTER TABLE `architect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `start` date DEFAULT NULL,
  `host_id` int NOT NULL,
  `contractor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_building_contractor_idx` (`contractor_id`),
  KEY `fk_building_host_idx` (`host_id`),
  CONSTRAINT `fk_building_contractor` FOREIGN KEY (`contractor_id`) REFERENCES `contractor` (`id`),
  CONSTRAINT `fk_building_host` FOREIGN KEY (`host_id`) REFERENCES `host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'khach san quoc te','5 nguyen an ninh','can tho',450,'1994-12-13',1,1),(2,'cong vien thieu nhi','100 nguyen thai hoc	','can tho',200,'1994-05-08',2,1),(3,'hoi cho nong nghiep','bai cat','vinh long',1000,'1994-06-10',1,1),(4,'truong mg mang non','48 cm thang 8','can tho',30,'1994-07-10',3,3),(5,'khoa trong trot dhct','khu ii dhct	','can tho',3000,'1994-06-19',4,3),(6,'van phong bitis','25 phan dinh phung','ha noi',40,'1994-05-10',5,3),(7,'nha rieng 1','124/5 nguyen trai','tp hcm',65,'1994-11-15',6,2),(8,'nha rieng 2','76 chau van liem','ha noi',200,'1994-06-09',7,4);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor`
--

DROP TABLE IF EXISTS `contractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor`
--

LOCK TABLES `contractor` WRITE;
/*!40000 ALTER TABLE `contractor` DISABLE KEYS */;
INSERT INTO `contractor` VALUES (1,'cty xd so 6','567456','5 phan chu trinh'),(2,'phong dich vu so xd','206481','2 le van sy'),(3,'le van son','028374','12 tran nhan ton'),(4,'tran khai hoan','658432','20 nguyen thai hoc');
/*!40000 ALTER TABLE `contractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design`
--

DROP TABLE IF EXISTS `design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design` (
  `building_id` int NOT NULL,
  `architect_id` int NOT NULL,
  `benefit` float DEFAULT NULL,
  PRIMARY KEY (`building_id`,`architect_id`),
  KEY `fk_design_architect_idx` (`architect_id`),
  CONSTRAINT `fk_design_architect` FOREIGN KEY (`architect_id`) REFERENCES `architect` (`id`),
  CONSTRAINT `fk_design_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design`
--

LOCK TABLES `design` WRITE;
/*!40000 ALTER TABLE `design` DISABLE KEYS */;
INSERT INTO `design` VALUES (1,1,25),(1,5,12),(2,4,6),(3,3,12),(4,2,20),(5,5,30),(6,2,40),(6,5,27),(7,1,10),(8,2,18);
/*!40000 ALTER TABLE `design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,'so t mai du lich','54 xo viet nghe tinh'),(2,'so van hoa thong tin','101 hai ba trung'),(3,'so giao duc','29 duong 3/2'),(4,'dai hoc can tho','56 duong 30/4'),(5,'cty bitis','29 phan dinh phung'),(6,'nguyen thanh ha','45 de tham'),(7,'phan thanh liem','48/6 huynh thuc khan');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work` (
  `building_id` int NOT NULL,
  `worker_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `total` int DEFAULT NULL,
  PRIMARY KEY (`building_id`,`worker_id`),
  KEY `fk_work_worker_idx` (`worker_id`),
  CONSTRAINT `fk_work_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_work_worker` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,1,'1994-12-15',5),(1,3,'1994-12-18',6),(1,6,'1994-09-14',7),(2,1,'1994-05-08',20),(2,4,'1994-05-10',10),(2,5,'1994-12-16',5),(3,4,'1994-10-06',10),(3,7,'1994-10-06',18),(4,1,'1994-09-07',20),(4,6,'1994-05-12',7);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `birthday` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `skill` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'nguyen thi suu',1945,1960,'ho'),(2,'vi chi a',1966,1987,'moc'),(3,'le manh quoc',1956,1971,'son'),(4,'vo van chin',1940,1952,'dien'),(5,'le quyet thang',1954,1974,'han'),(6,'nguyen hong van',1950,1970,'dien'),(7,'dang van son',1948,1965,'dien');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14  1:03:14
