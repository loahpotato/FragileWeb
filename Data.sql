-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: smbms
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `fragile_cart`
--

DROP TABLE IF EXISTS `fragile_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fragile_cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_pimage` varchar(100) DEFAULT NULL,
  `cart_pname` varchar(80) DEFAULT NULL,
  `cart_pprice` decimal(10,3) DEFAULT NULL,
  `cart_uid` int DEFAULT NULL,
  `cart_valid` int DEFAULT NULL,
  `cart_pid` bigint DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragile_cart`
--

LOCK TABLES `fragile_cart` WRITE;
/*!40000 ALTER TABLE `fragile_cart` DISABLE KEYS */;
INSERT INTO `fragile_cart` VALUES (4,'header_alt_assets_2.jpg','Fall Guys',50.000,24,1,1),(7,'header_schinese.jpg','Biped',37.000,25,1,55),(8,'Pummel Party.jpg','Pummel Party',50.000,25,1,51),(9,'assassin.jpg','Assassin\'s Creed: Valhalla',120.000,25,1,54),(10,'Death stranding.jpg','Death Stranding',149.000,25,1,46);
/*!40000 ALTER TABLE `fragile_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragile_category`
--

DROP TABLE IF EXISTS `fragile_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fragile_category` (
  `cate_id` int NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(20) NOT NULL,
  `cate_parent_id` decimal(10,0) NOT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragile_category`
--

LOCK TABLES `fragile_category` WRITE;
/*!40000 ALTER TABLE `fragile_category` DISABLE KEYS */;
INSERT INTO `fragile_category` VALUES (1,'Casual',0),(2,'Cooperation',0),(3,'RPG',0),(4,'Strategy',0);
/*!40000 ALTER TABLE `fragile_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragile_product`
--

DROP TABLE IF EXISTS `fragile_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fragile_product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `proCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商编码',
  `proName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proDesc` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proDeveloper` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proPublisher` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proDate` date DEFAULT NULL,
  `proPrice` decimal(10,3) DEFAULT NULL,
  `createdBy` bigint DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `modifyBy` bigint DEFAULT NULL COMMENT '更新者（userId）',
  `proFilename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proCate` bigint DEFAULT NULL,
  `proVideo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragile_product`
--

LOCK TABLES `fragile_product` WRITE;
/*!40000 ALTER TABLE `fragile_product` DISABLE KEYS */;
INSERT INTO `fragile_product` VALUES (1,'fallguys','Fall Guys','Fall Guys: Ultimate Knockout flings hordes of contestants together online in a mad dash through round after round of escalating chaos until one victor remains! Battle bizarre obstacles, shove through unruly competitors, and overcome the unbending laws of physics as you stumble towards greatness. Leave your dignity at the door and prepare for hilarious failure in your quest to claim the crown',' Mediatonic',' Devolver Digital','2020-08-04',50.000,1,NULL,'2021-01-05 01:00:16',1,'header_alt_assets_2.jpg',1,'https://media.st.dl.pinyuncloud.com/steam/apps/256815856/movie480_vp9.webm?t=1608598290'),(2,'thewitcher3','The Witcher 3: Wild Hunt','The Witcher: Wild Hunt is a story-driven open world RPG set in a visually stunning fantasy universe full of meaningful choices and impactful consequences. In The Witcher, you play as professional monster hunter Geralt of Rivia tasked with finding a child of prophecy in a vast open world rich with merchant cities, pirate islands, dangerous mountain passes, and forgotten caverns to explore.','CDPR','CDPR','2015-05-18',38.000,1,'2021-01-05 00:12:27','2021-01-07 03:56:51',1,'Witcher.jpg',3,'https://media.st.dl.pinyuncloud.com/steam/apps/256719019/movie480.webm?t=1528288698'),(45,'111','Dota2','Every day, millions of players worldwide enter battle as one of over a hundred Dota heroes. And no matter if it\'s their 10th hour of play or 1,000th, there\'s always something new to discover. With regular updates that ensure a constant evolution of gameplay, features, and heroes, Dota 2 has taken on a life of its own.',' Valve',' Valve','2013-07-10',20.000,1,'2021-01-05 00:25:08','2021-01-07 03:45:43',1,'dota2.jpg',2,'https://media.st.dl.pinyuncloud.com/steam/apps/256692021/movie480.webm?t=1599609272'),(46,'deathstranding','Death Stranding','From legendary game creator Hideo Kojima comes an all-new, genre-defying experience. Sam Bridges must brave a world utterly transformed by the Death Stranding. Carrying the disconnected remnants of our future in his hands, he embarks on a journey to reconnect the shattered world one step at a time.',' KOJIMA PRODUCTIONS',' 505 Games','2020-07-14',149.000,1,'2021-01-05 01:02:52',NULL,NULL,'Death stranding.jpg',3,'https://media.st.dl.pinyuncloud.com/steam/apps/256792616/movie480_vp9.webm?t=1594735429'),(47,'monsterhunterworld','Monster Hunter: World','Welcome to a new world! In Monster Hunter: World, the latest installment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.',' CAPCOM Co., Ltd.',' CAPCOM Co., Ltd.','2018-08-10',134.000,1,'2021-01-05 01:07:33','2021-01-07 03:57:23',1,'Monster hunter.jpg',2,'https://media.st.dl.pinyuncloud.com/steam/apps/256765435/movie480.webm?t=1578591299'),(48,'thescrolloftaiwu','The Scroll Of Taiwu','*The Scroll of Taiwu* is an indie game based on Chinese mythology and Wuxia tales. You will play as a \"successor of Taiwu\" in a fictional universe, defeating your greatest enemy under the effort and sacrifice of many generations and change the fate of humankind.',' ConchShip Games',' ConchShip Games','2018-09-21',57.000,1,'2021-01-05 01:11:21',NULL,NULL,'taiwu.jpg',4,'https://media.st.dl.pinyuncloud.com/steam/apps/256727618/movie480.webm?t=1535980845'),(49,'plantsvszombies','Plants vs. Zombies','Check out Plants vs. Zombies: The Defense of Harmony Town, where the craziest shooters are!',' PopCap',' Electronic Arts','2019-10-18',53.000,1,'2021-01-05 01:13:55',NULL,NULL,'P&Z.jpg',1,'https://media.st.dl.pinyuncloud.com/steam/apps/256786300/movie480_vp9.webm?t=1591282672'),(50,'citiesskylines','Cities: Skylines','Cities: Skylines is a modern take on the classic city sim.The game introduces new gameplay elements, giving players a first-hand taste of the excitement and hardship of creating and maintaining a real city, while expanding on some of the enduring themes of the city-building experience.',' Colossal Order Ltd.',' Paradox Interactive','2015-03-11',22.000,1,'2021-01-06 23:51:15','2021-01-07 03:45:50',1,'skylines.jpg',4,'https://media.st.dl.pinyuncloud.com/steam/apps/256785384/movie480_vp9.webm?t=1589550020'),(51,'pummelparty','Pummel Party','Pummel Party is an online and local multiplayer Party game for 4-8 players.Pummel friends or AI can use a variety of ridiculous and hilarious items in board mode, competing against each other in unique mini-game collections and destroying friendships.',' Rebuilt Games',' Rebuilt Games','2018-09-21',50.000,1,'2021-01-07 04:01:32',NULL,NULL,'Pummel Party.jpg',2,'https://media.st.dl.pinyuncloud.com/steam/apps/256729701/movie480.webm?t=1537457471'),(52,'thereisnogame','There Is No Game: Wrong Dimension','There are no games.So don\'t just tinker and tinker and tinker everywhere.You don\'t want to be kicked out of our video game world, do you?Of course not!',' Draw Me A Pixel',' Draw Me A Pixel','2020-08-07',43.000,1,'2021-01-07 04:05:54',NULL,NULL,'nogame.jpg',1,'https://media.st.dl.pinyuncloud.com/steam/apps/256793611/movie480_vp9.webm?t=1595513367'),(54,'acv','Assassin\'s Creed: Valhalla','As a ruthless warrior, Evor the Viking Mariner, lead your clan from the cold isolation of Norway to the bountiful land of 9th century England to explore a new home.Build your own settlement, conquer this hostile land by hook or by crook, and earn a place in the halls of English. Viking England was a fragmented land of warring lords and warring kingdoms.Beneath the endless chaos lies a rich and rugged land awaiting the arrival of a new ruler.Are you qualified for this role?','Ubisoft Entertainment','Ubisoft Entertainment','2020-11-10',120.000,1,'2021-01-10 14:59:01','2021-01-10 15:49:17',1,'assassin.jpg',3,'http://ubicdn.com/202011/ACK_Launch.mp4'),(55,'biped','Biped','Biped is a cooperative adventure game with physical features. In the game, you and your friends will play as \"Agu\" and \"Shira\", two bipedal alien robots, and embark on a fun and emotional adventure on Earth.','NEXT Studios','NEXT Studios, bilibili, META Publishing','2020-03-27',37.000,1,'2021-01-10 15:33:39',NULL,NULL,'header_schinese.jpg',2,'https://media.st.dl.pinyuncloud.com/steam/apps/256801786/movie480_vp9.webm?t=1609834663'),(56,'escapists','The Escapists 2','Trick, steal, fight, and escape! As you return to your life as a prisoner in The Escapists 2, it\'s time to break out of one of The world\'s toughest prisons in multiplayer mode.','Team17, Mouldy Toof Studios','Team17','2017-08-22',19.000,1,'2021-01-10 15:47:25',NULL,NULL,'header.jpg',2,'https://media.st.dl.pinyuncloud.com/steam/apps/256703598/movie480.webm?t=1513178847');
/*!40000 ALTER TABLE `fragile_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragile_role`
--

DROP TABLE IF EXISTS `fragile_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fragile_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `roleCode` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色编码',
  `roleName` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `createdBy` bigint DEFAULT NULL COMMENT '创建者',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint DEFAULT NULL COMMENT '修改者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragile_role`
--

LOCK TABLES `fragile_role` WRITE;
/*!40000 ALTER TABLE `fragile_role` DISABLE KEYS */;
INSERT INTO `fragile_role` VALUES (1,'ADMIN','Administrator',1,'2016-04-13 00:00:00',NULL,NULL),(2,'USER','User',1,'2016-04-13 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `fragile_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragile_user`
--

DROP TABLE IF EXISTS `fragile_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fragile_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userCode` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户编码',
  `userName` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `userPassword` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `gender` int DEFAULT NULL COMMENT '性别（1:女、 2:男）',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `userRole` bigint DEFAULT NULL COMMENT '用户角色（取自角色表-角色id）',
  `createdBy` bigint DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragile_user`
--

LOCK TABLES `fragile_user` WRITE;
/*!40000 ALTER TABLE `fragile_user` DISABLE KEYS */;
INSERT INTO `fragile_user` VALUES (1,'admin','Admin','1234567',1,'1983-10-10','13688889999','999@qq.com',1,1,'2013-03-21 16:52:07',1,'2021-01-03 21:10:06'),(23,'admin1','Admin1','1111111',2,'1986-01-21','11111111111','qqqq@a.com',1,1,'2021-01-03 21:08:28',NULL,NULL),(24,'liming','LI','0000000',1,'1995-01-10','13855566665','qqqq@a.com',2,1,'2021-01-03 21:11:10',NULL,NULL),(25,'yang','YANG','0000000',1,'1998-01-12','13855566666','12345@gmail.com',2,1,'2021-01-03 21:11:48',1,'2021-01-03 21:12:03'),(26,'zheng','ZHENG','0000000',2,'1992-01-29','13855566666','11111@qq.com',2,1,'2021-01-03 21:12:56',NULL,NULL),(27,'222','222','0000000',1,'1997-08-13','13855566665','11111@qq.com',2,1,'2021-01-03 21:13:47',NULL,NULL),(28,'admin2','Admin2','1111111',2,'1994-01-27','13855566666','qqqq@a.com',1,1,'2021-01-04 01:53:24',NULL,NULL),(29,'lihao','LIHAO','1111111',2,'1992-06-09','12234443222','eeee@a.com',2,NULL,'2021-01-04 23:37:42',NULL,NULL),(30,'potato','potato','1111111',2,'2020-06-06','11111111111','964040805@qq.com',2,NULL,'2021-01-06 21:29:52',NULL,NULL);
/*!40000 ALTER TABLE `fragile_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smbms_bill`
--

DROP TABLE IF EXISTS `smbms_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smbms_bill` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `billCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账单编码',
  `productName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `productDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品描述',
  `productUnit` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品单位',
  `productCount` decimal(20,2) DEFAULT NULL COMMENT '商品数量',
  `totalPrice` decimal(20,2) DEFAULT NULL COMMENT '商品总额',
  `isPayment` int DEFAULT NULL COMMENT '是否支付（1：未支付 2：已支付）',
  `createdBy` bigint DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `providerId` bigint DEFAULT NULL COMMENT '供应商ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smbms_bill`
--

LOCK TABLES `smbms_bill` WRITE;
/*!40000 ALTER TABLE `smbms_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `smbms_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'smbms'
--

--
-- Dumping routines for database 'smbms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12 23:38:20
