-- MariaDB dump 10.19  Distrib 10.6.8-MariaDB, for Linux (x86_64)
--
-- Host: classmysql.engr.oregonstate.edu    Database: cs340_deshazen
-- ------------------------------------------------------
-- Server version	10.6.9-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE=`+00:00` */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`NO_AUTO_VALUE_ON_ZERO` */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Astronomer_Sales`
--

SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

DROP TABLE IF EXISTS `Astronomer_Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Astronomer_Sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `astronomer_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `profit_due` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `astronomer_id` (`astronomer_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `Astronomer_Sales_ibfk_1` FOREIGN KEY (`astronomer_id`) REFERENCES `Astronomers` (`astronomer_id`),
  CONSTRAINT `Astronomer_Sales_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `Sales` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Astronomer_Sales`
--

LOCK TABLES `Astronomer_Sales` WRITE;
/*!40000 ALTER TABLE `Astronomer_Sales` DISABLE KEYS */;
INSERT INTO `Astronomer_Sales` (`id`,`astronomer_id`,`sale_id`,`profit_due`)
VALUES (1,1,1,40.00),(2,1,1,44.00),(3,5,2,64.00),(4,1,2,48.00),(5,2,3,20.00),(6,4,3,24.00),(7,4,4,96.00);
/*!40000 ALTER TABLE `Astronomer_Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Astronomers`
--

DROP TABLE IF EXISTS `Astronomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Astronomers` (
  `astronomer_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `social_media_handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`astronomer_id`),
  UNIQUE KEY `astronomer_id_UNIQUE` (`astronomer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Astronomers`
--

LOCK TABLES `Astronomers` WRITE;
/*!40000 ALTER TABLE `Astronomers` DISABLE KEYS */;
INSERT INTO `Astronomers` (`astronomer_id`,`fname`, `lname`, `email`, `social_media_handle`)
VALUES (1,`Chet`,`Ubetchya`,`ChetU@gmail.com`,`@chetbet`),(2,`Timmy`,`Turner`,`Timmy.Turner@hotmail.com`,`@timmyTbb`),(3,`Cosmo`,NULL,`whatsausername@aol.com`,`@fairiesrock`),(4,`Wanda`,NULL,`wandawishmaker@gmail.com`,`@wandawishmaker`),(5,"Timmy`s Dad",NULL,`numberonedad@gmail.com`,`@ihatedinkleburg`);
/*!40000 ALTER TABLE `Astronomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Celestial_Objects`
--

DROP TABLE IF EXISTS `Celestial_Objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Celestial_Objects` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `astronomer_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  UNIQUE KEY `object_id_UNIQUE` (`object_id`),
  KEY `fk_Celestial_Objects_Astronomers_idx` (`astronomer_id`),
  CONSTRAINT `fk_Celestial_Objects_Astronomers` FOREIGN KEY (`astronomer_id`) REFERENCES `Astronomers` (`astronomer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Celestial_Objects`
--

LOCK TABLES `Celestial_Objects` WRITE;
/*!40000 ALTER TABLE `Celestial_Objects` DISABLE KEYS */;
INSERT INTO `Celestial_Objects` (`object_id`, `astronomer_id`, `type`, `name`)
VALUES (1,2,`Nebula`,`The Crab Nebula`),(2,2,`Nebula`,`The Bubble Nebula`),(3,4,`Comet`,"Halley`s Comet"),(4,5,`Planet`,`Mars`),(5,1,`Planet`,`Mars`),(6,1,`Planet`,`Saturn`),(7,1,`planet`,`Mercury`);
/*!40000 ALTER TABLE `Celestial_Objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` (`customer_id`, `email`, `name`, `address1`, `address2`, `city`, `state`, `phone`)
VALUES (1,`j_henderson@gmail.com`,`Jillian Henderson`,`1234 Thumbwar Ave.`,NULL,`Seattle`,`Washington`,`206-874-9801`),(2,`mr-harris@outlook.com`,`Harris Levy`,`24816 Squared St.`,NULL,`Portland`,`Oregon`,`314-867-5309`),(3,`yu.hussain@yahoo.com`,`Hussain Yu`,`321 Countdown Blvd.`,NULL,`Redmond`,`Washington`,`765-852-7412`),(4,`harrygo@gmail.com`,`Harold Goldshire`,`8990 Windy Rd.`,`Apt. 318`,`Seattle`,`Washington`,`206-985-6622`);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Print_Sales`
--

DROP TABLE IF EXISTS `Print_Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Print_Sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `print_price` decimal(9,2) DEFAULT NULL,
  `line_total` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `print_id` (`print_id`),
  KEY `Print_Sales_ibfk_2` (`sale_id`),
  CONSTRAINT `Print_Sales_ibfk_1` FOREIGN KEY (`print_id`) REFERENCES `Prints` (`print_id`),
  CONSTRAINT `Print_Sales_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `Sales` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Print_Sales`
--

LOCK TABLES `Print_Sales` WRITE;
/*!40000 ALTER TABLE `Print_Sales` DISABLE KEYS */;
INSERT INTO `Print_Sales` (`id`, `print_id`, `sale_id`, `quantity`, `print_price`, `line_total`)
VALUES (1,1,1,2,25.00,50.00),(2,6,1,1,55.00,55.00),(3,4,2,1,80.00,80.00),(4,5,2,1,60.00,60.00),(5,1,3,1,25.00,25.00),(6,3,3,1,30.00,30.00),(7,3,4,4,30.00,120.00);
/*!40000 ALTER TABLE `Print_Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prints`
--

DROP TABLE IF EXISTS `Prints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prints` (
  `print_id` int(11) NOT NULL AUTO_INCREMENT,
  `num_stock` int(11) DEFAULT NULL,
  `astronomer_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`print_id`),
  UNIQUE KEY `print_id_UNIQUE` (`print_id`),
  KEY `fk_Prints_Astronomers1_idx` (`astronomer_id`),
  KEY `fk_Prints_Celestial_Objects1_idx` (`object_id`),
  CONSTRAINT `fk_Prints_Astronomers1` FOREIGN KEY (`astronomer_id`) REFERENCES `Astronomers` (`astronomer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prints_Celestial_Objects1` FOREIGN KEY (`object_id`) REFERENCES `Celestial_Objects` (`object_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prints`
--

LOCK TABLES `Prints` WRITE;
/*!40000 ALTER TABLE `Prints` DISABLE KEYS */;
INSERT INTO `Prints` (`print_id`, `num_stock`, `astronomer_id`, `object_id`, `price`)
VALUES (1,2,2,1,25.00),(2,5,2,2,30.00),(3,0,4,3,30.00),(4,3,5,4,80.00),(5,30,1,5,60.00),(6,5,1,7,55.00);
/*!40000 ALTER TABLE `Prints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `value` decimal(9,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `sale_id_UNIQUE` (`sale_id`),
  KEY `fk_Sales_Customers1_idx` (`customer_id`),
  CONSTRAINT `fk_Sales_Customers1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT=`fda`;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` (`sale_id`, `customer_id`, `value`, `date`)
VALUES (1,9,105.00,`2022-10-07`),(2,10,140.00,`2022-09-13`),(3,12,55.00,`2022-08-22`),(4,9,120.00,`2021-10-05`);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-20 19:01:49

SET FOREIGN_KEY_CHECKS=1;
COMMIT;