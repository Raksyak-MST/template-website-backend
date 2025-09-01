-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 01, 2025 at 03:45 PM
-- Server version: 8.4.6
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Template`
--

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int NOT NULL,
  `template_section_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `order_index` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `template_section_id`, `hotel_id`, `title`, `description`, `order_index`) VALUES
(1, 3, 1, NULL, NULL, 0),
(2, 5, 1, 'Overview', 'Independence hotel is a luxurious resort nestled in the heart of the majestic Carpathian Mountains. Surrounded by stunning natural scenery, the hotel offers guests a unique and unforgettable experience in one of Europe\'s most beautiful destinations.', 0),
(3, 6, 1, 'The Art Of Boutique, Luxury', 'Where luxury meets intimacy in the heart of Paris, our boutique establishment stands as a testament to refined elegance and sophistication. We redefine the concept of opulence not only through our meticulously curated interiors but also with our unwavering attention to detail and commitment to providing personalized service that caters to each guest\'s unique desires. Every aspect of your stay is designed to evoke a sense of comfort and exclusivity, allowing you to experience the very best that Paris has to offer.', 0),
(4, 7, 3, 'L Luxury Hotel', 'Where Opulence Meets Exceptional Service: Your Exquisite Escape', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `template_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `domain`, `template_id`) VALUES
(1, 'Ottera', 'theoterragroup.com', 1),
(3, 'Oterra', 'theoterragroup.b.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `media_content`
--

CREATE TABLE `media_content` (
  `id` int NOT NULL,
  `template_section_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `url` varchar(500) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `media_type` enum('image','video','audio') DEFAULT 'image',
  `order_index` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `media_content`
--

INSERT INTO `media_content` (`id`, `template_section_id`, `hotel_id`, `url`, `alt_text`, `media_type`, `order_index`) VALUES
(1, 3, 1, '/hotel1/hero_image1.jpg', 'hero_image_house_at_hill', 'image', 0),
(2, 3, 1, '/hotel1/hero_image2.jpg', 'hero_image_cabin_mountain_view', 'image', 1),
(3, 3, 1, '/hotel1/hero_image4.jpg', 'hero_image_cooked_food', 'image', 2),
(4, 3, 1, '/hotel1/hero_image3.jpg', 'hero_image_mountain_hiking_tour', 'image', 3),
(5, 6, 3, '/hotel2/section2ambiens.jpeg', 'serving food', 'image', 0),
(6, 6, 3, '/hotel2/section2Dish.jpeg', 'dine in tables', 'image', 0),
(8, 7, 3, '/hotel2/Mansion.webp', NULL, 'image', 0);

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `description`) VALUES
(1, 'template1', 'facny grid hero section, single page template'),
(2, 'template2', 'Multi page template');

-- --------------------------------------------------------

--
-- Table structure for table `template_pages`
--

CREATE TABLE `template_pages` (
  `id` int NOT NULL,
  `template_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order_index` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `template_pages`
--

INSERT INTO `template_pages` (`id`, `template_id`, `name`, `slug`, `order_index`) VALUES
(1, 1, 'Home Page', 'home', 0),
(2, 1, 'About Page', 'about-us', 0),
(3, 2, 'Home', 'home', 0);

-- --------------------------------------------------------

--
-- Table structure for table `template_sections`
--

CREATE TABLE `template_sections` (
  `id` int NOT NULL,
  `template_page_id` int NOT NULL,
  `section` varchar(255) NOT NULL,
  `order_index` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `template_sections`
--

INSERT INTO `template_sections` (`id`, `template_page_id`, `section`, `order_index`) VALUES
(3, 1, 'Hero', 0),
(4, 1, 'About us', 1),
(5, 1, 'overview', 1),
(6, 3, 'about-us', 0),
(7, 3, 'hero', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_section_id` (`template_section_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain` (`domain`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `media_content`
--
ALTER TABLE `media_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_section_id` (`template_section_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_pages`
--
ALTER TABLE `template_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `template_sections`
--
ALTER TABLE `template_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_page_id` (`template_page_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media_content`
--
ALTER TABLE `media_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `template_pages`
--
ALTER TABLE `template_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `template_sections`
--
ALTER TABLE `template_sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`template_section_id`) REFERENCES `template_sections` (`id`),
  ADD CONSTRAINT `contents_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`);

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`);

--
-- Constraints for table `media_content`
--
ALTER TABLE `media_content`
  ADD CONSTRAINT `media_content_ibfk_1` FOREIGN KEY (`template_section_id`) REFERENCES `template_sections` (`id`),
  ADD CONSTRAINT `media_content_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`);

--
-- Constraints for table `template_pages`
--
ALTER TABLE `template_pages`
  ADD CONSTRAINT `template_pages_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`);

--
-- Constraints for table `template_sections`
--
ALTER TABLE `template_sections`
  ADD CONSTRAINT `template_sections_ibfk_1` FOREIGN KEY (`template_page_id`) REFERENCES `template_pages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
