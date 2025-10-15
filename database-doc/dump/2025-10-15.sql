-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: hotel_system
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
-- Table structure for table `HotelPages`
--

DROP TABLE IF EXISTS `HotelPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelPages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `template_page_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotel_id` (`hotel_id`,`template_page_id`),
  KEY `template_page_id` (`template_page_id`),
  CONSTRAINT `HotelPages_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelPages_ibfk_2` FOREIGN KEY (`template_page_id`) REFERENCES `TemplatePages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelPages`
--

LOCK TABLES `HotelPages` WRITE;
/*!40000 ALTER TABLE `HotelPages` DISABLE KEYS */;
INSERT INTO `HotelPages` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,1,6,1),(7,1,7,1),(8,1,8,1),(9,1,9,1),(14,2,1,1),(15,2,2,1),(16,2,3,1),(17,2,4,1),(18,2,6,1),(19,2,8,1);
/*!40000 ALTER TABLE `HotelPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `HotelPagesView`
--

DROP TABLE IF EXISTS `HotelPagesView`;
/*!50001 DROP VIEW IF EXISTS `HotelPagesView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HotelPagesView` AS SELECT 
 1 AS `hotel_id`,
 1 AS `hotel_name`,
 1 AS `hotel_page_id`,
 1 AS `template_page_id`,
 1 AS `page_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `HotelSectionDescriptions`
--

DROP TABLE IF EXISTS `HotelSectionDescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelSectionDescriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_section_id` int NOT NULL,
  `description_text` text,
  `order_index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_section_id` (`hotel_section_id`),
  CONSTRAINT `HotelSectionDescriptions_ibfk_1` FOREIGN KEY (`hotel_section_id`) REFERENCES `HotelSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionDescriptions`
--

LOCK TABLES `HotelSectionDescriptions` WRITE;
/*!40000 ALTER TABLE `HotelSectionDescriptions` DISABLE KEYS */;
INSERT INTO `HotelSectionDescriptions` VALUES (3,3,'Swimming pool, gym, spa, and more to pamper our guests.',1),(4,4,'Call us at 9876543210 or email contact@manyatawoods.com.',1),(5,5,'Step into an intimate dining experience where classic French cuisine meets contemporary creativity. Our restaurant celebrates the art of gastronomy with seasonal menus crafted from the finest local ingredients, presented with elegance and care. From leisurely breakfasts to candlelit dinners, every dish is designed to delight the senses in an atmosphere of understated sophistication. Whether you\'re a guest or a local connoisseur, this is Parisian dining at its most refined.',1),(6,6,'Nestled within one of the world’s most iconic cities, our boutique hotel is more than just a place to stay—it is a curated experience of Parisian charm, timeless sophistication, and heartfelt hospitality. Every corner reflects our passion for design, comfort, and personalized service, creating a refined retreat where guests feel both at home and inspired. From the moment you arrive, you’re invited to become part of a story defined by elegance, intimacy, and unforgettable moments.',1),(7,7,'Escape the rhythm of the city and step into a sanctuary of calm. Our spa offers a curated selection of treatments designed to restore balance, beauty, and inner peace. From rejuvenating facials to indulgent massages, each experience is delivered with utmost care, using premium natural products. Let serenity take over in an intimate setting where every detail is devoted to your well-being.',1),(8,8,'Hear what our satisfied guests have to say about us.',1),(9,9,'Check-in from 2 PM, Check-out by 12 PM, follow our hotel rules.',1),(14,14,'Our spa offers rejuvenating massages and therapies.',1),(15,15,'Our outdoor pool is open from 6 AM to 9 PM with lifeguards.',1),(24,32,'Where luxury meets intimacy in the heart of Paris, our boutique establishment stands as a testament to refined elegance and sophistication. We redefine the concept of opulence not only through our meticulously curated interiors but also with our unwavering attention to detail and commitment to providing personalized service that caters to each guest\'s unique desires. Every aspect of your stay is designed to evoke a sense of comfort and exclusivity, allowing you to experience the very best that Paris has to offer.',NULL),(25,2,'Each of our rooms is thoughtfully designed to reflect the charm of Parisian elegance, blending timeless aesthetics with modern amenities. Whether you\'re seeking a serene hideaway or a romantic escape, our curated spaces offer an intimate retreat tailored to elevate every moment of your stay.',NULL);
/*!40000 ALTER TABLE `HotelSectionDescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `HotelSectionDescriptionsView`
--

DROP TABLE IF EXISTS `HotelSectionDescriptionsView`;
/*!50001 DROP VIEW IF EXISTS `HotelSectionDescriptionsView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HotelSectionDescriptionsView` AS SELECT 
 1 AS `description_id`,
 1 AS `hotel_name`,
 1 AS `page_name`,
 1 AS `section_name`,
 1 AS `description_text`,
 1 AS `order_index`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `HotelSectionHeadings`
--

DROP TABLE IF EXISTS `HotelSectionHeadings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelSectionHeadings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_section_id` int NOT NULL,
  `heading_text` varchar(255) DEFAULT NULL,
  `order_index` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `hotel_section_id` (`hotel_section_id`),
  CONSTRAINT `HotelSectionHeadings_ibfk_1` FOREIGN KEY (`hotel_section_id`) REFERENCES `HotelSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionHeadings`
--

LOCK TABLES `HotelSectionHeadings` WRITE;
/*!40000 ALTER TABLE `HotelSectionHeadings` DISABLE KEYS */;
INSERT INTO `HotelSectionHeadings` VALUES (1,1,'Luxury Hotel & Suites',1),(2,2,'ROOMS',1),(3,3,'Amenities You Will Love',1),(4,4,'Get in Touch',1),(5,5,'Restaurant',1),(6,6,'About us',1),(7,7,'SPA',1),(8,8,'Guest Testimonials',1),(9,9,'Booking Policies',1),(14,14,'Relax at Our Spa',1),(15,15,'Enjoy Our Pool',1),(25,1,'Experience unmatched elegance and comfort in the heart of Paris.',1),(26,32,'The Art of Boutique Luxury',1),(27,33,'Rooms & Suites',1),(28,33,'Elegance Redefined: Unwind in Our Luxurious Retreats',1),(29,34,'What our clients say about us',1),(30,35,'LOCATION & MAPS',1),(31,2,'Elegance Redefined: Unwind in Our Luxurious Retreats',1),(32,37,'Elevated Comforts & Services',1),(33,6,'A Legacy of Elegance in the Heart of Paris',1),(34,40,'Your Parisian Escape Awaits',1),(35,40,'Reserve your stay and experience timeless elegance in the heart of the city.',1),(37,7,'Tranquility, Tailored to You',1),(38,41,'Extra Services',1),(39,41,'Indulge in Blissful Serenity: Immerse Yourself in a Spectrum of Rejuvenating Spa Services',1),(40,5,'A Culinary Journey Through Refined Parisian Flavors',1);
/*!40000 ALTER TABLE `HotelSectionHeadings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `HotelSectionHeadingsView`
--

DROP TABLE IF EXISTS `HotelSectionHeadingsView`;
/*!50001 DROP VIEW IF EXISTS `HotelSectionHeadingsView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HotelSectionHeadingsView` AS SELECT 
 1 AS `heading_id`,
 1 AS `hotel_name`,
 1 AS `page_name`,
 1 AS `section_name`,
 1 AS `heading_text`,
 1 AS `order_index`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `HotelSectionImages`
--

DROP TABLE IF EXISTS `HotelSectionImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelSectionImages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_section_id` int NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `order_index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_url` (`image_url`),
  KEY `hotel_section_id` (`hotel_section_id`),
  CONSTRAINT `HotelSectionImages_ibfk_1` FOREIGN KEY (`hotel_section_id`) REFERENCES `HotelSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionImages`
--

LOCK TABLES `HotelSectionImages` WRITE;
/*!40000 ALTER TABLE `HotelSectionImages` DISABLE KEYS */;
INSERT INTO `HotelSectionImages` VALUES (1,1,'https://example.com/manyatawoods/hero.jpg',1),(2,2,'https://example.com/manyatawoods/room1.jpg',1),(3,2,'https://example.com/manyatawoods/room2.jpg',2),(4,3,'https://example.com/manyatawoods/amenities.jpg',1),(5,5,'https://example.com/manyatawoods/restaurant.jpg',1),(6,6,'https://example.com/manyatawoods/about.jpg',1),(8,8,'https://example.com/manyatawoods/testimonial1.jpg',1),(13,14,'https://example.com/manyatawoods/spa.jpg',1),(14,15,'https://example.com/manyatawoods/pool.jpg',1),(18,32,'/hotel2/section2ambiens.jpeg',NULL),(19,32,'/hotel2/section2Dish.jpeg',NULL),(20,34,'/hotel2/testimonalsbg.webp',NULL),(21,36,'/hotel2/PageRoom/section1bg.webp',NULL),(22,37,'/hotel2/PageRoom/section4image1.webp',NULL),(23,38,'/hotel2/PageAbout/image1.webp',NULL),(24,39,'/hotel2/PageAbout/image2.webp',NULL),(25,40,'/hotel2/PageAbout/image3.webp',NULL),(26,7,'/hotel2/PageSpa/image2.webp',NULL),(28,7,'/hotel2/PageSpa/image3.webp',NULL),(29,42,'/hotel2/PageSpa/image1.webp',NULL),(32,43,'/hotel2/PageRes/image1.webp',NULL);
/*!40000 ALTER TABLE `HotelSectionImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `HotelSectionImagesView`
--

DROP TABLE IF EXISTS `HotelSectionImagesView`;
/*!50001 DROP VIEW IF EXISTS `HotelSectionImagesView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HotelSectionImagesView` AS SELECT 
 1 AS `image_id`,
 1 AS `hotel_name`,
 1 AS `page_name`,
 1 AS `section_name`,
 1 AS `image_url`,
 1 AS `order_index`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `HotelSections`
--

DROP TABLE IF EXISTS `HotelSections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelSections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_page_id` int NOT NULL,
  `template_section_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotel_page_id` (`hotel_page_id`,`template_section_id`),
  KEY `template_section_id` (`template_section_id`),
  CONSTRAINT `HotelSections_ibfk_1` FOREIGN KEY (`hotel_page_id`) REFERENCES `HotelPages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelSections_ibfk_2` FOREIGN KEY (`template_section_id`) REFERENCES `TemplateSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSections`
--

LOCK TABLES `HotelSections` WRITE;
/*!40000 ALTER TABLE `HotelSections` DISABLE KEYS */;
INSERT INTO `HotelSections` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1),(4,4,4,1),(5,5,5,1),(6,6,6,1),(7,7,7,1),(8,8,8,1),(9,9,9,1),(14,14,14,1),(15,15,15,1),(16,16,16,1),(17,17,17,1),(18,18,18,1),(19,19,19,1),(32,1,31,1),(33,1,2,1),(34,1,8,1),(35,1,4,1),(36,2,1,1),(37,2,3,1),(38,6,1,1),(39,6,3,1),(40,6,36,1),(41,7,37,1),(42,7,1,1),(43,5,1,1);
/*!40000 ALTER TABLE `HotelSections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `HotelTemplateView`
--

DROP TABLE IF EXISTS `HotelTemplateView`;
/*!50001 DROP VIEW IF EXISTS `HotelTemplateView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HotelTemplateView` AS SELECT 
 1 AS `hotel_id`,
 1 AS `hotel_name`,
 1 AS `template_id`,
 1 AS `template_name`,
 1 AS `activated_on`*/;
SET character_set_client = @saved_cs_client;

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
  UNIQUE KEY `hotel_id` (`hotel_id`,`template_id`),
  KEY `template_id` (`template_id`),
  CONSTRAINT `HotelTemplates_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HotelTemplates_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `Templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelTemplates`
--

LOCK TABLES `HotelTemplates` WRITE;
/*!40000 ALTER TABLE `HotelTemplates` DISABLE KEYS */;
INSERT INTO `HotelTemplates` VALUES (1,1,1,'2025-10-14'),(2,2,1,'2025-10-14'),(3,3,4,'2025-10-14');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotels`
--

LOCK TABLES `Hotels` WRITE;
/*!40000 ALTER TABLE `Hotels` DISABLE KEYS */;
INSERT INTO `Hotels` VALUES (1,'ManyataWoods',1,2,'123 Manyata Road, Bangalore','9876543210','contact@manyatawoods.com','manyatawoods.com','14:00','12:00','09:00','22:00'),(2,'Oterra',2,1,'45 Oterra Street, Bangalore','9876501234','info@oterra.com','oterra.com','15:00','11:00','08:00','23:00'),(3,'Otium',3,4,'123 Goa expension street, near famous beach','9876543210','contact@otium.com','goa.otium.com','14:00','12:00','09:00','22:00');
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
  KEY `template_id` (`template_id`),
  CONSTRAINT `TemplatePages_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `Templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TemplatePages`
--

LOCK TABLES `TemplatePages` WRITE;
/*!40000 ALTER TABLE `TemplatePages` DISABLE KEYS */;
INSERT INTO `TemplatePages` VALUES (1,'Home',1),(2,'Rooms',1),(3,'Amenities',1),(4,'Contact',1),(5,'Restaurant',1),(6,'About Us',1),(7,'SPA',1),(8,'Blog',1),(9,'Contact Us',1);
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
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TemplateSections`
--

LOCK TABLES `TemplateSections` WRITE;
/*!40000 ALTER TABLE `TemplateSections` DISABLE KEYS */;
INSERT INTO `TemplateSections` VALUES (1,1,'Hero Section','image',0),(2,1,'Room Section','list',0),(3,1,'Amenities Section','text',0),(4,1,'Contact Section','text',0),(5,1,'Restaurant Section','list',1),(6,1,'About Section','text',1),(7,1,'SPA','list',1),(8,1,'Testimonials Section','list',1),(9,1,'Booking Policies','text',1),(10,1,'Offers Section','list',1),(11,1,'Dining Section','list',1),(12,1,'Activities Section','list',1),(13,1,'Gallery Section','image',1),(14,2,'Hero Section','image',0),(15,2,'Room Section','list',0),(16,2,'Amenities Section','text',0),(17,2,'Contact Section','text',0),(18,2,'About Section','text',1),(19,2,'Testimonials Section','list',1),(20,4,'Hero Section','image',0),(21,4,'Overview Section','image',0),(22,4,'Amenities Section','image',0),(23,4,'Restaurant Section','image',0),(24,4,'Activities Section','image',0),(25,4,'Meeting & Events Section','image',0),(26,4,'Sepcials section','image',0),(27,4,'Contact Section','image',0),(28,4,'Footer Section','image',0),(29,4,'Room Section','list',0),(30,1,'hero','banner',0),(31,1,'Overview Section',NULL,0),(32,1,'hero','banner',0),(33,1,'hero','banner',0),(34,1,'hero','banner',0),(35,1,'hero','banner',0),(36,1,'Advertisement','banner',0),(37,1,'Service Section',NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Templates`
--

LOCK TABLES `Templates` WRITE;
/*!40000 ALTER TABLE `Templates` DISABLE KEYS */;
INSERT INTO `Templates` VALUES (1,'Luxury Template'),(2,'Business Template'),(3,'Sunset Villas'),(4,'Independence Hotel'),(5,'Luxury Template'),(6,'Luxury Template'),(7,'Beachside Hotel'),(8,'Gumtree'),(9,'Frank'),(10,'Nest'),(11,'Tumble weed');
/*!40000 ALTER TABLE `Templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `HotelPagesView`
--

/*!50001 DROP VIEW IF EXISTS `HotelPagesView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelPagesView` AS select `h`.`id` AS `hotel_id`,`h`.`name` AS `hotel_name`,`hp`.`id` AS `hotel_page_id`,`tp`.`id` AS `template_page_id`,`tp`.`page_name` AS `page_name` from ((`HotelPages` `hp` join `Hotels` `h` on((`h`.`id` = `hp`.`hotel_id`))) join `TemplatePages` `tp` on((`tp`.`id` = `hp`.`template_page_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HotelSectionDescriptionsView`
--

/*!50001 DROP VIEW IF EXISTS `HotelSectionDescriptionsView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelSectionDescriptionsView` AS select `hsd`.`id` AS `description_id`,`h`.`name` AS `hotel_name`,`tp`.`page_name` AS `page_name`,`ts`.`section_name` AS `section_name`,`hsd`.`description_text` AS `description_text`,`hsd`.`order_index` AS `order_index` from (((((`HotelSectionDescriptions` `hsd` join `HotelSections` `hs` on((`hs`.`id` = `hsd`.`hotel_section_id`))) join `TemplateSections` `ts` on((`ts`.`id` = `hs`.`template_section_id`))) join `HotelPages` `hp` on((`hp`.`id` = `hs`.`hotel_page_id`))) join `Hotels` `h` on((`h`.`id` = `hp`.`hotel_id`))) join `TemplatePages` `tp` on((`tp`.`id` = `hp`.`template_page_id`))) order by `h`.`name`,`tp`.`page_name`,`ts`.`section_name`,`hsd`.`order_index`,`hsd`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HotelSectionHeadingsView`
--

/*!50001 DROP VIEW IF EXISTS `HotelSectionHeadingsView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelSectionHeadingsView` AS select `hsh`.`id` AS `heading_id`,`h`.`name` AS `hotel_name`,`tp`.`page_name` AS `page_name`,`ts`.`section_name` AS `section_name`,`hsh`.`heading_text` AS `heading_text`,`hsh`.`order_index` AS `order_index` from (((((`HotelSectionHeadings` `hsh` join `HotelSections` `hs` on((`hs`.`id` = `hsh`.`hotel_section_id`))) join `TemplateSections` `ts` on((`ts`.`id` = `hs`.`template_section_id`))) join `HotelPages` `hp` on((`hp`.`id` = `hs`.`hotel_page_id`))) join `Hotels` `h` on((`h`.`id` = `hp`.`hotel_id`))) join `TemplatePages` `tp` on((`tp`.`id` = `hp`.`template_page_id`))) order by `h`.`name`,`tp`.`page_name`,`ts`.`section_name`,`hsh`.`order_index` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HotelSectionImagesView`
--

/*!50001 DROP VIEW IF EXISTS `HotelSectionImagesView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelSectionImagesView` AS select `hsi`.`id` AS `image_id`,`h`.`name` AS `hotel_name`,`tp`.`page_name` AS `page_name`,`ts`.`section_name` AS `section_name`,`hsi`.`image_url` AS `image_url`,`hsi`.`order_index` AS `order_index` from (((((`HotelSectionImages` `hsi` join `HotelSections` `hs` on((`hs`.`id` = `hsi`.`hotel_section_id`))) join `TemplateSections` `ts` on((`ts`.`id` = `hs`.`template_section_id`))) join `HotelPages` `hp` on((`hp`.`id` = `hs`.`hotel_page_id`))) join `Hotels` `h` on((`h`.`id` = `hp`.`hotel_id`))) join `TemplatePages` `tp` on((`tp`.`id` = `hp`.`template_page_id`))) order by `h`.`name`,`tp`.`page_name`,`ts`.`section_name`,`hsi`.`order_index`,`hsi`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HotelTemplateView`
--

/*!50001 DROP VIEW IF EXISTS `HotelTemplateView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelTemplateView` AS select `h`.`id` AS `hotel_id`,`h`.`name` AS `hotel_name`,`t`.`id` AS `template_id`,`t`.`name` AS `template_name`,`ht`.`activated_on` AS `activated_on` from ((`Hotels` `h` join `HotelTemplates` `ht` on((`ht`.`hotel_id` = `h`.`id`))) join `Templates` `t` on((`t`.`id` = `ht`.`template_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 16:11:02
