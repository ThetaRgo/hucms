/*
Navicat MySQL Data Transfer

Source Server         : mysql_conn
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : salesys

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-04-04 14:06:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for h_bill
-- ----------------------------
DROP TABLE IF EXISTS `h_bill`;
CREATE TABLE `h_bill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_no` varchar(255) DEFAULT NULL,
  `bill_price` decimal(9,2) DEFAULT NULL,
  `bill_date` datetime DEFAULT NULL,
  `bill_qty` int(11) DEFAULT NULL,
  `bill_person` varchar(10) DEFAULT NULL,
  `cust_name` varchar(50) DEFAULT NULL,
  `cust_email` varchar(50) DEFAULT NULL,
  `cust_tel` varchar(50) DEFAULT NULL,
  `is_pay` varchar(1) DEFAULT NULL,
  `stock_out` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_bill
-- ----------------------------
INSERT INTO `h_bill` VALUES ('11', 'T20-20', '45.00', '2018-03-15 00:00:00', '5', 'admi', 'SLDFKJ', 'RWERFDSF', 'SDFSD', 'N', 'Y');
INSERT INTO `h_bill` VALUES ('12', 'T20-20', '45.00', '2020-02-18 00:00:00', '56', 'admi', 'LKJIO', '234WEFRWE', '24234', 'Y', 'Y');
INSERT INTO `h_bill` VALUES ('18', 'T20-20', '3400.00', '2018-03-14 00:00:00', '2', 'admi', '流沙', '额外人违法所得发', '23423423432', 'Y', 'Y');
INSERT INTO `h_bill` VALUES ('19', 'T20-20', '3400.00', '2018-03-14 00:00:00', '2', 'admi', '流沙', '额外人违法所得发', '23423423432', 'Y', 'Y');

-- ----------------------------
-- Table structure for h_session
-- ----------------------------
DROP TABLE IF EXISTS `h_session`;
CREATE TABLE `h_session` (
  `sessionid` varchar(64) NOT NULL,
  `session_data` varchar(500) DEFAULT NULL,
  `session_create_time` datetime DEFAULT NULL,
  `session_expire_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_session
-- ----------------------------
INSERT INTO `h_session` VALUES ('07c7c6ae09aa474aa55c317b926d7546', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('0b63962ba2f94e229cbe1899b8cf1b7a', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('117f8f97dacd4d1da9142d962e93597d', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('163016d68f5e498ab9fae0f5f6782b62', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('205c1aa01db44457bf07be112fb22c71', '{\'user_name\': u\'\\u674e\\u8d85\', \'user_no\': u\'1001\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('23bf855c25ff4607a94d9c146f80b996', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('2508b1d113b746e1a78011816d87572c', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('25ae22dff2434a36aef7607e47027457', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('291dab6253ee45daa5b15bcaa2b808bd', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('2995f446642e49a48dcaa388840e6fb7', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('2a5ae23011434dce8dde3caf762d85f4', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('2e040162b25e40ffba799140817ede0a', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('2e925d70116b490a96c00dcd5216bc2f', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('302ec9eb897d4ea19f9aa29c1a5aac96', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-27 00:00:00', null);
INSERT INTO `h_session` VALUES ('32d79e5e6cd94a29840d16f10d814c14', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('33f56df9b0274e108cde4470b071b612', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('36e149833b044db891a896ef7d947ec1', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('3880cbbe091a48079db1c8df9af2e2e1', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('397e988767d3496987affbf49605720e', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('3bfe3f7bc2904881a8fdba8c0e1bc4d5', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('3dd6d980b111460f8941433a6b9f907e', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('3efcecd3e1514f84bfbb70d95cd5da03', '{\'user_name\': u\'\\u674e\\u8d85\', \'user_no\': u\'1001\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('3f6de938f4d34cc2ab3443dd341c0343', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('3f70b6960fd143bc9bad89249bc319b5', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('41d933af84ee4d0cb3a467f6efd04024', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('429005544e8e4824ad037d92d045a87e', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('434ddb5979d7485e864684ab4940919a', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('461a016499374f4dacc89167db92c017', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('4642b6c92ffb4b8b83deb2a60a3ab21d', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('492351f1935146dda6412b6d8c44baff', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('4a3ce36cd4b544298f326ce8161f5aab', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('4b5e989f91374f35b29e929f9039cb24', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('4cd6a40f8a4a4ae1a58d476e08162223', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-27 00:00:00', null);
INSERT INTO `h_session` VALUES ('4db37d85eb9f4de9870d511fdcaf0af5', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('51434bc157914d2b82281e985305b0a4', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('5a7240505f1d4327a3e200c66d809ddd', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('5dda3331db4845a5977f5c303f6d0636', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('61781d63ba3e47438ea6fb2ca0c65b74', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-01 00:00:00', null);
INSERT INTO `h_session` VALUES ('63bd5ac0a72e41d8b5c8ae03542d8270', '{\'username\': u\'admi\', \'user_pass\': u\'123\'}', '2018-03-27 00:00:00', null);
INSERT INTO `h_session` VALUES ('6b7a3733ab4b4c37a58d78ed6549963b', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('6f3bc5c941344970bbf25e69b6f9ae99', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-03 00:00:00', null);
INSERT INTO `h_session` VALUES ('6faff15aaa7f498a9637b785474cb74a', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('75a61e4235944aa5a94e1cb5972e2db7', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-01 00:00:00', null);
INSERT INTO `h_session` VALUES ('7aee6279b697459e9e5344c97deb2758', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('7bb80b2cad4e40549a6c902c9575ef65', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('7dff558cd4344ccd98368448cf2517e6', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('7f18b85710144cb684dbf91cbabcf7fd', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('805b8fefee0342eba35798506ef62c7e', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('83bfaacb96e54e448efb8a04cf5bcd31', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('85c2aa70fb1e4dda8354954141009975', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('87ba1a2edfe14e30a7aef913a5850643', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('881cc7bf0c34408986b6404b31a12fcd', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('894e64541dfe4f1ebe4f287b6d3bb0c9', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('8a5c8891ab3c4496bfe7cdc6e1ae86e7', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('90278d4b732841f5bdf50e91704460f0', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('9625af1dfb954871b732968525fb238f', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('9702baae758044178e8e2d6b77b91732', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('9896d46152d740cc83a8f19b6029752d', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-01 00:00:00', null);
INSERT INTO `h_session` VALUES ('989d622c56504cefb36c2e317a35c67d', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('9dd11936e7c64d89a14761a2aecbd9ec', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('9e043b915bb0467194e6b6909ae3c5e0', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('a08fc6d331af4259b8e920a756b01303', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('a1e041a7d28c42dda891424c08ab4327', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-27 00:00:00', null);
INSERT INTO `h_session` VALUES ('a1f759b5ce184b26a8199fe5b0ac4afe', '{\'user_name\': u\'\\u674e\\u8d85\', \'user_no\': u\'1001\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('a2383d3a4d294c199db114439b2220d6', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('a50e37eeebe142648d4515bef2bc0b25', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('a57cd411e9fc4a19a4a12b95bd955952', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('a79d3d2ffba3440a8c80a3b9c4e1b83a', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('a7bd1e2a11aa4c13959774b8a0859b4e', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('a87811f9397942499f5c1a449497112e', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('aad6b9f575184e31921527c4fea9ee33', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('ace8fbe4f9b24121b623dc7fc2f09afb', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('adca31f036944430ba2e5d160bea76bb', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('ae26e06eb26e437a918854f56451fe05', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('af813ddc48fe4ed7b3838f3324602947', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('b08776ec54ca4879bf5679b81cf35210', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-01 00:00:00', null);
INSERT INTO `h_session` VALUES ('b431fde9ec3140b5b104cc9aee2648ef', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('b4507b391b8d4df4b238d402567e18b2', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-01 00:00:00', null);
INSERT INTO `h_session` VALUES ('b6636de34bde468687793c7e8daeda1c', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('b8406c7f558c4338b7bb0c7adef8ab85', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('b9190af4743f4dd9bbd6f67bc95ec63c', '{\'user_name\': u\'\', \'user_no\': u\'1004\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('b93de7e8b02444459e934e3d5a3004e4', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('bbfbf432b9524da09c96aea749396c91', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('c2584203c53b49559c1de1d98e61dca4', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('c3ebaaae7cc94152a44af8391d0e225f', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('c4e527ab3cd04f9493dce6d714c105f3', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('c86254aa54e04f9aa53fa1a4d00607c1', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('c8a3bfc041414b7280826a0fdcae4081', '{\'username\': u\'admi\', \'user_pass\': u\'123\'}', '2018-03-27 00:00:00', null);
INSERT INTO `h_session` VALUES ('c96180c288294570a901f11db98172bd', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('cd709cea13bd4b518e33eba1dd87b1b5', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('d2281e33cad748b2b0c5a5205ec5cc72', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('d2d0791e7ee348f78237630c55069bd0', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('d386424c5abf4ff09f5aff9e322a665e', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('d42fd9984d83469f85a561667d7a3c21', '{\'user_name\': u\'\\u674e\\u8d85\', \'user_no\': u\'1001\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('d619f38125044867929cb4af61f6045f', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('e2245b509d714f08a6cfb1734dd55567', '{\'user_name\': u\'\\u674e\\u8d85\', \'user_no\': u\'1001\'}', '2018-04-02 00:00:00', null);
INSERT INTO `h_session` VALUES ('e498016a4ba64e6d867c2140f6421acc', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('e638588dd8774e00ae39fc23a3bda3b9', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('e8777faf400b466d99eebd2844c06452', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('e9d81cd82af044b09f8a23f200f53bb8', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('eba1168455924e5aa4b5c9180eb76950', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('f39099ad0bdf448da11097cb31efbfe1', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('f59804c40d0844bf9a7549725b8a71ac', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);
INSERT INTO `h_session` VALUES ('f801d1af3df14ec2aa457994feb82903', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-27 00:00:00', null);
INSERT INTO `h_session` VALUES ('f8474163d6fe44f39670abfde5bf6293', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-31 00:00:00', null);
INSERT INTO `h_session` VALUES ('f9b65cbbdfab4b01973ddb9df84705e9', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('fcba687aa3a2416c852c8be72ffeace3', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_pass\': u\'123\', \'user_no\': u\'admi\'}', '2018-03-28 00:00:00', null);
INSERT INTO `h_session` VALUES ('fcf2c466f74f4b5f816eab0e3b1d4ed8', '{\'user_name\': u\'\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\', \'user_no\': u\'admi\'}', '2018-03-30 00:00:00', null);

-- ----------------------------
-- Table structure for h_stock
-- ----------------------------
DROP TABLE IF EXISTS `h_stock`;
CREATE TABLE `h_stock` (
  `part_no` varchar(40) NOT NULL,
  `part_name` varchar(20) DEFAULT NULL,
  `sale_points` varchar(100) DEFAULT NULL,
  `market_price` decimal(9,2) DEFAULT NULL,
  `market_on_time` datetime DEFAULT NULL,
  `pic_path` varchar(100) DEFAULT NULL,
  `colour_note` varchar(20) DEFAULT NULL,
  `brand_note` varchar(40) DEFAULT NULL,
  `info_build_time` datetime DEFAULT NULL,
  `info_build_person` varchar(10) DEFAULT NULL,
  `info_last_mody_time` datetime DEFAULT NULL,
  `info_last_mody_person` varchar(10) DEFAULT '',
  `is_delete` varchar(1) DEFAULT 'N',
  `stock_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`part_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_stock
-- ----------------------------
INSERT INTO `h_stock` VALUES ('QQW', 'DSFSD', 'SLDKAJFLLSKDAJFLSDKJ', '567.00', '2018-04-11 00:00:00', null, null, null, null, null, null, '', 'N', '45');
INSERT INTO `h_stock` VALUES ('S4567', 'SF', '斯蒂芬斯蒂芬', '4324.00', '2018-04-03 00:00:00', null, null, null, null, null, null, '', 'N', '45');
INSERT INTO `h_stock` VALUES ('T20-20', '天梭20', '第三方斯蒂芬', '23000.00', '2018-04-10 00:00:00', null, null, null, null, null, null, '', 'N', '567');

-- ----------------------------
-- Table structure for h_user
-- ----------------------------
DROP TABLE IF EXISTS `h_user`;
CREATE TABLE `h_user` (
  `user_no` varchar(6) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pass` varchar(160) DEFAULT NULL,
  `is_work` varchar(3) DEFAULT NULL,
  `user_tel` varchar(20) DEFAULT NULL,
  `user_gender` varchar(1) DEFAULT NULL,
  `user_role` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_user
-- ----------------------------
INSERT INTO `h_user` VALUES ('1001', '李超', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'on', '123456789', 'B', 'A');
INSERT INTO `h_user` VALUES ('admi', '超级管理员', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'on', '15814653877', 'B', 'A');
