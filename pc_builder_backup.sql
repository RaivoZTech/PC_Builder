-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: PC_Builder_DB
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
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `specs` text,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT INTO `components` VALUES (1,'Intel Core i9-10900K',530,'{\"cores\": 10, \"socket\": \"LGA1200\", \"frequency\": \"3.7GHz\", \"power\": 125}','CPU'),(2,'AMD Ryzen 7 5800X',450,'{\"cores\": 8, \"socket\": \"AM4\", \"frequency\": \"3.8GHz\", \"power\": 105}','CPU'),(3,'NVIDIA RTX 3070',500,'{\"memory\": \"8GB\", \"power\": 220, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"242mm x 112mm\"}','GPU'),(4,'AMD Radeon RX 6700 XT',480,'{\"memory\": \"12GB\", \"power\": 230, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"267mm x 120mm\"}','GPU'),(5,'ASUS TUF Gaming Z490-Plus',200,'{\"socket\": \"LGA1700\", \"interface\": \"SATA\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4600MHz\"}','Motherboard'),(6,'Gigabyte X570 Aorus Elite',190,'{\"socket\": \"AM3\", \"interface\": \"M.2\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR5\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4000MHz\"}','Motherboard'),(8,'NZXT H510',70,'{\"formFactor\": [\"ATX\", \"MicroATX\", \"Mini-ITX\"], \"dimensions\": \"W: 210mm H: 460mm D: 428mm\", \"color\": \"Black\", \"maxGPULength\": \"381mm\"}','Case'),(9,'Phanteks Eclipse P300',60,'{\"formFactor\": [\"ATX\", \"MicroATX\", \"Mini-ITX\"], \"dimensions\": \"W: 200mm H: 450mm D: 400mm\", \"color\": \"White\", \"maxGPULength\": \"355mm\"}','Case'),(10,'Corsair Vengeance LPX 16GB',80,'{\"speed\": \"3200MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL16\", \"formFactor\": \"DIMM\"}','RAM'),(11,'G.Skill Trident Z RGB 32GB',150,'{\"speed\": \"3600MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL18\", \"formFactor\": \"DIMM\"}','RAM'),(12,'EVGA SuperNOVA 650 G5',110,'{\"wattage\": 650, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\", \"dimensions\": \"150mm x 86mm x 150mm\"}','PSU'),(13,'Corsair RM750x',130,'{\"wattage\": 750, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\", \"dimensions\": \"150mm x 86mm x 160mm\"}','PSU'),(14,'AMD Radeon RX 6800 XT',650,'{\"ports\": \"HDMI, 2x DisplayPort\", \"power\": 300, \"memory\": \"16GB\", \"dimensions\": \"267mm x 112mm\"}','GPU'),(15,'Samsung 970 EVO Plus',119.99,'{\"capacity\": \"1TB\", \"interface\": \"M.2\", \"formFactor\": \"M.2\"}','SSD'),(16,'Crucial MX500',69.99,'{\"capacity\": \"500GB\", \"interface\": \"SATA\", \"formFactor\": \"2.5-inch\"}','SSD'),(17,'Western Digital Blue',54.99,'{\"capacity\": \"250GB\", \"interface\": \"SATA\", \"formFactor\": \"2.5-inch\"}','SSD'),(18,'Kingston A2000',89.99,'{\"capacity\": \"1TB\", \"interface\": \"M.2\", \"formFactor\": \"M.2\"}','SSD'),(19,'Intel Core i5-10600K',280,'{\"cores\": 6, \"socket\": \"LGA1200\", \"frequency\": \"4.1GHz\", \"power\": 125}','CPU'),(20,'AMD Ryzen 5 5600X',300,'{\"cores\": 6, \"socket\": \"AM4\", \"frequency\": \"3.7GHz\", \"power\": 65}','CPU'),(21,'Intel Core i7-10700K',350,'{\"cores\": 8, \"socket\": \"LGA1200\", \"frequency\": \"3.8GHz\", \"power\": 125}','CPU'),(22,'AMD Ryzen 9 5900X',550,'{\"cores\": 12, \"socket\": \"AM4\", \"frequency\": \"3.7GHz\", \"power\": 105}','CPU'),(23,'Intel Core i9-10850K',450,'{\"cores\": 10, \"socket\": \"LGA1200\", \"frequency\": \"3.6GHz\", \"power\": 125}','CPU'),(24,'AMD Ryzen 7 5800X3D',450,'{\"cores\": 8, \"socket\": \"AM4\", \"frequency\": \"3.4GHz\", \"power\": 105}','CPU'),(25,'Intel Core i5-11600K',260,'{\"cores\": 6, \"socket\": \"LGA1200\", \"frequency\": \"3.9GHz\", \"power\": 125}','CPU'),(26,'AMD Ryzen 5 3600',200,'{\"cores\": 6, \"socket\": \"AM4\", \"frequency\": \"3.6GHz\", \"power\": 65}','CPU'),(27,'Intel Core i7-11700K',380,'{\"cores\": 8, \"socket\": \"LGA1200\", \"frequency\": \"3.6GHz\", \"power\": 125}','CPU'),(28,'AMD Ryzen 9 5950X',800,'{\"cores\": 16, \"socket\": \"AM4\", \"frequency\": \"3.4GHz\", \"power\": 105}','CPU'),(29,'NVIDIA RTX 3080',700,'{\"memory\": \"10GB\", \"power\": 320, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"285mm x 112mm\"}','GPU'),(30,'AMD Radeon RX 6800',580,'{\"memory\": \"16GB\", \"power\": 250, \"ports\": \"HDMI, 2x DisplayPort\", \"dimensions\": \"267mm x 120mm\"}','GPU'),(31,'NVIDIA RTX 3060 Ti',400,'{\"memory\": \"8GB\", \"power\": 200, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"242mm x 112mm\"}','GPU'),(32,'AMD Radeon RX 6900 XT',1000,'{\"memory\": \"16GB\", \"power\": 300, \"ports\": \"HDMI, 2x DisplayPort\", \"dimensions\": \"267mm x 120mm\"}','GPU'),(33,'NVIDIA RTX 3090',1500,'{\"memory\": \"24GB\", \"power\": 350, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"313mm x 138mm\"}','GPU'),(34,'AMD Radeon RX 6600 XT',380,'{\"memory\": \"8GB\", \"power\": 160, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"237mm x 120mm\"}','GPU'),(35,'NVIDIA RTX 3070 Ti',600,'{\"memory\": \"8GB\", \"power\": 290, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"242mm x 112mm\"}','GPU'),(36,'AMD Radeon RX 6700',480,'{\"memory\": \"10GB\", \"power\": 230, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"267mm x 120mm\"}','GPU'),(37,'NVIDIA RTX 3060',330,'{\"memory\": \"12GB\", \"power\": 170, \"ports\": \"HDMI, 3x DisplayPort\", \"dimensions\": \"242mm x 112mm\"}','GPU'),(38,'AMD Radeon RX 6800 XT',650,'{\"memory\": \"16GB\", \"power\": 300, \"ports\": \"HDMI, 2x DisplayPort\", \"dimensions\": \"267mm x 120mm\"}','GPU'),(39,'ASUS ROG Strix Z490-E',300,'{\"socket\": \"LGA2066\", \"interface\": \"M.2, SATA\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR5\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4800MHz\"}','Motherboard'),(40,'MSI MPG B550 Gaming Edge WiFi',190,'{\"socket\": \"AM3\", \"interface\": \"SATA\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4400MHz\"}','Motherboard'),(41,'Gigabyte Z490 Aorus Ultra',260,'{\"socket\": \"LGA1700\", \"interface\": \"M.2\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"5000MHz\"}','Motherboard'),(42,'ASRock B550 Phantom Gaming 4',140,'{\"socket\": \"AM3\", \"interface\": \"SATA\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4733MHz\"}','Motherboard'),(43,'ASUS ROG Strix X570-E Gaming',330,'{\"socket\": \"LGA1700\", \"interface\": \"M.2\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR5\", \"memorySlots\": 4, \"maxMemorySpeed\": \"5100MHz\"}','Motherboard'),(44,'MSI MAG Z490 Tomahawk',200,'{\"socket\": \"LGA1700\", \"interface\": \"M.2, SATA\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4800MHz\"}','Motherboard'),(45,'ASUS Prime B550-Plus',150,'{\"socket\": \"LGA2066\", \"interface\": \"SATA\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4400MHz\"}','Motherboard'),(46,'Gigabyte B550 Aorus Pro',180,'{\"socket\": \"LGA1700\", \"interface\": \"M.2\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4733MHz\"}','Motherboard'),(47,'ASRock Z490 Extreme4',220,'{\"socket\": \"LGA2066\", \"interface\": \"SATA\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4700MHz\"}','Motherboard'),(48,'MSI MEG X570 Ace',370,'{\"socket\": \"AM3\", \"interface\": \"M.2, SATA\", \"formFactor\": \"ATX\", \"memoryType\": \"DDR5\", \"memorySlots\": 4, \"maxMemorySpeed\": \"5000MHz\"}','Motherboard'),(49,'Corsair Carbide Series 275R',80,'{\"color\": \"Black\", \"dimensions\": \"W: 210mm H: 460mm D: 428mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"360mm\"}','Case'),(50,'NZXT H710i',170,'{\"color\": \"White\", \"dimensions\": \"W: 230mm H: 516mm D: 494mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"260mm\"}','Case'),(51,'Fractal Design Meshify C',90,'{\"color\": \"Black\", \"dimensions\": \"W: 217mm H: 453mm D: 409mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"380mm\"}','Case'),(52,'Phanteks Enthoo Pro',110,'{\"color\": \"Black\", \"dimensions\": \"W: 235mm H: 535mm D: 550mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"400mm\"}','Case'),(53,'Lian Li PC-O11 Dynamic',140,'{\"color\": \"White\", \"dimensions\": \"W: 272mm H: 446mm D: 445mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"390mm\"}','Case'),(54,'Cooler Master MasterBox TD500',100,'{\"color\": \"Black\", \"dimensions\": \"W: 217mm H: 469mm D: 496mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"370mm\"}','Case'),(55,'Thermaltake V200',70,'{\"color\": \"Black\", \"dimensions\": \"270mm x 350mm x 350mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"270mm\"}','Case'),(56,'Deepcool MATREXX 50',60,'{\"color\": \"Black\", \"dimensions\": \"266mm x 322mm x 315mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"300mm\"}','Case'),(57,'Be Quiet! Pure Base 500DX',100,'{\"color\": \"White\", \"dimensions\": \"W: 232mm H: 463mm D: 450mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"350mm\"}','Case'),(58,'Corsair iCUE 4000X RGB',120,'{\"color\": \"Black\", \"dimensions\": \"243mm x 300mm x 316mm\", \"formFactor\": [\"ATX\"], \"maxGPULength\": \"293mm\"}','Case'),(59,'Kingston HyperX Fury 16GB',85,'{\"speed\": \"3200MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL16\", \"formFactor\": \"DIMM\"}','RAM'),(60,'Crucial Ballistix 32GB',160,'{\"speed\": \"3600MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL16\", \"formFactor\": \"DIMM\"}','RAM'),(61,'Corsair Dominator Platinum RGB 16GB',200,'{\"speed\": \"3200MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL15\", \"formFactor\": \"DIMM\"}','RAM'),(62,'G.Skill Ripjaws V 16GB',70,'{\"speed\": \"3200MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.2V\", \"latency\": \"CL16\", \"formFactor\": \"DIMM\"}','RAM'),(63,'Team T-FORCE VULCAN Z 32GB',150,'{\"speed\": \"3200MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL16\", \"formFactor\": \"DIMM\"}','RAM'),(64,'Patriot Viper Steel 16GB',80,'{\"speed\": \"3200MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL16\", \"formFactor\": \"DIMM\"}','RAM'),(65,'Adata XPG Spectrix D60G 32GB',170,'{\"speed\": \"3600MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL18\", \"formFactor\": \"DIMM\"}','RAM'),(66,'Corsair Vengeance RGB Pro 16GB',90,'{\"speed\": \"3600MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL18\", \"formFactor\": \"DIMM\"}','RAM'),(67,'HyperX Predator RGB 16GB',100,'{\"speed\": \"3600MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL17\", \"formFactor\": \"DIMM\"}','RAM'),(68,'T-Force Night Hawk RGB 32GB',180,'{\"speed\": \"3200MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR4\", \"voltage\": \"1.35V\", \"latency\": \"CL16\", \"formFactor\": \"DIMM\"}','RAM'),(69,'Corsair RM850x',140,'{\"wattage\": 850, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(70,'EVGA SuperNOVA 750 G5',120,'{\"wattage\": 750, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(71,'Seasonic FOCUS GX-650',100,'{\"wattage\": 650, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(72,'Thermaltake Toughpower GF1 850',160,'{\"wattage\": 850, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(73,'ASUS ROG Strix 750W',150,'{\"wattage\": 750, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(74,'NZXT C750',130,'{\"wattage\": 750, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(75,'Be Quiet! Straight Power 11 650W',110,'{\"wattage\": 650, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(76,'Cooler Master V750',120,'{\"wattage\": 750, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(77,'XPG CORE Reactor 850W',170,'{\"wattage\": 850, \"efficiency\": \"80+ Gold\", \"modular\": \"Full\"}','PSU'),(78,'Fractal Design Ion+ 660P',130,'{\"wattage\": 660, \"efficiency\": \"80+ Platinum\", \"modular\": \"Full\"}','PSU'),(79,'Crucial P1 1TB NVMe',100,'{\"capacity\": \"1TB\", \"interface\": \"M.2\", \"formFactor\": \"M.2\"}','SSD'),(80,'Samsung 860 EVO 1TB',120,'{\"capacity\": \"1TB\", \"interface\": \"SATA\", \"formFactor\": \"2.5-inch\"}','SSD'),(81,'Kingston A400 480GB',50,'{\"capacity\": \"480GB\", \"interface\": \"SATA\", \"formFactor\": \"2.5-inch\"}','SSD'),(82,'WD Blue SN550 1TB',110,'{\"capacity\": \"1TB\", \"interface\": \"M.2\", \"formFactor\": \"M.2\"}','SSD'),(83,'Seagate Barracuda Q1 SSD 960GB',90,'{\"capacity\": \"960GB\", \"interface\": \"SATA\", \"formFactor\": \"2.5-inch\"}','SSD'),(84,'ADATA XPG SX8200 Pro 1TB',130,'{\"capacity\": \"1TB\", \"interface\": \"M.2\", \"formFactor\": \"M.2\"}','SSD'),(85,'Intel 660p Series 1TB',100,'{\"capacity\": \"1TB\", \"interface\": \"M.2\", \"formFactor\": \"M.2\"}','SSD'),(86,'Crucial MX500 1TB',110,'{\"capacity\": \"1TB\", \"interface\": \"SATA\", \"formFactor\": \"2.5-inch\"}','SSD'),(87,'Sabrent Rocket Q 1TB',120,'{\"capacity\": \"1TB\", \"interface\": \"M.2\", \"formFactor\": \"M.2\"}','SSD'),(88,'Samsung 970 EVO Plus 2TB',250,'{\"capacity\": \"2TB\", \"interface\": \"M.2\", \"formFactor\": \"M.2\"}','SSD'),(89,'Cooler Master Hyper 212',34.99,'{\"dimensions\": \"120mm x 79mm x 158mm\", \"power\": 2.64}','Cooler'),(90,'Noctua NH-D15',89.95,'{\"dimensions\": \"165mm x 150mm x 161mm\", \"power\": 1.56}','Cooler'),(91,'Be Quiet! Dark Rock Pro 4',89.9,'{\"dimensions\": \"145mm x 136mm x 163mm\", \"power\": 2.10}','Cooler'),(92,'NZXT Kraken X53',129.99,'{\"dimensions\": \"275mm x 123mm x 30mm\", \"power\": 3.84}','Cooler'),(93,'Corsair H100i RGB Platinum',159.99,'{\"dimensions\": \"276mm x 120mm x 27mm\", \"power\": 4.32}','Cooler'),(94,'EVGA CLC 280',119.99,'{\"dimensions\": \"312mm x 139mm x 27mm\", \"power\": 4.20}','Cooler'),(95,'Arctic Liquid Freezer II 240',99.99,'{\"dimensions\": \"278mm x 120mm x 38mm\", \"power\": 3.60}','Cooler'),(96,'Thermaltake Floe DX RGB 360 TT',199.99,'{\"dimensions\": \"394mm x 120mm x 27mm\", \"power\": 5.76}','Cooler'),(97,'Deepcool Castle 240EX',109.99,'{\"dimensions\": \"282mm x 120mm x 27mm\", \"power\": 3.60}','Cooler'),(98,'Lian Li Galahad AIO 360',149.99,'{\"dimensions\": \"397.5mm x 123.5mm x 27mm\", \"power\": 5.76}','Cooler'),(99,'Corsair Crystal 280X',120,'{\"formFactor\": [\"mini-ITX\"], \"dimensions\": \"W: 270mm H: 350mm D: 350mm\", \"color\": \"Black\", \"maxGPULength\": \"300mm\"}','Case'),(100,'Cooler Master Elite 130',70,'{\"formFactor\": [\"mini-ITX\"], \"dimensions\": \"W: 240mm H: 207mm D: 399mm\", \"color\": \"Black\", \"maxGPULength\": \"343mm\"}','Case'),(101,'NZXT H210',85,'{\"formFactor\": [\"mini-ITX\"], \"dimensions\": \"W: 210mm H: 349mm D: 372mm\", \"color\": \"White\", \"maxGPULength\": \"325mm\"}','Case'),(102,'Thermaltake Core V1',55,'{\"formFactor\": [\"mini-ITX\"], \"dimensions\": \"W: 260mm H: 276mm D: 316mm\", \"color\": \"Black\", \"maxGPULength\": \"285mm\"}','Case'),(103,'Fractal Design Node 202',90,'{\"formFactor\": [\"mini-ITX\"], \"dimensions\": \"W: 377mm H: 82mm D: 330mm\", \"color\": \"Black\", \"maxGPULength\": \"310mm\"}','Case'),(104,'Corsair Carbide Series 88R',65,'{\"formFactor\": [\"microATX\"], \"dimensions\": \"W: 199mm H: 448mm D: 378mm\", \"color\": \"Black\", \"maxGPULength\": \"383mm\"}','Case'),(105,'Cooler Master Silencio S400',95,'{\"formFactor\": [\"microATX\"], \"dimensions\": \"W: 210mm H: 418mm D: 408mm\", \"color\": \"Black\", \"maxGPULength\": \"319mm\"}','Case'),(106,'NZXT H400',110,'{\"color\": \"White\", \"dimensions\": \"340mm x 372mm x 333mm\", \"formFactor\": [\"microATX\"], \"maxGPULength\": \"402mm\"}','Case'),(107,'Thermaltake Versa H18',50,'{\"formFactor\": [\"microATX\"], \"dimensions\": \"W: 205mm H: 380mm D: 390mm\", \"color\": \"Black\", \"maxGPULength\": \"350mm\"}','Case'),(108,'Fractal Design Meshify C Mini',100,'{\"formFactor\": [\"microATX\"], \"dimensions\": \"W: 217mm H: 409mm D: 395mm\", \"color\": \"Black\", \"maxGPULength\": \"315mm\"}','Case'),(109,'ASUS ROG Strix Z490-I Gaming',250,'{\"socket\": \"LGA2066\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR5\", \"memorySlots\": 2, \"maxMemorySpeed\": \"4800MHz\"}','Motherboard'),(110,'Gigabyte X570 I Aorus Pro WiFi',220,'{\"socket\": \"LGA1700\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR4\", \"memorySlots\": 2, \"maxMemorySpeed\": \"5300MHz\"}','Motherboard'),(111,'MSI MPG B550I Gaming Edge WiFi',200,'{\"socket\": \"LGA2066\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR5\", \"memorySlots\": 2, \"maxMemorySpeed\": \"4866MHz\"}','Motherboard'),(112,'ASRock Z490M-ITX/ac',180,'{\"socket\": \"LGA1200\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR4\", \"memorySlots\": 2, \"maxMemorySpeed\": \"4500MHz\"}','Motherboard'),(113,'NZXT N7 Z490',230,'{\"socket\": \"LGA1200\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR4\", \"memorySlots\": 2, \"maxMemorySpeed\": \"4600MHz\"}','Motherboard'),(114,'Biostar Racing X570GT',160,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR4\", \"memorySlots\": 2, \"maxMemorySpeed\": \"4000MHz\"}','Motherboard'),(115,'ASUS Prime B550M-A WiFi',140,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR4\", \"memorySlots\": 2, \"maxMemorySpeed\": \"5100MHz\"}','Motherboard'),(116,'Gigabyte Z490I Aorus Ultra',240,'{\"socket\": \"LGA1200\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR4\", \"memorySlots\": 2, \"maxMemorySpeed\": \"5000MHz\"}','Motherboard'),(117,'ASRock B550M-ITX/ac',150,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR4\", \"memorySlots\": 2, \"maxMemorySpeed\": \"4733MHz\"}','Motherboard'),(118,'MSI MEG Z490I Unify',270,'{\"socket\": \"LGA1200\", \"interface\": \"M.2, SATA\", \"formFactor\": \"mini-ITX\", \"memoryType\": \"DDR4\", \"memorySlots\": 2, \"maxMemorySpeed\": \"5000MHz\"}','Motherboard'),(119,'ASUS TUF Gaming B550M-Plus',180,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4600MHz\"}','Motherboard'),(120,'Gigabyte B550M Aorus Pro',170,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"5400MHz\"}','Motherboard'),(121,'MSI MAG B550M Mortar',160,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4400MHz\"}','Motherboard'),(122,'ASRock B550M Steel Legend',150,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4733MHz\"}','Motherboard'),(123,'ASUS Prime Z490M-Plus',190,'{\"socket\": \"LGA1200\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4800MHz\"}','Motherboard'),(124,'Gigabyte Z490M Gaming X',200,'{\"socket\": \"LGA1200\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"5000MHz\"}','Motherboard'),(125,'MSI MAG Z490M Bazooka',210,'{\"socket\": \"LGA1200\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4800MHz\"}','Motherboard'),(126,'ASRock Z490M Pro4',180,'{\"socket\": \"LGA1200\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4500MHz\"}','Motherboard'),(127,'NZXT N7 B550M',220,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR4\", \"memorySlots\": 4, \"maxMemorySpeed\": \"5200MHz\"}','Motherboard'),(128,'Biostar Racing B550GTQ',140,'{\"socket\": \"AM4\", \"interface\": \"M.2, SATA\", \"formFactor\": \"microATX\", \"memoryType\": \"DDR5\", \"memorySlots\": 4, \"maxMemorySpeed\": \"4933MHz\"}','Motherboard'),(129,'Intel Core i7-12700K',450,'{\"cores\": 12, \"socket\": \"LGA1700\", \"frequency\": \"3.6GHz\", \"power\": 125}','CPU'),(130,'Intel Core i9-12900K',600,'{\"cores\": 16, \"socket\": \"LGA1700\", \"frequency\": \"3.2GHz\", \"power\": 150}','CPU'),(131,'Intel Core i5-12600K',300,'{\"cores\": 10, \"socket\": \"LGA1700\", \"frequency\": \"3.7GHz\", \"power\": 95}','CPU'),(132,'AMD Ryzen 7 3800X',330,'{\"cores\": 8, \"socket\": \"AM3\", \"frequency\": \"3.9GHz\", \"power\": 105}','CPU'),(133,'AMD Ryzen 5 3600',200,'{\"cores\": 6, \"socket\": \"AM3\", \"frequency\": \"3.6GHz\", \"power\": 65}','CPU'),(134,'AMD Ryzen 9 3900X',500,'{\"cores\": 12, \"socket\": \"AM3\", \"frequency\": \"3.8GHz\", \"power\": 105}','CPU'),(135,'Intel Core i7 X-Series',750,'{\"cores\": 10, \"socket\": \"LGA2066\", \"frequency\": \"3.3GHz\", \"power\": 140}','CPU'),(136,'Intel Core i9 X-Series',1000,'{\"cores\": 18, \"socket\": \"LGA2066\", \"frequency\": \"3.0GHz\", \"power\": 165}','CPU'),(137,'Intel Core i5 X-Series',450,'{\"cores\": 8, \"socket\": \"LGA2066\", \"frequency\": \"3.5GHz\", \"power\": 120}','CPU'),(138,'Intel Core i7-9700X',550,'{\"cores\": 8, \"socket\": \"LGA2066\", \"frequency\": \"3.6GHz\", \"power\": 130}','CPU'),(139,'Corsair Dominator Platinum 16GB DDR5',300,'{\"speed\": \"5200MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.1V\", \"latency\": \"CL40\", \"formFactor\": \"DIMM\"}','RAM'),(140,'G.Skill Trident Z5 32GB DDR5',450,'{\"speed\": \"5600MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.2V\", \"latency\": \"CL36\", \"formFactor\": \"DIMM\"}','RAM'),(141,'Kingston Fury Beast 16GB DDR5',280,'{\"speed\": \"5300MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.1V\", \"latency\": \"CL38\", \"formFactor\": \"DIMM\"}','RAM'),(142,'Team T-Force Delta RGB 32GB DDR5',480,'{\"speed\": \"6000MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.25V\", \"latency\": \"CL40\", \"formFactor\": \"DIMM\"}','RAM'),(143,'Patriot Viper Venom 16GB DDR5',320,'{\"speed\": \"5400MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.2V\", \"latency\": \"CL36\", \"formFactor\": \"DIMM\"}','RAM'),(144,'Crucial Ballistix Max 16GB DDR5',310,'{\"speed\": \"5800MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.2V\", \"latency\": \"CL38\", \"formFactor\": \"DIMM\"}','RAM'),(145,'HyperX Predator 32GB DDR5',500,'{\"speed\": \"6000MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.3V\", \"latency\": \"CL40\", \"formFactor\": \"DIMM\"}','RAM'),(146,'Adata XPG Lancer 32GB DDR5',460,'{\"speed\": \"5800MHz\", \"size\": \"32GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.25V\", \"latency\": \"CL36\", \"formFactor\": \"DIMM\"}','RAM'),(147,'Silicon Power Gaming 16GB DDR5',290,'{\"speed\": \"5600MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.2V\", \"latency\": \"CL38\", \"formFactor\": \"DIMM\"}','RAM'),(148,'Lexar Hades 16GB DDR5',275,'{\"speed\": \"5200MHz\", \"size\": \"16GB\", \"memoryType\": \"DDR5\", \"voltage\": \"1.1V\", \"latency\": \"CL40\", \"formFactor\": \"DIMM\"}','RAM');
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_builds`
--

DROP TABLE IF EXISTS `pc_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc_builds` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(500) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeckl8m6rvj7jpvapkmryse08i` (`user_id`),
  CONSTRAINT `FKeckl8m6rvj7jpvapkmryse08i` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_builds`
--

LOCK TABLES `pc_builds` WRITE;
/*!40000 ALTER TABLE `pc_builds` DISABLE KEYS */;
INSERT INTO `pc_builds` VALUES (1,'https://geekawhat.com/wp-content/uploads/2023/04/RTX-4070-Founders-Build-Feature.jpg',2),(2,'https://www.asus.com/event/pcdiy/global/assets/img/builds/designs-by-ifr-z690-formula-1000x800.png',6),(6,'https://cdn.avadirect.com/blog/blog/wp-content/webp-express/webp-images/uploads/2023/08/white-gaming-pc-inside.jpg.webp',2),(18,'https://www.overclockers.co.uk/blog/wp-content/uploads/2022/06/b46ebd84-b969-416d-87b1-7803ac109e2b-1024x536.png.webp',6),(42,'https://www.wepc.com/wp-content/uploads/2023/02/Best-gaming-PC-build-under-700.jpg',2),(44,'https://www.neweggbusiness.com/smartbuyer/wp-content/uploads/DARK_FLASH_TOWER_WEBREADY-08678.jpg',11),(46,'https://www.cnet.com/a/img/resize/21b85a87ca023690d3ad3cd1e586ddf143268022/hub/2021/10/19/deb2bcd4-4b54-48de-b44f-4a12bf60a534/bld-kit.jpg?auto=webp&width=1200',11);
/*!40000 ALTER TABLE `pc_builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcbuild_components`
--

DROP TABLE IF EXISTS `pcbuild_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pcbuild_components` (
  `pcbuild_id` bigint NOT NULL,
  `component_id` bigint NOT NULL,
  KEY `FK5qbimb0o3wcvgkp8ka0vm9w71` (`component_id`),
  KEY `FK9pyaru76mmv2lj5oe73stmcq1` (`pcbuild_id`),
  CONSTRAINT `FK5qbimb0o3wcvgkp8ka0vm9w71` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`),
  CONSTRAINT `FK9pyaru76mmv2lj5oe73stmcq1` FOREIGN KEY (`pcbuild_id`) REFERENCES `pc_builds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcbuild_components`
--

LOCK TABLES `pcbuild_components` WRITE;
/*!40000 ALTER TABLE `pcbuild_components` DISABLE KEYS */;
INSERT INTO `pcbuild_components` VALUES (1,1),(1,2),(1,6),(1,11),(1,13),(1,14),(1,18),(2,2),(2,4),(2,5),(2,9),(2,10),(2,12),(2,17),(6,2),(6,4),(6,5),(6,8),(6,11),(6,13),(6,17),(18,1),(18,6),(18,8),(18,10),(18,12),(18,14),(18,17),(42,5),(42,8),(42,17),(42,37),(42,61),(42,70),(42,80),(42,91),(42,130),(44,35),(44,41),(44,50),(44,60),(44,71),(44,79),(44,91),(44,131),(46,5),(46,8),(46,16),(46,29),(46,62),(46,70),(46,94),(46,130);
/*!40000 ALTER TABLE `pcbuild_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,1),(6,2),(10,2),(11,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'raivozelcs@gmail.com','Raivo Zelcs','$2a$10$rUuoZxjekT6c2A.FIJXjt.Ba8LGbCzgR7RP0MgL5ENACjNsySuZNm','Phenomenums'),(6,'davidroar@gmail.com','David Roar','$2a$10$zbKTv4B8dpLIBYLii7ApL.FYh6cKtP.maYzd8I9hv4SZnHi1onT3C','Roary'),(10,'kateryna@gmail.com','Katya Nakonechna','$2a$10$zO3D31JhsI2SJHkGW0Q1FufRb4rkjth2MCBQL8QgPIFI1FHDPEAJy','Katnak'),(11,'gary@gmail.com','gary spain','$2a$10$zSdXa8YAVVCmVxdmV90/1uDkJpYfJ0TNt3/77C6fnHcKrKERzDZPu','gary1979');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-04 16:28:31
