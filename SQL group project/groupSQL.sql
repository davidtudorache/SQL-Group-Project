-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: groupsql
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `boat_record`
--

DROP TABLE IF EXISTS `boat_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boat_record` (
  `BoatID` decimal(5,0) NOT NULL,
  `Class_Size` varchar(11) DEFAULT NULL,
  `BoatModel` varchar(25) DEFAULT NULL,
  `ManufID` decimal(5,0) DEFAULT NULL,
  `PurchDate` date DEFAULT NULL,
  `PurchPrice` decimal(6,2) DEFAULT NULL,
  `LastService` date DEFAULT NULL,
  `DealerName` varchar(25) DEFAULT NULL,
  `SaleDate` date DEFAULT NULL,
  `SalePrice` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`BoatID`),
  KEY `ManufID` (`ManufID`),
  CONSTRAINT `boat_record_ibfk_1` FOREIGN KEY (`ManufID`) REFERENCES `manufacture_details` (`ManufID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boat_record`
--

LOCK TABLES `boat_record` WRITE;
/*!40000 ALTER TABLE `boat_record` DISABLE KEYS */;
INSERT INTO `boat_record` VALUES (1,'Std_MBoat','Explorer',1,'2010-11-22',3910.00,'2020-10-22','Dalis Vannoort','2020-01-02',1500.00),(2,'VLrg_SBoat','TurboSail',2,'2009-10-12',3840.00,'2019-10-08','Joe\'s Junk','2019-10-10',1600.00),(3,'Lrg_SBoat','MasterSail',2,'2009-10-12',3840.00,'2019-10-08',NULL,NULL,NULL),(4,'Sml_SBoat','SmallSailor',3,'2015-11-12',2040.00,'2020-10-14',NULL,NULL,NULL),(5,'Sml_SBoat','SmallSailor',3,'2015-11-12',2040.00,'2020-10-13',NULL,NULL,NULL),(6,'Lrg_MBoat','Grande',5,'2015-01-14',5440.00,'2020-10-15',NULL,NULL,NULL),(7,'Lrg_MBoat','Grande',5,'2015-01-14',5440.00,'2020-09-13',NULL,NULL,NULL),(8,'Std_MBoat','Turbo Mid',2,'2015-01-14',5440.00,'2020-09-13',NULL,NULL,NULL),(9,'Lrg_RBoat','RowStream',3,'2015-01-12',440.00,'2020-10-10',NULL,NULL,NULL),(10,'Std_RBoat','RowerX',4,'2015-01-12',320.00,'2020-09-22',NULL,NULL,NULL),(11,'Lrg_SBoat','Explorer',1,'2016-01-10',3320.00,'2020-03-03',NULL,NULL,NULL),(12,'Std_SBoat','Navigator',1,'2016-01-10',3320.00,'2020-04-03',NULL,NULL,NULL),(13,'Std_MBoat','Turbo Mid',2,'2018-02-14',4440.00,'2020-09-14',NULL,NULL,NULL),(14,'Std_MBoat','Turbo Mid',2,'2018-02-14',4440.00,'2020-09-13',NULL,NULL,NULL),(15,'Lrg_MBoat','MasterBlaster',7,'2018-02-14',5440.00,'2020-10-14',NULL,NULL,NULL),(16,'Lrg_RBoat','HappyRower',8,'2018-01-10',340.00,'2020-10-02',NULL,NULL,NULL),(17,'Sml_RBoat','HappyRower',8,'2018-01-10',340.00,'2020-10-02',NULL,NULL,NULL),(18,'VLrg_RBoat','Streamer',3,'2017-01-09',640.00,'2020-10-07',NULL,NULL,NULL),(19,'VLrg_RBoat','Great Row',4,'2019-01-19',650.00,'2020-09-12',NULL,NULL,NULL),(20,'VLrg_MBoat','SuperBlaster',7,'2018-01-14',7440.00,'2020-08-07',NULL,NULL,NULL),(21,'Std_RBoat','Lizard',6,'2017-01-09',340.00,'2020-10-04',NULL,NULL,NULL),(22,'Lrg_MBoat','Grande',5,'2018-02-14',5440.00,'2020-09-13',NULL,NULL,NULL),(23,'Lrg_SBoat','MasterSail',2,'2015-10-12',3240.00,'2020-01-27',NULL,NULL,NULL);
/*!40000 ALTER TABLE `boat_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_history`
--

DROP TABLE IF EXISTS `maintenance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_history` (
  `MaintID` decimal(5,0) NOT NULL,
  `BoatID` decimal(5,0) DEFAULT NULL,
  `MaintRefNo` decimal(5,0) DEFAULT NULL,
  `FaultDetails` varchar(50) DEFAULT NULL,
  `FaultDate` date DEFAULT NULL,
  `ActionTaken` varchar(50) DEFAULT NULL,
  `ActionDate` date DEFAULT NULL,
  PRIMARY KEY (`MaintID`),
  KEY `BoatID` (`BoatID`),
  CONSTRAINT `maintenance_history_ibfk_1` FOREIGN KEY (`BoatID`) REFERENCES `boat_record` (`BoatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_history`
--

LOCK TABLES `maintenance_history` WRITE;
/*!40000 ALTER TABLE `maintenance_history` DISABLE KEYS */;
INSERT INTO `maintenance_history` VALUES (1,1,1,'Chipped propeller','2015-02-15','Replace Propeller','2015-02-27'),(2,1,2,'Bilge pumps gone','2015-02-15','New bilge pumps','2015-08-27'),(3,1,3,NULL,NULL,'New head pumps','2015-08-15'),(4,1,4,NULL,NULL,'Normal Service','2016-03-20'),(5,1,5,'Cutless bearing worn through','2016-12-02','Fit new bearing','2017-01-27'),(6,3,1,'Damaged mast','2016-04-17','Repair Mast','2016-04-27'),(7,3,2,'Bent Forestay','2017-07-10','Replace Forestay','2017-08-22'),(8,3,3,'Shot Boom','2018-05-07','Replace Boom','2018-06-06'),(9,3,4,'Rudderstock Chipped','2019-06-07','Repair Rudderstock','2019-06-08'),(10,3,5,NULL,NULL,'Normal Service','2020-01-27'),(11,3,6,'Rudderblade busted','2020-10-19',NULL,NULL);
/*!40000 ALTER TABLE `maintenance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacture_details`
--

DROP TABLE IF EXISTS `manufacture_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacture_details` (
  `ManufID` decimal(5,0) NOT NULL,
  `ManufName` varchar(50) DEFAULT NULL,
  `ManufTelNo` decimal(11,0) DEFAULT NULL,
  `ManufAddress` varchar(50) DEFAULT NULL,
  `ManufPostCode` varchar(8) DEFAULT NULL,
  `ManufEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ManufID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacture_details`
--

LOCK TABLES `manufacture_details` WRITE;
/*!40000 ALTER TABLE `manufacture_details` DISABLE KEYS */;
INSERT INTO `manufacture_details` VALUES (1,'SuperBoat',1772459666,'Unit 7 Centurion Court, Leyland','LE10 2DJ','admin@superboat.co.uk'),(2,'Explorer Boats UK',1704807654,'Meadow Lane, Burscough','BU56 8GH','admin@explorerboats.co.uk'),(3,'The Northwich Boat Company',1270160160,'Unit 1 Kings Lock Boatyard Booth Lane, Middlewich','MW67 7GY','admin@northwichboats.co.uk'),(4,'Collingwood Boat Builders',1513742985,'29 Townsend Street, Collingwood','CL27 2DU','admin@collingwoodboats.co.uk'),(5,'Elton Moss Boat Builders',1270760160,'Unit 4 Kings Lock Boatyard Booth Lane, Middlewich','MW63 8TY','admin@eltonmossboats.co.uk'),(6,'Aintree Boat Company Ltd',1515239000,'Brookfield Drive, Liverpool','L1 6GU','admin@aintreeboats.co.uk'),(7,'Braidbar Boats Ltd',1625873471,'Lord Vernons Wharf Lyme Road Higher, Poynton','PY12 9TS','admin@braidbarboats.co.uk'),(8,'Bourne Boat Builders Ltd ',1785714692,'Teddesley Road, Penkridge','PE8 7SU','admin@bourneboats.co.uk'),(9,'Stoke on Trent Boat Building Co Ltd',1782813831,'Longport Wharf Station Street, Stoke-on-Trent','ST6 9GU','admin@stokeboats.co.uk'),(10,'MGM Boats Narrowboat Builders',1162640009,'27 Mill Lane, Leicester','LE6 9FY','admin@mgmboats.co.uk');
/*!40000 ALTER TABLE `manufacture_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'groupsql'
--

--
-- Dumping routines for database 'groupsql'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-27 20:26:30
