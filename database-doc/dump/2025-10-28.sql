-- MySQL dump 10.13  Distrib 8.4.7, for Linux (x86_64)
--
-- Host: localhost    Database: hotel_system
-- ------------------------------------------------------
-- Server version	8.4.7

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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelPages`
--

LOCK TABLES `HotelPages` WRITE;
/*!40000 ALTER TABLE `HotelPages` DISABLE KEYS */;
INSERT INTO `HotelPages` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(5,1,5,1),(6,1,6,1),(7,1,7,1),(8,1,8,1),(9,1,9,1),(14,2,1,1),(15,2,2,1),(16,2,3,1),(18,2,6,1),(19,2,8,1),(31,2,37,1),(32,2,38,1),(33,2,39,1),(34,2,40,1),(35,2,41,1),(36,2,44,1),(37,1,54,1),(40,3,1,1),(41,3,2,1),(42,3,3,1),(43,3,5,1),(44,3,6,1),(45,3,7,1),(46,3,8,1),(47,3,9,1),(55,2,55,1),(56,2,56,1),(57,2,57,1),(58,2,58,1),(59,2,59,1),(60,2,60,1),(61,2,61,1),(62,3,48,1),(63,3,49,1),(64,3,50,1),(65,3,51,1),(66,3,52,1),(67,3,53,1),(69,3,54,1),(72,2,54,1),(73,2,48,1),(74,2,49,1),(75,2,50,1),(76,2,51,1),(77,2,52,1),(78,2,53,1),(79,2,62,1),(80,3,62,1),(81,2,5,1),(82,2,7,1),(83,2,9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionDescriptions`
--

LOCK TABLES `HotelSectionDescriptions` WRITE;
/*!40000 ALTER TABLE `HotelSectionDescriptions` DISABLE KEYS */;
INSERT INTO `HotelSectionDescriptions` VALUES (3,3,'Swimming pool, gym, spa, and more to pamper our guests.',1),(5,5,'Step into an intimate dining experience where classic French cuisine meets contemporary creativity. Our restaurant celebrates the art of gastronomy with seasonal menus crafted from the finest local ingredients, presented with elegance and care. From leisurely breakfasts to candlelit dinners, every dish is designed to delight the senses in an atmosphere of understated sophistication. Whether you\'re a guest or a local connoisseur, this is Parisian dining at its most refined.',1),(6,6,'Nestled within one of the world’s most iconic cities, our boutique hotel is more than just a place to stay—it is a curated experience of Parisian charm, timeless sophistication, and heartfelt hospitality. Every corner reflects our passion for design, comfort, and personalized service, creating a refined retreat where guests feel both at home and inspired. From the moment you arrive, you’re invited to become part of a story defined by elegance, intimacy, and unforgettable moments.',1),(7,7,'Escape the rhythm of the city and step into a sanctuary of calm. Our spa offers a curated selection of treatments designed to restore balance, beauty, and inner peace. From rejuvenating facials to indulgent massages, each experience is delivered with utmost care, using premium natural products. Let serenity take over in an intimate setting where every detail is devoted to your well-being.',1),(8,8,'Hear what our satisfied guests have to say about us.',1),(9,9,'Check-in from 2 PM, Check-out by 12 PM, follow our hotel rules.',1),(14,14,'Our spa offers rejuvenating massages and therapies.',1),(15,15,'Our outdoor pool is open from 6 AM to 9 PM with lifeguards.',1),(24,32,'Where luxury meets intimacy in the heart of Paris, our boutique establishment stands as a testament to refined elegance and sophistication. We redefine the concept of opulence not only through our meticulously curated interiors but also with our unwavering attention to detail and commitment to providing personalized service that caters to each guest\'s unique desires. Every aspect of your stay is designed to evoke a sense of comfort and exclusivity, allowing you to experience the very best that Paris has to offer.',NULL),(25,2,'Each of our rooms is thoughtfully designed to reflect the charm of Parisian elegance, blending timeless aesthetics with modern amenities. Whether you\'re seeking a serene hideaway or a romantic escape, our curated spaces offer an intimate retreat tailored to elevate every moment of your stay.',NULL),(26,69,'We are a cozy stylish motel with located in beautiful Sedona. Set in the mystical Oak Creek Canyon, our motel backs up against the enchanting Coconino National Forest. We offer comfortable rooms & the best hospitality for an affordable price in one of the most beautiful places on Earth. We serve the best coffee and breakfast made of local ingredients in town. Our organized activities is all you need to make your stay unforgettable.',NULL),(27,69,'There are regular vacations and then there are vacations in the most beautiful place on Earth. There will always be something new to see and do in Sedona. If you\'re looking for a perfect stay in Sedona, look no further.',NULL),(28,77,'Life is busy - but there\'s more to life than just being on the go. At Tumbleweed, we offer more than the comfy rooms and hospitality motel - we offer a true escape from the stresses of life.',NULL),(29,77,'You can unwind, unplug, and connect with nature, unleashing the full powers of the outdoors.',NULL),(30,77,'Choose from a variety of your favorite outdoor activities, and you can even try something new every day you stay here.',NULL),(31,79,'Tumbleweed offers cozy and affordable lodging in Sedona, one of the most beautiful places on Earth.',NULL),(32,79,'The motel features 7 king rooms, 3 rooms with 2 queen beds and 3 king rooms with fully equipped kitchen, and the most breathtaking views. The rooms have all you need to recharge and rest after a long day of hiking in nature. Upon request we serve a delicious breakfast made out of local ingredients.',NULL),(33,82,'There is nothing better than a perfect cup of coffee in the morning to set you up for your day full of adventures. We know everything about coffee flavors and preparation. That\'s why our coffee is loved by the whole town. Anyone would confirm that Tumbleweed serves the best coffee in Sedona!',NULL),(34,86,'Sedona is an impossible combination of breathtaking wild nature wilderness and comforting luxury. Here red rock cliffs host a range of resorts, spas, art galleries and boutique wineries. We\'ll point you in any direction you choose to ensure your stay is all you want it to be and more!',NULL),(35,86,'How you want to experience Sedona is up to you and we are here to help you with incredible outdoor experiences organized for you. Surrounded by national forest land, wild areas and state parks, Sedona has got a landscape built for adventure. Contact us to book an activity for your perfect stay!',NULL),(36,89,'We are a cozy stylish motel with located in beautiful Sedona. Set in the mystical Oak Creek Canyon, our motel backs up against the enchanting Coconino National Forest. We offer comfortable rooms &apm; the best hospitality for an affordable price in one of the most beautiful places on Earth. We serve the best coffee and breakfast made of local ingredients in town. Our organized activities is all you need to make your stay unforgettable. If you\'re looking for a perfect stay in Sedona, look no further. Book a room today!',NULL),(37,88,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',NULL),(38,88,'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL),(39,90,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL),(40,78,'Bookings for Sunset Villass are available online 24 hours a day. Our Reservation Team is here to assist you from 9 AM to 10 PM daily with booking enquiries and personal requests.',NULL),(41,78,'Let us know if we can help you with any further information. Looking forward to hearing from you!',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionHeadings`
--

LOCK TABLES `HotelSectionHeadings` WRITE;
/*!40000 ALTER TABLE `HotelSectionHeadings` DISABLE KEYS */;
INSERT INTO `HotelSectionHeadings` VALUES (1,1,'Luxury Hotel & Suites',1),(2,2,'ROOMS',1),(3,3,'Amenities You Will Love',1),(5,5,'Restaurant',1),(6,6,'About us',1),(7,7,'SPA',1),(8,8,'Guest Testimonials',1),(9,9,'Booking Policies',1),(14,14,'Relax at Our Spa',1),(15,15,'Enjoy Our Pool',1),(25,1,'Experience unmatched elegance and comfort in the heart of Paris.',1),(26,32,'The Art of Boutique Luxury',1),(27,33,'Rooms & Suites',1),(28,33,'Elegance Redefined: Unwind in Our Luxurious Retreats',1),(29,34,'What our clients say about us',1),(30,35,'LOCATION & MAPS',1),(31,2,'Elegance Redefined: Unwind in Our Luxurious Retreats',1),(32,37,'Elevated Comforts & Services',1),(33,6,'A Legacy of Elegance in the Heart of Paris',1),(34,40,'Your Parisian Escape Awaits',1),(35,40,'Reserve your stay and experience timeless elegance in the heart of the city.',1),(37,7,'Tranquility, Tailored to You',1),(38,41,'Extra Services',1),(39,41,'Indulge in Blissful Serenity: Immerse Yourself in a Spectrum of Rejuvenating Spa Services',1),(40,5,'A Culinary Journey Through Refined Parisian Flavors',1),(41,67,'TUMBLEWEED',1),(42,67,'Cozy motel in the Red Rock country',1),(43,68,'WHAT OUR GUESTS SAY',1),(44,68,'Read our guests reviews',1),(45,69,'ABOUT TUMBLEWEED',1),(46,69,'Your favorite motel in Sedona',1),(47,70,'OUR ROOMS',1),(48,70,'Choose maximum comfort',1),(49,71,'OUR SPECIALS',1),(50,71,'Another reason to choose Tumbleweed motel',1),(51,72,'SEDONA AND SURROUNDINGS',1),(52,72,'Explore breathtaking nature and visit national parks',1),(53,73,'OUR LOCATION',1),(54,73,'Surrounded by nature',1),(55,74,'SIGN-UP FOR OUR NEWSLETTER',1),(56,74,'Sign-up today for monthly special offers & more!',1),(57,75,'ROOMS',1),(58,75,'A piece of comfort in the middle of nowhere',1),(59,76,'AMENITIES',1),(60,76,'All rooms are equipped with',1),(61,77,'RELAX & RECHARGE',1),(62,79,'ACCOMMODATION',1),(63,79,'Cozy & affordable rooms in Sedona',1),(64,80,'SPECIALS',1),(65,80,'Little & big extras to enhance your stay',1),(66,81,'OUR PACKAGES',1),(67,81,'The best deals for accommodation &amp; activities in Sedona',1),(68,82,'COFFEE',1),(69,82,'We serve the best coffee in town',1),(70,83,'Feeling like taking it easy?',1),(71,83,'No worries. All our activities are also available for our guests on request.',1),(72,85,'ACTIVITIES',1),(73,85,'Explore and wonder at every step',1),(74,86,'THINGS TO DO IN SEDONA',1),(75,86,'Unforgettable & breathtaking experiences organized for you',1),(76,87,'GALLERY',1),(77,87,'The photos of Tumbleweed & the area',1),(78,88,'ABOUT',1),(79,88,'Your favorite motel in Sedona',1),(80,89,'ABOUT US',1),(81,89,'Your favorite motel in Sedona',1),(82,90,'CONTACT',1),(83,90,'Bookings & special requests',1),(84,91,'OUR LOCATION',1),(85,91,'Surrounded by nature',1),(86,92,'BOOK ONLINE ON THIS WEBSITE',1),(87,92,'4 reasons why to choose our motel in Sedona',1),(88,78,'CONTACT INFORMATION',1);
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
  KEY `hotel_section_id` (`hotel_section_id`),
  CONSTRAINT `HotelSectionImages_ibfk_1` FOREIGN KEY (`hotel_section_id`) REFERENCES `HotelSections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSectionImages`
--

LOCK TABLES `HotelSectionImages` WRITE;
/*!40000 ALTER TABLE `HotelSectionImages` DISABLE KEYS */;
INSERT INTO `HotelSectionImages` VALUES (1,1,'/hotel2/Mansion.webp',1),(2,2,'https://example.com/manyatawoods/room1.jpg',1),(3,2,'https://example.com/manyatawoods/room2.jpg',2),(4,3,'https://example.com/manyatawoods/amenities.jpg',1),(5,5,'https://example.com/manyatawoods/restaurant.jpg',1),(6,6,'https://example.com/manyatawoods/about.jpg',1),(8,8,'https://example.com/manyatawoods/testimonial1.jpg',1),(13,14,'https://example.com/manyatawoods/spa.jpg',1),(14,15,'https://example.com/manyatawoods/pool.jpg',1),(18,32,'/hotel2/section2ambiens.jpeg',NULL),(19,32,'/hotel2/section2Dish.jpeg',NULL),(20,34,'/hotel2/testimonalsbg.webp',NULL),(21,36,'/hotel2/PageRoom/section1bg.webp',NULL),(22,37,'/hotel2/PageRoom/section4image1.webp',NULL),(23,38,'/hotel2/PageAbout/image1.webp',NULL),(24,39,'/hotel2/PageAbout/image2.webp',NULL),(25,40,'/hotel2/PageAbout/image3.webp',NULL),(26,7,'/hotel2/PageSpa/image2.webp',NULL),(28,7,'/hotel2/PageSpa/image3.webp',NULL),(29,42,'/hotel2/PageSpa/image1.webp',NULL),(32,43,'/hotel2/PageRes/image1.webp',NULL),(37,67,'/template11/mountain-night.jpg',NULL),(38,69,'/template11/mountain-resort.jpg',NULL),(39,75,'/template11/lamp-room-low-light.jpg',NULL),(40,77,'/template11/man-standing-in-sunlight.png',NULL),(41,80,'/template11/aluvera-plant.jpg',NULL),(42,85,'/template11/canan-view-in-forest.jpg',NULL),(43,87,'/template11/gallery/leaf.jpg',NULL),(44,88,'/template11/gallery/clay-banks-dHMJgl7UdLw-unsplash-1920w.webp',NULL),(45,89,'/template11/gallery/photo-1568484668894-3e9ab7eb0037-1920w.webp',NULL),(46,90,'/template11/gallery/photo-1529599087-bcf1dc4a7ae4-1920w.webp',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelSections`
--

LOCK TABLES `HotelSections` WRITE;
/*!40000 ALTER TABLE `HotelSections` DISABLE KEYS */;
INSERT INTO `HotelSections` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1),(5,5,5,1),(6,6,6,1),(7,7,7,1),(8,8,8,1),(9,9,9,1),(14,14,14,1),(15,15,15,1),(16,16,16,1),(18,18,18,1),(19,19,19,1),(32,1,31,1),(33,1,2,1),(34,1,8,1),(35,1,4,1),(36,2,1,1),(37,2,3,1),(38,6,1,1),(39,6,3,1),(40,6,36,1),(41,7,37,1),(42,7,1,1),(43,5,1,1),(67,14,38,1),(68,14,39,1),(69,14,40,1),(70,14,41,1),(71,14,42,1),(72,14,43,1),(73,14,44,1),(74,14,46,1),(75,15,1,1),(76,15,48,1),(77,15,49,1),(78,15,46,1),(79,15,47,1),(80,31,1,1),(81,31,50,1),(82,31,51,1),(83,31,52,1),(85,32,38,1),(86,32,43,1),(87,33,38,1),(88,34,38,1),(89,34,53,1),(90,35,38,1),(91,35,44,1),(92,35,54,1),(93,36,46,1),(94,37,20,1),(98,37,21,1),(99,37,22,1),(100,37,23,1),(102,37,24,1),(103,37,25,1),(104,37,26,1),(105,37,27,1),(106,37,28,1),(107,37,29,1),(108,55,71,1),(109,55,72,1),(110,55,73,1),(111,55,74,1),(112,55,75,1),(113,55,76,1);
/*!40000 ALTER TABLE `HotelSections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `HotelSectionsView`
--

DROP TABLE IF EXISTS `HotelSectionsView`;
/*!50001 DROP VIEW IF EXISTS `HotelSectionsView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HotelSectionsView` AS SELECT 
 1 AS `hotel_section_id`,
 1 AS `hotel_page_id`,
 1 AS `template_section_id`,
 1 AS `section_name`,
 1 AS `is_active`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `HotelTemplates` VALUES (1,1,2,'2025-10-14'),(2,2,11,'2025-10-14'),(3,3,4,'2025-10-14');
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
INSERT INTO `Hotels` VALUES (1,'ManyataWoods',1,4,'123 Manyata Road, Bangalore','9876543210','contact@manyatawoods.com','manyatawoods.com','14:00','12:00','09:00','22:00'),(2,'Oterra',2,9,'45 Oterra Street, Bangalore','9876501234','info@oterra.com','oterra.com','15:00','11:00','08:00','23:00'),(3,'Otium',3,10,'123 Goa expension street, near famous beach','9876543210','contact@otium.com','goa.otium.com','14:00','12:00','09:00','22:00');
/*!40000 ALTER TABLE `Hotels` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user1`@`%`*/ /*!50003 TRIGGER `after_update_hotel_template` AFTER UPDATE ON `Hotels` FOR EACH ROW BEGIN
  IF NEW.current_template_id <> OLD.current_template_id THEN
    INSERT INTO HotelPages (hotel_id, template_page_id)
    SELECT NEW.id, tp.id
    FROM TemplatePages AS tp
    WHERE tp.template_id = NEW.current_template_id
      AND NOT EXISTS (
        SELECT 1 FROM HotelPages AS hp
        WHERE hp.hotel_id = NEW.id
          AND hp.template_page_id = tp.id
      );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TemplatePages`
--

LOCK TABLES `TemplatePages` WRITE;
/*!40000 ALTER TABLE `TemplatePages` DISABLE KEYS */;
INSERT INTO `TemplatePages` VALUES (1,'Home',1),(2,'Rooms',1),(3,'Amenities',1),(5,'Restaurant',1),(6,'About Us',1),(7,'SPA',1),(8,'Blog',1),(9,'Contact Us',1),(35,'Home',11),(36,'Rooms',11),(37,'Specials',11),(38,'Activities',11),(39,'Gallery',11),(40,'About',11),(41,'Contact',11),(42,'Home',3),(43,'About Us',3),(44,'Contact Us',3),(45,'Things To Do',3),(46,'Terms & Conditions',3),(47,'Privacy & Cookies',3),(48,'Home',10),(49,'Rooms',10),(50,'Gallery',10),(51,'Neighborhood',10),(52,'About',10),(53,'Contact',10),(54,'Home',4),(55,'Home',9),(56,'Rooms',9),(57,'Explore',9),(58,'Restaurant',9),(59,'SPA',9),(60,'About',9),(61,'Contact',9),(62,'Home',10);
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
  UNIQUE KEY `template_id_2` (`template_id`,`section_name`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TemplateSections`
--

LOCK TABLES `TemplateSections` WRITE;
/*!40000 ALTER TABLE `TemplateSections` DISABLE KEYS */;
INSERT INTO `TemplateSections` VALUES (1,1,'Hero Section','image',0),(2,1,'Room Section','list',0),(3,1,'Amenities Section','text',0),(4,1,'Contact Section','text',0),(5,1,'Restaurant Section','list',1),(6,1,'About Section','text',1),(7,1,'SPA','list',1),(8,1,'Testimonials Section','list',1),(9,1,'Booking Policies','text',1),(10,1,'Offers Section','list',1),(11,1,'Dining Section','list',1),(12,1,'Activities Section','list',1),(13,1,'Gallery Section','image',1),(14,2,'Hero Section','image',0),(15,2,'Room Section','list',0),(16,2,'Amenities Section','text',0),(17,2,'Contact Section','text',0),(18,2,'About Section','text',1),(19,2,'Testimonials Section','list',1),(20,4,'Hero Section','image',0),(21,4,'Overview Section','image',0),(22,4,'Amenities Section','image',0),(23,4,'Restaurant Section','image',0),(24,4,'Activities Section','image',0),(25,4,'Meeting & Events Section','image',0),(26,4,'Sepcials section','image',0),(27,4,'Contact Section','image',0),(28,4,'Footer Section','image',0),(29,4,'Room Section','list',0),(31,1,'Overview Section',NULL,0),(36,1,'Advertisement','banner',0),(37,1,'Service Section',NULL,0),(38,11,'Hero section',NULL,0),(39,11,'Testimonial section',NULL,0),(40,11,'Overview section',NULL,0),(41,11,'Rooms section',NULL,0),(42,11,'Specials section',NULL,0),(43,11,'Activities section',NULL,0),(44,11,'Location section',NULL,0),(45,11,'Social follow section',NULL,0),(46,11,'CTA Section',NULL,0),(47,11,'Accommodation section',NULL,0),(48,11,'Amenities',NULL,0),(49,11,'Booking section',NULL,0),(50,11,'Offer Section',NULL,0),(51,11,'Promotional Block',NULL,0),(52,11,'Highlight Section',NULL,0),(53,11,'About Section',NULL,0),(54,11,'Showcase Section',NULL,0),(55,3,'Hero Section',NULL,0),(56,3,'About Section',NULL,0),(57,3,'Teams Seaction',NULL,0),(58,3,'Highlight Section',NULL,0),(60,10,'Hero section',NULL,0),(61,10,'About section',NULL,0),(62,10,'Offer section',NULL,0),(63,10,'Rooms section',NULL,0),(64,10,'Story section',NULL,0),(65,10,'Highlight section',NULL,0),(66,10,'Testimonial section',NULL,0),(67,10,'Social feed section',NULL,0),(68,10,'Promotional section',NULL,0),(71,9,'Hero section',NULL,0),(72,9,'Overview section',NULL,0),(73,9,'Highlight section',NULL,0),(74,9,'Restaurant section',NULL,0),(75,9,'Promotional section ',NULL,0),(76,9,'Offer section',NULL,0);
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
INSERT INTO `Templates` VALUES (1,'Luxury Template'),(2,'Business Template'),(3,'Sunset Villas'),(4,'Independence Hotel'),(5,'Luxury Template'),(6,'Luxury Template'),(7,'Beachside Hotel'),(8,'Gumtree'),(9,'Frank'),(10,'Nest'),(11,'Tumble wood');
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
-- Final view structure for view `HotelSectionsView`
--

/*!50001 DROP VIEW IF EXISTS `HotelSectionsView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelSectionsView` AS select `hs`.`id` AS `hotel_section_id`,`hs`.`hotel_page_id` AS `hotel_page_id`,`ts`.`id` AS `template_section_id`,`ts`.`section_name` AS `section_name`,`hs`.`is_active` AS `is_active` from (`HotelSections` `hs` join `TemplateSections` `ts` on((`ts`.`id` = `hs`.`template_section_id`))) */;
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

-- Dump completed on 2025-10-28 17:37:06
