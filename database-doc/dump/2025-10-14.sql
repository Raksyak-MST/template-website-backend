-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: hotel_cms
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `HotelPageSections`
--

DROP TABLE IF EXISTS `HotelPageSections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelPageSections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `template_section_id` int NOT NULL,
  `template_page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `template_section_id` (`template_section_id`),
  KEY `template_page_id` (`template_page_id`),
  CONSTRAINT `HotelPageSections_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelPageSections_ibfk_2` FOREIGN KEY (`template_section_id`) REFERENCES `TemplateSections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelPageSections_ibfk_3` FOREIGN KEY (`template_page_id`) REFERENCES `TemplatePages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelPageSections`
--

LOCK TABLES `HotelPageSections` WRITE;
/*!40000 ALTER TABLE `HotelPageSections` DISABLE KEYS */;
INSERT INTO `HotelPageSections` VALUES (1,1,2,1),(2,1,3,1),(3,1,4,1);
/*!40000 ALTER TABLE `HotelPageSections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelSectionDescriptions`
--

DROP TABLE IF EXISTS `HotelSectionDescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelSectionDescriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `hotel_section_id` int NOT NULL,
  `description_text` text,
  `order_index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `hotel_section_id` (`hotel_section_id`),
  CONSTRAINT `HotelSectionDescriptions_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelSectionDescriptions_ibfk_2` FOREIGN KEY (`hotel_section_id`) REFERENCES `HotelSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionDescriptions`
--

LOCK TABLES `HotelSectionDescriptions` WRITE;
/*!40000 ALTER TABLE `HotelSectionDescriptions` DISABLE KEYS */;
INSERT INTO `HotelSectionDescriptions` VALUES (1,2,4,'Where luxury meets intimacy in the heart of Paris, our boutique establishment stands as a testament to refined elegance and sophistication. We redefine the concept of opulence not only through our meticulously curated interiors but also with our unwavering attention to detail and commitment to providing personalized service that caters to each guest\'s unique desires. Every aspect of your stay is designed to evoke a sense of comfort and exclusivity, allowing you to experience the very best that Paris has to offer.',NULL),(2,2,3,'Each of our rooms is thoughtfully designed to reflect the charm of Parisian elegance, blending timeless aesthetics with modern amenities. Whether you\'re seeking a serene hideaway or a romantic escape, our curated spaces offer an intimate retreat tailored to elevate every moment of your stay.',NULL);
/*!40000 ALTER TABLE `HotelSectionDescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelSectionHeadings`
--

DROP TABLE IF EXISTS `HotelSectionHeadings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelSectionHeadings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `hotel_section_id` int NOT NULL,
  `heading_text` varchar(255) DEFAULT NULL,
  `order_index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `hotel_section_id` (`hotel_section_id`),
  CONSTRAINT `HotelSectionHeadings_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelSectionHeadings_ibfk_2` FOREIGN KEY (`hotel_section_id`) REFERENCES `HotelSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionHeadings`
--

LOCK TABLES `HotelSectionHeadings` WRITE;
/*!40000 ALTER TABLE `HotelSectionHeadings` DISABLE KEYS */;
INSERT INTO `HotelSectionHeadings` VALUES (1,1,2,'The Art of Boutique Luxury',NULL),(2,1,2,'The Art of Boutique Luxury',NULL),(3,1,4,'The Art of Boutique Luxury',NULL),(4,1,3,'ROOMS & SUITES',NULL),(5,1,3,'Elegance Redefined: Unwind in Our Luxurious Retreats',NULL),(6,1,6,'What our clients say about us',NULL),(7,1,7,'LOCATION & MAPS',NULL),(8,2,5,'Elevated Comforts & Services',NULL);
/*!40000 ALTER TABLE `HotelSectionHeadings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelSectionImages`
--

DROP TABLE IF EXISTS `HotelSectionImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelSectionImages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `hotel_section_id` int NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `order_index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `hotel_section_id` (`hotel_section_id`),
  CONSTRAINT `HotelSectionImages_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelSectionImages_ibfk_2` FOREIGN KEY (`hotel_section_id`) REFERENCES `HotelSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionImages`
--

LOCK TABLES `HotelSectionImages` WRITE;
/*!40000 ALTER TABLE `HotelSectionImages` DISABLE KEYS */;
INSERT INTO `HotelSectionImages` VALUES (1,1,2,'/hotel2/section2ambiens.jpeg',NULL);
/*!40000 ALTER TABLE `HotelSectionImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelSections`
--

DROP TABLE IF EXISTS `HotelSections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelSections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_template_id` int NOT NULL,
  `template_section_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `hotel_template_id` (`hotel_template_id`),
  KEY `template_section_id` (`template_section_id`),
  CONSTRAINT `HotelSections_ibfk_1` FOREIGN KEY (`hotel_template_id`) REFERENCES `HotelTemplates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelSections_ibfk_2` FOREIGN KEY (`template_section_id`) REFERENCES `TemplateSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hotel can toggle sections using this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSections`
--

LOCK TABLES `HotelSections` WRITE;
/*!40000 ALTER TABLE `HotelSections` DISABLE KEYS */;
INSERT INTO `HotelSections` VALUES (2,1,1,1),(3,1,2,1),(4,1,3,1),(5,1,4,1),(6,1,5,1),(7,1,6,1),(8,1,7,1),(10,2,1,1),(11,2,2,1),(12,2,3,1),(13,2,4,1),(14,2,5,1),(15,2,6,1),(16,2,7,1),(17,1,1,1);
/*!40000 ALTER TABLE `HotelSections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelTemplates`
--

DROP TABLE IF EXISTS `HotelTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelTemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `template_id` int NOT NULL,
  `activated_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `template_id` (`template_id`),
  CONSTRAINT `HotelTemplates_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelTemplates_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `Templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelTemplates`
--

LOCK TABLES `HotelTemplates` WRITE;
/*!40000 ALTER TABLE `HotelTemplates` DISABLE KEYS */;
INSERT INTO `HotelTemplates` VALUES (1,1,1,NULL),(2,2,2,NULL);
/*!40000 ALTER TABLE `HotelTemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotels`
--

DROP TABLE IF EXISTS `Hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `owner_id` int DEFAULT NULL,
  `current_template_id` int DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `domain_name` varchar(100) DEFAULT NULL,
  `check_in` varchar(20) DEFAULT NULL,
  `check_out` varchar(20) DEFAULT NULL,
  `opening` varchar(50) DEFAULT NULL,
  `closing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `current_template_id` (`current_template_id`),
  CONSTRAINT `Hotels_ibfk_1` FOREIGN KEY (`current_template_id`) REFERENCES `Templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotels`
--

LOCK TABLES `Hotels` WRITE;
/*!40000 ALTER TABLE `Hotels` DISABLE KEYS */;
INSERT INTO `Hotels` VALUES (1,'ManyataWoods',1,2,'123 Manyata Road, Bangalore, India','9888543211','contact@manyatawoods.com','manyatawoods.com','14:00','12:00','09:00','22:00'),(2,'Oterra',2,1,'45 Oterra Street, Bangalore, India','9876501234','info@oterra.com','oterra.com','15:00','11:00','08:00','23:00'),(4,'Hotel Sunshine',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TemplatePages`
--

DROP TABLE IF EXISTS `TemplatePages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TemplatePages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_name` varchar(100) NOT NULL,
  `template_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TemplatePages`
--

LOCK TABLES `TemplatePages` WRITE;
/*!40000 ALTER TABLE `TemplatePages` DISABLE KEYS */;
INSERT INTO `TemplatePages` VALUES (1,'home',2),(2,'rooms',2),(3,'about us',2),(4,'spa',2),(5,'restaurant',2),(6,'blog',2),(7,'contact us',2);
/*!40000 ALTER TABLE `TemplatePages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TemplateSections`
--

DROP TABLE IF EXISTS `TemplateSections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TemplateSections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_id` int NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_optional` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  CONSTRAINT `TemplateSections_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `Templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TemplateSections`
--

LOCK TABLES `TemplateSections` WRITE;
/*!40000 ALTER TABLE `TemplateSections` DISABLE KEYS */;
INSERT INTO `TemplateSections` VALUES (1,2,'home',NULL,0),(2,2,'rooms',NULL,0),(3,2,'about',NULL,0),(4,2,'amenities',NULL,0),(5,2,'testimonials',NULL,0),(6,2,'location',NULL,0),(7,2,'footer',NULL,0);
/*!40000 ALTER TABLE `TemplateSections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Templates`
--

DROP TABLE IF EXISTS `Templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Templates`
--

LOCK TABLES `Templates` WRITE;
/*!40000 ALTER TABLE `Templates` DISABLE KEYS */;
INSERT INTO `Templates` VALUES (1,'template1'),(2,'template2'),(3,'template3'),(4,'template4'),(5,'template5'),(6,'template6'),(7,'template7'),(8,'template9'),(9,'template11');
/*!40000 ALTER TABLE `Templates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-14  9:38:50
