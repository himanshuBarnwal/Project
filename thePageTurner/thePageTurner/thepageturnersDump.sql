CREATE DATABASE  IF NOT EXISTS `thepageturners` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `thepageturners`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: thepageturners
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_admins_email` (`email`),
  KEY `ix_admins_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Himanshu','admin@gmail.com','$2b$12$wE2S2JyoFpjBWnI7bvhQWOXLNTpgv6dU7vXbtHLdZlbzeFGrsKKGO','Head'),(2,'Rakesh','admin1@gmail.com','$2b$12$tcmR/6TbyDKtdnwoDfW8sOZoBYmBdLisccea8zoovGo/HMCYy0cLC','Librarian');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_request`
--

DROP TABLE IF EXISTS `book_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `isbn` varchar(17) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_book_request_student_id` (`student_id`),
  KEY `ix_book_request_id` (`id`),
  KEY `ix_book_request_isbn` (`isbn`),
  CONSTRAINT `book_request_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `book_request_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_request`
--

LOCK TABLES `book_request` WRITE;
/*!40000 ALTER TABLE `book_request` DISABLE KEYS */;
INSERT INTO `book_request` VALUES (1,1,'978-3-16-546812-9','2023-05-10 01:46:10','accepted','2023-05-10 03:52:37'),(2,1,'978-3-16-148410-0','2023-05-10 02:55:21','accepted','2023-05-10 03:58:45'),(3,1,'978-3-16-546812-9','2023-05-10 03:42:05','accepted','2023-05-10 04:00:12'),(4,1,'978-3-16-148410-5','2023-05-10 04:03:24','rejected','2023-05-10 04:03:37');
/*!40000 ALTER TABLE `book_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `year_of_publication` int DEFAULT NULL,
  `isbn` varchar(17) DEFAULT NULL,
  `available` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_books_isbn` (`isbn`),
  KEY `ix_books_id` (`id`),
  KEY `ix_books_title` (`title`),
  KEY `ix_books_author` (`author`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'A Season of Darkness','Leah Hamilton','Thriller',2009,'978-3-16-148410-0',0),(2,'Beyond the Twilight','Oliver Hale','Fantasy',2012,'978-3-16-546812-9',0),(5,'The Lost City','Megan Bradley','Adventure',2015,'978-3-16-148410-5',1),(6,'The Lost City','Megan Bradley','Adventure',2015,'978-3-16-144410-5',1),(8,'The Lost City','Megan Bradley','Adventure',2015,'978-3-16-665884-2',1),(9,'The Last Gasp','Isabella Grant','Mystery',2010,'978-3-16-793109-5',1),(10,'The Forgotten Island','Emily Taylor','Action',2014,'978-3-16-470098-4',1),(11,'The Ghost Ship','Jonathan Jackson','Horror',2008,'978-3-16-247996-7',1),(12,'The Secret Agent','Alexis White','Suspense',2011,'978-3-16-573254-3',1),(13,'The Blue Diamond','Julia Reed','Romance',2017,'978-3-16-398854-2',1),(14,'The Silent Witness','Ethan Brown','Mystery',2013,'978-3-16-326501-0',1),(15,'The Final Betrayal','Lucy Evans','Thriller',2018,'978-3-16-760442-9',1),(16,'The Deadly Game','Andrew Carter','Action',2007,'978-3-16-530977-8',1),(17,'The Burning Sky','Samantha Green','Fantasy',2016,'978-3-16-627884-5',1),(18,'The Haunting of Hill House','Shirley Jackson','Horror',1959,'978-3-16-322531-2',1),(19,'The Great Gatsby','F. Scott Fitzgerald','Classic',1925,'978-3-16-584550-8',1),(20,'To Kill a Mockingbird','Harper Lee','Classic',1960,'978-3-16-812094-2',1),(21,'1984','George Orwell','Dystopian',1949,'978-3-16-829885-5',1),(22,'Brave New World','Aldous Huxley','Dystopian',1932,'978-3-16-422709-6',1),(23,'The Catcher in the Rye','J.D. Salinger','Classic',1951,'978-3-16-740586-7',1),(24,'The Lord of the Rings','J.R.R. Tolkien','Fantasy',1954,'978-3-16-405267-6',1),(25,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling','Fantasy',1997,'978-3-16-726984-9',1),(26,'The Hunger Games','Suzanne Collins','Dystopian',2008,'978-3-16-945776-1',1),(27,'The Da Vinci Code','Dan Brown','Mystery',2003,'978-3-16-374458-3',1),(28,'The Girl with the Dragon Tattoo','Stieg Larsson','Thriller',2005,'978-3-16-276441-5',1),(29,'The Name of the Wind','Patrick Rothfuss','Fantasy',2007,'978-3-16-894887-4',1),(30,'The Road','Cormac McCarthy','Post-apocalyptic',2006,'978-3-16-618067-5',1),(31,'Pride and Prejudice','Jane Austen','Classic',1813,'978-3-16-958021-7',1),(32,'Sense and Sensibility','Jane Austen','Classic',1811,'978-3-16-920482-1',1),(33,'Persuasion','Jane Austen','Classic',1818,'978-3-16-609421-2',1),(34,'Emma','Jane Austen','Classic',1815,'978-3-16-456098-0',1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_connections_id` (`id`),
  KEY `ix_connections_receiver_id` (`receiver_id`),
  KEY `ix_connections_sender_id` (`sender_id`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `students` (`id`),
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,1,3,'accepted','2023-05-09 19:10:00'),(2,1,2,'pending','2023-05-09 22:10:25'),(3,1,4,'pending','2023-05-09 22:10:39'),(6,4,2,'pending','2023-05-09 22:28:32'),(7,4,3,'pending','2023-05-09 22:28:39');
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `roll_number` varchar(10) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `year_of_admission` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roll_number` (`roll_number`),
  UNIQUE KEY `ix_students_email` (`email`),
  KEY `ix_students_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Himanshu','CSB19063','btech','cse',2020,'123@gmail.com','$2b$12$jMX1djlHvKSGegYQ3.Z6R.vS.U5Z.aXTpwJ9OUF.MqngRVJZMPBIG'),(2,'Sarah Johnson','ENG19A001','Engineering','Mechanical',2019,'sarah.johnson@university.edu','$2b$12$fLJ04Yl2.UfV.kE0oGMGo.QQBIEbwjISqz6I0j1Vu4WqBk2p1w2Gq'),(3,'Alex Smith','SCI20B002','Science','Chemistry',2020,'alex.smith@university.edu','$2b$12$dgOyKZ1.9jnIz3WSuyPnH.Ryf2JwMlzFKd3apowKciiGp8aML236K'),(4,'Emily Brown','LAW21C003','Law','Legal Studies',2021,'emily.brown@university.edu','$2b$12$IBzIXMOO4G/qEN1yvZB9c.uJy5.sr0PXREmxnnX5mk8kGqVb4mybu'),(5,'Pranav','csb19065','btech','cse',2019,'pranav@gmail.com','$2b$12$xrvr2/7HjUlsbwPWrAUnPeJ0ngIO9RS/wld4QzycMmrI8Q.ySKawm'),(10,'John Davis','MED19D004','Medicine','Neurology',2019,'john.davis@university.edu','$2b$12$PmkvWb/6k/FKYmhxiuy9ye9K3h0epKQsctzuhh4rouwflhuDnUfd.'),(11,'Lucy Kim','BUS22E005','Business','Finance',2022,'lucy.kim@university.edu','$2b$12$BQclyZKT8Wm/AITgG2UD5uaRwqJdUdnFvTm/b9hFOQc0oVSwliYvm'),(12,'Joshua Lee','ENG20A006','Engineering','Electrical',2020,'joshua.lee@university.edu','$2b$12$hyBgGqBWMYRx5GKlK732veVjQoYwEJ6rQTcbYgD/6yT.GrzI.pXcq'),(13,'Olivia Johnson','SCI19B007','Science','Physics',2019,'olivia.johnson@university.edu','$2b$12$4BfxDM6TKu.ak6Fopy0L0uVEU9.UY8i3BL0BVwGobJQI/kp8juzQi'),(14,'Avery Hernandez','LAW20C008','Law','International Law',2020,'avery.hernandez@university.edu','$2b$12$6mRe6F6UgX/IBeuuk.ajXeIijDWDLCB6ga0CW6TFi6VPMStf/oBIC'),(15,'Ethan Jones','MED21D009','Medicine','Cardiology',2021,'ethan.jones@university.edu','$2b$12$CYUm2p1NzZHJCwPTao.gw.7wfeHJe0sWk3wqg8WJk1t2pnet5h5Ba'),(16,'Sophia Davis','BUS22E010','Business','Marketing',2022,'sophia.davis@university.edu','$2b$12$tVxLN18Np1OMJRNRRiYbAOn5zx6GbAVOIYUF0jTZcijeOe6y2TK9y'),(17,'Logan Brown','ENG19A011','Engineering','Civil',2019,'logan.brown@university.edu','$2b$12$LCczs4n.RXt7nfkCAv7Gm.yHEz7ULxMu13pqxgIHbCJBiHGLo.l9W'),(18,'Chloe Smith','SCI20B012','Science','Biology',2020,'chloe.smith@university.edu','$2b$12$aHeH4Bw0KPDwovaQ0uRNgOjV6ipqY.ecQyzAhs4K0LqX346I/M9Qy'),(19,'Benjamin Hernandez','LAW21C013','Law','Taxation',2021,'benjamin.hernandez@university.edu','$2b$12$8ZQsgAgEyGBgovd/GM.sNunuLE8b.Ya9tMDgBZW9.36nqMDIABU.m'),(20,'Emma Davis','MED19D014','Medicine','Dermatology',2019,'emma.davis@university.edu','$2b$12$.Ru0jSLdYtZc1BwH1WRr7ud.SW5CFoWkylx3y98vwHz1Z5/gDyg.u'),(21,'Mia Lee','BUS22E015','Business','Human Resources',2022,'mia.lee@university.edu','$2b$12$6u6kegdhjpm7OOLLzJfa.uhUrCo3KAs/l6NlXhlYpC9fcvkp4Enva'),(22,'Daniel Johnson','ENG20A016','Engineering','Mechanical',2020,'daniel.johnson@university.edu','$2b$12$vXWIEWgJvNBRO/ZbkThBb.UObUMo8MO6KSR1G1WgVgsuCL9yfSrSy'),(23,'Evelyn Hernandez','SCI19B017','Science','Physics',2019,'evelyn.hernandez@university.edu','$2b$12$RZlnlbA7WBuPk8srwr4RbOn3G/x2d4qVfHOoL6E2fI6cBvzX3x9xC'),(24,'Michael Davis','LAW20C018','Law','Criminal Law',2020,'michael.davis@university.edu','$2b$12$MvS6mGHF0s6wo3FIPF60L.P10XPF9LxVAwgsRZWIfXC39Lpgsy5Ya'),(25,'Isabella Brown','MED21D019','Medicine','Neurology',2021,'isabella.brown@university.edu','$2b$12$lIilkO3O9HSERUaSkayrVOs5A33Y2Gt.KaPHeufmwhv1ASlKcdpUC'),(26,'William Kim','BUS22E020','Business','Finance',2022,'william.kim@university.edu','$2b$12$A6U4WsHHy93qteTVLnNlFe6NkP5WlI.R0w7/Wz9PDUazk7ZR.CP/G'),(27,'Ava Smith','ENG19A021','Engineering','Electrical',2019,'ava.smith@university.edu','$2b$12$.ytiQeFt7o6TI6cSihQn2eHBJ6aALnGkgAbbpHqXZvhdrICMq1Mgi'),(28,'Noah Lee','SCI20B022','Science','Chemistry',2020,'noah.lee@university.edu','$2b$12$mt8aV2P04B7PYLhUViRuhOUzofCf9RSvWvjJYGj.4BJzKA45BwG.a'),(29,'Victoria Hernandez','LAW21C023','Law','International Law',2021,'victoria.hernandez@university.edu','$2b$12$S5NRGhRldMuDKrWLHjj9tuSx9DXDGVmxRpXZvztult7nzRdNyTlz.'),(30,'Jacob Davis','MED19D024','Medicine','Cardiology',2019,'jacob.davis@university.edu','$2b$12$5dKQa.C6t6u.YUIY5QqdveU5CZN7ZjGp3vsdQvm7Ec38Rl.c4GUY.'),(31,'Samantha Johnson','BUS22E025','Business','Marketing',2022,'samantha.johnson@university.edu','$2b$12$qzH43YunPTy24Eqfi7r57ujg1/Z2WcjgE5MrMYMZXQ3x5s7S/eyj.'),(32,'Alexander Brown','ENG20A026','Engineering','Civil',2020,'alexander.brown@university.edu','$2b$12$Ayl9of2ozujELSNfLPcE4.dV7Fxf.mc8jdLqzMA3ETcomF7nTpof2'),(33,'Madison Smith','SCI19B027','Science','Biology',2019,'madison.smith@university.edu','$2b$12$X7xU7opA35iST6Fnob5zxeF/jcxJNij0Nm74DPpVri2VrXOU1tPsO'),(34,'Christopher Hernandez','LAW20C028','Law','Taxation',2020,'christopher.hernandez@university.edu','$2b$12$5jg7NbwZSrAwn95kevtlzeHZulD86gW1Kd/kv5JWmc4Jh6rEY5maS'),(35,'Abigail Davis','MED21D029','Medicine','Dermatology',2021,'abigail.davis@university.edu','$2b$12$XOjbZ1d1B.H54a7xzx5ak.E/0LBCp7MUWVU7Fn8wb8JNgWHcY2h1G');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11 21:22:43
