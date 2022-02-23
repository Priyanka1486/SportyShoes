-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: shoesdb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c0r9atamxvbhjjvy5j8da1kam` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'mishra@g.c','Priyanka','Pandit','12');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admininfo`
--

DROP TABLE IF EXISTS `admininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admininfo` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admininfo`
--

LOCK TABLES `admininfo` WRITE;
/*!40000 ALTER TABLE `admininfo` DISABLE KEYS */;
INSERT INTO `admininfo` VALUES (1,'mishra@gmail.com','123','Priyanka','Pandit');
/*!40000 ALTER TABLE `admininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `cart_product_id` int DEFAULT NULL,
  `orders_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi96g0xxqyu7qt5awx6clp84rr` (`cart_product_id`),
  KEY `FK64nntm6chepg79xqtsgmvyp2v` (`orders_id`),
  CONSTRAINT `FK64nntm6chepg79xqtsgmvyp2v` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKi96g0xxqyu7qt5awx6clp84rr` FOREIGN KEY (`cart_product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (19,1,7,18),(21,1,7,20),(22,1,11,20),(24,1,13,23),(25,1,11,23),(26,1,13,23),(28,1,7,27),(30,1,7,29),(32,1,7,31),(33,1,13,31),(35,1,7,34),(37,1,7,36),(39,1,7,38),(40,1,11,38),(42,1,7,41),(43,1,13,41),(45,1,7,44),(46,1,13,44),(48,1,7,47),(50,1,7,49),(52,1,7,51),(53,1,13,51),(55,1,7,54),(56,1,11,54),(58,1,7,57),(60,1,11,59),(61,1,13,59),(63,1,7,62),(64,1,11,62),(65,1,13,62),(68,1,7,67),(69,1,11,67),(71,1,7,70),(72,1,7,70),(74,1,7,73),(75,1,7,73),(77,1,7,76),(78,1,11,76),(80,1,7,79),(81,1,11,79),(83,1,7,82),(84,1,13,82),(86,1,7,85),(87,1,11,85),(89,1,8,88),(90,1,9,88);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Walking'),(2,'Treking'),(3,'Running'),(8,'Gym');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (91);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` int NOT NULL,
  `society` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (18,'Pune',1231232,'F-101 Roystonea magarpatta','Maharastra',5000,'01-01-2022',4),(20,'Pune',109011,'F-101 Roystonea magarpatta','Maharastra',5000,'01-03-2022',5),(23,'Pune',109890,'F-101 Roystonea magarpatta','Maharastra',5000,'01-12-2022',4),(27,'Pune',88890,'F-101 Roystonea magarpatta','Maharastra',5000,'01-12-2022',6),(29,'Pune',123123,'F-101 Roystonea magarpatta','Maharastra',5000,'01-13-2022',7),(31,'Pune',12312,'F-101 Roystonea magarpatta','Maharastra',5000,'01-14-2022',7),(34,'Pune',111211,'F-101 Roystonea magarpatta','Maharastra',5000,'01-14-2022',7),(36,'Pune',123123,'F-101 Roystonea magarpatta','Maharastra',5000,'01-14-2022',6),(38,'Pune',123321,'F-101 Roystonea magarpatta','Maharastra',5000,'01-15-2022',5),(41,'Pune',22312,'F-101 Roystonea magarpatta','Maharastra',5000,'01-16-2022',4),(44,'Pune',232322,'F-101 Roystonea magarpatta','Maharastra',5000,'01-16-2022',4),(47,'Pune',32321,'F-101 Roystonea magarpatta','Maharastra',5000,'01-17-2022',6),(49,'Pune',121212,'F-101 Roystonea magarpatta','Maharastra',5000,'01-17-2022',7),(51,'Pune',1111,'F-101 Roystonea magarpatta','Maharastra',5000,'01-18-2022',6),(54,'Pune',1212,'F-101 Roystonea magarpatta','Maharastra',5000,'01-19-2022',6),(57,'Pune',123123,'F-303 Roystonea Magarpatta','Maharastra',5000,'01-19-2022',6),(59,'pune',12321,'F-303 Roystonea Magarpatta','Maharastra',5000,'01-19-2022',5),(62,'Pune',345345,'F-303 Roystonea Magarpatta','Maharastra',5000,'01-20-2022',5),(66,'Pune',112,'F-503 Roystonea Magarpatta','Maharastra',15000,'01-20-2022',4),(67,'Pune',32321,'F-303 Roystonea Magarpatta','Maharastra',5000,'01-21-2022',4),(70,'Pune',11111,'F-303 Roystonea Magarpatta','Maharastra',6000,'01-20-2022',7),(73,'Pune',121212,'F-303 Roystonea Magarpatta','Maharastra',6000,'01-22-2022',6),(76,'indore',980,'112','mp',5000,'02-10-2022',5),(79,'Indore',12121,'F-101 sudama Nagar','MP',5000,'02-23-2022',4),(82,'Indore',10190,'129 -B Sudama Nagar','MP',5000,'02-23-2022',5),(85,'Indore',12901,'112-A Sudama Nagar','MP',5000,'02-23-2022',5),(88,'Pune',4011208,'A-202 Iris Magarpatta','Maharastra',13000,'02-23-2022',8);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `size` int NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (7,'Puma',3000,10,11,1),(8,'Nike',5000,19,11,2),(9,'Adidas',8000,19,11,2),(10,'Puma',2000,20,11,2),(11,'Nike',2000,9,11,1),(12,'Action',4000,10,11,3),(13,'Action',2000,24,11,1),(14,'Action',4000,10,11,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'a@b.c','Priyanka','Pandit','123'),(5,'r@b.c','Anay','Pandit','123'),(6,'a@b.c','Ram','Singh','123'),(7,'a@m.c','Anay','Rai','123'),(8,'priyanka@gmail.com','Priyanka','Pandit','123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-23 17:27:18
