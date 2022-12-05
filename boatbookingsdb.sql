-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: boatbookingsdb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_ID` int NOT NULL AUTO_INCREMENT,
  `Phone_Number` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `S_A_Number` int NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Apt_No` int DEFAULT NULL,
  `Province` varchar(255) NOT NULL,
  `Zip` varchar(6) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `Amenities_ID` int NOT NULL AUTO_INCREMENT,
  `Location_No` int NOT NULL,
  PRIMARY KEY (`Amenities_ID`,`Location_No`),
  KEY `Location_No_idx` (`Location_No`),
  CONSTRAINT `Location_No` FOREIGN KEY (`Location_No`) REFERENCES `location` (`Location_NO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barbeque`
--

DROP TABLE IF EXISTS `barbeque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barbeque` (
  `Amenities_ID` int NOT NULL,
  `Num_Grills` int DEFAULT NULL,
  PRIMARY KEY (`Amenities_ID`),
  KEY `Amenities_ID_idx` (`Amenities_ID`),
  CONSTRAINT `Amenities_ID` FOREIGN KEY (`Amenities_ID`) REFERENCES `amenities` (`Amenities_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barbeque`
--

LOCK TABLES `barbeque` WRITE;
/*!40000 ALTER TABLE `barbeque` DISABLE KEYS */;
/*!40000 ALTER TABLE `barbeque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boat`
--

DROP TABLE IF EXISTS `boat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boat` (
  `Boat_ID` int NOT NULL AUTO_INCREMENT,
  `BName` varchar(255) NOT NULL,
  `BType` varchar(255) NOT NULL,
  `SailorLicenseNo` int DEFAULT NULL,
  PRIMARY KEY (`Boat_ID`),
  KEY `Boat_Sailer_idx` (`SailorLicenseNo`),
  CONSTRAINT `Boat_Sailer` FOREIGN KEY (`SailorLicenseNo`) REFERENCES `boatsailor` (`License_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boat`
--

LOCK TABLES `boat` WRITE;
/*!40000 ALTER TABLE `boat` DISABLE KEYS */;
/*!40000 ALTER TABLE `boat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boatsailor`
--

DROP TABLE IF EXISTS `boatsailor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boatsailor` (
  `License_NO` int NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `S_A_Number` int NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Apt_No` int DEFAULT NULL,
  `Province` varchar(255) NOT NULL,
  `Zip` varchar(255) NOT NULL,
  PRIMARY KEY (`License_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boatsailor`
--

LOCK TABLES `boatsailor` WRITE;
/*!40000 ALTER TABLE `boatsailor` DISABLE KEYS */;
/*!40000 ALTER TABLE `boatsailor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Booking_ID` int NOT NULL AUTO_INCREMENT,
  `Time` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Located_At` int NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `Located_at_idx` (`Located_At`),
  CONSTRAINT `Located_At` FOREIGN KEY (`Located_At`) REFERENCES `location` (`Location_NO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='the booking entity not the actual client booking relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `Booking_ID` int NOT NULL,
  `Amenities_ID` int NOT NULL,
  `Client_ID` int NOT NULL,
  PRIMARY KEY (`Booking_ID`,`Amenities_ID`,`Client_ID`),
  KEY `books_Amenities_ID_idx` (`Amenities_ID`),
  KEY `books_Client_ID_idx` (`Client_ID`),
  CONSTRAINT `books_amenitieID` FOREIGN KEY (`Amenities_ID`) REFERENCES `amenities` (`Amenities_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `books_Booking_ID` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `books_Client_ID` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`Client_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='books amenities table\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `Client_ID` int NOT NULL AUTO_INCREMENT,
  `Phone_Number` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `S_A_Number` int NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Apt_No` int DEFAULT NULL,
  `Province` varchar(255) NOT NULL,
  `Zip` varchar(6) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  PRIMARY KEY (`Client_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Location_NO` int NOT NULL AUTO_INCREMENT,
  `Phone_Number` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `S_A_Number` int NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Apt_No` int DEFAULT NULL,
  `Province` varchar(255) NOT NULL,
  `Zip` varchar(6) NOT NULL,
  PRIMARY KEY (`Location_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_has_membership_card`
--

DROP TABLE IF EXISTS `member_has_membership_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_has_membership_card` (
  `Client_ID` int NOT NULL,
  `CARD_ID` int NOT NULL,
  `Member_Since` date DEFAULT NULL,
  PRIMARY KEY (`Client_ID`),
  CONSTRAINT `Member_ID` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`Client_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='I had to change card as not automatically updating since auto increment must be the primary key';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_has_membership_card`
--

LOCK TABLES `member_has_membership_card` WRITE;
/*!40000 ALTER TABLE `member_has_membership_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_has_membership_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserves`
--

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserves` (
  `Booking_ID` int NOT NULL,
  `Boat_ID` int NOT NULL,
  `Client_ID` int NOT NULL,
  PRIMARY KEY (`Booking_ID`,`Boat_ID`,`Client_ID`),
  KEY `reserves_CID_idx` (`Client_ID`),
  KEY `reserves_BoatID_idx` (`Boat_ID`),
  CONSTRAINT `reserves_BID` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_BoatID` FOREIGN KEY (`Boat_ID`) REFERENCES `boat` (`Boat_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_CID` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`Client_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swimmingpools`
--

DROP TABLE IF EXISTS `swimmingpools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `swimmingpools` (
  `Amenities_ID` int NOT NULL,
  `Num_Lanes` int DEFAULT NULL,
  `poolsize` int DEFAULT NULL,
  PRIMARY KEY (`Amenities_ID`),
  CONSTRAINT `amenities_IDP` FOREIGN KEY (`Amenities_ID`) REFERENCES `amenities` (`Amenities_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swimmingpools`
--

LOCK TABLES `swimmingpools` WRITE;
/*!40000 ALTER TABLE `swimmingpools` DISABLE KEYS */;
/*!40000 ALTER TABLE `swimmingpools` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 19:43:50
