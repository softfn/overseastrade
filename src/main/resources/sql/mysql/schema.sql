/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50140
Source Host           : localhost:3306
Source Database       : overseastrade

Target Server Type    : MYSQL
Target Server Version : 50140
File Encoding         : 65001

Date: 2014-09-13 15:03:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ot_article
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
-- Records of ot_article
-- ----------------------------
INSERT INTO `ot_article` VALUES ('aboutus', 'About us', 'About us trade', '<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\">Shenzhen Overseas Trade Limited Company is a professional supplier of high quality home used healthcare products in Shenzhen city which is famous for its quality manufacturing industry city of China.</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\">By now we are successful to get good feedback from oversea market on our following products series: Fingertip Pulse Oximeter, Fetal Doppler, and Digital Thermometer, etc. They are selling well in North America, Europe countries and South Asian countries.</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\">We can offer professional OEM service too. All products of our company can be customized, you just need to transfer your design photo and image by SKYPE,E-mail and other way to us. Warmly welcome your OEM orders.</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\">\"Quality First, Customer First\" is our work ethics. Sincerely thank our customers, dealers, and end users for your care and support to our company. Welcome to contact us if you need any high quality products and good service from China.</span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Tel: 86-755-18926005906</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Contact: Mr. Zhang</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Email:overseastradecn@outlook.com</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Skype: overseastradecn@outlook.com</strong></span> \r\n</p>', '2014-09-08 15:27:11');
INSERT INTO `ot_article` VALUES ('contactus', 'Contact us', 'Contact us', '<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Tel: 86-755-18926005906</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Contact: Mr. Zhang</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Email:overseastradecn@outlook.com</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong>Skype: overseastradecn@outlook.com</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong><br />\r\n</strong></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<span style=\"font-size:14px;line-height:1.5;\"><strong> \r\n	<iframe src=\"http://localhost:8080/static/kindeditor/plugins/baidumap/index.html?center=114.034513%2C22.533223&zoom=14&width=666&height=400&markers=114.034513%2C22.533223&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:676px;height:420px;\">\r\n	</iframe>\r\n<br />\r\n</strong></span> \r\n</p>', '2014-09-08 18:38:08');
INSERT INTO `ot_article` VALUES ('faq', 'FAQ', 'trade faq', '<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">Q: <strong>How do I pay for my purchase?</strong></span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">A: We accept Paypal, Western Union, Money Gram,\r\nTT, for small amount below $1000 suggest Paypal, Western Union or Money Gram to\r\nsave handling fee.</span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span> </span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">Q: <strong>What’s the shipping way?</strong></span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">A: Optional shipping way By Air, By Sea, By\r\nexpress(DHL/UPS/FEDEX/EMS)</span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span><span><span> </span><span style=\"line-height:2;font-size:14px;\">For\r\nsmall quantity suggest to by express, for large volume suggest by air, for big\r\nquantity by sea.</span></span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span> </span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">Q:<strong>What’s the delivery time?</strong></span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">A: By air normal 6-7 working days(exactly\r\nbased on the flight)</span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span><span><span> </span><span style=\"line-height:2;font-size:14px;\">By\r\nexpress normal 5-6 working days (except </span></span></span><span style=\"color: rgb(34, 34, 34); line-height: 2; font-family:; font-size: 14px;\" arial\",\"sans-serif\";\"=\"\">Warehouse\r\nexplosion time when on Christmas season)</span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"color: rgb(34, 34, 34); font-family:;\" arial\",\"sans-serif\";\"=\"\"><span><span> </span><span style=\"line-height:2;font-size:14px;\">By\r\nsea normal 25-35 working days delivery</span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span> </span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">Q: <strong>Is there any tracking number for parcel?</strong></span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-size:14px;\">A:\r\nYes, By air there is Air way landing bill for your reference, By express there\r\nis tracking number. By sea there is landing bill paper.</span></span> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<b><span><span> </span></span></b> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<b><span><span> </span></span></b> \r\n</p>\r\n<p>\r\n	<span> </span> \r\n</p>\r\n<p>\r\n	<span><span> </span></span> \r\n</p>', '2014-09-09 22:17:29');

-- ----------------------------
-- Table structure for ot_category
-- ----------------------------
DROP TABLE IF EXISTS `ot_category`;
CREATE TABLE `ot_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_category
-- ----------------------------
INSERT INTO `ot_category` VALUES ('1', 'fwe', null, '2014-09-13 00:00:09');
INSERT INTO `ot_category` VALUES ('2', 'fff', '1', '2014-09-13 00:00:19');

-- ----------------------------
-- Table structure for ot_download
-- ----------------------------
DROP TABLE IF EXISTS `ot_download`;
CREATE TABLE `ot_download` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` longtext,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_download
-- ----------------------------

-- ----------------------------
-- Table structure for ot_feedback
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_feedback
-- ----------------------------
INSERT INTO `ot_feedback` VALUES ('30', 'gg', 'wef', 'wef', 'wef@fwe.com', 'w', '', 'few', '', '', '0', '2014-09-03 21:22:46');
INSERT INTO `ot_feedback` VALUES ('31', 'adf', 'few', 'wef', 'wef@sf.com', 'w432', 'wef', 'wfwefwe', 'fwfw', 'fewf', '0', '2014-09-08 17:21:41');
INSERT INTO `ot_feedback` VALUES ('32', 'dfwef', 'wefewf', 'wef', 'wef@ef.com', 'fwef', 'fwe', 'wef', '', '', '0', '2014-09-08 17:28:02');
INSERT INTO `ot_feedback` VALUES ('33', 'fwef', 'wef', 'wef', 'wfw@fwef.com', '4354353', '', 'dsafgewavgf', '', '', '0', '2014-09-08 17:30:26');
INSERT INTO `ot_feedback` VALUES ('34', 'wefw', 'efewf', 'grewg', 'gergfr324@afe.com', '433', '', 'fsafsdf', '', '', '0', '2014-09-08 17:30:48');
INSERT INTO `ot_feedback` VALUES ('35', 'ef', 'wfe', 'wefwef', 'wefwefg@fa.com', '43', '', 'dsaf', '', '', '0', '2014-09-08 17:31:46');
INSERT INTO `ot_feedback` VALUES ('36', 'wqd', 'qwd', 'qwd', 'qwd@sdf.com', '3232', '', 'sdadf', '', '', '0', '2014-09-08 17:32:23');
INSERT INTO `ot_feedback` VALUES ('37', 'hdetrh', 'trh', 'trhtrh', 'trerhtew@asdf.com', '2343', '', 'geoigreg', '', '', '0', '2014-09-08 17:32:59');
INSERT INTO `ot_feedback` VALUES ('38', 'fwef', 'wefwef', 'wefwef', 'wef@ef.com', '43f', '', 'saf', '', '', '0', '2014-09-08 17:33:49');

-- ----------------------------
-- Table structure for ot_news
-- ----------------------------
DROP TABLE IF EXISTS `ot_news`;
CREATE TABLE `ot_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `content` longtext,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_news
-- ----------------------------
INSERT INTO `ot_news` VALUES ('2', 'ffffff', 'fffffffffwe', '2014-09-09 23:48:48');
INSERT INTO `ot_news` VALUES ('3', 'f', 'ffffffff', '2014-09-09 23:49:57');
INSERT INTO `ot_news` VALUES ('4', 'erg', 'ger', '2014-09-09 23:50:03');
INSERT INTO `ot_news` VALUES ('5', 'htr', 'rhtrth', '2014-09-09 23:54:08');
INSERT INTO `ot_news` VALUES ('6', 'Shenzhen Overseas Trade Limited ', 'Shenzhen Overseas Trade Limited', '2014-09-11 00:56:43');
INSERT INTO `ot_news` VALUES ('7', 'Shenzhen Overseas Trade Limited Shenzhen Overseas Trade Limited ', 'Shenzhen Overseas Trade Limited Shenzhen Overseas Trade Limited Shenzhen Overseas Trade Limited', '2014-09-11 00:56:49');
INSERT INTO `ot_news` VALUES ('8', 'wef', 'wef', '2014-09-12 00:05:46');
INSERT INTO `ot_news` VALUES ('9', 'ggggggggggg', 'ggggggggg', '2014-09-12 00:05:51');
INSERT INTO `ot_news` VALUES ('10', 'gggggggg', 'gggggggggg', '2014-09-12 00:05:55');
INSERT INTO `ot_news` VALUES ('11', 'erg', 'ergerg', '2014-09-12 00:05:58');
INSERT INTO `ot_news` VALUES ('12', 'gergerg', 'ergergre', '2014-09-12 00:06:03');
INSERT INTO `ot_news` VALUES ('13', 'ergergre', 'gergreg', '2014-09-12 00:06:07');
INSERT INTO `ot_news` VALUES ('14', 'gergre', 'ergreg', '2014-09-12 00:06:11');
INSERT INTO `ot_news` VALUES ('15', 'h', 'ergerg', '2014-09-12 00:06:16');
INSERT INTO `ot_news` VALUES ('16', 'ergreg', 'ergerg', '2014-09-12 00:06:22');
INSERT INTO `ot_news` VALUES ('17', 'hhrth', 'rthrth', '2014-09-12 00:06:27');
INSERT INTO `ot_news` VALUES ('18', 'ytjrytj', 'trjtyj', '2014-09-12 00:06:31');
INSERT INTO `ot_news` VALUES ('19', 'kyuk', 'yuk', '2014-09-12 00:06:35');
INSERT INTO `ot_news` VALUES ('20', 'retjkl', 'fgjk', '2014-09-12 00:06:39');
INSERT INTO `ot_news` VALUES ('21', 'jtryj', 'tyjtyjr', '2014-09-12 00:06:44');
INSERT INTO `ot_news` VALUES ('22', 'gggggggggg', 'hrthrth', '2014-09-12 00:06:52');
INSERT INTO `ot_news` VALUES ('23', 'grerg', 'ergerg', '2014-09-12 00:07:15');
INSERT INTO `ot_news` VALUES ('24', 'hhhhhhhhhh', 'h', '2014-09-12 00:07:20');
INSERT INTO `ot_news` VALUES ('25', 'jtyj', 'trjty', '2014-09-12 00:07:23');
INSERT INTO `ot_news` VALUES ('26', 'kyuk', 'yukyuk', '2014-09-12 00:07:27');
INSERT INTO `ot_news` VALUES ('27', 'ktyuk', 'ytk', '2014-09-12 00:07:32');
INSERT INTO `ot_news` VALUES ('28', 'lkiukl', 'iutkiu', '2014-09-12 00:07:36');
INSERT INTO `ot_news` VALUES ('29', 'uiylu', 'kyuik', '2014-09-12 00:07:40');
INSERT INTO `ot_news` VALUES ('30', 'luiykl', 'tukyuk', '2014-09-12 00:07:45');
INSERT INTO `ot_news` VALUES ('31', 'lkuitku', 'ktyk', '2014-09-12 00:07:48');
INSERT INTO `ot_news` VALUES ('32', 'utk', 'tku', '2014-09-12 00:07:52');
INSERT INTO `ot_news` VALUES ('33', 'sdfsd', 'bdf', '2014-09-12 00:07:56');
INSERT INTO `ot_news` VALUES ('34', 'gdngf', '<p style=\"color:#242424;font-family:Arial;background-color:#FFFFFF;\">\r\n	settlement has been billed as complementing other government programs designed to boost the housing market that has been a drag on the economic recovery, a key issue for President Barack Obama as he fights for re-election in November.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;background-color:#FFFFFF;\">\r\n	The settlement has been estimated at up to $25 billion in value, but federal officials have said the actual relief to homeowners could be closer to $40 billion because of the way the deal is scored\r\n</p>', '2014-09-12 01:05:21');
INSERT INTO `ot_news` VALUES ('35', 'California and New York, two big holdout states in a $25 billion mortgage settlement', '<p class=\"first\" style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	(Reuters) - California and New York, two big holdout states in a $25 billion mortgage settlement, are expected to join the deal, smoothing the way for an announcement on Thursday, according to a person familiar with the matter.\r\n</p>\r\n<p class=\"first\" style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	Florida, with its large distressed housing market, was also close to joining the settlement that resolves civil government lawsuits over faulty foreclosures and servicing misconduct by top U.S. banks, a separate person familiar with the deal said on Wednesday.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The announcement will cap more than a year of chaotic negotiations among state and federal officials, and the banks, who have been accused of using robosigners and unlawful documentation to deal with a flood of foreclosures.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The Obama administration has estimated that up to 1 million homeowners could benefit from the deal through mortgage writedowns and other forms of relief.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The settlement has been billed as complementing other government programs designed to boost the housing market that has been a drag on the economic recovery, a key issue for President Barack Obama as he fights for re-election in November.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The settlement has been estimated at up to $25 billion in value, but federal officials have said the actual relief to homeowners could be closer to $40 billion because of the way the deal is scored.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The core group of banks involved in settlement talks are Bank of America Corp , Wells Fargo &amp; Co , JPMorgan Chase &amp; Co , Citigroup Inc and Ally Financial Inc.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	More than 40 states said they would join the settlement in advance of a February 6 deadline, but several states continued negotiations to address concerns specific to their state.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The value of the state and federal settlement would have dropped significantly if California and Florida decided not to join.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	A handful of other states that had dragged their feet in signing on, including Delaware and Massachusetts, are expected to also participate in the settlement, but the situation is still fluid, the first person familiar with the matter said.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	Dissident states and several activist groups had criticized earlier terms of the proposed deal as too lenient toward the banks.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	WINNING CONCESSIONS\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	California and New York had stayed on the sidelines over concerns they would not be able to pursue further mortgage-related investigations.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	California, one of the hardest-hit states in the foreclosure crisis, also wanted assurances of how much relief would go specifically to its homeowners.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The proposed settlement distributed last month to state officials included rough estimates on the benefits each state\'s homeowners might receive, but did not include guaranteed numbers.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	California received a guarantee its struggling homeowners would receive around $8 billion in relief, two people familiar with the negotiations said. The state itself would receive around $430 million for foreclosure prevention and other housing efforts.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	New York Attorney General Eric Schneiderman, for his part, will be allowed to continue with a lawsuit he filed last week against three of the banks involved in the talks, according to one person familiar with the deal.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The New York suit initially was seen as a stumbling block, because it accused the banks of some conduct expected to be resolved in the settlement.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	Schneiderman will also play a leading role in a federal-state working group Obama formed last month to investigate misconduct in the pooling and sale of risky home loans.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	MONEY BREAKDOWN\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	Under the settlement, the banks would provide $17 billion in loan modifications for delinquent borrowers, but the actual homeowner benefits from modifications would be valued at $32.3 billion, according to a source familiar with the deal.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	It would also include $3 billion in refinancing for homeowners who are current on their payments but unable to refinance because they owe more than their homes are worth; and around $1.5 billion in direct payments of up to $2,000 each to borrowers who lost their homes to foreclosure,\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	Participating states will also receive a total of roughly $2.5 billion for housing programs.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	Representatives for Bank of America, JPMorgan, Wells Fargo, Citigroup and Ally declined to comment.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	Representatives for the attorneys general in New York, Massachusetts and California declined to comment.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	A spokeswoman for Florida Attorney General Pam Bondi said late Wednesday that Bondi is actively involved in the settlement discussions.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	\"While Attorney General Bondi has not yet joined the settlement, she is hopeful that a resolution will be reached soon,\" spokeswoman Jennifer Meale said.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	The state will receive around $350 million, and its attorney general is working to receive a guarantee similar to the one California received, the two people familiar with the matter said.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	A spokesman for Delaware Attorney General Beau Biden, who is the son of U.S. Vice President Joe Biden, said the attorney general is still considering the proposed settlement terms.\r\n</p>\r\n<p style=\"color:#242424;font-family:Arial;text-indent:2em;background-color:#FFFFFF;\">\r\n	(Reporting By Aruna Viswanatha in Washington, D.C., Karen Freifeld in New York, and Rick Rothacker in Charlotte, N.C.; Additional reporting by Kevin Gray; Editing by Tim Dobbyn)\r\n</p>', '2014-09-12 01:07:50');

-- ----------------------------
-- Table structure for ot_picture
-- ----------------------------
DROP TABLE IF EXISTS `ot_picture`;
CREATE TABLE `ot_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `seq` int(3) DEFAULT NULL,
  `block_size` int(1) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_picture
-- ----------------------------

-- ----------------------------
-- Table structure for ot_product
-- ----------------------------
DROP TABLE IF EXISTS `ot_product`;
CREATE TABLE `ot_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `brief` text,
  `description` longtext,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_product
-- ----------------------------

-- ----------------------------
-- Table structure for ot_refer_product
-- ----------------------------
DROP TABLE IF EXISTS `ot_refer_product`;
CREATE TABLE `ot_refer_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `refer_product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_refer_product
-- ----------------------------

-- ----------------------------
-- Table structure for ot_task
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
-- Records of ot_task
-- ----------------------------

-- ----------------------------
-- Table structure for ot_user
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_user
-- ----------------------------
INSERT INTO `ot_user` VALUES ('1', 'admin', 'Admin', 'd713b757b71414a0db4f91d47fd45e98bf406dd7', '871736c2532960ac', 'admin', '2012-06-04 01:00:00');
INSERT INTO `ot_user` VALUES ('2', 'user', 'Calvin', '2488aa0c31c624687bd9928e0a5d29e7d1ed520b', '6d65d24122c30500', 'user', '2012-06-04 02:00:00');
