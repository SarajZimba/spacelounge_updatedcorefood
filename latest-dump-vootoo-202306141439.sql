-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: vootoo
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `CreditHistory`
--

DROP TABLE IF EXISTS `CreditHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CreditHistory` (
  `Date` datetime NOT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `PaymentAt` varchar(10) DEFAULT NULL,
  `idCreditTable` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(100) NOT NULL,
  `outetName` varchar(100) NOT NULL,
  `guestID` varchar(20) NOT NULL,
  `creditState` varchar(15) DEFAULT NULL,
  `Outlet_OrderID` varchar(10) NOT NULL,
  PRIMARY KEY (`idCreditTable`),
  KEY `idCreditTable` (`idCreditTable`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CreditHistory`
--

LOCK TABLES `CreditHistory` WRITE;
/*!40000 ALTER TABLE `CreditHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `CreditHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeLogin`
--

DROP TABLE IF EXISTS `EmployeeLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmployeeLogin` (
  `userName` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Token` varchar(140) DEFAULT NULL,
  `ClientID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeLogin`
--

LOCK TABLES `EmployeeLogin` WRITE;
/*!40000 ALTER TABLE `EmployeeLogin` DISABLE KEYS */;
INSERT INTO `EmployeeLogin` VALUES ('vootoo','jibrofry','test',NULL);
/*!40000 ALTER TABLE `EmployeeLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intbl_purchaserequisition`
--

DROP TABLE IF EXISTS `intbl_purchaserequisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intbl_purchaserequisition` (
  `IDIntbl_PurchaseRequisition` int(11) NOT NULL AUTO_INCREMENT,
  `RequisitionType` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `TaxAmount` decimal(10,2) DEFAULT NULL,
  `Company_Name` varchar(100) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `purchaseBillNumber` int(11) DEFAULT NULL,
  `DiscountAmount` decimal(10,2) DEFAULT NULL,
  `Outlet_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDIntbl_PurchaseRequisition`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intbl_purchaserequisition`
--

LOCK TABLES `intbl_purchaserequisition` WRITE;
/*!40000 ALTER TABLE `intbl_purchaserequisition` DISABLE KEYS */;
INSERT INTO `intbl_purchaserequisition` VALUES (4,'134','2023-04-25',1500.00,100.00,'R Store','Received','2023-04-25',428,10.00,'Club House Restaurant & Bar'),(674,'Smooth Operation','2023-04-03',3026.93,348.23,'Universal Beverages Pvt. Ltd.','Received','2023-04-25',12,0.00,'Club House Restaurant & Bar'),(675,'Smooth Operation','2023-04-25',1084.75,9.75,'Bhat Bhateni','Received','2023-04-25',333,0.00,'Club House Restaurant & Bar'),(676,'Smooth Operation','2023-04-25',5240.00,0.00,'Barja Bottlers Traders','Received','2023-04-25',6,0.00,'Club House Restaurant & Bar'),(677,'Smooth Operation','2023-04-25',5864.70,674.70,'B TO B Hositality','Received','2023-04-25',33,0.00,'Club House Restaurant & Bar'),(678,'Smooth Operation','2023-04-25',0.00,0.00,'Shangrila Spirits Pvt Ltd','Received','2023-04-25',345,0.00,'Club House Restaurant & Bar'),(679,'Smooth Operation','2023-04-25',1020.00,0.00,'K. B. Supplier','Received','2023-04-25',4456,0.00,'Club House Restaurant & Bar'),(680,'Smooth Operation','2023-04-28',2260.00,260.00,'Bhat Bhateni','Received','2023-04-28',334,0.00,'Club House Restaurant & Bar'),(685,'Smooth Operation','2023-04-25',3390.00,390.00,'S. And S. Marketing Pvt . Ltd','Received','2023-04-25',1,0.00,'Club House Restaurant & Bar');
/*!40000 ALTER TABLE `intbl_purchaserequisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intbl_purchaserequisition_contract`
--

DROP TABLE IF EXISTS `intbl_purchaserequisition_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intbl_purchaserequisition_contract` (
  `IDIntbl_PurchaseRequisition_Contract` int(11) NOT NULL AUTO_INCREMENT,
  `ItemID` int(11) DEFAULT NULL,
  `UnitsOrdered` decimal(10,2) DEFAULT NULL,
  `PurchaseReqID` int(11) DEFAULT NULL,
  `Rate` decimal(10,2) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `BrandName` varchar(100) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `UOM` varchar(20) DEFAULT NULL,
  `StockType` varchar(15) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `GroupName` varchar(100) DEFAULT NULL,
  `ExpDate` varchar(100) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Taxable` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IDIntbl_PurchaseRequisition_Contract`),
  KEY `InTblK11` (`PurchaseReqID`),
  CONSTRAINT `InTblk11` FOREIGN KEY (`PurchaseReqID`) REFERENCES `intbl_purchaserequisition` (`IDIntbl_PurchaseRequisition`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=837 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intbl_purchaserequisition_contract`
--

LOCK TABLES `intbl_purchaserequisition_contract` WRITE;
/*!40000 ALTER TABLE `intbl_purchaserequisition_contract` DISABLE KEYS */;
INSERT INTO `intbl_purchaserequisition_contract` VALUES (826,211,3.00,4,2236.43,'Gurkha & Gun 750ml','','','ml','Non-Stockable','Beverage','Whiskey','','In Stock','Yes'),(827,103,2.00,674,1339.35,'Agave Syrup 700ml','Monin','','ml','Non-Stockable','Beverage','Syrup','','In Stock','Yes'),(828,44,10.00,675,100.00,'Baking Soda','','','Grms','Non-Stockable','Food','Provision and Cans','','In Stock','No'),(829,163,3.00,675,25.00,'Salt Bar','','','Kg','Non-Stockable','Beverage','Condiment','','In Stock','Yes'),(830,387,3.00,676,80.00,'Raddish','','','Kg','Non-Stockable','Food','Vegetables and Fruits','','In Stock','No'),(831,313,5.00,676,1000.00,'Basa Fish','','','Kg','Non-Stockable','Food','Meat And Eggs','','In Stock','No'),(832,358,2.00,677,2595.00,'Dashi Powderr','','','Kg','Non-Stockable','Food','Imported Provision','','In Stock','Yes'),(833,77,11.00,679,60.00,'Potatoes','','','Kg','Non-Stockable','Food','Vegetables and Fruits','','In Stock','No'),(834,76,3.00,679,120.00,'Tomatoes','','','Kg','Non-Stockable','Food','Vegetables and Fruits','','In Stock','No'),(835,211,1.00,685,3000.00,'Gurkha & Gun 750ml','','','ml','Non-Stockable','Beverage','Whiskey','','In Stock','Yes'),(836,9,5.00,680,400.00,'Maggi Hot and Sweet Sauce','','','Kg','Non-Stockable','Food','Provision and Cans','','In Stock','Yes');
/*!40000 ALTER TABLE `intbl_purchaserequisition_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outetNames`
--

DROP TABLE IF EXISTS `outetNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outetNames` (
  `Outlet` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outetNames`
--

LOCK TABLES `outetNames` WRITE;
/*!40000 ALTER TABLE `outetNames` DISABLE KEYS */;
INSERT INTO `outetNames` VALUES ('Club House Restaurant & Bar');
/*!40000 ALTER TABLE `outetNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorderTracker`
--

DROP TABLE IF EXISTS `tblorderTracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblorderTracker` (
  `idtblorderTracker` int(11) NOT NULL AUTO_INCREMENT,
  `outlet_orderID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `tableNum` varchar(10) DEFAULT NULL,
  `orderedAt` varchar(10) DEFAULT NULL,
  `completedAt` varchar(10) DEFAULT NULL,
  `TotalTime` varchar(10) DEFAULT NULL,
  `orderType` varchar(20) DEFAULT NULL,
  `currentState` varchar(20) DEFAULT NULL,
  `Quantity` decimal(10,2) DEFAULT NULL,
  `outlet_Name` varchar(50) DEFAULT NULL,
  `Employee` varchar(50) DEFAULT NULL,
  `Guest_count` int(11) DEFAULT NULL,
  `KOTID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idtblorderTracker`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorderTracker`
--

LOCK TABLES `tblorderTracker` WRITE;
/*!40000 ALTER TABLE `tblorderTracker` DISABLE KEYS */;
INSERT INTO `tblorderTracker` VALUES (112,1254,'2023-04-19','1','17:00:43','16:18:14','23:17:31','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'107'),(113,1256,'2023-04-19','1','17:29:56','16:18:14','22:48:18','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'109'),(114,1255,'2023-04-19','1','17:32:56','16:18:13','22:45:17','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'108'),(115,1256,'2023-04-21','200','11:41:58','16:18:12','04:36:14','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'1'),(116,1257,'2023-04-23','1','12:41:30','16:18:13','03:36:43','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',3,'2'),(117,1258,'2023-04-25','7','11:57:16','16:18:11','04:20:55','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'1'),(118,1259,'2023-04-25','500','14:15:53','void','void','Dine-In','void',0.00,'Club House Restaurant & Bar','Ram Bahadur',5,'2'),(119,1260,'2023-04-25','98','14:17:22','void','void','Dine-In','void',0.00,'Club House Restaurant & Bar','Ram Bahadur',1,'3'),(120,1261,'2023-04-27','200','17:05:34','14:33:49','21:28:15','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'4'),(121,1257,'2023-04-28','1','14:29:51','14:33:47','00:03:56','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'110'),(122,1258,'2023-04-28','9','14:34:17','14:39:02','00:04:45','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'111'),(123,1257,'2023-04-28','1','14:36:52','','','Dine-In','Started',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'112'),(124,1259,'2023-04-28','2','14:38:13','14:47:42','00:09:29','Dine-In','Completed',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'113'),(125,1260,'2023-04-28','3','15:14:21','','','Dine-In','Started',0.00,'Club House Restaurant & Bar','Ram Bahadur',4,'114'),(126,1262,'2023-05-04','8','12:25:47','','','Dine-In','Started',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'5'),(127,1264,'2023-05-05','500','17:11:14','','','Dine-In','Started',0.00,'Club House Restaurant & Bar','Ram Bahadur',2,'6'),(128,1266,'2023-05-09','5','14:24:10','','','Dine-In','Started',0.00,'Club House Restaurant & Bar','Ram Bahadur',5,'7');
/*!40000 ALTER TABLE `tblorderTracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorderTracker_Details`
--

DROP TABLE IF EXISTS `tblorderTracker_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblorderTracker_Details` (
  `idtblorderTracker_Details` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(100) DEFAULT NULL,
  `orderedAt` varchar(10) DEFAULT NULL,
  `completedAt` varchar(10) DEFAULT NULL,
  `TotalTime` varchar(10) DEFAULT NULL,
  `Quantity` decimal(10,2) DEFAULT NULL,
  `Modification` varchar(50) DEFAULT NULL,
  `orderTrackerID` int(11) DEFAULT NULL,
  `AvgPrepTime` varchar(20) DEFAULT NULL,
  `prepTimeDifference` varchar(14) DEFAULT NULL,
  `item_price` varchar(10) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `voidAt` varchar(20) DEFAULT NULL,
  `voidTotalTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idtblorderTracker_Details`),
  KEY `InTblK3` (`orderTrackerID`),
  CONSTRAINT `InTblk3` FOREIGN KEY (`orderTrackerID`) REFERENCES `tblorderTracker` (`idtblorderTracker`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorderTracker_Details`
--

LOCK TABLES `tblorderTracker_Details` WRITE;
/*!40000 ALTER TABLE `tblorderTracker_Details` DISABLE KEYS */;
INSERT INTO `tblorderTracker_Details` VALUES (98,'Alu tama','17:00:43','16:18:14','23:17:31',1.00,'',112,'00:00:00','','194.69','Soups',NULL,NULL),(99,'Mushroom soup','17:00:43','16:18:14','23:17:31',1.00,'',112,'00:00:00','','265.49','Soups',NULL,NULL),(100,'Chicken kurkure','17:29:56','16:18:14','22:48:18',1.00,'',113,'00:00:00','','438.05','Chicken',NULL,NULL),(101,'Alu tama','17:32:56','16:18:13','22:45:17',1.00,'',114,'00:00:00','','194.69','Soups',NULL,NULL),(102,'Mushroom soup','17:32:56','16:18:13','22:45:17',1.00,'',114,'00:00:00','','265.49','Soups',NULL,NULL),(103,'Chicken Jhol mo:mo','11:41:58','16:18:12','04:36:14',1.00,'',115,'00:00:00','','88.50','Other Beverages',NULL,NULL),(104,'Alu tama','12:41:30','16:18:13','03:36:43',1.00,'',116,'00:00:00','','194.69','Soups',NULL,NULL),(105,'Bhuttan','12:41:30','16:18:13','03:36:43',1.00,'',116,'00:00:00','','283.19','Buff',NULL,NULL),(106,'Pork chilli','11:57:16','16:18:11','04:20:55',1.00,'',117,'00:00:00','','398.23','Pork',NULL,NULL),(107,'Pork syaptha','11:57:16','16:18:11','04:20:55',1.00,'',117,'00:00:00','','438.05','Pork',NULL,NULL),(108,'Badel Steam','11:57:16','16:18:11','04:20:55',1.00,'',117,'00:00:00','','442.48','Pork',NULL,NULL),(109,'Chicken  Wrap','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'345.13','Wrap','16:18:06','02:02:13'),(110,'Buff Chilli mo:mo','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'309.73','Momo','16:18:07','02:02:14'),(111,'Chicken Fry mo:mo','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'309.73','Momo','16:18:08','02:02:15'),(112,'Veg Kothey mo:mo','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'283.19','Momo','16:18:08','02:02:15'),(113,'Buff Kothey mo:mo','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'309.73','Momo','16:18:08','02:02:15'),(114,'Fish kurkure','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'486.73','FISH','16:18:08','02:02:15'),(115,'Fish finger','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'530.97','FISH','16:18:09','02:02:16'),(116,'Fish Fry Nepali St','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'486.73','FISH','16:18:09','02:02:16'),(117,'Fish & Chips','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'530.97','FISH','16:18:09','02:02:16'),(118,'Hot garlic Prawn','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'699.12','FISH','16:18:09','02:02:16'),(119,'Prawn fry','14:15:53','void','void',1.00,'',118,'00:00:00',NULL,'699.12','FISH','16:18:10','02:02:17'),(120,'Pork syaptha','14:17:22','void','void',1.00,'',119,'00:00:00',NULL,'438.05','Pork','16:18:03','02:00:41'),(121,'Hot garlic Prawn','17:05:34','14:33:49','21:28:15',1.00,'',120,'00:00:00','','699.12','FISH',NULL,NULL),(122,'Fish finger','17:05:34','14:33:49','21:28:15',1.00,'',120,'00:00:00','','530.97','FISH',NULL,NULL),(123,'Chicken mushroom soup','14:29:51','14:33:47','00:03:56',2.00,'',121,'00:00:00','','309.73','Soups',NULL,NULL),(124,'Chicken Fry mo:mo','14:34:17','14:39:02','00:04:45',2.00,'',122,'00:00:00','','309.73','Momo',NULL,NULL),(125,'Pork chop','14:36:52','','',1.00,'',123,'00:00:00',NULL,'699.12','Continental',NULL,NULL),(126,'Smoked Chicken Pizza','14:38:13','14:47:42','00:09:29',1.00,'',124,'00:00:00','','601.77','Pizza',NULL,NULL),(127,'Chicken  & Egg Chatamari','15:14:21','','',1.00,'',125,'00:00:00',NULL,'221.24','Chatamari',NULL,NULL),(128,'Veg Kothey mo:mo','12:25:47','','',1.00,'',126,'00:00:00',NULL,'283.19','Momo',NULL,NULL),(129,'Buff Kothey mo:mo','12:25:47','','',2.00,'',126,'00:00:00',NULL,'309.73','Momo',NULL,NULL),(130,'Darjeeling pork mo:mo','17:11:14','','',1.00,'',127,'00:00:00',NULL,'345.13','Momo',NULL,NULL),(131,'Hot & sour soup Veg','14:24:10','','',2.00,'',128,'00:00:00',NULL,'256.64','Soups',NULL,NULL),(132,'Chicken mushroom soup','14:24:10','','',1.00,'',128,'00:00:00',NULL,'309.73','Soups',NULL,NULL),(133,'Mushroom soup','14:24:10','','',1.00,'',128,'00:00:00',NULL,'265.49','Soups',NULL,NULL);
/*!40000 ALTER TABLE `tblorderTracker_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorder_detailshistory`
--

DROP TABLE IF EXISTS `tblorder_detailshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblorder_detailshistory` (
  `idtblorder_detailsHistory` int(11) NOT NULL AUTO_INCREMENT,
  `order_ID` int(11) DEFAULT NULL,
  `ItemName` varchar(200) DEFAULT NULL,
  `itemRate` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `ItemType` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `discountExempt` varchar(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtblorder_detailsHistory`),
  KEY `OrderFK1` (`order_ID`),
  CONSTRAINT `OrderFK11` FOREIGN KEY (`order_ID`) REFERENCES `tblorderhistory` (`idtblorderHistory`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorder_detailshistory`
--

LOCK TABLES `tblorder_detailshistory` WRITE;
/*!40000 ALTER TABLE `tblorder_detailshistory` DISABLE KEYS */;
INSERT INTO `tblorder_detailshistory` VALUES (264,76,'Alu tama',194.69,194.69,'Food','Soups','False',1),(265,76,'Black Label 30 ml',566.37,566.37,'Beverage','Hard Drinks Imported','False',1),(266,76,'Black Label 60 ml',1132.74,1132.74,'Beverage','Hard Drinks Imported','False',1),(267,76,'Mushroom soup',265.49,265.49,'Food','Soups','False',1),(268,77,'Chicken Jhol mo:mo',88.50,88.50,'Food','Other Beverages','False',1),(269,77,'Hot lemon with honey',168.14,672.56,'Beverage','Other Beverages','False',4),(270,78,'Alu tama',194.69,194.69,'Food','Soups','False',1),(271,78,'Americano',141.59,283.18,'Beverage','Coffee','False',2),(272,78,'Bhuttan',283.19,283.19,'Food','Buff','False',1),(273,79,'Badel Steam',442.48,442.48,'Food','Pork','False',1),(274,79,'Pork chilli',398.23,398.23,'Food','Pork','False',1),(275,79,'Pork syaptha',438.05,438.05,'Food','Pork','False',1),(276,80,'Buff Chilli mo:mo',309.73,309.73,'Food','Momo','False',1),(277,80,'Buff Kothey mo:mo',309.73,309.73,'Food','Momo','False',1),(278,80,'Chicken  Wrap',345.13,345.13,'Food','Wrap','False',1),(279,80,'Chicken Fry mo:mo',309.73,309.73,'Food','Momo','False',1),(280,80,'Fish & Chips',530.97,530.97,'Food','FISH','False',1),(281,80,'Fish finger',530.97,530.97,'Food','FISH','False',1),(282,80,'Fish Fry Nepali St',486.73,486.73,'Food','FISH','False',1),(283,80,'Fish kurkure',486.73,486.73,'Food','FISH','False',1),(284,80,'Hot garlic Prawn',699.12,699.12,'Food','FISH','False',1),(285,80,'Prawn fry',699.12,699.12,'Food','FISH','False',1),(286,80,'Veg Kothey mo:mo',283.19,283.19,'Food','Momo','False',1),(287,81,'Bacardi 60 ml',327.43,654.86,'Beverage','Rum','False',2),(288,81,'Fish finger',530.97,530.97,'Food','FISH','False',1),(289,81,'Hot garlic Prawn',699.12,699.12,'Food','FISH','False',1),(290,82,'Chicken Curry',398.23,398.23,'Food','Curry','False',1),(291,82,'Glenlivet 30 ml',513.27,513.27,'Beverage','Single Malt','False',1),(292,82,'Glenlivet 60 ml',1061.95,1061.95,'Beverage','Single Malt','False',1),(293,82,'Pork Curry',398.23,398.23,'Food','Curry','False',1),(294,82,'Veg curry',256.64,256.64,'Food','Curry','False',1),(295,83,'Alu tama',194.69,194.69,'Food','Soups','False',1),(296,83,'Chicken mushroom soup',309.73,309.73,'Food','Soups','False',1),(297,83,'House wine Red Glass',530.97,530.97,'Beverage','Red wine','False',1),(298,83,'Mushroom soup',265.49,265.49,'Food','Soups','False',1),(299,84,'Veg Chatamari',132.74,265.48,'Food','Chatamari','False',2),(300,85,'Chicken kurkure',438.05,438.05,'Food','Chicken','False',1),(301,86,'Americano',141.59,283.18,'Beverage','Coffee','False',2),(302,86,'Chicken mushroom soup',309.73,619.46,'Food','Soups','False',2),(303,86,'Pilsner 1ltr',1283.19,2566.38,'Beverage','Beer','False',2),(304,86,'Pork chop',699.12,699.12,'Food','Continental','False',1),(305,87,'Chicken Curry',398.23,398.23,'Food','Curry','False',1),(306,87,'Glenlivet 30 ml',513.27,513.27,'Beverage','Single Malt','False',1),(307,87,'Glenlivet 60 ml',1061.95,1061.95,'Beverage','Single Malt','False',1),(308,87,'Pork Curry',398.23,398.23,'Food','Curry','False',1),(309,87,'Veg curry',256.64,256.64,'Food','Curry','False',1),(310,88,'Alu tama',194.69,194.69,'Food','Soups','False',1),(311,88,'Chicken mushroom soup',309.73,309.73,'Food','Soups','False',1),(312,88,'House wine Red Glass',530.97,530.97,'Beverage','Red wine','False',1),(313,88,'Mushroom soup',265.49,265.49,'Food','Soups','False',1),(314,89,'Veg Chatamari',132.74,265.48,'Food','Chatamari','False',2),(315,90,'Chicken kurkure',438.05,438.05,'Food','Chicken','False',1),(316,91,'Americano',141.59,283.18,'Beverage','Coffee','False',2),(317,91,'Chicken mushroom soup',309.73,619.46,'Food','Soups','False',2),(318,91,'Pilsner 1ltr',1283.19,2566.38,'Beverage','Beer','False',2),(319,91,'Pork chop',699.12,699.12,'Food','Continental','False',1),(320,92,'Chicken Fry mo:mo',309.73,619.46,'Food','Momo','False',2),(321,93,'Chicken Curry',398.23,398.23,'Food','Curry','False',1),(322,93,'Glenlivet 30 ml',513.27,513.27,'Beverage','Single Malt','False',1),(323,93,'Glenlivet 60 ml',1061.95,1061.95,'Beverage','Single Malt','False',1),(324,93,'Pork Curry',398.23,398.23,'Food','Curry','False',1),(325,93,'Veg curry',256.64,256.64,'Food','Curry','False',1),(326,94,'Alu tama',194.69,194.69,'Food','Soups','False',1),(327,94,'Chicken mushroom soup',309.73,309.73,'Food','Soups','False',1),(328,94,'House wine Red Glass',530.97,530.97,'Beverage','Red wine','False',1),(329,94,'Mushroom soup',265.49,265.49,'Food','Soups','False',1),(330,95,'Veg Chatamari',132.74,265.48,'Food','Chatamari','False',2),(331,96,'Chicken kurkure',438.05,438.05,'Food','Chicken','False',1),(332,97,'Americano',141.59,283.18,'Beverage','Coffee','False',2),(333,97,'Chicken mushroom soup',309.73,619.46,'Food','Soups','False',2),(334,97,'Pilsner 1ltr',1283.19,2566.38,'Beverage','Beer','False',2),(335,97,'Pork chop',699.12,699.12,'Food','Continental','False',1),(336,98,'Chicken Fry mo:mo',309.73,619.46,'Food','Momo','False',2),(337,99,'Extra Cheese',132.74,132.74,'Food','Extra Toppings','False',1),(338,99,'Extra Mushroom',61.95,61.95,'Food','Extra Toppings','False',1),(339,99,'Smoked Chicken Pizza',601.77,601.77,'Food','Pizza','False',1),(340,100,'Chicken Curry',398.23,398.23,'Food','Curry','False',1),(341,100,'Glenlivet 30 ml',513.27,513.27,'Beverage','Single Malt','False',1),(342,100,'Glenlivet 60 ml',1061.95,1061.95,'Beverage','Single Malt','False',1),(343,100,'Pork Curry',398.23,398.23,'Food','Curry','False',1),(344,100,'Veg curry',256.64,256.64,'Food','Curry','False',1),(345,101,'Alu tama',194.69,194.69,'Food','Soups','False',1),(346,101,'Chicken mushroom soup',309.73,309.73,'Food','Soups','False',1),(347,101,'House wine Red Glass',530.97,530.97,'Beverage','Red wine','False',1),(348,101,'Mushroom soup',265.49,265.49,'Food','Soups','False',1),(349,102,'Veg Chatamari',132.74,265.48,'Food','Chatamari','False',2),(350,103,'Chicken kurkure',438.05,438.05,'Food','Chicken','False',1),(351,104,'Americano',141.59,283.18,'Beverage','Coffee','False',2),(352,104,'Chicken mushroom soup',309.73,619.46,'Food','Soups','False',2),(353,104,'Pilsner 1ltr',1283.19,2566.38,'Beverage','Beer','False',2),(354,104,'Pork chop',699.12,699.12,'Food','Continental','False',1),(355,105,'Chicken Fry mo:mo',309.73,619.46,'Food','Momo','False',2),(356,106,'Extra Cheese',132.74,132.74,'Food','Extra Toppings','False',1),(357,106,'Extra Mushroom',61.95,61.95,'Food','Extra Toppings','False',1),(358,106,'Smoked Chicken Pizza',601.77,601.77,'Food','Pizza','False',1),(359,107,'Chicken  & Egg Chatamari',221.24,221.24,'Food','Chatamari','False',1),(360,108,'Buff Kothey mo:mo',309.73,619.46,'Food','Momo','False',2),(361,108,'Veg Kothey mo:mo',283.19,283.19,'Food','Momo','False',1),(362,109,'Hazy IPA 500',637.17,637.17,'Beverage','Beer','False',1),(363,110,'Darjeeling pork mo:mo',345.13,345.13,'Food','Momo','False',1),(364,111,'Hot lemon with honey',168.14,168.14,'Beverage','Other Beverages','False',1),(365,112,'Chicken mushroom soup',309.73,309.73,'Food','Soups','False',1),(366,112,'Hot & sour soup Veg',256.64,513.28,'Food','Soups','False',2),(367,112,'Mushroom soup',265.49,265.49,'Food','Soups','False',1),(368,113,'Whisky Sour',663.72,3982.32,'Beverage','Cocktails','False',6);
/*!40000 ALTER TABLE `tblorder_detailshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorderhistory`
--

DROP TABLE IF EXISTS `tblorderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblorderhistory` (
  `idtblorderHistory` int(11) NOT NULL AUTO_INCREMENT,
  `Outlet_OrderID` int(11) DEFAULT NULL,
  `Employee` varchar(200) DEFAULT NULL,
  `Table_No` varchar(100) DEFAULT NULL,
  `NoOfGuests` int(11) DEFAULT NULL,
  `Start_Time` varchar(100) DEFAULT NULL,
  `End_Time` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Discounts` varchar(50) DEFAULT NULL,
  `Date` varchar(25) DEFAULT NULL,
  `bill_no` varchar(15) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `serviceCharge` decimal(10,2) DEFAULT NULL,
  `VAT` decimal(10,2) DEFAULT NULL,
  `DiscountAmt` decimal(10,2) DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `fiscal_year` varchar(11) DEFAULT NULL,
  `GuestName` varchar(100) DEFAULT NULL,
  `Outlet_Name` varchar(100) DEFAULT NULL,
  `billPrintTime` varchar(30) DEFAULT NULL,
  `guestID` varchar(20) DEFAULT NULL,
  `guestEmail` varchar(50) DEFAULT NULL,
  `guestPhone` varchar(20) DEFAULT NULL,
  `guestAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtblorderHistory`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorderhistory`
--

LOCK TABLES `tblorderhistory` WRITE;
/*!40000 ALTER TABLE `tblorderhistory` DISABLE KEYS */;
INSERT INTO `tblorderhistory` VALUES (76,1255,'Abhishek Tuladhar','1',2,'05:32 PM','05:33 PM','Closed','Dine-In','None','2023-04-19','943',2440.00,0.00,280.71,0.00,'Split','','','Club House Restaurant & Bar','05:33 PM','','','',''),(77,1256,'Abhishek Tuladhar','200',2,'11:41','11:42','Closed','Dine-In','None','2023-04-21','944',860.00,0.00,98.94,0.00,'Cash','','','Club House Restaurant & Bar','11:42','','','',''),(78,1257,'Abhishek Tuladhar','1',3,'12:41','12:45','Closed','Dine-In','None','2023-04-23','945',860.00,0.00,98.94,0.00,'Cash','','','Club House Restaurant & Bar','12:43','','','',''),(79,1258,'Abhishek Tuladhar','7',2,'11:57','11:58','Closed','Dine-In','None','2023-04-25','946',1445.00,0.00,166.24,0.00,'Cash','','','Club House Restaurant & Bar','11:58','','','',''),(80,1259,'Abhishek Tuladhar','500',5,'14:15','14:17','Closed','Dine-In','None','2023-04-25','947',5640.00,0.00,648.85,0.00,'Cash','','','Club House Restaurant & Bar','14:16','','','',''),(81,1261,'Abhishek Tuladhar','200',2,'05:05 PM','05:06 PM','Closed','Dine-In','None','2023-04-27','948',2130.00,0.00,245.04,0.00,'Cash','','','Club House Restaurant & Bar','05:05 PM','','','',''),(82,1253,'Abhishek Tuladhar','20',5,'4:46 PM','4:47 PM','Closed','Dine-In','None','2023-04-19','942',2970.00,0.00,341.68,0.00,'Cash','','','Club House Restaurant & Bar','4:47 PM','','','',''),(83,1254,'Abhishek Tuladhar','5',2,'4:49 PM','4:49 PM','Closed','Dine-In','None','2023-04-19','943',1470.00,0.00,169.12,0.00,'Credit Card','','','Club House Restaurant & Bar','4:49 PM','','','',''),(84,1255,'Abhishek Tuladhar','20',6,'4:51 PM','4:51 PM','Closed','Dine-In','None','2023-04-19','944',300.00,0.00,34.51,0.00,'Credit Card','','','Club House Restaurant & Bar','4:51 PM','','','',''),(85,1256,'Abhishek Tuladhar','1',2,'5:29 PM','5:30 PM','Closed','Dine-In','None','2023-04-19','945',495.00,0.00,56.95,0.00,'Credit Card','','','Club House Restaurant & Bar','5:30 PM','','','',''),(86,1257,'Abhishek Tuladhar','1',2,'2:29 PM','2:54 PM','Closed','Dine-In','Normal Discount','2023-04-28','946',4239.00,0.00,487.67,416.81,'Credit Card','','Prabal Kunwar','Club House Restaurant & Bar','2:50 PM','97','','',''),(87,1253,'Abhishek Tuladhar','20',5,'4:46 PM','4:47 PM','Closed','Dine-In','None','2023-04-19','942',2970.00,0.00,341.68,0.00,'Cash','','','Club House Restaurant & Bar','4:47 PM','','','',''),(88,1254,'Abhishek Tuladhar','5',2,'4:49 PM','4:49 PM','Closed','Dine-In','None','2023-04-19','943',1470.00,0.00,169.12,0.00,'Credit Card','','','Club House Restaurant & Bar','4:49 PM','','','',''),(89,1255,'Abhishek Tuladhar','20',6,'4:51 PM','4:51 PM','Closed','Dine-In','None','2023-04-19','944',300.00,0.00,34.51,0.00,'Credit Card','','','Club House Restaurant & Bar','4:51 PM','','','',''),(90,1256,'Abhishek Tuladhar','1',2,'5:29 PM','5:30 PM','Closed','Dine-In','None','2023-04-19','945',495.00,0.00,56.95,0.00,'Credit Card','','','Club House Restaurant & Bar','5:30 PM','','','',''),(91,1257,'Abhishek Tuladhar','1',2,'2:29 PM','2:54 PM','Closed','Dine-In','Normal Discount','2023-04-28','946',4239.00,0.00,487.67,416.81,'Credit Card','','Prabal Kunwar','Club House Restaurant & Bar','2:50 PM','97','','',''),(92,1258,'PRK','9',2,'2:34 PM','3:07 PM','Closed','Dine-In','None','2023-04-28','947',700.00,0.00,80.53,0.00,'Cash','','','Club House Restaurant & Bar','3:07 PM','','','',''),(93,1253,'Abhishek Tuladhar','20',5,'4:46 PM','4:47 PM','Closed','Dine-In','None','2023-04-19','942',2970.00,0.00,341.68,0.00,'Cash','','','Club House Restaurant & Bar','4:47 PM','','','',''),(94,1254,'Abhishek Tuladhar','5',2,'4:49 PM','4:49 PM','Closed','Dine-In','None','2023-04-19','943',1470.00,0.00,169.12,0.00,'Credit Card','','','Club House Restaurant & Bar','4:49 PM','','','',''),(95,1255,'Abhishek Tuladhar','20',6,'4:51 PM','4:51 PM','Closed','Dine-In','None','2023-04-19','944',300.00,0.00,34.51,0.00,'Credit Card','','','Club House Restaurant & Bar','4:51 PM','','','',''),(96,1256,'Abhishek Tuladhar','1',2,'5:29 PM','5:30 PM','Closed','Dine-In','None','2023-04-19','945',495.00,0.00,56.95,0.00,'Credit Card','','','Club House Restaurant & Bar','5:30 PM','','','',''),(97,1257,'Abhishek Tuladhar','1',2,'2:29 PM','2:54 PM','Closed','Dine-In','Normal Discount','2023-04-28','946',4239.00,0.00,487.67,416.81,'Credit Card','','Prabal Kunwar','Club House Restaurant & Bar','2:50 PM','97','','',''),(98,1258,'PRK','9',2,'2:34 PM','3:07 PM','Closed','Dine-In','None','2023-04-28','947',700.00,0.00,80.53,0.00,'Cash','','','Club House Restaurant & Bar','3:07 PM','','','',''),(99,1259,'PRK','2',2,'2:38 PM','3:07 PM','Closed','Dine-In','None','2023-04-28','948',900.00,0.00,103.54,0.00,'Mobile Payment','','','Club House Restaurant & Bar','3:07 PM','','','',''),(100,1253,'Abhishek Tuladhar','20',5,'4:46 PM','4:47 PM','Closed','Dine-In','None','2023-04-19','942',2970.00,0.00,341.68,0.00,'Cash','','','Club House Restaurant & Bar','4:47 PM','','','',''),(101,1254,'Abhishek Tuladhar','5',2,'4:49 PM','4:49 PM','Closed','Dine-In','None','2023-04-19','943',1470.00,0.00,169.12,0.00,'Credit Card','','','Club House Restaurant & Bar','4:49 PM','','','',''),(102,1255,'Abhishek Tuladhar','20',6,'4:51 PM','4:51 PM','Closed','Dine-In','None','2023-04-19','944',300.00,0.00,34.51,0.00,'Credit Card','','','Club House Restaurant & Bar','4:51 PM','','','',''),(103,1256,'Abhishek Tuladhar','1',2,'5:29 PM','5:30 PM','Closed','Dine-In','None','2023-04-19','945',495.00,0.00,56.95,0.00,'Credit Card','','','Club House Restaurant & Bar','5:30 PM','','','',''),(104,1257,'Abhishek Tuladhar','1',2,'2:29 PM','2:54 PM','Closed','Dine-In','Normal Discount','2023-04-28','946',4239.00,0.00,487.67,416.81,'Credit Card','','Prabal Kunwar','Club House Restaurant & Bar','2:50 PM','97','','',''),(105,1258,'PRK','9',2,'2:34 PM','3:07 PM','Closed','Dine-In','None','2023-04-28','947',700.00,0.00,80.53,0.00,'Cash','','','Club House Restaurant & Bar','3:07 PM','','','',''),(106,1259,'PRK','2',2,'2:38 PM','3:07 PM','Closed','Dine-In','None','2023-04-28','948',900.00,0.00,103.54,0.00,'Mobile Payment','','','Club House Restaurant & Bar','3:07 PM','','','',''),(107,1260,'Abhishek Tuladhar','3',4,'3:14 PM','3:14 PM','Closed','Dine-In','None','2023-04-28','',60.00,0.00,0.00,0.00,'Complimentary','','Prasansha Rana','Club House Restaurant & Bar','','98','','',''),(108,1262,'Abhishek Tuladhar','8',2,'12:25 PM','03:18 PM','Closed','Dine-In','None','2023-05-04','949',1020.00,0.00,117.35,0.00,'Cash','','','Club House Restaurant & Bar','03:18 PM','','','',''),(109,1263,'Abhishek Tuladhar','49',8,'05:10 PM','05:10 PM','Closed','Dine-In','None','2023-05-05','950',720.00,0.00,82.83,0.00,'Credit Card','','','Club House Restaurant & Bar','05:10 PM','','','',''),(110,1264,'Abhishek Tuladhar','500',2,'05:11 PM','05:11 PM','Closed','Dine-In','None','2023-05-05','951',390.00,0.00,44.87,0.00,'Cash','','','Club House Restaurant & Bar','05:11 PM','','','',''),(111,1265,'Abhishek Tuladhar','7',2,'05:11 PM','05:11 PM','Closed','Dine-In','None','2023-05-05','952',190.00,0.00,21.86,0.00,'Cash','','','Club House Restaurant & Bar','05:11 PM','','','',''),(112,1266,'Abhishek Tuladhar','5',5,'02:24 PM','03:40 PM','Closed','Dine-In','None','2023-05-09','953',1230.00,0.00,141.50,0.00,'Cash','','','Club House Restaurant & Bar','03:40 PM','','','',''),(113,1267,'Abhishek Tuladhar','100',5,'03:41 PM','03:41 PM','Closed','Dine-In','None','2023-05-09','954',4500.00,0.00,517.70,0.00,'Cash','','','Club House Restaurant & Bar','03:41 PM','','','','');
/*!40000 ALTER TABLE `tblorderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vootoo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 14:39:55
