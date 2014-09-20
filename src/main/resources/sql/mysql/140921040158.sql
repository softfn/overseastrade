/*
MySQL Backup
Source Server Version: 5.6.17
Source Database: overseastrade
Date: 9/21/2014 04:01:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `ot_article`
-- ----------------------------
DROP TABLE IF EXISTS `ot_article`;
CREATE TABLE `ot_article` (
  `id` varchar(20) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `content` longtext,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_category`
-- ----------------------------
DROP TABLE IF EXISTS `ot_category`;
CREATE TABLE `ot_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` int(3) DEFAULT '1',
  `is_new` tinyint(1) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_download`
-- ----------------------------
DROP TABLE IF EXISTS `ot_download`;
CREATE TABLE `ot_download` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` longtext,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `ot_feedback`;
CREATE TABLE `ot_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` longtext,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  `state` char(1) DEFAULT '0',
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_home`
-- ----------------------------
DROP TABLE IF EXISTS `ot_home`;
CREATE TABLE `ot_home` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `brief` varchar(1000) DEFAULT NULL,
  `seq` int(255) DEFAULT NULL,
  `refer_id` int(20) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_news`
-- ----------------------------
DROP TABLE IF EXISTS `ot_news`;
CREATE TABLE `ot_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `content` longtext,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_picture`
-- ----------------------------
DROP TABLE IF EXISTS `ot_picture`;
CREATE TABLE `ot_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `seq` int(255) DEFAULT '1',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_product`
-- ----------------------------
DROP TABLE IF EXISTS `ot_product`;
CREATE TABLE `ot_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `hot` int(255) DEFAULT '1',
  `keywords` varchar(500) DEFAULT NULL,
  `brief` text,
  `description` longtext,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_refer_product`
-- ----------------------------
DROP TABLE IF EXISTS `ot_refer_product`;
CREATE TABLE `ot_refer_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `refer_product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_task`
-- ----------------------------
DROP TABLE IF EXISTS `ot_task`;
CREATE TABLE `ot_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ot_user`
-- ----------------------------
DROP TABLE IF EXISTS `ot_user`;
CREATE TABLE `ot_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `ot_article` VALUES ('aboutus','About us','About us trade','<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\">Shenzhen Overseas Trade Limited Company is a professional supplier of high quality home used healthcare products in Shenzhen city which is famous for its quality manufacturing industry city of China.</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\">By now we are successful to get good feedback from oversea market on our following products series: Fingertip Pulse Oximeter, Fetal Doppler, and Digital Thermometer, etc. They are selling well in North America, Europe countries and South Asian countries.</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\">We can offer professional OEM service too. All products of our company can be customized, you just need to transfer your design photo and image by SKYPE,E-mail and other way to us. Warmly welcome your OEM orders.</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\">\"Quality First, Customer First\" is our work ethics. Sincerely thank our customers, dealers, and end users for your care and support to our company. Welcome to contact us if you need any high quality products and good service from China.</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Tel: 86-755-18926005906</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Contact: Mr. Zhang</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Email:overseastradecn@outlook.com</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Skype: overseastradecn@outlook.com</strong></span> \r\n</p>','2014-09-08 15:27:11'), ('contactus','Contact us','Contact us','<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Tel: 86-755-18926005906</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Contact: Mr. Zhang</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Email:overseastradecn@outlook.com</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Skype: overseastradecn@outlook.com</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong><br />\r\n</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong> \r\n	<iframe src=\"http://localhost:8080/static/kindeditor/plugins/baidumap/index.html?center=114.034513%2C22.533223&zoom=14&width=666&height=400&markers=114.034513%2C22.533223&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:676px;height:420px;\">\r\n	</iframe>\r\n<br />\r\n</strong></span> \r\n</p>','2014-09-08 18:38:08'), ('faq','FAQ','trade faq','<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">Q: <strong>How do I pay for my purchase?</strong></span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">A: We accept Paypal, Western Union, Money Gram,\r\nTT, for small amount below $1000 suggest Paypal, Western Union or Money Gram to\r\nsave handling fee.</span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span> </span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">Q: <strong>What’s the shipping way?</strong></span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">A: Optional shipping way By Air, By Sea, By\r\nexpress(DHL/UPS/FEDEX/EMS)</span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span><span><span> </span><span style=\"line-height:2;font-size:14px;\">For\r\nsmall quantity suggest to by express, for large volume suggest by air, for big\r\nquantity by sea.</span></span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span> </span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">Q:<strong>What’s the delivery time?</strong></span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">A: By air normal 6-7 working days(exactly\r\nbased on the flight)</span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span><span><span> </span><span style=\"line-height:2;font-size:14px;\">By\r\nexpress normal 5-6 working days (except </span></span></span><span style=\"color: rgb(34, 34, 34); line-height: 2; font-family:; font-size: 14px;\" arial\",\"sans-serif\";\"=\"\">Warehouse\r\nexplosion time when on Christmas season)</span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"color: rgb(34, 34, 34); font-family:;\" arial\",\"sans-serif\";\"=\"\"><span><span> </span><span style=\"line-height:2;font-size:14px;\">By\r\nsea normal 25-35 working days delivery</span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span> </span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">Q: <strong>Is there any tracking number for parcel?</strong></span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">A:\r\nYes, By air there is Air way landing bill for your reference, By express there\r\nis tracking number. By sea there is landing bill paper.</span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<b><span><span> </span></span></b> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<b><span><span> </span></span></b> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span> </span></span> \r\n</p>','2014-09-09 22:17:29');
INSERT INTO `ot_category` VALUES ('44','Finger Pulse Oximeter','001',NULL,'1','0','2014-09-20 00:49:11'), ('45','Thermometer','002',NULL,'1','0','2014-09-20 00:51:08'), ('46','Fetal Doppler','003',NULL,'1','0','2014-09-20 00:49:53'), ('47','Infrared Thermometer','002001','45','1','0','2014-09-20 00:50:41'), ('48','Digital Thermometer','002002','45','1','0','2014-09-20 00:51:34');
INSERT INTO `ot_home` VALUES ('1','wfwef','NEW! Get Heart Smart With Essential Omega III NEW! Get paid to shop with Cashback','1','8','/attached/image/20140921/20140921023956_280.jpg','2014-09-21 03:23:13'), ('2','wfwef','NEW! Support Your Skin on a Cellular Level NEW! Get paid to shop with Cashback','2','8','/attached/image/20140920/20140920002506_477.png','2014-09-21 03:23:13'), ('3','f2fweqf','NEW! Indulge in Luxury With Royal Spa NEW! Get paid to shop with Cashback','3','8','/attached/image/20140917/20140917215640_241.jpg','2014-09-21 03:23:13'), ('7','f2fweqf','NEW! Get paid to shop with Cashback NEW! Get paid to shop with Cashback','4','7','/attached/image/20140914/20140914223116_894.png','2014-09-21 03:23:13'), ('8','f2fweqf','Trade Limited Company is a professional supplier of high  NEW! Get paid to shop with Cashback','5','7','/attached/image/20140917/20140917215640_241.jpg','2014-09-21 03:23:13'), ('9','f2fweqf','Trade Limited Company is a professional supplier of high  NEW! Get paid to','6','7','/attached/image/20140917/20140917215640_241.jpg','2014-09-21 03:23:13');
INSERT INTO `ot_picture` VALUES ('24','27','OT-A3     ','/attached/image/20140920/20140920005848_894.jpg','1',NULL), ('25','27','OT-A3     ','/attached/image/20140920/20140920005848_324.jpg','2',NULL), ('26','27','OT-A3     ','/attached/image/20140920/20140920005848_592.jpg','3',NULL), ('27','27','OT-A3     ','/attached/image/20140920/20140920005930_184.jpg','4',NULL);
INSERT INTO `ot_product` VALUES ('1','44','Finger Pulse Oximeter','1','Finger Pulse Oximeter、Oximeter、Oximetry','Model No: OT-A3     Test blood Oxygen Model No: OT-A3   Model No: OT-A3     Test blood Oxygen Model No: OT-A3     Test blood Oxygen Model No: OT-A3     Test blood Oxygen   Test blood Oxygen Model No: OT-A3     Test blood Oxygen\r\n','<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">OLED\r\ndisplay Fingertip pulse oximeter</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">OT-A3</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<strong><span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Features:</span></span></strong> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:; background-color: rgb(229, 102, 0);\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;background-color:#E56600;\">-\r\nReliable accuracy and durability</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:; background-color: rgb(229, 102, 0);\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;background-color:#E56600;\">- Two\r\nColor OLED Display, four display modes.</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:; background-color: rgb(229, 102, 0);\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;background-color:#E56600;\">-\r\n4-Direction Display adjustable.</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">- Low\r\nvoltage indicator, Real-time spot-checks.-</span></span><span style=\"font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Low\r\npower consumption,50 hours continuous to work.</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">- Low\r\nPerfusion&nbsp;≤0.4%</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">-\r\nAutomatic power off when no signal</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">-\r\nSmall and light weight, convenient to carry</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<blockquote>\r\n	<blockquote>\r\n		<blockquote>\r\n			<p align=\"left\" style=\"text-indent:2em;\">\r\n				<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">- <span style=\"font-size:24px;\">Widely used in hospital, home healthcare, oxygen bar, community medical centre,\r\nalpine area, sports healthcare etc.</span></span></span> \r\n			</p>\r\n		</blockquote>\r\n	</blockquote>\r\n</blockquote>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<strong><span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Specification:</span></span></strong> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<img width=\"437\" height=\"308\" title=\"\" align=\"right\" style=\"width:437px;height:308px;\" alt=\"\" src=\"/attached/image/20140920/20140920005848_894.jpg\" /> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">DisplayOLED\r\ntwo color display</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">SpO2</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:small;\"><span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\">Measurement\r\nrange: 70</span><span style=\"color:black;\"><span style=\"font-family:宋体;\">～</span></span><span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\">99%Resolution:&nbsp;±1%Accuracy:&nbsp;±2%\r\n(70%</span><span style=\"color:black;\"><span style=\"font-family:宋体;\">～</span></span><span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\">99%), unspecified\r\n(&lt;70%)</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Pulse\r\nrate</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:small;\"><span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\">Measurement\r\nrange: 30</span><span style=\"color:black;\"><span style=\"font-family:宋体;\">～</span></span><span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\">240\r\nbpmResolution:&nbsp;±1%Accuracy:&nbsp;±2bpm or&nbsp;±2% (select larger) Low\r\nPerfusion&nbsp;≤0.4%</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Power</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">1.5V\r\n(AAA size) alkaline battery x 2Supply voltage: 2.6~3.6V</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Working\r\ncurrent≤30mA</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\"> </span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Automatic\r\npower-offAutomatically power off when no signal in the oximeter for more than 8\r\nseconds</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Dimension\r\n&amp; Weightnearly 50g each pulse oximeter, the real weight depends on the quantities\r\nyou need in an order, which should be more than 100 pieces: 40*40*40cm=11KG\r\naccoding to its&nbsp;volumetric weight&nbsp;(without batteries--NOTE:batteries\r\nare not allowed for international air transportation for the safety of shipping\r\nand protection environmen)</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"color: black; font-family:;\" arial\",\"sans-serif\";\"=\"\"><span style=\"font-size:small;\">Package\r\nContent:- 1 x Fingertip Oximeter- 1 x Lanyard- 1 x English user manual</span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-family:宋体;font-size:small;\"> <br />\r\n</span> \r\n</p>','2014-09-20 01:09:59');
INSERT INTO `ot_user` VALUES ('1','flora','Flora','be0a3743c5afd7bf7d6054bafd4d4224c3ef0c30','50b1d01f563c328a','admin','2012-06-04 01:00:00'), ('2','softfn','WillBen','be0a3743c5afd7bf7d6054bafd4d4224c3ef0c30','50b1d01f563c328a','admin','2014-09-21 03:55:43'), ('3','admin','Admin','be0a3743c5afd7bf7d6054bafd4d4224c3ef0c30','50b1d01f563c328a','admin','2014-09-21 03:55:43');
