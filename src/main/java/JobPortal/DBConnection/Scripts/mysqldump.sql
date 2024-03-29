-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: jobportal
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appliedjobs`
--

DROP TABLE IF EXISTS `appliedjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appliedjobs` (
  `JobID` int(11) NOT NULL,
  `EmpID` int(11) NOT NULL,
  `Approved` varchar(10) NOT NULL,
  KEY `employee_applied_fk` (`EmpID`),
  KEY `job_applied_fk` (`JobID`),
  CONSTRAINT `employee_applied_fk` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_applied_fk` FOREIGN KEY (`JobID`) REFERENCES `jobpost` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appliedjobs`
--

LOCK TABLES `appliedjobs` WRITE;
/*!40000 ALTER TABLE `appliedjobs` DISABLE KEYS */;
INSERT INTO `appliedjobs` VALUES (29,2,'WAIT'),(20,14,'WAIT'),(8,20,'YES'),(19,7,'WAIT'),(13,11,'WAIT'),(10,15,'WAIT'),(35,11,'WAIT'),(7,15,'WAIT'),(16,2,'WAIT'),(43,2,'WAIT'),(25,10,'WAIT'),(40,17,'WAIT'),(25,1,'WAIT'),(43,18,'YES'),(29,3,'WAIT'),(10,6,'NO'),(41,18,'WAIT'),(45,9,'WAIT'),(6,20,'WAIT'),(42,7,'WAIT'),(21,8,'WAIT'),(43,10,'WAIT'),(34,15,'WAIT'),(5,4,'WAIT'),(34,18,'WAIT'),(25,17,'WAIT'),(37,10,'WAIT'),(10,3,'WAIT'),(45,15,'YES'),(15,16,'WAIT'),(4,9,'WAIT'),(23,11,'YES'),(34,20,'WAIT'),(44,18,'WAIT'),(3,10,'WAIT'),(32,3,'NO'),(21,5,'WAIT'),(27,9,'WAIT'),(9,6,'WAIT'),(33,11,'YES'),(23,10,'NO'),(35,20,'NO'),(47,3,'WAIT'),(5,5,'NO'),(4,10,'WAIT'),(45,18,'WAIT'),(27,9,'WAIT'),(46,10,'WAIT'),(7,4,'WAIT'),(38,9,'YES'),(15,7,'NO'),(24,14,'YES'),(4,7,'WAIT'),(25,19,'WAIT'),(18,10,'WAIT'),(34,7,'WAIT'),(3,14,'WAIT'),(36,13,'WAIT'),(10,6,'WAIT'),(37,11,'NO'),(48,1,'WAIT'),(12,8,'NO'),(48,19,'YES'),(48,15,'NO'),(32,18,'WAIT'),(21,20,'WAIT'),(42,15,'WAIT'),(33,10,'NO'),(19,3,'WAIT'),(25,14,'YES'),(26,4,'WAIT'),(36,4,'WAIT'),(49,1,'WAIT'),(10,6,'WAIT'),(16,19,'WAIT'),(10,7,'WAIT'),(5,2,'NO'),(39,9,'WAIT'),(29,16,'WAIT'),(2,7,'WAIT'),(48,1,'NO'),(46,12,'WAIT'),(16,10,'WAIT'),(31,19,'WAIT'),(37,2,'YES'),(13,10,'NO'),(9,7,'WAIT'),(15,20,'YES'),(45,14,'WAIT'),(29,7,'NO'),(41,4,'WAIT'),(44,3,'WAIT'),(33,14,'WAIT'),(28,6,'WAIT'),(16,9,'YES'),(19,15,'WAIT'),(24,2,'NO'),(1,1,'Yes'),(31,12,'WAIT'),(3,14,'WAIT');
/*!40000 ALTER TABLE `appliedjobs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 Trigger insert_new_application
    BEFORE INSERT
    ON appliedjobs
    FOR EACH ROW
BEGIN
    update report set application_count = application_count + 1 where month = month(now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_job_success
    BEFORE UPDATE
    ON appliedjobs
    FOR EACH ROW
BEGIN
    IF NEW.Approved = 'Yes' THEN
        update report set job_success = job_success + 1 where month = month(now());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(16) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `About` varchar(1000) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Credit` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'cclemmens0','Bosco-Mills','Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.','company@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',90),(2,'lbarnsdale1','Jacobs, Batz and Terry','Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.','jlinthead1@exblog.jp','5f4dcc3b5aa765d61d8327deb882cf99',90),(3,'kjeeks2','Barrows-Heller','Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.','pbilbrooke2@cisco.com','5f4dcc3b5aa765d61d8327deb882cf99',90),(4,'cfulleylove3','Waelchi-Zboncak','Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.','ghayes3@goodreads.com','5f4dcc3b5aa765d61d8327deb882cf99',90),(5,'jmcaughtrie4','Graham, Lemke and Mann','Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.','nbedham4@goodreads.com','5f4dcc3b5aa765d61d8327deb882cf99',90),(6,'rivakhno5','Cummerata, McKenzie and Moore','Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.','cguerreiro5@feedburner.com','5f4dcc3b5aa765d61d8327deb882cf99',90),(7,'lhollyland6','Durgan-Kovacek','Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.','ajaggers6@cnn.com','5f4dcc3b5aa765d61d8327deb882cf99',90);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_company_count
    AFTER INSERT
    ON companies
    FOR EACH ROW
BEGIN
    UPDATE report SET company_count = company_count + 1 WHERE month = MONTH(NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_company_count
    AFTER DELETE
    ON companies
    FOR EACH ROW
BEGIN
    UPDATE report SET company_count = company_count - 1 WHERE month = MONTH(NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `About` varchar(1000) NOT NULL,
  `Number` varchar(20) NOT NULL,
  `ComID` int(11) DEFAULT NULL,
  `Role` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `employee_email_uindex` (`Email`),
  KEY `employee_companies_cid_fk` (`ComID`),
  CONSTRAINT `employee_companies_cid_fk` FOREIGN KEY (`ComID`) REFERENCES `companies` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'firstlast@gmail.com','Barbra','Metterick','bmetterick0','5f4dcc3b5aa765d61d8327deb882cf99','Structural Engineer','2329028638',1,0),(2,'admin@jobportal.com','Berke','Gherarducci','bgherarducci1','5f4dcc3b5aa765d61d8327deb882cf99','Internal Auditor','5656156023',5,0),(3,'rdykas2@pinterest.com','Rodi','Dykas','rdykas2','5f4dcc3b5aa765d61d8327deb882cf99','Marketing Assistant','7464098833',4,0),(4,'rdeschelle3@weibo.com','Raff','Deschelle','rdeschelle3','5f4dcc3b5aa765d61d8327deb882cf99','Budget/Accounting Analyst I','6806721574',5,0),(5,'bhembry4@bigcartel.com','Baron','Hembry','bhembry4','5f4dcc3b5aa765d61d8327deb882cf99','Food Chemist','1293969601',2,0),(6,'jbanaszkiewicz5@ox.ac.uk','Jamal','Banaszkiewicz','jbanaszkiewicz5','5f4dcc3b5aa765d61d8327deb882cf99','Community Outreach Specialist','4064386479',2,0),(7,'cbulch6@guardian.co.uk','Carny','Bulch','cbulch6','5f4dcc3b5aa765d61d8327deb882cf99','Geologist IV','1927168375',7,0),(8,'swedgbrow7@free.fr','Siouxie','Wedgbrow','swedgbrow7','5f4dcc3b5aa765d61d8327deb882cf99','Safety Technician IV','8198365815',1,0),(9,'mpods8@gravatar.com','Michaella','Pods','mpods8','5f4dcc3b5aa765d61d8327deb882cf99','Help Desk Technician','1178727856',2,0),(10,'wburberow9@topsy.com','Waiter','Burberow','wburberow9','5f4dcc3b5aa765d61d8327deb882cf99','Staff Scientist','7523744585',1,0),(11,'lkmieca@networksolutions.com','Linn','Kmiec','lkmieca','5f4dcc3b5aa765d61d8327deb882cf99','Food Chemist','1904405840',4,0),(12,'jtullisb@amazon.co.jp','Jordain','Tullis','jtullisb','5f4dcc3b5aa765d61d8327deb882cf99','Director of Sales','2593801186',7,0),(13,'bkamenac@engadget.com','Burgess','Kamena','bkamenac','5f4dcc3b5aa765d61d8327deb882cf99','Accounting Assistant II','4402977640',1,0),(14,'jalpesd@cbslocal.com','Jodee','Alpes','jalpesd','5f4dcc3b5aa765d61d8327deb882cf99','Quality Control Specialist','3602178381',2,0),(15,'gstrawbridgee@rambler.ru','Georgie','Strawbridge','gstrawbridgee','5f4dcc3b5aa765d61d8327deb882cf99','General Manager','3723724745',2,0),(16,'hbazyletsf@mashable.com','Hendrick','Bazylets','hbazyletsf','5f4dcc3b5aa765d61d8327deb882cf99','Desktop Support Technician','5987083785',1,0),(17,'ksaddletong@pagesperso-orange.fr','Kelvin','Saddleton','ksaddletong','5f4dcc3b5aa765d61d8327deb882cf99','VP Accounting','3096716643',6,0),(18,'mbenitoh@ca.gov','Minne','Benito','mbenitoh','5f4dcc3b5aa765d61d8327deb882cf99','Chief Design Engineer','5294901370',1,0),(19,'jblaxtoni@jugem.jp','Jillene','Blaxton','jblaxtoni','5f4dcc3b5aa765d61d8327deb882cf99','Paralegal','9621495515',3,0),(20,'fclayillj@freewebs.com','Filberte','Clayill','fclayillj','5f4dcc3b5aa765d61d8327deb882cf99','Senior Cost Accountant','5931616920',5,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_employee_count
    AFTER INSERT
    ON employee
    FOR EACH ROW
BEGIN
    UPDATE report SET employee_count = employee_count + 1 WHERE month = MONTH(NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_employee_count
    AFTER DELETE
    ON employee
    FOR EACH ROW
BEGIN
    UPDATE report SET employee_count = employee_count - 1 WHERE month = MONTH(NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jobpost`
--

DROP TABLE IF EXISTS `jobpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobpost` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(50) NOT NULL,
  `Vacancy` int(11) NOT NULL,
  `Iplace` varchar(45) NOT NULL,
  `Deadline` varchar(45) NOT NULL,
  `Salary` varchar(45) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Boosted` int(10) NOT NULL,
  `About` varchar(1000) NOT NULL,
  `Requirement` varchar(1000) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `ComID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `company_job_fk` (`ComID`),
  CONSTRAINT `company_job_fk` FOREIGN KEY (`ComID`) REFERENCES `companies` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobpost`
--

LOCK TABLES `jobpost` WRITE;
/*!40000 ALTER TABLE `jobpost` DISABLE KEYS */;
INSERT INTO `jobpost` VALUES (1,'Lamjung',24,'Dhanusa','15/11/2023','163894','Developer IV',30,'Duis dapibus leo leo. quis placerat ex rhoncus vel. Cras non tempus lectus. Morbi massa sapien. malesuada vel tincidunt sit amet. rutrum eu diam. Quisque at arcu ultricies lectus egestas efficitur. Pellentesque elementum quam ac tellus bibendum. vitae elementum tortor pellentesque. Nulla a orci imperdiet. hendrerit arcu vel. finibus nibh. Integer ut sem sed ipsum ullamcorper feugiat id nec turpis. Phasellus ut feugiat purus. Vivamus interdum congue condimentum. Morbi dapibus purus quis nisl feugiat. nec scelerisque libero facilisis. Vivamus placerat felis vestibulum massa efficitur. ac iaculis quam eleifend. Aliquam arcu eros. suscipit at volutpat vitae. interdum at nulla.','Sed sed justo venenatis','Internship',3),(2,'Dhankuta',27,'Ilam','10/04/2024','393542','Desktop Support Technician',30,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','rutrum ultricies tgenerateJobs.sqlortor congue','Internship',4),(3,'Lalitpur',39,'Panchthar','30/09/2023','126482','Structural Engineer',20,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','Cras lobortis orci at nunc finibus tempus Donec ac quam vehicula','Part-Time',5),(4,'Kailali',18,'Kanchanpur','29/03/2024','465607','Quality Engineer',20,'Lorem ipsum dolor sit amet. consectetur adipiscing elit. Pellentesque vel lobortis libero. Duis eleifend. ex eget tempor feugiat. urna nisl mollis ante. sit amet pellentesque neque nulla a ipsum. In nec odio est. Mauris semper ornare ligula eget tristique. Ut nisl purus. imperdiet nec sollicitudin non. tristique ac enim. Cras pretium sapien sem. iaculis vehicula erat consectetur a. Donec mi sapien. congue eu placerat ut. semper in mi. Phasellus a odio enim. Etiam rhoncus. mauris ac efficitur bibendum. erat elit rhoncus massa. non sodales massa risus sed mauris. Vestibulum sed dignissim ipsum.','fermentum dolor Suspendisse eu mi hendrerit','Full-Time',7),(5,'Achham',31,'Bardiya','22/04/2024','330151','Programmer Analyst II',10,'Donec condimentum vitae metus in dictum. Fusce tristique malesuada enim a rutrum. Integer convallis nisi nec ultricies venenatis. Aenean porta dolor interdum purus imperdiet imperdiet. Proin finibus. mauris vitae hendrerit dignissim. velit lorem rutrum sapien. vitae blandit eros nulla eget risus. Duis sed lorem vitae justo porta pulvinar in vitae massa. Aliquam erat volutpat. In nec molestie ligula. Pellentesque dapibus at urna vitae dictum. Donec lobortis rutrum mauris. a scelerisque nisi faucibus non. Morbi malesuada neque non tortor dapibus suscipit. Integer in tristique sem. bibendum pellentesque mi.','Donec vel diam et neque rhoncus varius Aliquam at risus efficitur','Temporary',6),(6,'Chitwan',11,'Dholkha','11/11/2023','460238','Quality Engineer',20,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','blandit ligula quis','One-Time',2),(7,'Surkhet',21,'Rautahat','21/09/2023','420069','Librarian',20,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','suscipit diam at','One-Time',7),(8,'Bardiya',20,'Jumla','03/07/2024','312868','Help Desk Operator',10,'Donec sit amet est nec risus pharetra consequat id a nisi. Donec vestibulum lacus quis elit aliquet. condimentum aliquam metus ullamcorper. Donec dictum venenatis justo. sit amet pretium diam mattis iaculis. Morbi vitae lobortis turpis. Phasellus imperdiet est non finibus aliquet. Praesent sodales vel purus et viverra. Nullam vulputate urna eget dictum consequat.','rhoncus augue sed','Internship',6),(9,'Tanahu',24,'Gulmi','12/11/2023','63652','Product Engineer',20,'Aenean posuere diam in ex pulvinar dignissim. Aenean consectetur malesuada posuere. Nulla facilisi. Nunc euismod est diam. sed congue augue viverra at. Aliquam et orci nec nibh tincidunt placerat quis sed lorem. Fusce non ex a massa varius aliquam ultricies ut diam. Aenean ornare mi sit amet libero pellentesque malesuada ac mollis ante. Fusce pretium auctor nisi id mattis. Proin vitae mi eget neque vulputate porta. Sed ligula mauris. dignissim vel dictum a. porttitor id massa. Curabitur commodo. sapien eu auctor mattis. nunc nisi convallis mi. eget faucibus augue diam non nibh. Nunc augue mi. pulvinar vel felis ac. ornare rutrum nisi. Vestibulum tincidunt libero sed viverra mollis. Quisque tincidunt venenatis massa vel suscipit. Pellentesque suscipit commodo odio. ut vehicula velit hendrerit semper. Nullam nec leo ex.','Maecenas sed lorem ac erat fermentum commodo eget volutpat velit Quisque suscipit ligula sed leo convallis mollis Donec malesuada dolor sit amet libero aliquam','Internship',2),(10,'Dadeldhura',35,'Bajura','26/06/2024','103016','VP Quality Control',30,'Lorem ipsum dolor sit amet. consectetur adipiscing elit. Pellentesque vel lobortis libero. Duis eleifend. ex eget tempor feugiat. urna nisl mollis ante. sit amet pellentesque neque nulla a ipsum. In nec odio est. Mauris semper ornare ligula eget tristique. Ut nisl purus. imperdiet nec sollicitudin non. tristique ac enim. Cras pretium sapien sem. iaculis vehicula erat consectetur a. Donec mi sapien. congue eu placerat ut. semper in mi. Phasellus a odio enim. Etiam rhoncus. mauris ac efficitur bibendum. erat elit rhoncus massa. non sodales massa risus sed mauris. Vestibulum sed dignissim ipsum.','Donec vel eros fermentum','One-Time',3),(11,'Mugu',49,'Bajura','19/11/2023','36209','Civil Engineer',20,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','nec commodo purus consectetur Nullam sed quam eget quam convallis tincidunt Suspendisse blandit quam in ex scelerisque','Temporary',6),(12,'Kalikot',38,'Syangja','05/10/2023','249812','Librarian',20,'Aenean posuere diam in ex pulvinar dignissim. Aenean consectetur malesuada posuere. Nulla facilisi. Nunc euismod est diam. sed congue augue viverra at. Aliquam et orci nec nibh tincidunt placerat quis sed lorem. Fusce non ex a massa varius aliquam ultricies ut diam. Aenean ornare mi sit amet libero pellentesque malesuada ac mollis ante. Fusce pretium auctor nisi id mattis. Proin vitae mi eget neque vulputate porta. Sed ligula mauris. dignissim vel dictum a. porttitor id massa. Curabitur commodo. sapien eu auctor mattis. nunc nisi convallis mi. eget faucibus augue diam non nibh. Nunc augue mi. pulvinar vel felis ac. ornare rutrum nisi. Vestibulum tincidunt libero sed viverra mollis. Quisque tincidunt venenatis massa vel suscipit. Pellentesque suscipit commodo odio. ut vehicula velit hendrerit semper. Nullam nec leo ex.','pretium nulla Phasellus quis sem nec diam viverra convallis nec nec est Duis tempor leo nec tellus vehicula','Part-Time',7),(13,'Myagdi',11,'Khotang','13/03/2024','231922','Mechanical Systems Engineer',30,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','tincidunt tortor Nunc et ex dictum','Part-Time',3),(14,'Palpa',45,'Dadeldhura','27/11/2023','404087','Help Desk Operator',20,'Aenean posuere diam in ex pulvinar dignissim. Aenean consectetur malesuada posuere. Nulla facilisi. Nunc euismod est diam. sed congue augue viverra at. Aliquam et orci nec nibh tincidunt placerat quis sed lorem. Fusce non ex a massa varius aliquam ultricies ut diam. Aenean ornare mi sit amet libero pellentesque malesuada ac mollis ante. Fusce pretium auctor nisi id mattis. Proin vitae mi eget neque vulputate porta. Sed ligula mauris. dignissim vel dictum a. porttitor id massa. Curabitur commodo. sapien eu auctor mattis. nunc nisi convallis mi. eget faucibus augue diam non nibh. Nunc augue mi. pulvinar vel felis ac. ornare rutrum nisi. Vestibulum tincidunt libero sed viverra mollis. Quisque tincidunt venenatis massa vel suscipit. Pellentesque suscipit commodo odio. ut vehicula velit hendrerit semper. Nullam nec leo ex.','blandit ligula quis','Full-Time',7),(15,'Rasuwa',33,'Saptari','29/08/2023','27032','Assistant Media Planner',20,'Donec condimentum vitae metus in dictum. Fusce tristique malesuada enim a rutrum. Integer convallis nisi nec ultricies venenatis. Aenean porta dolor interdum purus imperdiet imperdiet. Proin finibus. mauris vitae hendrerit dignissim. velit lorem rutrum sapien. vitae blandit eros nulla eget risus. Duis sed lorem vitae justo porta pulvinar in vitae massa. Aliquam erat volutpat. In nec molestie ligula. Pellentesque dapibus at urna vitae dictum. Donec lobortis rutrum mauris. a scelerisque nisi faucibus non. Morbi malesuada neque non tortor dapibus suscipit. Integer in tristique sem. bibendum pellentesque mi.','Cras lobortis orci at nunc finibus tempus Donec ac quam vehicula','Temporary',5),(16,'Achham',37,'Dang Deukhuri','16/01/2024','59540','VP Quality Control',30,'Lorem ipsum dolor sit amet. consectetur adipiscing elit. Pellentesque vel lobortis libero. Duis eleifend. ex eget tempor feugiat. urna nisl mollis ante. sit amet pellentesque neque nulla a ipsum. In nec odio est. Mauris semper ornare ligula eget tristique. Ut nisl purus. imperdiet nec sollicitudin non. tristique ac enim. Cras pretium sapien sem. iaculis vehicula erat consectetur a. Donec mi sapien. congue eu placerat ut. semper in mi. Phasellus a odio enim. Etiam rhoncus. mauris ac efficitur bibendum. erat elit rhoncus massa. non sodales massa risus sed mauris. Vestibulum sed dignissim ipsum.','Maecenas sed lorem ac erat fermentum commodo eget volutpat velit Quisque suscipit ligula sed leo convallis mollis Donec malesuada dolor sit amet libero aliquam','Internship',3),(17,'Rautahat',18,'Dolpa','15/01/2024','132508','Media Manager IV',30,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','a malesuada diam tristique','Temporary',6),(18,'Rasuwa',26,'Pyuthan','06/08/2023','213694','Environmental Tech',30,'Cras eleifend at sapien vel vestibulum. Praesent iaculis consequat lacinia. Integer vestibulum sapien nec ipsum faucibus pellentesque. Sed porta mi vel turpis venenatis semper at eu diam. Vestibulum fringilla arcu dignissim condimentum tincidunt. Nulla a commodo mi. Curabitur blandit ante diam. vel tristique tellus ullamcorper sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin nulla ex. consectetur sit amet libero vel. elementum convallis tortor. Pellentesque felis ante. vestibulum sit amet egestas id. pharetra quis justo. Praesent vitae metus id nibh interdum placerat non et tellus. Nulla elementum efficitur mi. ut luctus nibh viverra dapibus. Donec feugiat leo nec velit ultricies. sit amet consequat neque dignissim. Nulla ac mattis libero. consectetur ornare ante. Donec finibus magna eget malesuada ultrices.','facilisis tortor Nam hendrerit neque et mauris rutrum','Full-Time',6),(19,'Achham',46,'Surkhet','09/03/2024','188607','Computer Systems Analyst IV',30,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','accumsan risus','Part-Time',1),(20,'Terhathum',23,'Salyan','29/01/2024','287953','Food Chemist',20,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','Phasellus sit amet arcu at nisl finibus semper Proin cursus ante hendrerit','Part-Time',6),(21,'Lalitpur',11,'Chitwan','01/11/2023','83376','Programmer Analyst IV',30,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','accumsan risus','One-Time',6),(22,'Chitwan',17,'Pokhara','02/11/2023','93540','Payment Adjustment Coordinator',20,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','Donec vel diam et neque rhoncus varius Aliquam at risus efficitur','Internship',7),(23,'Kathmandu',14,'Chitwan','08/08/2023','63862','Data Coordiator',30,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','blandit ligula quis','One-Time',1),(24,'Pokhara',46,'Pokhara','23/03/2024','84233','Community Outreach Specialist',20,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','nec commodo purus consectetur Nullam sed quam eget quam convallis tincidunt Suspendisse blandit quam in ex scelerisque','Internship',4),(25,'Lalitpur',42,'Kathmandu','12/08/2023','70237','Budget/Accounting Analyst I',10,'Duis dapibus leo leo. quis placerat ex rhoncus vel. Cras non tempus lectus. Morbi massa sapien. malesuada vel tincidunt sit amet. rutrum eu diam. Quisque at arcu ultricies lectus egestas efficitur. Pellentesque elementum quam ac tellus bibendum. vitae elementum tortor pellentesque. Nulla a orci imperdiet. hendrerit arcu vel. finibus nibh. Integer ut sem sed ipsum ullamcorper feugiat id nec turpis. Phasellus ut feugiat purus. Vivamus interdum congue condimentum. Morbi dapibus purus quis nisl feugiat. nec scelerisque libero facilisis. Vivamus placerat felis vestibulum massa efficitur. ac iaculis quam eleifend. Aliquam arcu eros. suscipit at volutpat vitae. interdum at nulla.','accumsan risus','Part-Time',4),(26,'Kathmandu',11,'Chitwan','17/06/2023','75426','Health Coach I',30,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','facilisis tortor Nam hendrerit neque et mauris rutrum','Internship',7),(27,'Kathmandu',29,'Lalitpur','26/11/2023','66671','Systems Administrator I',10,'Cras eleifend at sapien vel vestibulum. Praesent iaculis consequat lacinia. Integer vestibulum sapien nec ipsum faucibus pellentesque. Sed porta mi vel turpis venenatis semper at eu diam. Vestibulum fringilla arcu dignissim condimentum tincidunt. Nulla a commodo mi. Curabitur blandit ante diam. vel tristique tellus ullamcorper sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin nulla ex. consectetur sit amet libero vel. elementum convallis tortor. Pellentesque felis ante. vestibulum sit amet egestas id. pharetra quis justo. Praesent vitae metus id nibh interdum placerat non et tellus. Nulla elementum efficitur mi. ut luctus nibh viverra dapibus. Donec feugiat leo nec velit ultricies. sit amet consequat neque dignissim. Nulla ac mattis libero. consectetur ornare ante. Donec finibus magna eget malesuada ultrices.','nec commodo purus consectetur Nullam sed quam eget quam convallis tincidunt Suspendisse blandit quam in ex scelerisque','Internship',6),(28,'Pokhara',41,'Bhaktapur','17/12/2023','75584','Registered Nurse',10,'Lorem ipsum dolor sit amet. consectetur adipiscing elit. Pellentesque vel lobortis libero. Duis eleifend. ex eget tempor feugiat. urna nisl mollis ante. sit amet pellentesque neque nulla a ipsum. In nec odio est. Mauris semper ornare ligula eget tristique. Ut nisl purus. imperdiet nec sollicitudin non. tristique ac enim. Cras pretium sapien sem. iaculis vehicula erat consectetur a. Donec mi sapien. congue eu placerat ut. semper in mi. Phasellus a odio enim. Etiam rhoncus. mauris ac efficitur bibendum. erat elit rhoncus massa. non sodales massa risus sed mauris. Vestibulum sed dignissim ipsum.','Donec vel diam et neque rhoncus varius Aliquam at risus efficitur','Temporary',5),(29,'Bhaktapur',22,'Chitwan','26/08/2023','55322','Quality Control Specialist',10,'Lorem ipsum dolor sit amet. consectetur adipiscing elit. Pellentesque vel lobortis libero. Duis eleifend. ex eget tempor feugiat. urna nisl mollis ante. sit amet pellentesque neque nulla a ipsum. In nec odio est. Mauris semper ornare ligula eget tristique. Ut nisl purus. imperdiet nec sollicitudin non. tristique ac enim. Cras pretium sapien sem. iaculis vehicula erat consectetur a. Donec mi sapien. congue eu placerat ut. semper in mi. Phasellus a odio enim. Etiam rhoncus. mauris ac efficitur bibendum. erat elit rhoncus massa. non sodales massa risus sed mauris. Vestibulum sed dignissim ipsum.','Maecenas sed lorem ac erat fermentum commodo eget volutpat velit Quisque suscipit ligula sed leo convallis mollis Donec malesuada dolor sit amet libero aliquam','Internship',7),(30,'Pokhara',42,'Pokhara','25/02/2024','44007','Human Resources Assistant II',30,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','Donec vel eros fermentum','Full-Time',1),(31,'Pokhara',39,'Bhaktapur','06/07/2023','78548','Structural Analysis Engineer',20,'Lorem ipsum dolor sit amet. consectetur adipiscing elit. Pellentesque vel lobortis libero. Duis eleifend. ex eget tempor feugiat. urna nisl mollis ante. sit amet pellentesque neque nulla a ipsum. In nec odio est. Mauris semper ornare ligula eget tristique. Ut nisl purus. imperdiet nec sollicitudin non. tristique ac enim. Cras pretium sapien sem. iaculis vehicula erat consectetur a. Donec mi sapien. congue eu placerat ut. semper in mi. Phasellus a odio enim. Etiam rhoncus. mauris ac efficitur bibendum. erat elit rhoncus massa. non sodales massa risus sed mauris. Vestibulum sed dignissim ipsum.','','Temporary',3),(32,'Bhaktapur',16,'Lalitpur','07/03/2024','46920','Recruiter',20,'Donec condimentum vitae metus in dictum. Fusce tristique malesuada enim a rutrum. Integer convallis nisi nec ultricies venenatis. Aenean porta dolor interdum purus imperdiet imperdiet. Proin finibus. mauris vitae hendrerit dignissim. velit lorem rutrum sapien. vitae blandit eros nulla eget risus. Duis sed lorem vitae justo porta pulvinar in vitae massa. Aliquam erat volutpat. In nec molestie ligula. Pellentesque dapibus at urna vitae dictum. Donec lobortis rutrum mauris. a scelerisque nisi faucibus non. Morbi malesuada neque non tortor dapibus suscipit. Integer in tristique sem. bibendum pellentesque mi.','nec commodo purus consectetur Nullam sed quam eget quam convallis tincidunt Suspendisse blandit quam in ex scelerisque','Full-Time',1),(33,'Bhaktapur',41,'Kathmandu','29/08/2023','81957','Physical Therapy Assistant',10,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','Donec vel diam et neque rhoncus varius Aliquam at risus efficitur','Full-Time',6),(34,'Lalitpur',29,'Bhaktapur','05/12/2023','84417','Recruiter',30,'Aenean posuere diam in ex pulvinar dignissim. Aenean consectetur malesuada posuere. Nulla facilisi. Nunc euismod est diam. sed congue augue viverra at. Aliquam et orci nec nibh tincidunt placerat quis sed lorem. Fusce non ex a massa varius aliquam ultricies ut diam. Aenean ornare mi sit amet libero pellentesque malesuada ac mollis ante. Fusce pretium auctor nisi id mattis. Proin vitae mi eget neque vulputate porta. Sed ligula mauris. dignissim vel dictum a. porttitor id massa. Curabitur commodo. sapien eu auctor mattis. nunc nisi convallis mi. eget faucibus augue diam non nibh. Nunc augue mi. pulvinar vel felis ac. ornare rutrum nisi. Vestibulum tincidunt libero sed viverra mollis. Quisque tincidunt venenatis massa vel suscipit. Pellentesque suscipit commodo odio. ut vehicula velit hendrerit semper. Nullam nec leo ex.','Maecenas sed lorem ac erat fermentum commodo eget volutpat velit Quisque suscipit ligula sed leo convallis mollis Donec malesuada dolor sit amet libero aliquam','One-Time',3),(35,'Lalitpur',21,'Lalitpur','26/10/2023','37102','Occupational Therapist',10,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','Maecenas sed lorem ac erat fermentum commodo eget volutpat velit Quisque suscipit ligula sed leo convallis mollis Donec malesuada dolor sit amet libero aliquam','Part-Time',6),(36,'Kathmandu',34,'Chitwan','22/08/2023','58648','VP Accounting',10,'Cras eleifend at sapien vel vestibulum. Praesent iaculis consequat lacinia. Integer vestibulum sapien nec ipsum faucibus pellentesque. Sed porta mi vel turpis venenatis semper at eu diam. Vestibulum fringilla arcu dignissim condimentum tincidunt. Nulla a commodo mi. Curabitur blandit ante diam. vel tristique tellus ullamcorper sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin nulla ex. consectetur sit amet libero vel. elementum convallis tortor. Pellentesque felis ante. vestibulum sit amet egestas id. pharetra quis justo. Praesent vitae metus id nibh interdum placerat non et tellus. Nulla elementum efficitur mi. ut luctus nibh viverra dapibus. Donec feugiat leo nec velit ultricies. sit amet consequat neque dignissim. Nulla ac mattis libero. consectetur ornare ante. Donec finibus magna eget malesuada ultrices.','tincidunt tortor Nunc et ex dictum','Internship',1),(37,'Lalitpur',36,'Kathmandu','23/10/2023','34365','Quality Engineer',20,'Duis dapibus leo leo. quis placerat ex rhoncus vel. Cras non tempus lectus. Morbi massa sapien. malesuada vel tincidunt sit amet. rutrum eu diam. Quisque at arcu ultricies lectus egestas efficitur. Pellentesque elementum quam ac tellus bibendum. vitae elementum tortor pellentesque. Nulla a orci imperdiet. hendrerit arcu vel. finibus nibh. Integer ut sem sed ipsum ullamcorper feugiat id nec turpis. Phasellus ut feugiat purus. Vivamus interdum congue condimentum. Morbi dapibus purus quis nisl feugiat. nec scelerisque libero facilisis. Vivamus placerat felis vestibulum massa efficitur. ac iaculis quam eleifend. Aliquam arcu eros. suscipit at volutpat vitae. interdum at nulla.','Sed sed justo venenatis','Full-Time',5),(38,'Lalitpur',35,'Bhaktapur','25/03/2024','82587','Executive Secretary',20,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','blandit ligula quis','Temporary',4),(39,'Lalitpur',25,'Lalitpur','18/08/2023','71825','Senior Developer',10,'Donec condimentum vitae metus in dictum. Fusce tristique malesuada enim a rutrum. Integer convallis nisi nec ultricies venenatis. Aenean porta dolor interdum purus imperdiet imperdiet. Proin finibus. mauris vitae hendrerit dignissim. velit lorem rutrum sapien. vitae blandit eros nulla eget risus. Duis sed lorem vitae justo porta pulvinar in vitae massa. Aliquam erat volutpat. In nec molestie ligula. Pellentesque dapibus at urna vitae dictum. Donec lobortis rutrum mauris. a scelerisque nisi faucibus non. Morbi malesuada neque non tortor dapibus suscipit. Integer in tristique sem. bibendum pellentesque mi.','blandit ligula quis','Part-Time',4),(40,'Lalitpur',41,'Kathmandu','24/11/2023','23890','Senior Quality Engineer',30,'Aenean posuere diam in ex pulvinar dignissim. Aenean consectetur malesuada posuere. Nulla facilisi. Nunc euismod est diam. sed congue augue viverra at. Aliquam et orci nec nibh tincidunt placerat quis sed lorem. Fusce non ex a massa varius aliquam ultricies ut diam. Aenean ornare mi sit amet libero pellentesque malesuada ac mollis ante. Fusce pretium auctor nisi id mattis. Proin vitae mi eget neque vulputate porta. Sed ligula mauris. dignissim vel dictum a. porttitor id massa. Curabitur commodo. sapien eu auctor mattis. nunc nisi convallis mi. eget faucibus augue diam non nibh. Nunc augue mi. pulvinar vel felis ac. ornare rutrum nisi. Vestibulum tincidunt libero sed viverra mollis. Quisque tincidunt venenatis massa vel suscipit. Pellentesque suscipit commodo odio. ut vehicula velit hendrerit semper. Nullam nec leo ex.','blandit ligula quis','One-Time',5),(41,'Chitwan',25,'Lalitpur','22/09/2023','87042','Physical Therapy Assistant',20,'Aenean posuere diam in ex pulvinar dignissim. Aenean consectetur malesuada posuere. Nulla facilisi. Nunc euismod est diam. sed congue augue viverra at. Aliquam et orci nec nibh tincidunt placerat quis sed lorem. Fusce non ex a massa varius aliquam ultricies ut diam. Aenean ornare mi sit amet libero pellentesque malesuada ac mollis ante. Fusce pretium auctor nisi id mattis. Proin vitae mi eget neque vulputate porta. Sed ligula mauris. dignissim vel dictum a. porttitor id massa. Curabitur commodo. sapien eu auctor mattis. nunc nisi convallis mi. eget faucibus augue diam non nibh. Nunc augue mi. pulvinar vel felis ac. ornare rutrum nisi. Vestibulum tincidunt libero sed viverra mollis. Quisque tincidunt venenatis massa vel suscipit. Pellentesque suscipit commodo odio. ut vehicula velit hendrerit semper. Nullam nec leo ex.','Sed sed justo venenatis','Internship',3),(42,'Pokhara',10,'Bhaktapur','17/07/2023','85254','Account Representative III',20,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','blandit ligula quis','Part-Time',3),(43,'Bhaktapur',15,'Pokhara','25/06/2023','40213','Senior Editor',20,'Lorem ipsum dolor sit amet. consectetur adipiscing elit. Pellentesque vel lobortis libero. Duis eleifend. ex eget tempor feugiat. urna nisl mollis ante. sit amet pellentesque neque nulla a ipsum. In nec odio est. Mauris semper ornare ligula eget tristique. Ut nisl purus. imperdiet nec sollicitudin non. tristique ac enim. Cras pretium sapien sem. iaculis vehicula erat consectetur a. Donec mi sapien. congue eu placerat ut. semper in mi. Phasellus a odio enim. Etiam rhoncus. mauris ac efficitur bibendum. erat elit rhoncus massa. non sodales massa risus sed mauris. Vestibulum sed dignissim ipsum.','Phasellus sit amet arcu at nisl finibus semper Proin cursus ante hendrerit','Temporary',6),(44,'Lalitpur',45,'Pokhara','12/01/2024','39440','Nurse',10,'Donec sit amet est nec risus pharetra consequat id a nisi. Donec vestibulum lacus quis elit aliquet. condimentum aliquam metus ullamcorper. Donec dictum venenatis justo. sit amet pretium diam mattis iaculis. Morbi vitae lobortis turpis. Phasellus imperdiet est non finibus aliquet. Praesent sodales vel purus et viverra. Nullam vulputate urna eget dictum consequat.','facilisis tortor Nam hendrerit neque et mauris rutrum','Internship',1),(45,'Lalitpur',49,'Pokhara','04/11/2023','97220','Technical Writer',30,'Aenean posuere diam in ex pulvinar dignissim. Aenean consectetur malesuada posuere. Nulla facilisi. Nunc euismod est diam. sed congue augue viverra at. Aliquam et orci nec nibh tincidunt placerat quis sed lorem. Fusce non ex a massa varius aliquam ultricies ut diam. Aenean ornare mi sit amet libero pellentesque malesuada ac mollis ante. Fusce pretium auctor nisi id mattis. Proin vitae mi eget neque vulputate porta. Sed ligula mauris. dignissim vel dictum a. porttitor id massa. Curabitur commodo. sapien eu auctor mattis. nunc nisi convallis mi. eget faucibus augue diam non nibh. Nunc augue mi. pulvinar vel felis ac. ornare rutrum nisi. Vestibulum tincidunt libero sed viverra mollis. Quisque tincidunt venenatis massa vel suscipit. Pellentesque suscipit commodo odio. ut vehicula velit hendrerit semper. Nullam nec leo ex.','suscipit diam at','Temporary',7),(46,'Pokhara',20,'Lalitpur','23/02/2024','54075','Biostatistician II',10,'Cras ipsum ex. accumsan ac mi sed. vestibulum rhoncus libero. Vivamus rutrum enim vel ligula hendrerit efficitur. Quisque venenatis enim dignissim urna tempus. non fermentum tellus finibus. Sed rhoncus. nisl vitae tempor egestas. turpis ipsum bibendum orci. eu lobortis felis sapien vel felis. Nunc nec bibendum neque. In hac habitasse platea dictumst. Nunc ornare nisi a sapien elementum elementum.','rutrum ultricies tortor congue','Internship',3),(47,'Bhaktapur',14,'Pokhara','01/10/2023','69918','Payment Adjustment Coordinator',30,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','blandit ligula quis','Full-Time',4),(48,'Kathmandu',36,'Bhaktapur','22/10/2023','91373','Assistant Media Planner',20,'Donec dui nisl. rhoncus eu lacinia eget. accumsan ut velit. Nunc a ligula elementum. porta ante ac. auctor ex. Vivamus in maximus elit. Cras elit enim. efficitur in sapien non. accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi. maximus ac vehicula et. egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.','Maecenas sed lorem ac erat fermentum commodo eget volutpat velit Quisque suscipit ligula sed leo convallis mollis Donec malesuada dolor sit amet libero aliquam','Internship',4),(49,'Bhaktapur',17,'Bhaktapur','11/08/2023','91151','Nurse Practicioner',20,'Aenean posuere diam in ex pulvinar dignissim. Aenean consectetur malesuada posuere. Nulla facilisi. Nunc euismod est diam. sed congue augue viverra at. Aliquam et orci nec nibh tincidunt placerat quis sed lorem. Fusce non ex a massa varius aliquam ultricies ut diam. Aenean ornare mi sit amet libero pellentesque malesuada ac mollis ante. Fusce pretium auctor nisi id mattis. Proin vitae mi eget neque vulputate porta. Sed ligula mauris. dignissim vel dictum a. porttitor id massa. Curabitur commodo. sapien eu auctor mattis. nunc nisi convallis mi. eget faucibus augue diam non nibh. Nunc augue mi. pulvinar vel felis ac. ornare rutrum nisi. Vestibulum tincidunt libero sed viverra mollis. Quisque tincidunt venenatis massa vel suscipit. Pellentesque suscipit commodo odio. ut vehicula velit hendrerit semper. Nullam nec leo ex.','Phasellus sit amet arcu at nisl finibus semper Proin cursus ante hendrerit','Internship',2),(50,'Pokhara',12,'Bhaktapur','11/06/2023','67727','Operator',30,'Donec sit amet est nec risus pharetra consequat id a nisi. Donec vestibulum lacus quis elit aliquet. condimentum aliquam metus ullamcorper. Donec dictum venenatis justo. sit amet pretium diam mattis iaculis. Morbi vitae lobortis turpis. Phasellus imperdiet est non finibus aliquet. Praesent sodales vel purus et viverra. Nullam vulputate urna eget dictum consequat.','rutrum ultricies tortor congue','Internship',5);
/*!40000 ALTER TABLE `jobpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommend` (
  `JobID` int(11) NOT NULL,
  `RecID` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  KEY `recommend_employee_eid_fk` (`RecID`),
  KEY `recommend_employee_email_fk` (`Email`),
  KEY `recommend_jobpost_jid_fk` (`JobID`),
  CONSTRAINT `recommend_employee_eid_fk` FOREIGN KEY (`RecID`) REFERENCES `employee` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommend_employee_email_fk` FOREIGN KEY (`Email`) REFERENCES `employee` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommend_jobpost_jid_fk` FOREIGN KEY (`JobID`) REFERENCES `jobpost` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend`
--

LOCK TABLES `recommend` WRITE;
/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `month` int(11) DEFAULT NULL,
  `employee_count` int(11) DEFAULT 0,
  `company_count` int(11) DEFAULT 0,
  `job_count` int(11) DEFAULT 0,
  `application_count` int(11) DEFAULT 0,
  `job_success` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,8,6,8,8,7),(2,5,5,7,10,8),(3,5,8,10,9,5),(4,9,10,9,8,6),(5,8,9,10,9,6),(6,7,10,9,9,5),(7,5,6,9,9,9),(8,7,8,7,7,5),(9,8,6,5,8,6),(10,9,7,7,10,9),(11,5,5,7,10,7),(12,6,5,5,8,5);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EmpID` int(11) NOT NULL,
  `ComID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Comment` varchar(700) NOT NULL,
  PRIMARY KEY (`EmpID`,`ComID`),
  UNIQUE KEY `review_id_uindex` (`ID`),
  KEY `reviews_employee_cid_cid_fk` (`ComID`),
  CONSTRAINT `reviews_employee_cid_cid_fk` FOREIGN KEY (`ComID`) REFERENCES `companies` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (28,1,1,4,'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.'),(39,1,6,4,'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.'),(22,2,1,4,'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),(4,2,2,3,'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.'),(44,2,5,5,'Donec quis orci eget orci vehicula condimentum.'),(3,2,6,4,'Aliquam non mauris.'),(26,2,7,3,'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.'),(11,4,2,5,'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.'),(42,4,4,5,'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.'),(27,4,6,5,'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.'),(18,6,1,4,'Donec quis orci eget orci vehicula condimentum.'),(23,6,2,4,'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),(12,6,3,4,'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.'),(31,6,4,3,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.'),(30,6,5,3,'Aliquam non mauris. Morbi non lectus.'),(15,6,7,3,'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.'),(5,7,1,3,'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),(38,9,7,3,'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.'),(36,10,6,4,'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),(16,11,6,5,'Aenean lectus.'),(21,12,1,4,'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.'),(35,12,2,5,'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.'),(29,12,4,5,'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.'),(20,13,3,3,'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.'),(19,13,7,4,'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.'),(32,14,2,4,'Etiam vel augue. Vestibulum rutrum rutrum neque.'),(13,14,4,5,'Nulla nisl. Nunc nisl.'),(6,14,7,5,'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.'),(25,15,4,3,'Praesent lectus.'),(17,15,5,5,'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.'),(41,16,1,4,'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.'),(14,16,2,3,'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),(24,16,5,4,'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.'),(40,17,1,5,'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.'),(2,17,4,5,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.'),(7,17,7,5,'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),(8,18,1,4,'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.'),(10,18,3,3,'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.'),(33,18,4,5,'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.'),(34,18,6,5,'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.'),(1,19,2,3,'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.'),(37,19,5,5,'Praesent blandit.'),(43,20,1,4,'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.'),(9,20,7,3,'Praesent blandit.');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `UserID` varchar(5) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `Time` varchar(30) NOT NULL,
  PRIMARY KEY (`Type`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-29 10:44:12
