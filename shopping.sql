/*
Navicat MySQL Data Transfer

Source Server         : cihog
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-15 15:18:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  KEY `user_cart_id` (`user_id`),
  KEY `id` (`id`),
  CONSTRAINT `user_cart_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('ed9c28fa343544e682fe480912f1fdbd', '15eaf78817864020b5aeded859cf7146');
INSERT INTO `cart` VALUES ('33f54405197d41ff812f085b06180a88', '8a4d2ba52bc2483284e2f2676af97926');
INSERT INTO `cart` VALUES ('afe64eee885c4c53bb46ba9c3332056e', null);

-- ----------------------------
-- Table structure for cart_details
-- ----------------------------
DROP TABLE IF EXISTS `cart_details`;
CREATE TABLE `cart_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_count` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `product_cart_id` (`product_id`),
  CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_cart_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart_details
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `statue` int(11) DEFAULT '1' COMMENT '默认未发货为1发货为0',
  `user_id` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  KEY `id` (`id`),
  KEY `user_orders_id` (`user_id`),
  CONSTRAINT `user_orders_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('cdced9ee482a4af48b5ded6932ebadd3', '2017-12-19 23:08:48', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('065b7301663446ecbb71eb4730b89370', '2017-12-19 23:08:58', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('c775bf37f1004c24ab2195ae7a00aad8', '2017-12-19 23:09:15', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('e37a539b3e344e1991062e171796e753', '2017-12-19 23:09:26', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('365f36827bd54d77bd9c0c0b1cfbfeff', '2017-12-19 23:09:57', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('1d13567dcb104b88bf0bd6452ea06697', '2017-12-20 12:55:36', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('9d33be0c530849acab11a1e8b87c777e', '2017-12-20 12:56:10', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('93f9a749113247e3ae7946fc139853b8', '2017-12-20 13:02:09', '1', '8a4d2ba52bc2483284e2f2676af97926', '', null);
INSERT INTO `orders` VALUES ('f35d05bc29a24525bd8c4b95c26fd22d', '2017-12-20 13:06:24', '1', '8a4d2ba52bc2483284e2f2676af97926', '', null);
INSERT INTO `orders` VALUES ('f697f89c83834bf8970f21dbe03d489f', '2017-12-20 13:08:08', '1', '8a4d2ba52bc2483284e2f2676af97926', '', null);
INSERT INTO `orders` VALUES ('5956212c031141dfbaa89866d05d1de2', '2017-12-20 13:10:29', '1', '8a4d2ba52bc2483284e2f2676af97926', '56156', null);
INSERT INTO `orders` VALUES ('80a5752850fa474aaf94f4178cd35315', '2017-12-20 13:13:16', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('e3d2dd6a519f4494842f3dbcbe8c5b4a', '2017-12-20 13:22:59', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('bde6e6b55eea42c09d70dcde1f64b812', '2017-12-20 13:29:27', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('94c1893df67f4bd091533e99c2137b50', '2017-12-20 13:30:05', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('89bdd06898e34beb907f4629af8921c9', '2017-12-20 13:30:48', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('11bab6b9227b45618e34a87a42363392', '2017-12-20 13:33:50', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('2ac4a11ae24840d0bad41a16fa3442d3', '2017-12-20 13:36:58', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('91049a38c95b4c37ad433fa3a68fd8d4', '2017-12-20 16:24:01', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('80583a46a99b4a1c87ee4594a445837b', '2017-12-21 09:42:47', '1', '15eaf78817864020b5aeded859cf7146', '456546', null);
INSERT INTO `orders` VALUES ('49e017c98d9048b5bfc906d77e95dc11', '2017-12-23 11:06:22', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('fd1ba1cc47354c709c864fbdfb162df6', '2017-12-23 11:06:27', '1', '15eaf78817864020b5aeded859cf7146', '', null);
INSERT INTO `orders` VALUES ('85c54b2601df4326b4dce5c03efc84ee', '2017-12-23 11:06:32', '1', '15eaf78817864020b5aeded859cf7146', '', null);

-- ----------------------------
-- Table structure for orders_details
-- ----------------------------
DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE `orders_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_count` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`orders_id`) USING BTREE,
  KEY `product_orders_id` (`product_id`),
  CONSTRAINT `orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_orders_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_details
-- ----------------------------
INSERT INTO `orders_details` VALUES ('135', 'cdced9ee482a4af48b5ded6932ebadd3', '19230547a7e042cabeb5fce53e754e3f', '1');
INSERT INTO `orders_details` VALUES ('136', '065b7301663446ecbb71eb4730b89370', '19230547a7e042cabeb5fce53e754e3f', '1');
INSERT INTO `orders_details` VALUES ('137', 'c775bf37f1004c24ab2195ae7a00aad8', '19230547a7e042cabeb5fce53e754e3f', '1');
INSERT INTO `orders_details` VALUES ('138', 'e37a539b3e344e1991062e171796e753', '19230547a7e042cabeb5fce53e754e3f', '1');
INSERT INTO `orders_details` VALUES ('139', '365f36827bd54d77bd9c0c0b1cfbfeff', '19230547a7e042cabeb5fce53e754e3f', '1');
INSERT INTO `orders_details` VALUES ('142', '1d13567dcb104b88bf0bd6452ea06697', '37494e890d9a4c90a1e3e9eacd128bb6', '17');
INSERT INTO `orders_details` VALUES ('143', '1d13567dcb104b88bf0bd6452ea06697', '19230547a7e042cabeb5fce53e754e3f', '2');
INSERT INTO `orders_details` VALUES ('144', '1d13567dcb104b88bf0bd6452ea06697', '05d9133b5b0646e8919ede6aa86f4d01', '1');
INSERT INTO `orders_details` VALUES ('145', '1d13567dcb104b88bf0bd6452ea06697', '08034352265f48f2bb5dad32c3bf3766', '1');
INSERT INTO `orders_details` VALUES ('146', '1d13567dcb104b88bf0bd6452ea06697', '1117551e5a90484b98ce538ddda81388', '1');
INSERT INTO `orders_details` VALUES ('147', '1d13567dcb104b88bf0bd6452ea06697', '69729126b1ff4b22988ea9148d46a473', '1');
INSERT INTO `orders_details` VALUES ('149', '9d33be0c530849acab11a1e8b87c777e', '19230547a7e042cabeb5fce53e754e3f', '1');
INSERT INTO `orders_details` VALUES ('150', '9d33be0c530849acab11a1e8b87c777e', '1d00b3a16a104e3ab6e04dbd444a9923', '1');
INSERT INTO `orders_details` VALUES ('151', '93f9a749113247e3ae7946fc139853b8', 'd23546b31c884bdbb2609828579ff7d4', '1');
INSERT INTO `orders_details` VALUES ('152', 'f35d05bc29a24525bd8c4b95c26fd22d', 'd23546b31c884bdbb2609828579ff7d4', '1');
INSERT INTO `orders_details` VALUES ('154', 'f35d05bc29a24525bd8c4b95c26fd22d', '4251eb20b27b4e40b69d099dd450969b', '1');
INSERT INTO `orders_details` VALUES ('155', 'f35d05bc29a24525bd8c4b95c26fd22d', '52e1c69104854482bbcb0b158019c9e6', '1');
INSERT INTO `orders_details` VALUES ('156', 'f697f89c83834bf8970f21dbe03d489f', '37494e890d9a4c90a1e3e9eacd128bb6', '1');
INSERT INTO `orders_details` VALUES ('157', '5956212c031141dfbaa89866d05d1de2', '09f8a4545ae74959a445dd478818a989', '15');
INSERT INTO `orders_details` VALUES ('159', '80a5752850fa474aaf94f4178cd35315', 'f56881b416ca49aebadec6ce3633dd5a', '16');
INSERT INTO `orders_details` VALUES ('160', 'e3d2dd6a519f4494842f3dbcbe8c5b4a', 'd23546b31c884bdbb2609828579ff7d4', '1');
INSERT INTO `orders_details` VALUES ('162', 'e3d2dd6a519f4494842f3dbcbe8c5b4a', 'fdd024059fd646e6bea6e46c69876938', '1');
INSERT INTO `orders_details` VALUES ('163', 'bde6e6b55eea42c09d70dcde1f64b812', '37494e890d9a4c90a1e3e9eacd128bb6', '1');
INSERT INTO `orders_details` VALUES ('165', '94c1893df67f4bd091533e99c2137b50', '19230547a7e042cabeb5fce53e754e3f', '1');
INSERT INTO `orders_details` VALUES ('167', '89bdd06898e34beb907f4629af8921c9', '52e1c69104854482bbcb0b158019c9e6', '1');
INSERT INTO `orders_details` VALUES ('172', '91049a38c95b4c37ad433fa3a68fd8d4', '19230547a7e042cabeb5fce53e754e3f', '23');
INSERT INTO `orders_details` VALUES ('173', '91049a38c95b4c37ad433fa3a68fd8d4', '1d00b3a16a104e3ab6e04dbd444a9923', '7');
INSERT INTO `orders_details` VALUES ('177', '80583a46a99b4a1c87ee4594a445837b', 'f56881b416ca49aebadec6ce3633dd5a', '7');
INSERT INTO `orders_details` VALUES ('178', '80583a46a99b4a1c87ee4594a445837b', '37494e890d9a4c90a1e3e9eacd128bb6', '2');
INSERT INTO `orders_details` VALUES ('179', '80583a46a99b4a1c87ee4594a445837b', '30fa83d3c16347fc80337bc1d9ac98ce', '1');
INSERT INTO `orders_details` VALUES ('180', '49e017c98d9048b5bfc906d77e95dc11', '013e87ae68184e0d8ebebb362883549e', '1');
INSERT INTO `orders_details` VALUES ('181', '49e017c98d9048b5bfc906d77e95dc11', '52e1c69104854482bbcb0b158019c9e6', '1');
INSERT INTO `orders_details` VALUES ('182', '49e017c98d9048b5bfc906d77e95dc11', '5734c7c9c7584effb3e2c5a79e5285fd', '1');
INSERT INTO `orders_details` VALUES ('183', '49e017c98d9048b5bfc906d77e95dc11', 'a2ac216a6a534b0a9d75561a7183d8dc', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_type_id` varchar(255) DEFAULT NULL,
  `product_details_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `product_details_id` (`product_details_id`),
  CONSTRAINT `product_details_id` FOREIGN KEY (`product_details_id`) REFERENCES `product_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_type_id` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('013e87ae68184e0d8ebebb362883549e', '小夹子', '08355957af8c4e0b853a027462febb80', 'ede961a3ac874fb5b09b1f7e36f52ee8');
INSERT INTO `product` VALUES ('05d9133b5b0646e8919ede6aa86f4d01', '凤凰铲勺', '81a2287cfc1f4651bcce5f074ff11f06', '24acb24712c74bac93ed00d4db12a906');
INSERT INTO `product` VALUES ('06a1ad0340af49b4bfe68b10d903310d', '小华', '68aa01cdda124578a4862e5c84ae8dde', '0f8fc11f89d04a339f5ed11dbd21fef7');
INSERT INTO `product` VALUES ('08034352265f48f2bb5dad32c3bf3766', '凤凰铲勺', '81a2287cfc1f4651bcce5f074ff11f06', '36fd654ff91f461184ba617e1ba4227b');
INSERT INTO `product` VALUES ('09f8a4545ae74959a445dd478818a989', '不锈钢线漏', '1620a5a48ca446f28baa4fecdf75fa33', 'a5858c041ea44eeca7795fde24c82bb6');
INSERT INTO `product` VALUES ('0b46214ff52c474684e168da661d020d', '小书越', '68aa01cdda124578a4862e5c84ae8dde', '2b349ba4ac33496c93c4a3ca1bc41908');
INSERT INTO `product` VALUES ('0e9876f7769643e6a5084024618ea6ea', '6号钢线多用刨', 'b2fefbabfb134facbcffe8b773cfa0d3', 'de590ff6c361419dadee9c506629d092');
INSERT INTO `product` VALUES ('0f976694985349209e3259289f4fba61', '大兄弟格', 'f321811976d14aeeaa716991273cb314', '6c7fb1389bc546d994324c5d7561fecf');
INSERT INTO `product` VALUES ('104edcaea2b941778f76a9e023ef4bc9', '小华壳', 'eb77b3775fad4194a5cc786c752a492e', '854858602900454c9ecab3c25fdcbd51');
INSERT INTO `product` VALUES ('1117551e5a90484b98ce538ddda81388', '凤凰铲勺', '81a2287cfc1f4651bcce5f074ff11f06', 'cf275090cd164c2bad11d13978558e69');
INSERT INTO `product` VALUES ('145013113ed94206b18ac9985e242f96', '不规则', 'j2a133408d1d4187970c3454b88316db', '91ca50a9fda642f1b6cff24f507da0c0');
INSERT INTO `product` VALUES ('19230547a7e042cabeb5fce53e754e3f', '食品夹', '08355957af8c4e0b853a027462febb80', 'e9c06ffe1b874c7a80f852d746477dcb');
INSERT INTO `product` VALUES ('1d00b3a16a104e3ab6e04dbd444a9923', '硅胶食物夹', '08355957af8c4e0b853a027462febb80', '7793024763ab47628586e8f84b7607b8');
INSERT INTO `product` VALUES ('2056e5b2ec734a35a01dcc8aad72d19b', '西瓜刨', '8fc23bf8eaea4211898f285334d3596c', '3eb3005fc0034c149827e175fe06b215');
INSERT INTO `product` VALUES ('258a9e936ce04a44bef7c89457d95281', '木筷子', '10c2ca90f894474c969284bb9bff9ea2', 'c5d83dd7b0a64825b0ba50b6fd0d044d');
INSERT INTO `product` VALUES ('25dd394cec404af7973e28ba621587bc', '不规则', 'j2a133408d1d4187970c3454b88316db', 'e92eb278590d40bf8ef7c5d9e27b5b87');
INSERT INTO `product` VALUES ('30fa83d3c16347fc80337bc1d9ac98ce', '多用刨1', '8fc23bf8eaea4211898f285334d3596c', '2ece264cb9714e148476e58d503cde02');
INSERT INTO `product` VALUES ('31afa5bd822042ffb79feae6459c0f85', '多功能线漏', '1620a5a48ca446f28baa4fecdf75fa33', 'd46fdad2131d4580b8946557dde1d4eb');
INSERT INTO `product` VALUES ('37494e890d9a4c90a1e3e9eacd128bb6', '水果刨', '8fc23bf8eaea4211898f285334d3596c', '349dbc30e35e4dcc9d9b264ae6180e39');
INSERT INTO `product` VALUES ('411399462fbb419db6df1a11d8d77830', '小篓子', '1620a5a48ca446f28baa4fecdf75fa33', 'a92b6bf103114097a49c1aa348709001');
INSERT INTO `product` VALUES ('4251eb20b27b4e40b69d099dd450969b', '陶瓷筷子', '10c2ca90f894474c969284bb9bff9ea2', '4b3817f4526c4486b887767f0ff645a6');
INSERT INTO `product` VALUES ('4d2faf5e60de4847958e7c473a9a146a', '西瓜刨', '8fc23bf8eaea4211898f285334d3596c', '3c90e025035f4392ba4706067d525158');
INSERT INTO `product` VALUES ('52e1c69104854482bbcb0b158019c9e6', '食品夹2', '08355957af8c4e0b853a027462febb80', 'aa7a7fda43304bc28e593fa1828844c3');
INSERT INTO `product` VALUES ('5734c7c9c7584effb3e2c5a79e5285fd', '红木筷子', '10c2ca90f894474c969284bb9bff9ea2', '1889e1ac2c924d8abb7e3cf878cac38d');
INSERT INTO `product` VALUES ('69729126b1ff4b22988ea9148d46a473', '凤凰铲勺', '81a2287cfc1f4651bcce5f074ff11f06', '406037aac8e543ac85a137b4368c94ee');
INSERT INTO `product` VALUES ('6c218c3e8c9e4ca6be38387f4faf1616', '小金华', '68aa01cdda124578a4862e5c84ae8dde', '89fbbd2ba26d45a8aebfbd545bc4f5e3');
INSERT INTO `product` VALUES ('70f965b4723b48fc8d9c36f2a7fc878d', '大兄弟格', 'f321811976d14aeeaa716991273cb314', '92ca83ef0d7d45c0ba0110fd9e66b8f5');
INSERT INTO `product` VALUES ('749102e8c24d4f0698cc52ebd12c23c8', '大兄弟格', 'f321811976d14aeeaa716991273cb314', '39342eb4e2ae4e60b4b04b6720f978d0');
INSERT INTO `product` VALUES ('76faed93c1304d859daec49b2078ffc4', '食品夹3', '08355957af8c4e0b853a027462febb80', '5d7303b351f048b5aebeb777e2cdd7cf');
INSERT INTO `product` VALUES ('7da185f2cd7348db8e6b052eb4d0c25b', '凤凰铲勺', '81a2287cfc1f4651bcce5f074ff11f06', '38fb69c1dc3e4b43b6bf5dab9d7017c7');
INSERT INTO `product` VALUES ('8682e43c0c2f4b3aaf1295b6a0575230', '好运木柄铲勺', '81a2287cfc1f4651bcce5f074ff11f06', '3b1bf3dbb84e466793b52660ab1c8a87');
INSERT INTO `product` VALUES ('8b2c9339edd54e2fa3ca6ef48e7899bb', '大兄弟格', 'f321811976d14aeeaa716991273cb314', '1e6b746901a14303a2d33072c4c99724');
INSERT INTO `product` VALUES ('8d39ae8e26964bc79d128e6f56ae65c8', '陶瓷筷子', '10c2ca90f894474c969284bb9bff9ea2', '7acdd4a7370f4faf964c484c8968870c');
INSERT INTO `product` VALUES ('8f95eee749224effb8c3665ac3837e14', '不锈钢筷筒', '68aa01cdda124578a4862e5c84ae8dde', '5ebe782ee61145cb9af6b66fb82f4c47');
INSERT INTO `product` VALUES ('96571f6df2084a2bbe470a18af1d9d47', '陶瓷筷子', '10c2ca90f894474c969284bb9bff9ea2', '73083092915841d3895b506a43203bb8');
INSERT INTO `product` VALUES ('968c622f908e44f08c1fd18b6d976b24', '抉择', 'j2a133408d1d4187970c3454b88316db', 'aae8607fef874e2ea34e3818b595714c');
INSERT INTO `product` VALUES ('987f22052e264e4a97e179d6782dab00', '小篓子', '1620a5a48ca446f28baa4fecdf75fa33', '8fc73f72bc9348088152b8876f0db712');
INSERT INTO `product` VALUES ('99c5adb31de04d6fa7a475e006c50c8f', '强线漏', '1620a5a48ca446f28baa4fecdf75fa33', '8fb95c4b4c614164a0b6832066ebca81');
INSERT INTO `product` VALUES ('a1bd334b855742c99b13c408b7f389bb', '火锅壳漏', '81a2287cfc1f4651bcce5f074ff11f06', '0812a10cca7c4ce5b109bee562414b35');
INSERT INTO `product` VALUES ('a2ac216a6a534b0a9d75561a7183d8dc', '小筷子', '10c2ca90f894474c969284bb9bff9ea2', 'c7c22b7713404cf39197edce88fd9346');
INSERT INTO `product` VALUES ('a9e6bda9116f41948c502cb1a727e390', '大兄弟格', 'f321811976d14aeeaa716991273cb314', '24f35a30acaa4cb68fe0c4bfecc0a37c');
INSERT INTO `product` VALUES ('aa227dfadb1e46ef9a37775a939a137f', '红筷子', '10c2ca90f894474c969284bb9bff9ea2', 'a31cf0650ef44ba899d217bf196f4a36');
INSERT INTO `product` VALUES ('b102a8be6b4d4fd9a8480702c99faf86', '小夹子', '08355957af8c4e0b853a027462febb80', '09f5deed31eb4ba99bc348ed22251864');
INSERT INTO `product` VALUES ('b6c95e1043d940e38fa066818bd4eb02', '小凯壳', 'eb77b3775fad4194a5cc786c752a492e', '0f5a0ab452944f4c81040722c5a4239e');
INSERT INTO `product` VALUES ('b7b24d13f3f64d678f0c6c6bb85c39b2', '小华', '68aa01cdda124578a4862e5c84ae8dde', '3b71b15ba0074121947cfbbd7264de09');
INSERT INTO `product` VALUES ('bc545503bdb64915af5c07818b7eb534', '小篓子', '1620a5a48ca446f28baa4fecdf75fa33', 'fbee856ed679452ca1addee131941188');
INSERT INTO `product` VALUES ('bd9f218b17ec41cf8269931a7cb6d584', '火锅壳漏', '81a2287cfc1f4651bcce5f074ff11f06', '6e68481cd1cf4b80bc4864363857f746');
INSERT INTO `product` VALUES ('cae6f6ca9164459e9bd1fc7c921ec80e', '西瓜刨', '8fc23bf8eaea4211898f285334d3596c', '5943747c0e594db3a3eae0f34c93dd3f');
INSERT INTO `product` VALUES ('cc085d4bc1954e26b305ba2a4b71a791', '好运木柄铲勺', '81a2287cfc1f4651bcce5f074ff11f06', '032cfe07d3154b428fb97c6bec7ef8f1');
INSERT INTO `product` VALUES ('cefd1272e63d4375938d3507360c39e2', '水晶型苹果切 ', 'b2fefbabfb134facbcffe8b773cfa0d3', '5926431a98b4498a851437f09351403a');
INSERT INTO `product` VALUES ('d23546b31c884bdbb2609828579ff7d4', '338苹果型切果器 ', 'b2fefbabfb134facbcffe8b773cfa0d3', 'd3fe76f4545d4b2c8f3683cdf069f305');
INSERT INTO `product` VALUES ('d41b4d3fe32149cb9be8173ba7c6a2c5', '抉择', 'j2a133408d1d4187970c3454b88316db', 'fed77483ed394c29a14ce0ec9bfd7914');
INSERT INTO `product` VALUES ('d6fa763ed18041658de385697ebddbb7', '多线漏', '1620a5a48ca446f28baa4fecdf75fa33', '293bff66e5e64f65b9fe953e001fe097');
INSERT INTO `product` VALUES ('db339c2dd4de4a3a9f51daf4f90d9302', '大线漏', '1620a5a48ca446f28baa4fecdf75fa33', '26af447010d84cd9a41fd0dace80740b');
INSERT INTO `product` VALUES ('e3dad3fab82540a9a8b98a17eca1bd05', '滤油网', 'f321811976d14aeeaa716991273cb314', '15bf2649ebcf42bea3f2f00ad3ffbe11');
INSERT INTO `product` VALUES ('e498e2b6a66a4dd9bb99b44082eeb6fc', '水果刨子', '8fc23bf8eaea4211898f285334d3596c', 'e2717200558f4a179edd853bce3e1b1a');
INSERT INTO `product` VALUES ('e95261e1840a47f2a1d60aa0b54fa894', '好运木柄铲勺', '81a2287cfc1f4651bcce5f074ff11f06', '86e44e6ebaf848a2af6fc4edeb10644b');
INSERT INTO `product` VALUES ('ea5fbc1b35b74a9fa28985cf360c19dc', '缤纷筷筒', '68aa01cdda124578a4862e5c84ae8dde', '62d160486f594e3d827c2c89ecc12786');
INSERT INTO `product` VALUES ('ee316927815e418ea772670fb2050321', '好运木柄铲勺', '81a2287cfc1f4651bcce5f074ff11f06', 'c14d3d9ced8b4733bbda477b4d966140');
INSERT INTO `product` VALUES ('ee5a3edeece34cc988f80eb153aadea1', '小华壳', 'eb77b3775fad4194a5cc786c752a492e', '62986cce23df4a48acaa2a494ef16b21');
INSERT INTO `product` VALUES ('f01af01a10ae478090699afbd77882d1', '小华', '68aa01cdda124578a4862e5c84ae8dde', 'c3926a7d2f88459d8718c8b8b54e4047');
INSERT INTO `product` VALUES ('f43580e9792640d5b21325fca7da0542', '小凯壳', 'eb77b3775fad4194a5cc786c752a492e', '535adef565b046ee84e15fc459c69e1d');
INSERT INTO `product` VALUES ('f56881b416ca49aebadec6ce3633dd5a', '盘夹', 'j2a133408d1d4187970c3454b88316db', '1ea6b1ed910a4b1690e43b22cce27d03');
INSERT INTO `product` VALUES ('faef742d7c794310b5909a4b0ee588d1', '带钩汤壳 ', 'eb77b3775fad4194a5cc786c752a492e', 'd9a66996f53d4ccc98593e56050d2526');
INSERT INTO `product` VALUES ('fc46981341bd4fec8e4a9ad17f67555f', '彩色柄削皮刀  ', 'b2fefbabfb134facbcffe8b773cfa0d3', '3dbbb92cf60242d3bad5d7e936e7094e');
INSERT INTO `product` VALUES ('fdd024059fd646e6bea6e46c69876938', '西瓜刀', 'b2fefbabfb134facbcffe8b773cfa0d3', '09d39623ac6f4a68a4ec5a2138a02973');

-- ----------------------------
-- Table structure for product_details
-- ----------------------------
DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details` (
  `id` varchar(255) NOT NULL,
  `one_price` double(10,2) DEFAULT NULL,
  `two_price` double(10,2) DEFAULT NULL,
  `one_count` int(20) DEFAULT NULL,
  `two_count` int(20) DEFAULT NULL,
  `stock` int(20) DEFAULT NULL,
  `sales_count` int(20) DEFAULT NULL,
  `product_instruction` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `is_week` int(2) DEFAULT '0',
  `is_month` int(2) DEFAULT '0',
  `is_year` int(2) DEFAULT '0',
  `is_carousel` int(2) DEFAULT '0' COMMENT '是否为轮播',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_details
-- ----------------------------
INSERT INTO `product_details` VALUES ('032cfe07d3154b428fb97c6bec7ef8f1', '8.30', '7.89', '200', '5000', '60000', '54200', '铲 勺 12漏 果铲 饭匙，201不锈钢', '/image/chanshao/chanshao8.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('0812a10cca7c4ce5b109bee562414b35', '8.00', '7.89', '200', '5000', '50000', '54205', '1.2厘光身7公分壳/漏，201不锈钢', '/image/chanshao/chanshao6.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('09d39623ac6f4a68a4ec5a2138a02973', '5.00', '4.99', '200', '5000', '59998', '54202', '培利亨 厂家直销 西瓜刀 水果神器', '/image/guapao/guapao3.jpg', '1', '0', '1', '1');
INSERT INTO `product_details` VALUES ('09f5deed31eb4ba99bc348ed22251864', '4.00', '3.00', '500', '5000', '54567', '1237', '小夹子', '/image/shipingjia/27211c76e0454b45878fbf376ddb6c89.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('0f5a0ab452944f4c81040722c5a4239e', '4.00', '3.50', '200', '4000', '56879', '1234', '多用壳', '/image/tanglou/6e4eed6bb6034a719ccc17e433e1e923.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('0f8fc11f89d04a339f5ed11dbd21fef7', '8.00', '7.50', '200', '2000', '44997', '1238', '靓丽的笔筒', '/image/kuaitong/902bba24168347418552d4f9a6090a5c.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('15bf2649ebcf42bea3f2f00ad3ffbe11', '5.00', '8.00', '100', '2000', '50000', '420', '过滤油网，安全无污染', '/image/youge/34c4706b83c94fb8ba2f822e1dfec468.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('1889e1ac2c924d8abb7e3cf878cac38d', '1.00', '0.80', '200', '5000', '449999', '21', '红木恒久远', '/image/kuaizi/e81dacd61b4b45dfa898990379a1ad72.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('1e1314785feb445d9717bdff93bfa0d7', '2.00', '1.80', '500', '20000', '50000', '1205', '大番薯，味道好，', '/image/weifenlei/7fedd9154179410cba0c3389a8c1d650.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('1e6b746901a14303a2d33072c4c99724', '4.00', '3.50', '400', '4000', '23000', '4567', '质量过关', '/image/youge/f97f9236a1ab4e0489a8222153522559.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('1ea6b1ed910a4b1690e43b22cce27d03', '5.00', '4.92', '200', '5000', '59961', '54240', '不锈钢多功能取盘夹，防烫夹，厨房小盘夹', '/image/weifenlei/weifenlei1.jpg', '1', '0', '0', '0');
INSERT INTO `product_details` VALUES ('24acb24712c74bac93ed00d4db12a906', '7.00', '6.80', '200', '5000', '58996', '54004', '没有哦', '/image/chanshao/ce5b6132214e440895634bf5575bd274.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('24f35a30acaa4cb68fe0c4bfecc0a37c', '4.00', '3.50', '400', '4000', '23000', '4567', '质量过关', '/image/youge/d1db303b45af4a8d804f131493e821f9.jpg', '0', '0', '1', '0');
INSERT INTO `product_details` VALUES ('26af447010d84cd9a41fd0dace80740b', '34.00', '32.00', '155', '200', '1000', '432', '米线粉篱网漏笊篱不锈钢麻辣烫漏', '/image/xianlou/18cd5795dee84dab838ae532f105c903.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('293bff66e5e64f65b9fe953e001fe097', '53.00', '52.00', '100', '200', '4000', '200', '米线粉篱网漏笊篱不锈钢麻辣烫漏', '/image/xianlou/c47b318a5393433d887e40f344df8b10.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('2b349ba4ac33496c93c4a3ca1bc41908', '5.00', '4.50', '200', '4000', '256565', '1225', '靓丽的笔筒', '/image/kuaitong/87f61ca1d00846f0b8d8f0bda0141be7.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('2ece264cb9714e148476e58d503cde02', '13.00', '12.00', '111', '222', '3332', '445', '不锈钢苹果削皮器 水果刀 多功能瓜刨厨房削莴', '/image/duoyongpao/c1c5c0388f1e4680912f2e3c94b0c468.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('349dbc30e35e4dcc9d9b264ae6180e39', '2.00', '1.50', '500', '2000', '55979', '1221', '好用不伤手', '/image/duoyongpao/2a102aa1c5b841f0b2e0e024c0a22811.jpg', '1', '0', '0', '0');
INSERT INTO `product_details` VALUES ('36fd654ff91f461184ba617e1ba4227b', '7.00', '6.80', '200', '5000', '14441', '54203', '铲 勺 12漏 果铲 饭匙 14漏  16漏  18漏', '/image/chanshao/chanshao2.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('38fb69c1dc3e4b43b6bf5dab9d7017c7', '7.00', '6.80', '200', '5000', '59999', '54201', '铲 勺 12漏 果铲 饭匙 14漏  16漏  18漏', '/image/chanshao/chanshao5.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('39342eb4e2ae4e60b4b04b6720f978d0', '4.00', '3.50', '400', '4000', '23000', '4567', '质量过关', '/image/youge/b09a699aba4144f6b1660aab2e75b22e.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('3b1bf3dbb84e466793b52660ab1c8a87', '8.00', '7.80', '200', '5000', '59999', '54201', '铲 勺 12漏 果铲 饭匙，201不锈钢', '/image/chanshao/chanshao11.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('3b71b15ba0074121947cfbbd7264de09', '8.00', '7.50', '200', '2000', '45000', '1235', '靓丽的笔筒', '/image/kuaitong/a903153d3fcc49609b37fc7fb019aa01.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('3c90e025035f4392ba4706067d525158', '6.00', '5.50', '200', '2000', '45000', '2354', '水果刨子', '/image/duoyongpao/f85e331b6df64f42afc58b8bacb4322c.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('3dbbb92cf60242d3bad5d7e936e7094e', '5.00', '4.80', '200', '5000', '59988', '54212', '培利亨 彩色柄旋转削皮器', '/image/guapao/3ebcc44aeef34dd8a12f5d232ff95c6e.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('3eb3005fc0034c149827e175fe06b215', '6.00', '5.50', '200', '2000', '44999', '2355', '水果刨子', '/image/duoyongpao/d19f7cf9808a4a02ab1026252fb04d5e.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('406037aac8e543ac85a137b4368c94ee', '7.00', '6.80', '200', '5000', '14442', '54202', '铲 勺 12漏 果铲 饭匙 14漏  16漏  18漏', '/image/chanshao/chanshao4.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('4b3817f4526c4486b887767f0ff645a6', '13.00', '12.00', '123', '1234', '12344', '1235', '慕容世家鸡翅木筷子家用日式无漆无蜡筷子实木餐具1', '/image/kuaizi/82351831a41944408f565f7232511fe3.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('535adef565b046ee84e15fc459c69e1d', '4.00', '3.50', '200', '4000', '56879', '1234', '多用壳', '/image/tanglou/4c1cbf8020b64739b90b1606cd04bdf5.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('5926431a98b4498a851437f09351403a', '2.00', '1.80', '200', '500', '60000', '54200', '培利亨 水晶苹果切 多功能水果神器', '/image/guapao/guapao1.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('5943747c0e594db3a3eae0f34c93dd3f', '6.00', '5.50', '200', '2000', '45000', '2354', '水果刨子', '/image/duoyongpao/417c1fa542d54f61a0797e31b4644608.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('5d7303b351f048b5aebeb777e2cdd7cf', '21.00', '20.00', '111', '222', '3333', '444', '食品夹子 面包夹子 牛排夹子 烧烤夹 不锈钢 食物夹子', '/image/shipingjia/ecd4f7a31e784ae795cfdc6d6ca196f6.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('5ebe782ee61145cb9af6b66fb82f4c47', '10.00', '9.50', '500', '5000', '200445', '5000', '不锈钢筷筒，不生锈', '/image/kuaitong/49d6d6c2d76f496a9fa64f45e0db1397.jpg', '0', '0', '1', '0');
INSERT INTO `product_details` VALUES ('62986cce23df4a48acaa2a494ef16b21', '4.00', '3.50', '500', '5000', '456789', '4562', '好快好省', '/image/tanglou/9a71da0dd9d54b28ab0b1b34dcbe822a.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('62d160486f594e3d827c2c89ecc12786', '3.00', '2.50', '100', '1000', '154020', '1350', '塑料筷筒，颜色艳丽', '/image/kuaitong/7a37b768cb1d489f8b5fd4c33276758d.jpg', '0', '1', '0', '0');
INSERT INTO `product_details` VALUES ('6c7fb1389bc546d994324c5d7561fecf', '4.00', '3.50', '400', '4000', '23000', '4567', '质量过关', '/image/youge/096d69ab8f8641e5a9040cf2b2bd5be8.jpg', '0', '0', '0', '1');
INSERT INTO `product_details` VALUES ('6e68481cd1cf4b80bc4864363857f746', '8.00', '7.80', '200', '5000', '60000', '54200', '1.2厘光身7公分壳/漏，201不锈钢', '/image/chanshao/chanshao7.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('73083092915841d3895b506a43203bb8', '13.00', '12.00', '1111', '1234', '12345', '124', '慕容世家鸡翅木筷子家用日式无漆无蜡筷子实木餐具', '/image/kuaizi/b7d123ac93014b37aaf8ae340da70126.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('7793024763ab47628586e8f84b7607b8', '10.00', '9.50', '100', '2000', '51992', '2012', '硅胶防滑食品夹 硅胶食物夹', '/image/shipingjia/832d62a208ca44d59d8952abb6194f97.jpg', '0', '0', '0', '1');
INSERT INTO `product_details` VALUES ('7acdd4a7370f4faf964c484c8968870c', '12.00', '11.00', '100', '1000', '10000', '5464', '双枪家庭装不锈不含钢家用合金筷子套装酒店日韩防滑', '/image/kuaizi/7a13b8a720bf4cdfb6de45651e7b6bce.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('854858602900454c9ecab3c25fdcbd51', '4.00', '3.50', '500', '5000', '456789', '4562', '好快好省', '/image/tanglou/ca3f3217c48443f4abf34dd520554479.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('86e44e6ebaf848a2af6fc4edeb10644b', '8.00', '7.80', '200', '5000', '59999', '54201', '铲 勺 12漏 果铲 饭匙，201不锈钢', '/image/chanshao/chanshao9.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('89fbbd2ba26d45a8aebfbd545bc4f5e3', '8.00', '7.50', '200', '4000', '51453', '1235', '靓丽的笔筒', '/image/kuaitong/80a083a2cfcf4be48b618f75e0e45901.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('8fb95c4b4c614164a0b6832066ebca81', '43.00', '42.00', '100', '200', '1000', '200', '米线粉篱网漏笊篱不锈钢麻辣烫漏勺捞面勺', '/image/xianlou/bc646f71a1484eddbfd1dfebaa478e19.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('8fc73f72bc9348088152b8876f0db712', '5.00', '4.50', '455', '5000', '20000', '200', '灭偶遇哦', '/image/xianlou/db6e3f94b11f4e5fa3cc4fc9bc337d9c.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('91ca50a9fda642f1b6cff24f507da0c0', '5.00', '4.50', '200', '4000', '2000', '5000', '萨迪克', '/image/weifenlei/9c4a552c0bb24e978c0d21d8713d1607.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('92ca83ef0d7d45c0ba0110fd9e66b8f5', '4.00', '3.50', '400', '4000', '23000', '4567', '质量过关', '/image/youge/b513852273d44087a140a6e260a478b1.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('a31cf0650ef44ba899d217bf196f4a36', '10.00', '9.00', '100', '500', '2328', '432', '慕容世家鸡翅木筷子家用日式无漆无蜡筷子实', '/image/kuaizi/acf160b371d54028a7e9b32229e83a33.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('a5858c041ea44eeca7795fde24c82bb6', '32.00', '30.00', '100', '200', '980', '1294', '米线粉篱网漏笊篱不锈钢麻辣烫漏勺捞面勺', '/image/xianlou/5701afc384c54c7fa57e2648fc9d8374.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('a92b6bf103114097a49c1aa348709001', '5.00', '4.00', '200', '3000', '50454', '200', '阿拉山口计划', '/image/xianlou/01d2d6e053504320a93bd4840b0b7d13.jpg', '0', '1', '0', '0');
INSERT INTO `product_details` VALUES ('aa7a7fda43304bc28e593fa1828844c3', '43.00', '42.00', '666', '777', '885', '1002', '食品夹子 面包夹子 牛排夹子 烧烤夹 不锈钢 食物夹', '/image/shipingjia/fc1fc18a685d4fa2a3681d5d599b4935.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('aae8607fef874e2ea34e3818b595714c', '5.00', '4.50', '200', '2000', '45278', '5445', '不知道', '/image/weifenlei/6f2e248de95543b6ac83036615b6b3b4.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('c14d3d9ced8b4733bbda477b4d966140', '8.00', '7.80', '200', '5000', '59999', '54201', '铲 勺 12漏 果铲 饭匙，201不锈钢', '/image/chanshao/chanshao10.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('c3926a7d2f88459d8718c8b8b54e4047', '8.00', '7.50', '200', '2000', '45000', '1235', '靓丽的笔筒', '/image/kuaitong/0e4de570b7c4419d9857026709a81580.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('c5d83dd7b0a64825b0ba50b6fd0d044d', '13.00', '11.00', '234', '555', '2333', '324', '慕容世家鸡翅木筷子家用日式无漆无蜡筷子实木餐', '/image/kuaizi/e9538cf942be47eeaba54014fa279d3d.jpg', '0', '1', '0', '0');
INSERT INTO `product_details` VALUES ('c7c22b7713404cf39197edce88fd9346', '3.00', '2.00', '200', '3000', '45323', '446', '卡萨丁和', '/image/kuaizi/266c1c419ee1432b99d9c89837947f98.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('cf275090cd164c2bad11d13978558e69', '7.00', '6.80', '200', '5000', '14442', '54202', '铲 勺 12漏 果铲 饭匙 14漏  16漏  18漏', '/image/chanshao/chanshao3.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('d3fe76f4545d4b2c8f3683cdf069f305', '2.00', '1.80', '200', '5000', '59996', '54204', '\r\n培利亨 苹果型分果器 水果切果器 多多功能切果器', '/image/guapao/guapao2.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('d46fdad2131d4580b8946557dde1d4eb', '5.00', '4.50', '500', '5000', '45000', '200', '多功能线漏，持久耐用', '/image/xianlou/be210ed395fb4dd296d4b635d7757ae6.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('d9a66996f53d4ccc98593e56050d2526', '5.00', '4.80', '200', '5000', '59999', '54201', '可放消毒柜也可以挂立，广泛用于家庭，酒店，饭堂等舀汤，舀粥', '/image/tanglou/tanglou1.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('de590ff6c361419dadee9c506629d092', '6.00', '5.80', '200', '5000', '59996', '54204', '材质：201不锈钢 用途：酒店用品', '/image/duoyongpao/duoyongpao1.jpg', '0', '0', '0', '1');
INSERT INTO `product_details` VALUES ('e2717200558f4a179edd853bce3e1b1a', '4.00', '3.50', '200', '5500', '452154', '1234', '多用的水果刨', '/image/duoyongpao/1072acad70124060b066e0ae59abc651.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('e92eb278590d40bf8ef7c5d9e27b5b87', '5.00', '4.50', '200', '4000', '2000', '5000', '萨迪克', '/image/weifenlei/788a0f9d5a8d47d7bc8446972878bde5.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('e9c06ffe1b874c7a80f852d746477dcb', '6.00', '5.80', '2000', '5000', '17717', '54260', '曲奇食品夹，9寸  12寸  14寸 材质：201', '/image/shipingjia/shipingjia1.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('ede961a3ac874fb5b09b1f7e36f52ee8', '4.00', '3.00', '500', '5000', '54566', '1238', '小夹子', '/image/shipingjia/59a1016974964ad29823d54818c4d90a.jpg', '1', '1', '1', '0');
INSERT INTO `product_details` VALUES ('fbee856ed679452ca1addee131941188', '5.00', '4.50', '455', '5000', '20000', '200', '灭偶遇哦', '/image/xianlou/c04ea52cd6f14da08564f10362f11cf5.jpg', '0', '0', '0', '0');
INSERT INTO `product_details` VALUES ('fed77483ed394c29a14ce0ec9bfd7914', '5.00', '4.50', '200', '2000', '45278', '5445', '不知道', '/image/weifenlei/b5c2938c7734438d974ee39f30897a84.jpg', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('08355957af8c4e0b853a027462febb80', '食品夹', 'shipingjia');
INSERT INTO `product_type` VALUES ('10c2ca90f894474c969284bb9bff9ea2', '筷子', 'kuaizi');
INSERT INTO `product_type` VALUES ('1620a5a48ca446f28baa4fecdf75fa33', '线漏', 'xianlou');
INSERT INTO `product_type` VALUES ('68aa01cdda124578a4862e5c84ae8dde', '筷筒', 'kuaitong');
INSERT INTO `product_type` VALUES ('81a2287cfc1f4651bcce5f074ff11f06', '铲勺系列', 'chanshao');
INSERT INTO `product_type` VALUES ('8fc23bf8eaea4211898f285334d3596c', '多用刨', 'duoyongpao');
INSERT INTO `product_type` VALUES ('b2fefbabfb134facbcffe8b773cfa0d3', '瓜刨', 'guapao');
INSERT INTO `product_type` VALUES ('eb77b3775fad4194a5cc786c752a492e', '小汤壳/漏', 'tanglou');
INSERT INTO `product_type` VALUES ('f321811976d14aeeaa716991273cb314', '油格', 'youge');
INSERT INTO `product_type` VALUES ('j2a133408d1d4187970c3454b88316db', '未分类', 'weifenlei');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL COMMENT '用户id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `phonenumber` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `ROLE_USER` varchar(255) DEFAULT 'user' COMMENT '权限',
  `istrue` int(1) DEFAULT '1' COMMENT '默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15eaf78817864020b5aeded859cf7146', 'llg', '123456', '13711919653', '广东省', '823357667@qq.com', 'admin', '1');
INSERT INTO `user` VALUES ('8a4d2ba52bc2483284e2f2676af97926', 'llx', '123456', '13711919653', '广东省', '243858667@qq.com', 'user', '1');
