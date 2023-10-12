-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: pndb
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

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
-- Table structure for table `tbl_business_type`
--

DROP TABLE IF EXISTS `tbl_business_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_business_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tooltip` varchar(255) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_business_type`
--

LOCK TABLES `tbl_business_type` WRITE;
/*!40000 ALTER TABLE `tbl_business_type` DISABLE KEYS */;
INSERT INTO `tbl_business_type` VALUES (1,'I’m the sole provider of services, working independently of another business.',NULL,'Example: I own the business and am the only provider of service(s) with no other employees providing the service(s).',0),(2,'I’m an independent contractor, contracting to perform services for another company.','','Example: I am renting a space (i.e. chair, room, etc.) and using the facilities of a company that also provides the service(s).',0),(3,'I’m a company with 2+ employees performing services.',NULL,'Example: I am the owner of the contracting entity with more than one employee performing the service(s).',0),(4,'I’m a third party representative involved in the sale of the goods or services being sold.',NULL,'Example: I represent a marketing company and am setting up a campaign for a business providing the services.',0);
/*!40000 ALTER TABLE `tbl_business_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_business_type_category`
--

DROP TABLE IF EXISTS `tbl_business_type_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_business_type_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_business_type_category`
--

LOCK TABLES `tbl_business_type_category` WRITE;
/*!40000 ALTER TABLE `tbl_business_type_category` DISABLE KEYS */;
INSERT INTO `tbl_business_type_category` VALUES (1,'Local Experiences (Restaurant\'s, Beauty, Leisure & Services)','Local Experiences (Restaurant\'s, Beauty, Leisure & Services)',0),(2,'Ticketed Events','Ticketed Events',0),(3,'Hotels & Travel','Hotels & Travel',0);
/*!40000 ALTER TABLE `tbl_business_type_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_business_type_subcategory`
--

DROP TABLE IF EXISTS `tbl_business_type_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_business_type_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_business_type_subcategory`
--

LOCK TABLES `tbl_business_type_subcategory` WRITE;
/*!40000 ALTER TABLE `tbl_business_type_subcategory` DISABLE KEYS */;
INSERT INTO `tbl_business_type_subcategory` VALUES (1,2,'Ticket Master',NULL,0),(2,2,'AXS',NULL,0),(3,2,'SeatGeek',NULL,0),(4,2,'Outbox',NULL,0),(5,2,'Tickets.com',NULL,0),(6,2,'Telecharge',NULL,0),(7,2,'Frontgate',NULL,0),(8,2,'Universe',NULL,0),(9,2,'Ticketweb',NULL,0),(10,2,'See Tickets',NULL,0),(11,2,'eTix',NULL,0),(12,2,'EventBrite',NULL,0),(13,2,'Paciolan',NULL,0),(14,2,'Others',NULL,0);
/*!40000 ALTER TABLE `tbl_business_type_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Health, beauty & wellness','Spas, Salons, Gyms, Doctors, Alternative medicine, etc.',0),(2,'Things to do','Events, Activities, Classes, etc.',0),(3,'Home & auto','Automotive services, Home services, Pet care, etc.',0),(4,'Restaurant','Dine-in, Takeout, Delivery, etc.',0),(5,'Retail','Storefronts, Online shopping, Online services, etc.',0);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_discount_type`
--

DROP TABLE IF EXISTS `tbl_discount_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_discount_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `formula` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_discount_type`
--

LOCK TABLES `tbl_discount_type` WRITE;
/*!40000 ALTER TABLE `tbl_discount_type` DISABLE KEYS */;
INSERT INTO `tbl_discount_type` VALUES (1,'none',NULL),(2,'Discount Percentage','original price - discount %'),(3,'Discount Price','discount price');
/*!40000 ALTER TABLE `tbl_discount_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_merchant_info`
--

DROP TABLE IF EXISTS `tbl_merchant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchant_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) DEFAULT NULL,
  `business_type_category_id` int(11) DEFAULT NULL,
  `business_type_subcategory_id` int(11) DEFAULT NULL,
  `business_address` text DEFAULT NULL,
  `street_address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `highlights` text DEFAULT NULL COMMENT 'What makes your campaign stand out?\nBriefly describe the highlights of your business and campaign in 1–2 sentences.',
  `description` text DEFAULT NULL COMMENT 'What''s included in each option?\nList out what''s included in each of this campaign''s options to give customers a better understanding of what to expect.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchant_info`
--

LOCK TABLES `tbl_merchant_info` WRITE;
/*!40000 ALTER TABLE `tbl_merchant_info` DISABLE KEYS */;
INSERT INTO `tbl_merchant_info` VALUES (5,'Test',1,NULL,'Test',NULL,NULL,NULL,NULL,NULL,'99999999',NULL,NULL);
/*!40000 ALTER TABLE `tbl_merchant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_merchant_payment`
--

DROP TABLE IF EXISTS `tbl_merchant_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchant_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) DEFAULT NULL,
  `routing_no` varchar(255) DEFAULT NULL,
  `bank_account_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchant_payment`
--

LOCK TABLES `tbl_merchant_payment` WRITE;
/*!40000 ALTER TABLE `tbl_merchant_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_merchant_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_merchant_photos`
--

DROP TABLE IF EXISTS `tbl_merchant_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchant_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) DEFAULT NULL,
  `img` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchant_photos`
--

LOCK TABLES `tbl_merchant_photos` WRITE;
/*!40000 ALTER TABLE `tbl_merchant_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_merchant_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_merchant_services`
--

DROP TABLE IF EXISTS `tbl_merchant_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchant_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchant_services`
--

LOCK TABLES `tbl_merchant_services` WRITE;
/*!40000 ALTER TABLE `tbl_merchant_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_merchant_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_merchant_tax_info`
--

DROP TABLE IF EXISTS `tbl_merchant_tax_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchant_tax_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_type_id` int(11) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `ein` varchar(100) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `ssn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchant_tax_info`
--

LOCK TABLES `tbl_merchant_tax_info` WRITE;
/*!40000 ALTER TABLE `tbl_merchant_tax_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_merchant_tax_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `discount_type_id` int(11) DEFAULT 1,
  `discount_price` decimal(18,2) DEFAULT 0.00,
  `discount_percent` int(11) DEFAULT 0,
  `deleted_flag` tinyint(4) DEFAULT 0,
  `date_created` datetime DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,1,'Product 1','Immerse Yourself in the Magic of Cambodia with a Luxurious Eight Day/Seven Night Escape at Two of the World’s Finest Hotels!',1000.00,1,NULL,NULL,0,NULL,NULL),(2,1,'Product 2','Immerse Yourself in the Magic of Cambodia with a Luxurious Eight Day/Seven Night Escape at Two of the World’s Finest Hotels!',1500.00,2,NULL,50,0,NULL,NULL),(3,1,'Product 3','Immerse Yourself in the Magic of Cambodia with a Luxurious Eight Day/Seven Night Escape at Two of the World’s Finest Hotels!',2000.00,2,NULL,50,0,NULL,NULL),(4,1,'Product 4','Immerse Yourself in the Magic of Cambodia with a Luxurious Eight Day/Seven Night Escape at Two of the World’s Finest Hotels!',2500.00,3,2000.00,NULL,0,NULL,NULL),(5,1,'Product 5','Immerse Yourself in the Magic of Cambodia with a Luxurious Eight Day/Seven Night Escape at Two of the World’s Finest Hotels!',3000.00,3,1500.00,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_comments`
--

DROP TABLE IF EXISTS `tbl_product_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `is_edited` tinyint(4) DEFAULT 0,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_comments`
--

LOCK TABLES `tbl_product_comments` WRITE;
/*!40000 ALTER TABLE `tbl_product_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_product_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_images`
--

DROP TABLE IF EXISTS `tbl_product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_images`
--

LOCK TABLES `tbl_product_images` WRITE;
/*!40000 ALTER TABLE `tbl_product_images` DISABLE KEYS */;
INSERT INTO `tbl_product_images` VALUES (1,1,'c870x524.webp',0),(2,2,'700x400.png',0),(3,3,'700x400.png',0),(4,4,'700x400.png',0),(5,5,'700x400.png',0),(6,1,'c870x5242.webp',0),(7,1,'700x400.png',0);
/*!40000 ALTER TABLE `tbl_product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_likes`
--

DROP TABLE IF EXISTS `tbl_product_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_likes`
--

LOCK TABLES `tbl_product_likes` WRITE;
/*!40000 ALTER TABLE `tbl_product_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_product_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_stock_history`
--

DROP TABLE IF EXISTS `tbl_product_stock_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product_stock_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_stock_history`
--

LOCK TABLES `tbl_product_stock_history` WRITE;
/*!40000 ALTER TABLE `tbl_product_stock_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_product_stock_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_service`
--

DROP TABLE IF EXISTS `tbl_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_service`
--

LOCK TABLES `tbl_service` WRITE;
/*!40000 ALTER TABLE `tbl_service` DISABLE KEYS */;
INSERT INTO `tbl_service` VALUES (8,NULL,16,'Eye Exam',NULL,0),(9,NULL,16,'LASIK',NULL,0),(10,NULL,16,'Laser Eye Surgery - Non-Branded',NULL,0),(11,NULL,16,'Prescription - Glasses/Contacts',NULL,0),(12,NULL,16,'Ophthalmologist',NULL,0),(13,NULL,16,'Optometrist',NULL,0),(14,NULL,6,'Salon - Hair Color / Highlights',NULL,0),(15,NULL,6,'Salon - Womens Haircut',NULL,0),(16,NULL,6,'Hair Styling',NULL,0),(17,NULL,6,'Salon - Hair Color / Highlights - Roots',NULL,0),(18,NULL,6,'Salon - Keratin Treatment',NULL,0),(19,NULL,6,'Salon - Mens Haircut / Barber',NULL,0),(20,NULL,6,'Salon - Blow Dry / Blow Out',NULL,0),(21,NULL,6,'Hair Color / Highlights - Ombre',NULL,0),(22,NULL,6,'Salon - Brazilian Straightening',NULL,0),(23,NULL,6,'Salon - Hair Conditioning',NULL,0),(24,NULL,6,'Salon - Beauty Package with Choice of Service',NULL,0),(25,NULL,6,'Salon - Straightening Treatment',NULL,0),(26,NULL,6,'Mens Shave',NULL,0),(27,NULL,6,'Salon - Updo',NULL,0),(28,NULL,6,'Salon - Hair Extensions',NULL,0),(29,NULL,6,'Salon - Wig Styling',NULL,0),(30,NULL,6,'Salon - Childrens Haircut',NULL,0),(31,NULL,6,'Salon - Scalp Care',NULL,0),(32,NULL,6,'Botox Hair Treatment',NULL,0),(33,NULL,6,'Gift Card - Hair Salon',NULL,0),(34,NULL,6,'Salon - Perm',NULL,0),(35,NULL,6,'Salon - Japanese Straightening',NULL,0),(36,NULL,6,'Salon - Hair Braiding',NULL,0),(37,NULL,6,'Salon - Hair Locking/Dreadlocks',NULL,0),(38,NULL,6,'Salon - Natural Hair Care',NULL,0),(39,NULL,14,'Electrical Muscle Stimulation',NULL,0),(40,NULL,14,'Chiropractic Services',NULL,0),(41,NULL,14,'Acupuncture',NULL,0),(42,NULL,14,'Cryotherapy',NULL,0),(43,NULL,14,'Cupping',NULL,0),(44,NULL,14,'Hypnosis',NULL,0),(45,NULL,14,'Detox / Cleanse',NULL,0),(46,NULL,14,'Aromatherapy',NULL,0),(47,NULL,14,'Nutritionist',NULL,0),(48,NULL,14,'Colonic / Hydro Colon Therapy',NULL,0),(49,NULL,14,'Pressotherapy',NULL,0),(50,NULL,14,'Doula / Midwife',NULL,0),(51,NULL,14,'Spinal Decompression',NULL,0),(52,NULL,14,'Naturopathy',NULL,0),(53,NULL,14,'Ear Candling',NULL,0),(54,NULL,14,'Craniosacral Therapy',NULL,0),(55,NULL,14,'Traditional Chinese Medicine',NULL,0),(56,NULL,14,'Juice Cleanse',NULL,0),(57,NULL,5,'Eyelash Extensions',NULL,0),(58,NULL,5,'Eyelash Tinting',NULL,0),(59,NULL,5,'Eyelash Perm',NULL,0),(60,NULL,5,'Makeup Application',NULL,0),(61,NULL,5,'Eyebrow Tinting',NULL,0),(62,NULL,5,'Eyebrow Shaping',NULL,0),(63,NULL,5,'Eyebrow Extensions',NULL,0),(64,NULL,5,'Eyebrow Embroidery',NULL,0),(65,NULL,3,'Full Body Massage',NULL,0),(66,NULL,3,'Swedish Massage',NULL,0),(67,NULL,3,'Deep Tissue Massage',NULL,0),(68,NULL,3,'Therapeutic Massage',NULL,0),(69,NULL,3,'Hot Stone Massage',NULL,0),(70,NULL,3,'Couples Massage',NULL,0),(71,NULL,3,'Massage - Chosen by Customer',NULL,0),(72,NULL,3,'Thai Massage',NULL,0),(73,NULL,3,'Foot Reflexology Massage',NULL,0),(74,NULL,3,'Lymphatic Drainage Massage',NULL,0),(75,NULL,3,'Aroma Oil Massage',NULL,0),(76,NULL,3,'Classic Massage',NULL,0),(77,NULL,3,'Prenatal Massage',NULL,0),(78,NULL,3,'Sports Massage',NULL,0),(79,NULL,3,'Chair Massage',NULL,0),(80,NULL,3,'Ayurvedic Massage',NULL,0),(81,NULL,3,'Oriental Massage',NULL,0),(82,NULL,1,'Microblading',NULL,0),(83,NULL,1,'Permanent Makeup',NULL,0),(84,NULL,1,'Micro-Needling',NULL,0),(85,NULL,1,'Lipo - Non-Invasive Laser-iLipo',NULL,0),(86,NULL,1,'Radio Frequency Skin Tightening',NULL,0),(87,NULL,1,'Laser Hair Removal',NULL,0),(88,NULL,1,'Non-Surgical Butt Lift',NULL,0),(89,NULL,1,'Facelift - Non-Surgical',NULL,0),(90,NULL,1,'IPL-Intense Pulse Light Therapy',NULL,0),(91,NULL,1,'IPL Hair Removal',NULL,0),(92,NULL,1,'Lipo - Invasive Laser-Smart Lipo',NULL,0),(93,NULL,1,'Tattooing',NULL,0),(94,NULL,1,'Electrolysis',NULL,0),(95,NULL,1,'Laser Skin Resurfacing - Branded',NULL,0),(96,NULL,1,'Laser Skin Resurfacing',NULL,0),(97,NULL,1,'Laser Skin Resurfacing-Unbranded',NULL,0),(98,NULL,1,'Mesotherapy - Needleless',NULL,0),(99,NULL,1,'Mesotherapy',NULL,0),(100,NULL,1,'Henna Tattooing',NULL,0),(101,NULL,1,'Eyelash Treatment - Latisse',NULL,0),(102,NULL,1,'Spider Vein Removal',NULL,0),(103,NULL,1,'Soprano Laser Hair Removal',NULL,0),(104,NULL,1,'Piercing',NULL,0),(105,NULL,1,'Spider Vein Removal - Injection',NULL,0),(106,NULL,1,'Temporary Tattooing',NULL,0),(107,NULL,1,'Lipo - Invasive Laser-Trio Lipo',NULL,0),(108,NULL,1,'Spider Vein Removal - IPL',NULL,0),(109,NULL,1,'Lipo - Invasive Laser - Aqua',NULL,0),(110,NULL,1,'Lipo - Invasive Laser-Vaser',NULL,0),(111,NULL,1,'Epilfree Hair Removal',NULL,0),(112,NULL,13,'Teeth Whitening',NULL,0),(113,NULL,13,'Teeth Whitening - In-Office - Non-Branded',NULL,0),(114,NULL,13,'Dental Checkup',NULL,0),(115,NULL,13,'Teeth Whitening - In-Office - Branded (Zoom, ',NULL,0),(116,NULL,13,'Teeth Cleaning',NULL,0),(117,NULL,13,'Dental Implant / Corona / Veneer',NULL,0),(118,NULL,13,'Invisalign',NULL,0),(119,NULL,13,'Dental Filling',NULL,0),(120,NULL,13,'Braces - Invisible - Non-Branded',NULL,0),(121,NULL,13,'Denture Services',NULL,0),(122,NULL,13,'Orthodontist',NULL,0),(123,NULL,13,'Braces - Metal / Ceramic',NULL,0),(124,NULL,13,'Root Canal Treatment',NULL,0),(125,NULL,13,'Airflow (Dentistry)',NULL,0),(126,NULL,7,'Facial',NULL,0),(127,NULL,7,'Microdermabrasion',NULL,0),(128,NULL,7,'HydraFacial',NULL,0),(129,NULL,7,'Facial - Chosen by Customer',NULL,0),(130,NULL,7,'Anti-Aging Facial',NULL,0),(131,NULL,7,'Exfoliating Facial',NULL,0),(132,NULL,7,'Chemical Peel',NULL,0),(133,NULL,7,'Back Facial',NULL,0),(134,NULL,7,'Moisturizing Facial',NULL,0),(135,NULL,7,'Mens Facial',NULL,0),(136,NULL,7,'IPL Photo Facial',NULL,0),(137,NULL,7,'Ultherapy / Ultrasonic Facial',NULL,0),(138,NULL,4,'Nail Salon - Mani-Pedi',NULL,0),(139,NULL,4,'Nail Salon - Pedicure',NULL,0),(140,NULL,4,'Nail Salon - Manicure',NULL,0),(141,NULL,4,'Nail Spa/Salon - Nail Design',NULL,0),(142,NULL,4,'Salon-Shellac/No-Chip Mani-Pedi',NULL,0),(143,NULL,4,'Fish Pedicure',NULL,0),(144,NULL,4,'Nail Salon Gift Card',NULL,0),(145,NULL,10,'Cavitation',NULL,0),(146,NULL,10,'Ultrasonic Fat Reduction',NULL,0),(147,NULL,10,'Weight Loss Program / Center',NULL,0),(148,NULL,10,'Fat Reduction - Non-Branded',NULL,0),(149,NULL,10,'Sauna Weight Loss Treatment',NULL,0),(150,NULL,10,'Infrared Therapy',NULL,0),(151,NULL,10,'Zerona or Velashape',NULL,0),(152,NULL,10,'Endermologie',NULL,0),(153,NULL,10,'Hypoxi Vacuum Training',NULL,0),(154,NULL,11,'Lip Enhancement',NULL,0),(155,NULL,11,'Breast Lift',NULL,0),(156,NULL,11,'Facelift - Surgical',NULL,0),(157,NULL,11,'Hair Restoration - Non-Surgical',NULL,0),(158,NULL,11,'Tattoo Removal',NULL,0),(159,NULL,11,'Breast Reduction',NULL,0),(160,NULL,11,'Breast Reduction - Non-Surgical',NULL,0),(161,NULL,11,'Gluteoplasty / Butt Lift',NULL,0),(162,NULL,11,'Facelift - Thread Lift',NULL,0),(163,NULL,11,'Mole / Growth Removal',NULL,0),(164,NULL,11,'Breast Lift - Non-Surgical',NULL,0),(165,NULL,11,'Non-Surgical Brow/Forehead Lift',NULL,0),(166,NULL,11,'Non-Surgical Breast Enhancement',NULL,0),(167,NULL,11,'Brow / Forehead Lift',NULL,0),(168,NULL,11,'Hand Rejuvenation',NULL,0),(169,NULL,11,'Tummy Tuck',NULL,0),(170,NULL,11,'Laser Hair Restoration',NULL,0),(171,NULL,11,'Liposuction - Surgical',NULL,0),(172,NULL,11,'Hair Restoration - Implants',NULL,0),(173,NULL,11,'Eyebrow Transplant',NULL,0),(174,NULL,11,'Varicose Vein Removal',NULL,0),(175,NULL,11,'Surgery - Eyelid',NULL,0),(176,NULL,11,'Cheek Augmentation',NULL,0),(177,NULL,11,'Gastric Band',NULL,0),(178,NULL,11,'Breast Implants',NULL,0),(179,NULL,11,'Rhinoplasty',NULL,0),(180,NULL,11,'Surgery - Chin',NULL,0),(181,NULL,11,'Surgery - Ear Pinning',NULL,0),(182,NULL,11,'Sweat Gland Removal',NULL,0),(183,NULL,11,'Thermolifting',NULL,0),(184,NULL,12,'Hangover IV',NULL,0),(185,NULL,12,'Light Therapy',NULL,0),(186,NULL,12,'Medical Check-Up / Physical',NULL,0),(187,NULL,12,'Pain Theraphy',NULL,0),(188,NULL,12,'Medical Marijuana Treatment',NULL,0),(189,NULL,12,'Physical Therapy',NULL,0),(190,NULL,12,'Body Scanning',NULL,0),(191,NULL,12,'Medical Foot Care',NULL,0),(192,NULL,12,'Blood Testing',NULL,0),(193,NULL,12,'Ultrasound - 3D / 4D',NULL,0),(194,NULL,12,'Physiotherapist',NULL,0),(195,NULL,12,'Ultrasound',NULL,0),(196,NULL,12,'Toe Fungus Treatment',NULL,0),(197,NULL,12,'Allergy/Food Intolerance Testing',NULL,0),(198,NULL,12,'Alcohol / Drug Abuse Treatment',NULL,0),(199,NULL,12,'Dermatologist',NULL,0),(200,NULL,12,'Urine Testing',NULL,0),(201,NULL,12,'Occupational Therapy',NULL,0),(202,NULL,12,'Dexa Scan',NULL,0),(203,NULL,12,'Hearing Aid',NULL,0),(204,NULL,12,'Lice Removal',NULL,0),(205,NULL,12,'MRI Scan',NULL,0),(206,NULL,12,'Skin Cancer Treatment',NULL,0),(207,NULL,12,'Speech Therapy',NULL,0),(208,NULL,9,'Injection - Botox',NULL,0),(209,NULL,9,'Injection - B12',NULL,0),(210,NULL,9,'Injection - Dermal Filler',NULL,0),(211,NULL,9,'Injection - Bellafill',NULL,0),(212,NULL,9,'Injection-Other-Dysport, Xeomin',NULL,0),(213,NULL,9,'Injection - Vitamin C',NULL,0),(214,NULL,9,'Injection - Hyaluronic Acid',NULL,0),(215,NULL,9,'Injection - Filler and Freezer',NULL,0),(216,NULL,9,'Injection - Organic Filler',NULL,0),(217,NULL,9,'Injection - Restylane',NULL,0),(218,NULL,15,'Yoga',NULL,0),(219,NULL,15,'Fitness Studio',NULL,0),(220,NULL,15,'Martial Arts Training',NULL,0),(221,NULL,15,'Gym Membership',NULL,0),(222,NULL,15,'Fitness Dance Classes',NULL,0),(223,NULL,15,'Fitness Conditioning',NULL,0),(224,NULL,15,'Boot Camp Classes',NULL,0),(225,NULL,15,'Boxing / Kickboxing',NULL,0),(226,NULL,15,'Martial Arts Training for Kids',NULL,0),(227,NULL,15,'Crossfit',NULL,0),(228,NULL,15,'Boxing / Kickboxing - Training',NULL,0),(229,NULL,15,'Hot Yoga',NULL,0),(230,NULL,15,'Gym',NULL,0),(231,NULL,15,'Power Plate Whole Body Vibration',NULL,0),(232,NULL,15,'Kids Fitness Classes',NULL,0),(233,NULL,15,'Pilates',NULL,0),(234,NULL,15,'Zumba',NULL,0),(235,NULL,15,'Indoor Cycling',NULL,0),(236,NULL,15,'Aerial Fitness',NULL,0),(237,NULL,15,'Curcuit Training',NULL,0),(238,NULL,15,'Gymnastics',NULL,0),(239,NULL,15,'Sexy Fitness Class',NULL,0),(240,NULL,15,'Barre Class',NULL,0),(241,NULL,15,'Movement Classes',NULL,0),(242,NULL,15,'Aerial Yoga',NULL,0),(243,NULL,15,'Prenatal Yoga',NULL,0),(244,NULL,15,'Spinning',NULL,0),(245,NULL,15,'Aerobics',NULL,0),(246,NULL,8,'Waxing',NULL,0),(247,NULL,8,'Brazilian / Bikini Waxing',NULL,0),(248,NULL,8,'Spray Tanning',NULL,0),(249,NULL,8,'Eyebrow Waxing',NULL,0),(250,NULL,8,'Sugaring',NULL,0),(251,NULL,8,'Eyebrow Threading',NULL,0),(252,NULL,8,'Bed / Booth Tanning',NULL,0),(253,NULL,8,'Threading',NULL,0),(254,NULL,2,'Pampering Package',NULL,0),(255,NULL,2,'Spa / Salon Beauty Treatments',NULL,0),(256,NULL,2,'Reiki',NULL,0),(257,NULL,2,'Body Wrap',NULL,0),(258,NULL,2,'Spa - Sauna - Infrared',NULL,0),(259,NULL,2,'Body Scrub',NULL,0),(260,NULL,2,'Bath - Steam',NULL,0),(261,NULL,2,'Meditation Session',NULL,0),(262,NULL,2,'In Spa Gym / Fitness Center',NULL,0),(263,NULL,2,'Reflexology',NULL,0),(264,NULL,2,'Acne Treatment',NULL,0),(265,NULL,2,'Gift Card - Spa',NULL,0),(266,NULL,2,'Spa - Day Pass',NULL,0),(267,NULL,2,'Spa - Sauna',NULL,0),(268,NULL,2,'Spa - Salt Cave',NULL,0),(269,NULL,2,'Hyperbaric Chamber',NULL,0),(270,NULL,2,'Flotation / Isolation Tank',NULL,0),(271,NULL,2,'Dark Circle/Under Eye Treatment',NULL,0),(272,NULL,2,'Oxygen Bar',NULL,0),(273,NULL,2,'Mud Wrap',NULL,0),(274,NULL,2,'Spa - For Children',NULL,0),(275,NULL,2,'Hotel Spa',NULL,0),(276,NULL,2,'Bath House / Hammam',NULL,0),(277,NULL,31,'Zoo / Animal Park',NULL,0),(278,NULL,31,'Petting Zoo',NULL,0),(279,NULL,31,'Aquarium Visit',NULL,0),(280,NULL,31,'Arboretum / Botanical Garden',NULL,0),(281,NULL,26,'Museum',NULL,0),(282,NULL,26,'Convention',NULL,0),(283,NULL,26,'Art Gallery',NULL,0),(284,NULL,26,'Castle',NULL,0),(285,NULL,26,'Country Estate / Manor',NULL,0),(286,NULL,26,'Landmark / Tower',NULL,0),(287,NULL,26,'Planetarium',NULL,0),(288,NULL,29,'Apple Picking',NULL,0),(289,NULL,29,'Summer Camp',NULL,0),(290,NULL,29,'Educational Camp',NULL,0),(291,NULL,29,'Boat Party',NULL,0),(292,NULL,29,'Sports Camp',NULL,0),(293,NULL,29,'Art Camp',NULL,0),(294,NULL,29,'Berry Picking',NULL,0),(295,NULL,29,'Space Camp',NULL,0),(296,NULL,29,'Beach Party',NULL,0),(297,NULL,29,'Day Camp',NULL,0),(298,NULL,29,'Pool Party',NULL,0),(299,NULL,29,'Weight Loss Camp',NULL,0),(300,NULL,29,'Hayride',NULL,0),(301,NULL,29,'Bouldering',NULL,0),(302,NULL,29,'Campground',NULL,0),(303,NULL,29,'Pumpkin Picking',NULL,0),(304,NULL,29,'Corn Maze',NULL,0),(305,NULL,29,'Survival Camp',NULL,0),(306,NULL,29,'Canyoning',NULL,0),(307,NULL,29,'Cinema - Drive-In',NULL,0),(308,NULL,29,'Cinema - Open Air',NULL,0),(309,NULL,29,'Flower Picking',NULL,0),(310,NULL,29,'Historic Train Ride',NULL,0),(311,NULL,29,'Horse Drawn Carriage Ride',NULL,0),(312,NULL,29,'Horse Drawn Sleigh Ride',NULL,0),(313,NULL,29,'Ski Lift / Gondola',NULL,0),(314,NULL,29,'Submarine Ride',NULL,0),(315,NULL,29,'Zorbing / Orbing',NULL,0),(316,NULL,25,'Boat Tour',NULL,0),(317,NULL,25,'Guided Tour',NULL,0),(318,NULL,25,'Yacht Rental',NULL,0),(319,NULL,25,'Walking Tour',NULL,0),(320,NULL,25,'City Tour',NULL,0),(321,NULL,25,'Party Bus Tour',NULL,0),(322,NULL,25,'Bus Tour',NULL,0),(323,NULL,25,'Airplane Experience',NULL,0),(324,NULL,25,'Wine / Vineyard Tour',NULL,0),(325,NULL,25,'Flying Tour',NULL,0),(326,NULL,25,'Helicopter Ride',NULL,0),(327,NULL,25,'Dinner Cruise',NULL,0),(328,NULL,25,'Haunted House',NULL,0),(329,NULL,25,'Photography Tour',NULL,0),(330,NULL,25,'Haunted Tour',NULL,0),(331,NULL,25,'Ghost Hunting Tour',NULL,0),(332,NULL,25,'Bike Tour',NULL,0),(333,NULL,25,'Brewery Tour',NULL,0),(334,NULL,25,'Culinary Tour',NULL,0),(335,NULL,25,'Farm Tour',NULL,0),(336,NULL,25,'Distillery Tour',NULL,0),(337,NULL,25,'Scavenger Hunt',NULL,0),(338,NULL,25,'Stunt Airplane Experience',NULL,0),(339,NULL,25,'Segway Tour',NULL,0),(340,NULL,25,'Hot Air Balloon Ride',NULL,0),(341,NULL,25,'Whale / Wildlife Watching',NULL,0),(342,NULL,25,'Restaurant Tour',NULL,0),(343,NULL,25,'Equestrian Experience',NULL,0),(344,NULL,25,'Gondola Ride',NULL,0),(345,NULL,25,'Llama Trekking',NULL,0),(346,NULL,25,'Pedal Bus',NULL,0),(347,NULL,25,'Architecture Tour',NULL,0),(348,NULL,25,'Rafting Tour',NULL,0),(349,NULL,18,'Dance Class',NULL,0),(350,NULL,18,'Business Consultant',NULL,0),(351,NULL,18,'Home Organization',NULL,0),(352,NULL,18,'Musical Instrument Course',NULL,0),(353,NULL,18,'Beauty School Classes',NULL,0),(354,NULL,18,'Salsa Dancing Class',NULL,0),(355,NULL,18,'Kids Dance Classes',NULL,0),(356,NULL,18,'Notary Services',NULL,0),(357,NULL,18,'Makeup Course',NULL,0),(358,NULL,18,'Self Defense Course',NULL,0),(359,NULL,18,'Glassblowing/Stained Glass Class',NULL,0),(360,NULL,18,'Painting Lesson',NULL,0),(361,NULL,18,'Event Planner',NULL,0),(362,NULL,18,'Handcraft Class',NULL,0),(363,NULL,18,'Kids Music Classes',NULL,0),(364,NULL,18,'Resume Writing',NULL,0),(365,NULL,18,'Interior Decorator / Designer',NULL,0),(366,NULL,18,'Photography Class',NULL,0),(367,NULL,18,'Acting & Improv Class',NULL,0),(368,NULL,18,'Singing / Voice Lesson',NULL,0),(369,NULL,18,'Golf - Training',NULL,0),(370,NULL,18,'Horse Back Riding - Training',NULL,0),(371,NULL,18,'Personal Chef',NULL,0),(372,NULL,18,'Language Course - Spanish',NULL,0),(373,NULL,18,'Basketball - Training',NULL,0),(374,NULL,18,'Personal Stylist',NULL,0),(375,NULL,18,'Pottery Lesson',NULL,0),(376,NULL,18,'Sports Training Camp',NULL,0),(377,NULL,18,'Massage Course',NULL,0),(378,NULL,18,'Surfing Lessons',NULL,0),(379,NULL,18,'Soap Making Class',NULL,0),(380,NULL,18,'Swimming Lessons',NULL,0),(381,NULL,18,'Pottery Painting Course',NULL,0),(382,NULL,18,'Drawing Class',NULL,0),(383,NULL,18,'Personal Shopper',NULL,0),(384,NULL,18,'Language Course - English',NULL,0),(385,NULL,18,'Soccer / Football Training',NULL,0),(386,NULL,18,'Football - American - Training',NULL,0),(387,NULL,18,'Knitting & Sewing Class',NULL,0),(388,NULL,18,'Writing Class',NULL,0),(389,NULL,18,'Fencing - Training',NULL,0),(390,NULL,18,'Investigation Services',NULL,0),(391,NULL,18,'Womens Self Defense Course',NULL,0),(392,NULL,18,'Snore Therapy',NULL,0),(393,NULL,18,'DJ / AV Course',NULL,0),(394,NULL,18,'Jewelry Making Class',NULL,0),(395,NULL,18,'Baseball - Training',NULL,0),(396,NULL,18,'Language Course - Italian',NULL,0),(397,NULL,18,'Tennis Lessons',NULL,0),(398,NULL,18,'Energy Efficiency Consultant',NULL,0),(399,NULL,18,'Feng Shui Consultant',NULL,0),(400,NULL,18,'Paddleboarding - Training',NULL,0),(401,NULL,18,'Animation Course',NULL,0),(402,NULL,18,'Archery - Training',NULL,0),(403,NULL,18,'TESOL (Language Certification)',NULL,0),(404,NULL,18,'Cheerleading - Training',NULL,0),(405,NULL,18,'Circus Arts Training',NULL,0),(406,NULL,18,'Diving Lesson',NULL,0),(407,NULL,18,'Falconry - Training',NULL,0),(408,NULL,18,'Film Class',NULL,0),(409,NULL,18,'Food Sculpting Class',NULL,0),(410,NULL,18,'Hatmaking Course',NULL,0),(411,NULL,18,'Hockey - Training',NULL,0),(412,NULL,18,'Ice Sculpting Class',NULL,0),(413,NULL,18,'Immigration Services',NULL,0),(414,NULL,18,'Kids Comedy Classes',NULL,0),(415,NULL,18,'Language Course',NULL,0),(416,NULL,18,'Language Course - Arabic',NULL,0),(417,NULL,18,'Language Course - French',NULL,0),(418,NULL,18,'Language Course - German',NULL,0),(419,NULL,18,'Language Course - Hindi',NULL,0),(420,NULL,18,'Language Course - Japanese',NULL,0),(421,NULL,18,'Language Course - Korean',NULL,0),(422,NULL,18,'Language Course - Mandarin',NULL,0),(423,NULL,18,'Running - Training',NULL,0),(424,NULL,18,'Ice Skating - Lessons',NULL,0),(425,NULL,18,'Inline / Roller Skating Lessons',NULL,0),(426,NULL,18,'Skiing / Snowboarding Lessons',NULL,0),(427,NULL,18,'Wine / Beer Knowledge Course',NULL,0),(428,NULL,20,'Food Festival',NULL,0),(429,NULL,20,'Art Festival',NULL,0),(430,NULL,20,'Wine Festival',NULL,0),(431,NULL,20,'Beer Festival',NULL,0),(432,NULL,20,'Liquor Festival',NULL,0),(433,NULL,20,'Fireworks Display',NULL,0),(434,NULL,20,'Carnival',NULL,0),(435,NULL,20,'County / State Fairs',NULL,0),(436,NULL,30,'Personal trainers',NULL,0),(437,NULL,24,'Wine Tasting / Flight',NULL,0),(438,NULL,24,'Beer Tasting / Flights',NULL,0),(439,NULL,24,'Hard Alcohol Tasting / Flight',NULL,0),(440,NULL,21,'Arcade',NULL,0),(441,NULL,21,'Escape Room',NULL,0),(442,NULL,21,'Indoor Play Area',NULL,0),(443,NULL,21,'Laser Quest / Tag',NULL,0),(444,NULL,21,'Bowling',NULL,0),(445,NULL,21,'Trampoline Park',NULL,0),(446,NULL,21,'Go-Kart Rides',NULL,0),(447,NULL,21,'Painting Party',NULL,0),(448,NULL,21,'Childrens Party / Event',NULL,0),(449,NULL,21,'Spa Party',NULL,0),(450,NULL,21,'Party Hall',NULL,0),(451,NULL,21,'Cinema / Movie Theater',NULL,0),(452,NULL,21,'Tea Party',NULL,0),(453,NULL,21,'Climbing - Indoor',NULL,0),(454,NULL,21,'Board Game Session',NULL,0),(455,NULL,21,'Gem Mining',NULL,0),(456,NULL,21,'Bingo',NULL,0),(457,NULL,21,'Cinema - Dine-In',NULL,0),(458,NULL,21,'Slot Car Racing',NULL,0),(459,NULL,21,'Wind Tunnel / Indoor Skydiving',NULL,0),(460,NULL,23,'Psychic/Astrology/Fortune Teller',NULL,0),(461,NULL,23,'Tarot Card Reading',NULL,0),(462,NULL,23,'Life Coach',NULL,0),(463,NULL,19,'Business Training Course',NULL,0),(464,NULL,19,'Firearm / Weapon Safety Training',NULL,0),(465,NULL,19,'Academic Tutor',NULL,0),(466,NULL,19,'CPR & First Aid Certification',NULL,0),(467,NULL,19,'Cooking Course',NULL,0),(468,NULL,19,'Academic Tutor',NULL,0),(469,NULL,19,'Certification - Real Estate',NULL,0),(470,NULL,19,'Computer Training',NULL,0),(471,NULL,19,'Bartending Course',NULL,0),(472,NULL,19,'SCUBA Certification',NULL,0),(473,NULL,19,'Mechanic / Auto Repair Training',NULL,0),(474,NULL,19,'Baking Course',NULL,0),(475,NULL,19,'Digital Media Class',NULL,0),(476,NULL,19,'Kids Reading Classes',NULL,0),(477,NULL,19,'Airplane Pilot License Lesson',NULL,0),(478,NULL,19,'Certification - Drone Piloting',NULL,0),(479,NULL,19,'Test Prep Course',NULL,0),(480,NULL,19,'Etiquette / Finishing Course',NULL,0),(481,NULL,19,'Defensive Driving Course',NULL,0),(482,NULL,19,'Parenting Course',NULL,0),(483,NULL,19,'Garden / Farm / Beekeeping Class',NULL,0),(484,NULL,19,'Preschool',NULL,0),(485,NULL,19,'Certification - Massage Course',NULL,0),(486,NULL,19,'Helicopter Pilot License Lesson',NULL,0),(487,NULL,19,'Confectionery / Chocolate Course',NULL,0),(488,NULL,19,'Drivers License Training',NULL,0),(489,NULL,19,'Wine Making Course',NULL,0),(490,NULL,19,'Wood/Metal Working Course',NULL,0),(491,NULL,19,'Boating Course - License',NULL,0),(492,NULL,19,'Certification - Graphic Design',NULL,0),(493,NULL,19,'Certification - IT',NULL,0),(494,NULL,19,'Personal Trainer Certification',NULL,0),(495,NULL,19,'Cheese Making Course',NULL,0),(496,NULL,19,'Motorcycle License Training',NULL,0),(497,NULL,19,'Racetrack Driving Course',NULL,0),(498,NULL,19,'Heavy Equipment License Training',NULL,0),(499,NULL,19,'Hunting License',NULL,0),(500,NULL,19,'Pet Grooming Course',NULL,0),(501,NULL,19,'Public Speaking Course',NULL,0),(502,NULL,22,'Dancing',NULL,0),(503,NULL,22,'Martial Arts / Karate / MMA',NULL,0),(504,NULL,22,'Horse Back Riding',NULL,0),(505,NULL,22,'Golf',NULL,0),(506,NULL,22,'Shooting Range',NULL,0),(507,NULL,22,'Paintball',NULL,0),(508,NULL,22,'ATV / Quad Ride',NULL,0),(509,NULL,22,'MIni Golf',NULL,0),(510,NULL,22,'High-End / Sport Car Experience',NULL,0),(511,NULL,22,'Hiking Trails',NULL,0),(512,NULL,22,'Limosine Experience',NULL,0),(513,NULL,22,'Basketball',NULL,0),(514,NULL,22,'Tennis',NULL,0),(515,NULL,22,'Indoor Golf',NULL,0),(516,NULL,22,'Marathon Registration',NULL,0),(517,NULL,22,'Scooter Experience',NULL,0),(518,NULL,22,'Virtual Golf',NULL,0),(519,NULL,22,'Skateboarding',NULL,0),(520,NULL,22,'Flight Simulator',NULL,0),(521,NULL,22,'Fencing',NULL,0),(522,NULL,22,'Cheerleading',NULL,0),(523,NULL,22,'Airsoft',NULL,0),(524,NULL,22,'Batting Cages',NULL,0),(525,NULL,22,'Archery',NULL,0),(526,NULL,22,'Volleyball',NULL,0),(527,NULL,22,'Inline / Roller Skating',NULL,0),(528,NULL,22,'Soccer / Football',NULL,0),(529,NULL,22,'Climbing - Outdoor',NULL,0),(530,NULL,22,'Flag Football',NULL,0),(531,NULL,22,'Race Car Experience',NULL,0),(532,NULL,22,'Rugby',NULL,0),(533,NULL,22,'Hunting',NULL,0),(534,NULL,22,'Paragliding/Hang Gliding (Ride)',NULL,0),(535,NULL,22,'Trapeze (Experience)',NULL,0),(536,NULL,22,'Air Rifle Experience',NULL,0),(537,NULL,22,'Alpine Slide Park',NULL,0),(538,NULL,22,'Aquabiking',NULL,0),(539,NULL,22,'Badminton',NULL,0),(540,NULL,22,'Baseball',NULL,0),(541,NULL,22,'Mountain Biking',NULL,0),(542,NULL,22,'Biking / Road Cycling',NULL,0),(543,NULL,22,'Bumper Cars',NULL,0),(544,NULL,22,'Bungee Jumping',NULL,0),(545,NULL,22,'Capoeira Class',NULL,0),(546,NULL,22,'Classic Car Experience',NULL,0),(547,NULL,22,'Clay Pigeon Shooting',NULL,0),(548,NULL,22,'Climbing - Alpine',NULL,0),(549,NULL,22,'Tree Climbing',NULL,0),(550,NULL,22,'Cricket',NULL,0),(551,NULL,22,'Curling',NULL,0),(552,NULL,22,'Disc Golf',NULL,0),(553,NULL,22,'Dogsledding',NULL,0),(554,NULL,22,'Drive Simulator',NULL,0),(555,NULL,22,'Driving Range',NULL,0),(556,NULL,22,'Dune Buggy Experience',NULL,0),(557,NULL,22,'Falconry',NULL,0),(558,NULL,22,'Fantasy Sports League',NULL,0),(559,NULL,22,'American Football',NULL,0),(560,NULL,22,'Gaelic Football',NULL,0),(561,NULL,22,'Gliding',NULL,0),(562,NULL,22,'9-Hole Golf',NULL,0),(563,NULL,22,'Footgolf',NULL,0),(564,NULL,22,'MIni Golf - Blacklight',NULL,0),(565,NULL,22,'Handball',NULL,0),(566,NULL,22,'High Rope Course',NULL,0),(567,NULL,22,'Hockey',NULL,0),(568,NULL,22,'Lacrosse',NULL,0),(569,NULL,22,'Lawn Bowls',NULL,0),(570,NULL,22,'Ultraright Aviation',NULL,0),(571,NULL,22,'Motorcycle Ride / Driving',NULL,0),(572,NULL,22,'Obstacle Course',NULL,0),(573,NULL,22,'Off-Roading / Jeep Experience',NULL,0),(574,NULL,22,'Padel Tennis',NULL,0),(575,NULL,22,'Parachuting / Skydiving',NULL,0),(576,NULL,22,'Polo',NULL,0),(577,NULL,22,'Pool - Indoor',NULL,0),(578,NULL,22,'Pool - Outdoor',NULL,0),(579,NULL,22,'Pool / Billiards',NULL,0),(580,NULL,22,'Color Race',NULL,0),(581,NULL,22,'Mud Run / Mud Race',NULL,0),(582,NULL,22,'Relay Race',NULL,0),(583,NULL,22,'Zombie Race',NULL,0),(584,NULL,22,'Racquetball',NULL,0),(585,NULL,22,'Rappelling / Abseiling',NULL,0),(586,NULL,22,'Ice Skating',NULL,0),(587,NULL,22,'Cross Country Skiing',NULL,0),(588,NULL,22,'Ski Jumping',NULL,0),(589,NULL,22,'Skiing / Snowboarding',NULL,0),(590,NULL,22,'Sledding / Tobogganing',NULL,0),(591,NULL,22,'Snow Tubing Park',NULL,0),(592,NULL,22,'Snowshoeing Class',NULL,0),(593,NULL,22,'Bubble Soccer / Football',NULL,0),(594,NULL,22,'Indoor Soccer / Football',NULL,0),(595,NULL,22,'Squash',NULL,0),(596,NULL,22,'Stunt Driving Experience',NULL,0),(597,NULL,22,'Table Tennis / Ping Pong',NULL,0),(598,NULL,22,'Tank Driving',NULL,0),(599,NULL,22,'Trike Ride',NULL,0),(600,NULL,22,'Ultimate Frisbee',NULL,0),(601,NULL,22,'Glacier Walking',NULL,0),(602,NULL,22,'Whirly Ball',NULL,0),(603,NULL,22,'Wrestling',NULL,0),(604,NULL,22,'Zip-line',NULL,0),(605,NULL,28,'Amusement Park',NULL,0),(606,NULL,28,'Amusement Park',NULL,0),(607,NULL,28,'Waterpark',NULL,0),(608,NULL,28,'Pool - Adventure',NULL,0),(609,NULL,28,'Ferris Wheel / Panoramic Wheel',NULL,0),(610,NULL,28,'Safari Park',NULL,0),(611,NULL,28,'Playground',NULL,0),(612,NULL,27,'Jet Ski Rental',NULL,0),(613,NULL,27,'Jet Skiing',NULL,0),(614,NULL,27,'Motorboat Rental',NULL,0),(615,NULL,27,'Kayak Rental',NULL,0),(616,NULL,27,'Powerboat Rental',NULL,0),(617,NULL,27,'Kayaking',NULL,0),(618,NULL,27,'Fishing',NULL,0),(619,NULL,27,'White Water Rafting',NULL,0),(620,NULL,27,'Snorkeling',NULL,0),(621,NULL,27,'Parasailing',NULL,0),(622,NULL,27,'Boat Ride',NULL,0),(623,NULL,27,'Motor Boat Ride',NULL,0),(624,NULL,27,'SCUBA',NULL,0),(625,NULL,27,'Paddleboarding',NULL,0),(626,NULL,27,'Surfing',NULL,0),(627,NULL,27,'Jet Boat',NULL,0),(628,NULL,27,'Sailing',NULL,0),(629,NULL,27,'Powerboating',NULL,0),(630,NULL,27,'Water Skiing / Water Tubing',NULL,0),(631,NULL,27,'Sailboat Rental',NULL,0),(632,NULL,27,'Dolphin Watching',NULL,0),(633,NULL,27,'Shark Diving',NULL,0),(634,NULL,27,'Banana Boat Ride',NULL,0),(635,NULL,27,'Canoe Rental',NULL,0),(636,NULL,27,'Canoeing',NULL,0),(637,NULL,27,'Clam Digging',NULL,0),(638,NULL,27,'Dragon Boat',NULL,0),(639,NULL,27,'Flyboarding / Water Jet Pack',NULL,0),(640,NULL,27,'Hydrobike',NULL,0),(641,NULL,27,'Ice Swimming / Winter Swimming',NULL,0),(642,NULL,27,'Wave Pool',NULL,0),(643,NULL,27,'Riverboarding / Hydrospeed',NULL,0),(644,NULL,27,'Rowing / Crew',NULL,0),(645,NULL,27,'Kite Surfing',NULL,0),(646,NULL,27,'Wind Surfing',NULL,0),(647,NULL,27,'Wakeboarding',NULL,0),(648,NULL,27,'Water Polo',NULL,0);
/*!40000 ALTER TABLE `tbl_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_subcategory`
--

DROP TABLE IF EXISTS `tbl_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_subcategory`
--

LOCK TABLES `tbl_subcategory` WRITE;
/*!40000 ALTER TABLE `tbl_subcategory` DISABLE KEYS */;
INSERT INTO `tbl_subcategory` VALUES (1,1,'Med spa services','Laser hair removal, Microblading, Non-surgical facelifts, etc.'),(2,1,'Spa services','Spa services'),(3,1,'Massage services','Deep tissue, Hot stone, Reflexology, etc.'),(4,1,'Nail services','Mani-pedi, No-chip, Nail design, etc.'),(5,1,'Brow & lash services','Eyebrow shaping and tinting, Eyelash extensions, etc.'),(6,1,'Hair salon services','Haircuts, Color and highlights, Blowouts, Barbers, etc.'),(7,1,'Facials','Microdermabrasion, IPL Photo, etc.'),(8,1,'Tanning & waxing','Tanning & waxing'),(9,1,'Injectables','B12, Botox, Fillers, etc.'),(10,1,'Weight loss/cleanse','Weight loss programs, Fat/cellulite reduction, etc.'),(11,1,'Cosmetic Surgery','Lip enhancements, Hair restoration, Tattoo removal, etc.'),(12,1,'Medical','Allergy testing, Physical therapy, MRI, etc.'),(13,1,'Dental','Dental checkups, Teeth whitening, etc.'),(14,1,'Alternative medicine','Acupuncture, Chiropractic, Cryotherapy, Hypnosis, Hydro colon therapy, etc.'),(15,1,'Gym & fitness studio','Gym memberships, Martial arts, Yoga, Classes, etc.'),(16,1,'Vision','Exams, Laser eye surgery, etc.'),(17,1,'Other Services',NULL),(18,2,'Skills & training workshops','Dance classes, Horseback riding, Trade skills, Resume writing, etc.'),(19,2,'Education','Academic courses, Certifications, Driver’s education, Firearm safety, etc.'),(20,2,'Events & festivals','Beer and wine festivals, Conventions, Food and drink exhibitions, etc.'),(21,2,'Indoor activities','Arcades, Bowling, Trampolines, Climbing walls, Room-escape games, etc.'),(22,2,'Sports activities','Golf, Paintball, Shooting ranges, Skydiving, Off-roading, etc.'),(23,2,'New age practices','Fortune telling, Astrology, Psychics, Life coaches, etc.'),(24,2,'Tastings','Wine and beer tastings, etc.'),(25,2,'Tours','Guided tours, Whale watching, Bus and helicopter tours, Hot air balloons, etc.'),(26,2,'Museums','Museums and gallery visits, etc.'),(27,2,'Water activities','Fishing, Boat rentals, Jet skiing, White water rafting, etc.'),(28,2,'Amusement & water parks','Theme parks, Water parks, Ferris wheels, etc.'),(29,2,'Outdoor/seasonal activities','Camps, Party boats, Carriage rides, Pumpkin picking, etc.'),(30,2,'Personal trainers','One-on-one training, Personalized programs, etc.'),(31,2,'Zoos & aquariums','Zoos and animal parks, Aquariums, etc.'),(32,2,'Other Services',NULL),(33,3,'Car enhancements & repair','Brake pads, Window tinting, Remote starters, etc.'),(34,3,'Car maintenance','Oil changes, Wheel alignments, Inspections, Emissions testing, etc.'),(35,3,'Car wash','Exterior washes, Detailing, Wax and polish, etc.'),(36,3,'Entertainment rentals','DJ equipment, Catering, Photo booths, etc.'),(37,3,'Exterior home services','Landscaping, Window cleaning, Pressure washing, Pest control, Paving, etc.'),(38,3,'Interior home services','House cleaning, Carpet and upholstery cleaning, Furnace and HVAC maintenance, etc.'),(39,3,'Pet care','Veterinary services, Pet grooming, Kennels and boarding, etc.'),(40,3,'Repairs','Electronics repairs, Bike repairs, Boat repairs, Sports equipment repairs, etc.'),(41,3,'Transportation & transportation rentals','Airport parking, Vehicle rentals, Party buses and limos, Ferries, etc.'),(42,3,'Alterations & Cobbler','Laundry services, Shoe repair, Tailor, etc.'),(43,3,'Other Services',NULL),(44,4,'American food','Pub grub, New American, Pizza, Burgers, Steakhouses, etc.'),(45,4,'International food','Italian, Mexican, Sushi, Indian, etc.'),(46,4,'Quick service','Cafes, Sandwich shops, Ice cream parlors, etc.'),(47,4,'Other Services',NULL),(48,5,'eLearning','Online courses and certifications, etc.'),(49,5,'Photography','Photoshoots, etc.'),(50,5,'Personal services','Meal prep delivery, Online consulting, Online tarot and psychic readings, etc.'),(51,5,'Online retail shopping','Shopping on a website, etc.'),(52,5,'Consulting Services','Financial/tax consultant, counselor/therapist, marketing consultant, etc.'),(53,5,'Subscriptions','Online service subscriptions, Gift box subscription, Online movie/game rental subscription, etc.'),(54,5,'Sporting Rental','Rental-surf & paddle board/skis, Bike/bicycle rental, Fishing gear rental, etc.'),(55,5,'Other Services','');
/*!40000 ALTER TABLE `tbl_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tax_type`
--

DROP TABLE IF EXISTS `tbl_tax_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tax_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tax_type`
--

LOCK TABLES `tbl_tax_type` WRITE;
/*!40000 ALTER TABLE `tbl_tax_type` DISABLE KEYS */;
INSERT INTO `tbl_tax_type` VALUES (1,'Social Security Number'),(2,'Employer Identification Number (EIN)');
/*!40000 ALTER TABLE `tbl_tax_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_access`
--

DROP TABLE IF EXISTS `tbl_user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_access`
--

LOCK TABLES `tbl_user_access` WRITE;
/*!40000 ALTER TABLE `tbl_user_access` DISABLE KEYS */;
INSERT INTO `tbl_user_access` VALUES (1,'Admin',0),(2,'Merchant',0),(3,'Customer',0);
/*!40000 ALTER TABLE `tbl_user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (1,1,'admin','admin@gmail.com','$2y$12$unglyRO6Zejez188ttGCU.bCPcY5TZWPXxD2pZ.mFnRcdBiU66Co.',NULL,0),(2,2,'merchant','merchant@gmail.com','$2y$12$1gcgAZ1BBFEsRjnlQL/W0.TIxwDnU2JPDcMLOfe/EjZvyjVRRUmEO',NULL,0),(3,3,'customer','customer@gmail.com','$2y$12$scgRuwYiocy0CvDUBw9JEu8VBEqYfVTfeplA4msn/3OJR0lyzCbAy',NULL,0),(4,3,NULL,'customer123@gmail.com','12346','customer customer',0),(5,2,NULL,'test@gmail.com','$2y$12$4Kh4Fi2gxZSM0Dr.qyRPv.dNDpLQLWHGiT8akohikrI00wfZcE9S.','test test test',0);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_info`
--

DROP TABLE IF EXISTS `tbl_users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_info`
--

LOCK TABLES `tbl_users_info` WRITE;
/*!40000 ALTER TABLE `tbl_users_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_users_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12  5:51:01
