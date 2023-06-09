-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: nikeshop2
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Shoes'),(2,'Shirts'),(3,'Shorts'),(4,'Caps'),(5,'wallet222');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `FKbtex7kw1vv34hjdy08rx6d1q5` (`item_id`),
  CONSTRAINT `FKbtex7kw1vv34hjdy08rx6d1q5` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iorder`
--

DROP TABLE IF EXISTS `iorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iorder` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `time_order` varchar(255) DEFAULT NULL,
  `time_delivery` varchar(255) DEFAULT NULL,
  `total_payment` double DEFAULT NULL,
  `status` int DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `name_receiver` varchar(255) DEFAULT NULL,
  `address_reciver` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iorder`
--

LOCK TABLES `iorder` WRITE;
/*!40000 ALTER TABLE `iorder` DISABLE KEYS */;
INSERT INTO `iorder` VALUES (1,'nothing','10:14 AM','none',3.519,1,'1234567','user abc','Los Angeles','mail2@gmail.com'),(2,'nothing','03:13 AM','none',882.43,1,'123523','user xcv','America','mail3@gmail.com'),(3,'','2023-06-10','2023-06-10',6.018000000000001,1,'+1 (817) 492-2197','Consectetur ut molli','Qui ipsam asperiores','hotyxudu@mailinator.com'),(4,'','2023-06-10','',3.519,0,'','','','');
/*!40000 ALTER TABLE `iorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount_price` double DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_ITEM_CATEGORY` (`category_id`),
  KEY `FK_ITEM_TYPE` (`type_id`),
  CONSTRAINT `FK_ITEM_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_ITEM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Nike Air Force 1 \'07','White','EU 36',1,3.519,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/572475a8-427c-43a6-9fa9-5d41827fc848/air-force-1-07-shoes-hr5tH4.png'),(2,'Nike Air Max Alpha Trainer 5000','White','EU41',1,2.499,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/05ecb631-d5d9-4de7-9bac-80a460617586/air-max-alpha-trainer-5-training-shoes-x8Jzj6.png'),(3,'Air Jordan 1 Mid SE','White','EU40',1,3.829,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/be2f9230-5c8b-4393-b638-0811051284ae/air-jordan-1-mid-se-shoes-BcB3MD.png'),(4,'Nike Alphafly 2','White','EU40',1,8.369,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c24ddc33-6e38-4cc9-b548-dc48cd3528ea/alphafly-2-road-racing-shoes-pTSZRk.png'),(5,'Nike Victory G Lite NN','White','EU40',1,2.069,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/7eef2c77-ff0b-4a89-99bc-ead40048ad7f/victory-g-lite-nn-golf-shoes-j0jM2m.png'),(6,'Air Jordan XXXVII Low PF','Black','EU40',1,5.129,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/9cb30549-fe13-4998-ad7d-6c2876be3b5b/air-jordan-xxxvii-low-pf-basketball-shoes-7z7ltC.png'),(7,'Nike Zoom Superfly Elite 2','Pink','EU40',1,4.409,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/563f8a66-62f2-4a58-8f34-05a9a4007450/zoom-superfly-elite-2-athletics-sprinting-spikes-bDFmq0.png'),(8,'Nike Zoom Fly 5','Black','EU42',1,4.699,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ee18eb38-d735-4ce0-a3ac-6ca94f750027/zoom-fly-5-road-running-shoes-lkx7Zp.png'),(9,'KD Trey 5 X EP','White','EU41',1,2.649,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/57b45fef-45f0-4fe6-9db9-b0173385ce3d/kd-trey-5-ep-basketball-shoes-mkllTG.png'),(10,'Nike Offcourt Adjust','Black','EU41',1,1.329,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/09a69272-faf2-4e43-b773-a10503e3f0f6/offcourt-adjust-slides-6L2C07.png'),(11,'Air Jordan 1 Mid','Red','EU35',2,3.669,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d63cb565-a8fa-4731-89c9-144b41591c4f/air-jordan-1-mid-shoes-86f1ZW.png'),(12,'Nike Air Force 1 \'07 LX','Golden','EU35',2,3.089,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6afd6931-9628-405d-ab34-35962b55dac0/air-force-1-07-lx-shoes-9ngpX4.png'),(13,'Nike Air Force 1 Shadow','White','EU36',2,3.519,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/470ab209-df88-4686-b67a-9f729c0b3fe2/air-force-1-shadow-shoes-mN8Glx.png'),(14,'Nike AF-1 Shadow','Brown','EU37',2,3.829,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/34daf410-4fec-46c4-8ce4-47721a8b66f9/af-1-shadow-shoes-MjtPWr.png'),(15,'Nike Zoom SuperRep 4 Next Nature','Pink','EU36',2,3.829,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/7bdb26de-8c7c-40b2-8cab-8be302d2777c/zoom-superrep-4-next-nature-hiit-class-shoes-vL8WXL.png'),(16,'Nike Revolution 6 Next Nature','Black','EU36',2,1.759,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d9b5defa-2dcb-4a0c-9150-592f2195bad4/revolution-6-next-nature-road-running-shoes-vjrrwc.png'),(17,'Nike Air Max Flyknit Racer','Black','EU37',2,4.699,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/83b207b8-e8c6-4e36-be03-132f2683f192/air-max-flyknit-racer-shoes-rVNTNl.png'),(18,'NikeCourt Air Zoom Lite 3','Pink','EU35',2,2.069,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f6be3470-5900-4468-ab24-ccdc50ead2ae/nikecourt-air-zoom-lite-3-tennis-shoes-6f6J0W.png'),(19,'Nike Spark','Violet','EU35',2,4.109,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/b93f8703-cb87-49b3-b1f0-68485d94a1ea/spark-shoes-zPVQHZ.png'),(20,'Nike Go FlyEase','Black','EU37',2,3.829,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c76e2119-acb7-4944-9085-d4f5ae2bda4a/go-flyease-easy-on-off-shoes-3svRCL.png'),(21,'Jordan 1 Low Alt','Red','EU17',3,1.399,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/b7b3fd34-22c5-40dd-90ff-c91bdfed1cb7/jordan-1-low-alt-shoes-RCQGFn.png'),(22,'Nike Dynamo Go SE','Orange','EU17',3,1.709,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/364e9d36-34bd-4b9e-a70b-83ca07719b10/dynamo-go-se-easy-on-off-shoes-HM4Sl8.png'),(23,'NikeCourt Legacy','White','EU19',3,889,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0a40db7d-ee41-40ac-a508-7982769c5ac4/nikecourt-legacy-and-shoe-3MMGC9.png'),(24,'Jordan Stay Loyal 2','Black','EU36',3,2.419,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/edb101ea-7e82-46f0-ae57-efcd17db5eaf/jordan-stay-loyal-2-older-shoes-6Z27xv.png'),(25,'Nike Court Borough Low 2','Black','EU35',3,1.279,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/i1-bacffbd1-ba4b-4792-8e7c-4c7274035c2f/court-borough-low-2-older-shoes-chDVgV.png'),(26,'Nike E-Series 1.0','Pink','EU35',3,1.909,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/26b8fdd2-75ba-4306-b58f-f638340009d2/e-series-1-older-shoes-xNbr6X.png'),(27,'Nike Air Max 90 LTR','White','EU36',3,2.549,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0976169b-51e4-44d7-91cd-b3b1bc76e37b/air-max-90-ltr-older-shoes-M0TsXt.png'),(28,'Nike Revolution 6','Violet','EU37',3,1.329,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f506bd0c-e1ac-4769-9a9b-aaabbedda1a1/revolution-6-younger-shoes-d8d8lG.png'),(29,'Nike Star Runner 3','Pink','18',3,1.149,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/747384b5-3d7f-4fb1-93f3-c96a44e51a9e/star-runner-3-shoes-7321HF.png'),(30,'Air Jordan 1 Mid SE','Orange','EU35',3,2.809,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0871c6cb-9776-4ec6-942c-5fa58b04f041/air-jordan-1-mid-se-older-shoes-H5B9mr.png'),(31,'Nike Sportswear','Teal','L',1,819,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/242e93bd-ea77-4a72-99ae-ffcadcd15f3d/sportswear-t-shirt-zmMkxS.png'),(32,'Nike Dri-FIT','Navy','XL',1,659,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/9166ca3b-b9c0-4f31-8b72-0e593a2f1ddc/dri-fit-fitness-t-shirt-PDvL9m.png'),(33,'Nike Max90','Black','XL',1,919,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/801810e7-93af-412d-88c0-aee43f74f574/max90-all-over-print-basketball-t-shirt-Bg6CnP.png'),(34,'Nike Dri-FIT UV Hyverse','Pink','L',1,1.119,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/9730e70e-bf32-4f59-b182-96420e1bcfe9/dri-fit-uv-hyverse-short-sleeve-fitness-top-Ng4LHB.png'),(35,'Nike \'Just Do It.\'','Orange','L',1,919,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/83155577-e09e-4655-b0f9-5ba434d9fcbf/just-do-it-long-sleeve-t-shirt-gZmbh8.png'),(36,'Nike Dri-FIT','Gray','L',1,819,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/a8b3743b-78f6-4a7f-b555-69f7ba11676f/dri-fit-fitness-t-shirt-njv6Wq.png'),(37,'Nike Dri-FIT Academy','Cyan','L',1,919,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/28d81c91-ce4b-486a-9066-60a679ca89d9/dri-fit-academy-short-sleeve-graphic-football-top-bBN0Ht.png'),(38,'Jordan Flight MVP','Orange','XL',1,869,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/07f72356-0147-485f-9b29-46a4d1916303/jordan-flight-mvp-graphic-t-shirt-1qXkl8.png'),(39,'Nike SB','Black','XL',1,659,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/38f62de2-ae3b-4468-869e-58a8a541daf9/sb-logo-skate-t-shirt-LBBxZV.png'),(40,'Nike Sportswear','White','XL',1,819,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ac8e2ac9-b470-4c07-bd13-52eb321f67bd/sportswear-t-shirt-n7bNsJ.png'),(41,'Nike Dri-FIT Form','Tan','L',1,1.019,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d1b60d08-6ab7-4038-a177-665bde390850/dri-fit-form-18cm-unlined-versatile-shorts-X1m0FM.png'),(42,'Nike DNA','Black','L',1,1.739,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d53d245a-a438-402d-ab93-7cc04191b367/dna-woven-basketball-trousers-468S6k.png'),(43,'Nike Dri-FIT Unlimited','Black','XL',1,1.579,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0947f364-a6fe-4932-8498-7b8bc43de416/dri-fit-unlimited-18cm-2-in-1-versatile-shorts-RfSbKg.png'),(44,'Nike Circa','White','XL',1,2.039,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/bf0c62b2-4f46-4c27-a75a-6ba8bb7ac9b0/circa-20cm-basketball-shorts-V7ccKq.png'),(45,'Nike Dri-FIT Unlimited','Pink','L',1,1.579,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/925af000-d976-4419-aedc-424732fcef0c/dri-fit-unlimited-18cm-unlined-versatile-shorts-nq5p7P.png'),(46,'Nike Dri-FIT Challenger','Black','L',1,1.579,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8b080ecc-358a-457a-9da7-d00d3076632b/dri-fit-challenger-knit-running-trousers-NxKxTz.png'),(47,'Nike Sportswear Therma-FIT ADV Tech Pack','Gray','XL',1,2.959,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d4511995-df8f-4860-9071-bc9b1a6975ad/sportswear-adv-tech-pack-trousers-JC0r34.png'),(48,'Nike Sportswear Air','Black','XL',1,1.939,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c6618f2e-89f0-445b-9b9e-d67be113bacc/sportswear-air-poly-knit-trousers-q4jMFC.png'),(49,'Paris Saint-Germain','Black','XL',1,2.299,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/b0675062-54fc-4706-a7b4-95bff1d59c22/paris-saint-germain-woven-trousers-HVgZRx.png'),(50,'Nike Sportswear Heritage86 Futura Washed','Violet','',1,539,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/684bc6d2-e67d-46fd-960f-7d06049d87cc/sportswear-heritage86-futura-washed-hat-9zdC2m.png'),(51,'Nike Dri-FIT AeroBill Featherlight','Black','',1,609,0,4,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6623eaa2-c5c6-49ac-b5e6-1a9ea14077b0/dri-fit-aerobill-featherlight-perforated-running-cap-0sTv3T.png'),(52,'Nike Sportswear Heritage86','Brown','',1,559,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/46f616b5-e223-4887-aa27-efea9791a69d/sportswear-heritage86-adjustable-hat-mGg30s.png'),(53,'Nike ACG Storm-FIT','Black','L/XL',1,1.279,0,4,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/fa753ab8-39ea-42d0-bd85-e297b212a1cc/acg-bucket-hat-7Ll9P2.png'),(54,'Jordan Jumpman Classic99 Metal','Red','',1,659,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b7556f45-a4be-4365-afff-cb94eee0f29b/jordan-jumpman-classic99-metal-cap-8z78kc.png'),(55,'Jordan Jumpman','Black','',1,709,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b5dc02d8-ee36-4cd2-9dc8-ffbe4667a727/jordan-jumpman-washed-bucket-hat-kblNWN.png'),(56,'Nike Dri-FIT AeroBill Legacy91','Black Camo','',1,709,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/df2b6cc8-1a8c-413d-b550-721fdee3aa1b/dri-fit-aerobill-legacy91-camo-training-cap-rc1zZQ.png'),(57,'Jordan Jumpman Heritage86','White','',1,559,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/6566f75f-9cb1-48b6-bd83-f464035138b4/jordan-jumpman-heritage86-washed-cap-f59xF8.png'),(58,'Nike Sportswear Classic 99','Navy','',1,609,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/9e7c5ad1-deaa-48ad-bd10-825cec08491e/sportswear-classic-99-trucker-cap-k3ZFDZ.png'),(59,'NikeCourt Heritage86','White','',1,659,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/dbb79b34-9514-4de5-97fe-8783a416c81b/nikecourt-heritage86-logo-tennis-hat-QQz7pd.png'),(60,'Jordan Classic99 Flight','Black','',1,709,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/03488bd7-a899-4df3-94b0-ac842195481a/jordan-classic99-flight-cap-gk3PDm.png'),(61,'Nike Pro','White','L',2,659,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/djcrsxtkk6nrfb5l4akw/pro-short-sleeve-training-top-HWMXvc.png'),(62,'Nike Sportswear City Utility','Black','L',2,1.529,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/310932c8-1759-4f6c-8086-3c11d16ffb14/sportswear-city-utility-oversized-short-sleeve-polo-dBhnl3.png'),(63,'Nike Sportswear','White','L',2,1.169,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c83a387b-1d0d-42ae-bc5c-37a31ac0356c/sportswear-oversized-long-sleeve-t-shirt-nJ2jpW.png'),(64,'Nike Sportswear','Orange','L',2,869,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/bc8eb299-3ba0-40d0-a5b1-e8a01b992597/sportswear-slim-fit-t-shirt-3nWFWj.png'),(65,'Nike Sportswear','White','L',2,1.839,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/fcb9a997-4d45-423c-916a-247d5d64af3d/sportswear-oversized-crop-fleece-polo-sweatshirt-GQ4mr0.png'),(66,'Nike Sportswear Essentials','Black','L',2,709,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/08e9bb2a-19bc-4c9a-a2ea-426334066b02/sportswear-essentials-logo-t-shirt-MF2nms.png'),(67,'Nike Swoosh','Black','L',2,1.119,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/9b73e4f0-3e5e-41a1-9585-cc3ffb520e22/swoosh-support-padded-zip-front-sports-bra-0jrhrb.png'),(68,'NikeCourt Dri-FIT Victory','White','L',2,1.939,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/cf02c9ad-586a-43c9-9ea3-66f2effbd24c/nikecourt-dri-fit-victory-tennis-dress-Lp3V5b.png'),(69,'Paris Saint-Germain','Black','L',2,1.989,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d627660d-a428-48a6-8249-d8021c24682c/paris-saint-germain-hoodie-VBk0tN.png'),(70,'Nike Sportswear','Olive','L',2,1.279,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e7676591-c1c8-42c0-9cac-e9e5a5e5d09c/sportswear-mock-neck-short-sleeve-terry-top-0PpXld.png'),(71,'Nike One','Black','L',2,1.279,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6361f3e4-1d35-4f65-bbe3-a69349417fea/one-high-waisted-7-8-leggings-B1WL85.png'),(72,'Nike Sportswear Everyday Modern','Brown','L',2,1.939,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5c7e3401-dad4-4c27-a3a4-444d75e68c9b/sportswear-everyday-modern-high-waisted-wide-leg-french-terry-trousers-8qKZ1k.png'),(73,'Jordan Women\'s Knit Trousers','Black','L',2,1.939,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/2757ae58-a3d8-4335-b263-49b0c64920dc/jordan-knit-trousers-Bz8mvR.png'),(74,'Jordan Flight Fleece Women\'s Trousers','Lavender','L',2,1.939,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d9509014-ceab-4a9a-9bb1-d9858f036beb/jordan-flight-fleece-trousers-jhWMC1.png'),(75,'Nike One Women\'s Mid-Rise 7/8 Graphic Leggings','Black','L',2,1.429,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/52281779-a805-4f6d-8aa2-935f10ea9d93/one-mid-rise-7-8-graphic-leggings-fFRFtt.png'),(76,'Nike Sportswear Sport Shine','Black','L',2,969,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/491357f5-b5ee-4800-8c05-3f29f790dce6/sportswear-sport-shine-mid-rise-bike-shorts-T7fbMG.png'),(77,'Nike Flex Essential 2-in-1','Gray','L',2,1.019,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8e9a2234-5be0-4bc4-8c1a-7f18fad91050/flex-essential-2-in-1-training-shorts-j47fzD.png'),(78,'Jordan Essentials Diamond Shorts','Black','L',2,1.579,1,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ef869116-8df2-4c2d-93a4-955f7b9fb8a4/jordan-essentials-diamond-shorts-cFL9l2.png'),(79,'Nike Pro Dri-FIT Mid-Rise','Black','L',2,1.069,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/70e50529-0c2c-4fa1-be2c-85e60f6c09c5/pro-dri-fit-mid-rise-8cm-training-shorts-FxSThZ.png'),(80,'NikeCourt Dri-FIT Slam Tennis Skirt','Turkish','L',2,1.939,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/2977d2b9-2af2-4eed-ade1-9901600ec0cf/nikecourt-dri-fit-slam-tennis-skirt-xZVtk3.png'),(81,'Nike Sportswear Heritage86','Pink','',2,559,447,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/3c87d0fc-4e97-45fa-b92c-4bcf47b2c923/sportswear-heritage86-cap-NsvFvT.png'),(82,'Nike Dri-FIT Heritage86','Cream Yellow','',2,509,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/cb9e4c05-af82-444b-8991-e3f0279641ce/dri-fit-heritage86-golf-hat-KwqR3r.png'),(83,'Nike Sportswear','Brown','',2,659,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/20522074-45ec-42f3-89a1-94c090e35357/sportswear-beanie-vvLQvd.png'),(84,'Nike Sportswear','White','',2,819,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/27d91cd2-d859-4d56-8537-6945fa56f37c/sportswear-tye-dyed-beanie-9gwRhK.png'),(85,'Jordan 23 Engineered','Orange','',2,819,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/af57d0b3-6f68-4003-95e6-a7e881ae5c74/jordan-23-engineered-utility-beanie-WT576r.png'),(86,'NikeCourt Advantage','Black','',2,559,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/55f331a7-2b80-44c2-8278-a3816ae5ef76/nikecourt-advantage-tennis-visor-c6X8Fj.png'),(87,'Nike ACG Cuffed Beanie','Black','',2,869,0,4,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/8e9c1998-c3dc-48ce-8160-747af0f4464b/acg-cuffed-beanie-7wph91.png'),(88,'Nike Dri-FIT Performance Printed Training Top','Black','L',3,769,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5993fdbb-65af-444d-9983-61db14551874/dri-fit-older-printed-training-top-0D9x73.png'),(89,'Nike x LeBron Dri-FIT T-Shirt','Gray','L',3,769,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ed4f6d89-7dd1-4a43-99f3-c64f5fa744cf/lebron-older-dri-fit-t-shirt-SswtNx.png'),(90,'Nike Dri-FIT Multi Training Top','Black','L',3,769,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c8218e34-0941-4717-b343-0631bf0a0d16/dri-fit-multi-older-training-top-7RlKKh.png'),(91,'Nike Sportswear T-Shirt','Navy','L',3,409,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/609d29c0-2390-4d9c-b119-ed8425f4c293/sportswear-older-t-shirt-nrRFB7.png'),(92,'Nike Sportswear T-Shirt','Gray','L',3,509,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e96d267d-0c72-4668-9569-9307196daeb7/sportswear-older-t-shirt-G88cbk.png'),(93,'Liverpool F.C. 2022/23 Stadium Third Nike Dri-FIT Football Shirt','Teal','L',3,1.939,0,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6e443efb-c24c-475f-a0f4-53517c302384/liverpool-fc-2022-23-stadium-third-older-dri-fit-football-shirt-h9VcRr.png'),(94,'Nike Dri-FIT Multi Long-Sleeve Training Top','Aqua','L',3,919,0,2,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/fb3cb2fc-d379-417a-badb-160a16fa1318/dri-fit-multi-older-long-sleeve-training-top-fR7kQB.png'),(95,'Nike Printed Training Shorts','Black Camo','L',3,919,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/83174dd0-3433-49e4-ae95-cfd96c6439df/older-printed-training-shorts-G5MFht.png'),(96,'Nike Dri-FIT Athletics Training Shorts','Black','L',3,559,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/156c2ba4-c45a-4de4-8597-0b73b5be867d/dri-fit-athletics-older-training-shorts-mvcKx4.png'),(97,'Nike Sportswear Club Cargo Trousers','Black','L',3,969,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/uullotizeal51q47xriu/sportswear-club-older-cargo-trousers-fcGPvm.png'),(98,'Nike Dri-FIT Football Shorts','White','L',3,509,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f6c634c3-c5b8-46ba-b3ca-051e407cd2a5/dri-fit-older-football-shorts-PPX159.png'),(99,'Nike Sportswear Woven Utility Cargo Shorts','Coral','L',3,1.019,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/91f2e131-8f22-49c9-ba02-9f3e93f1ea44/sportswear-older-woven-utility-cargo-shorts-tKC6X0.png'),(100,'Nike Dri-FIT Trophy23 Training Shorts','Red','L',3,409,0,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/22c424ff-3636-486f-9adb-58c43e01b64a/dri-fit-trophy23-older-training-shorts-lFR9KN.png'),(101,'CENTRAL COAST LADY SHIRT','Black','L',4,590,0,2,'https://zunezx.com/upload/image/cache/data/banner/Tee/UP-WEB/central-shirt/3-a22-crop-550-550.PNG'),(103,'Nike Air Zoom Maxfly More Uptempo','Black','EU 39',4,5.279,0,1,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3ea412e6-0c1f-42cd-8fc6-f4e9b546ee95/air-zoom-maxfly-more-uptempo-athletics-sprinting-spikes-rJlb4d.png'),(104,'Nike Air Max Alpha Trainer 5000','White','EU41',1,2.499,0,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/05ecb631-d5d9-4de7-9bac-80a460617586/air-max-alpha-trainer-5-training-shoes-x8Jzj6.png');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`item_id`,`order_id`),
  KEY `FK_ORDER_DETAIL_ORDER` (`order_id`),
  CONSTRAINT `FK_ORDER_DETAIL_ITEM` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `FK_ORDER_DETAIL_ORDER` FOREIGN KEY (`order_id`) REFERENCES `iorder` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,1),(1,3,1),(1,4,1),(2,3,1),(3,2,3),(5,2,1),(6,2,1),(9,2,1),(10,2,1),(11,2,1),(13,2,1),(103,2,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `type_id` int NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Man'),(2,'Woman'),(3,'Kids'),(4,'Other');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-10  3:28:14
