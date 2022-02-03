/*
Navicat MySQL Data Transfer

Source Server         : YiXiYu
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : yixiyu

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-06-16 13:24:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_ID` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for `bill_all`
-- ----------------------------
DROP TABLE IF EXISTS `bill_all`;
CREATE TABLE `bill_all` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(50) NOT NULL,
  `bill_data` date NOT NULL,
  `bill_customer` varchar(30) NOT NULL,
  `bill_proom` varchar(20) NOT NULL,
  `vegetable_id` varchar(20) NOT NULL,
  `vegetable_type` varchar(20) NOT NULL,
  `vegetable_name` varchar(50) NOT NULL,
  `vegetable_price` float NOT NULL,
  `vegetable_number` int(11) NOT NULL,
  `vegetable_state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bill_all
-- ----------------------------
INSERT INTO `bill_all` VALUES ('147', '618045', '2021-05-28', '15612156588', '包2', 'GG1', '干锅类', '翅中虾', '128', '1', '已上');
INSERT INTO `bill_all` VALUES ('148', '618046', '2021-05-28', '15612156588', '包2', 'GG1', '干锅类', '翅中虾', '128', '1', '已上');
INSERT INTO `bill_all` VALUES ('149', '618047', '2021-05-28', '15612156588', '包2', 'GG1', '干锅类', '翅中虾', '128', '1', '已上');
INSERT INTO `bill_all` VALUES ('150', '618048', '2021-05-28', '15612156588', '包2', 'TG4', '汤锅类', '麻辣锅', '20', '1', '已上');
INSERT INTO `bill_all` VALUES ('154', '211782', '2021-06-04', '15612156587', '大厅1', 'GG1', '干锅类', '翅中虾', '128', '1', '已上');
INSERT INTO `bill_all` VALUES ('155', '211782', '2021-06-04', '15612156587', '大厅1', 'TG4', '汤锅类', '麻辣锅', '20', '1', '已上');
INSERT INTO `bill_all` VALUES ('156', '211782', '2021-06-04', '15612156587', '大厅1', 'HC1', '荤菜类', '顶级肥牛', '38', '1', '已上');
INSERT INTO `bill_all` VALUES ('157', '211782', '2021-06-04', '15612156587', '大厅1', 'HC4', '荤菜类', '火腿肠', '6', '1', '已上');
INSERT INTO `bill_all` VALUES ('158', '211782', '2021-06-04', '15612156587', '大厅1', 'HC5', '荤菜类', '极品肥牛', '28', '1', '已上');
INSERT INTO `bill_all` VALUES ('159', '211782', '2021-06-04', '15612156587', '大厅1', 'HC7', '荤菜类', '羊肉卷', '28', '1', '已上');
INSERT INTO `bill_all` VALUES ('160', '211782', '2021-06-04', '15612156587', '大厅1', 'TSC1', '素菜类', '金针菇', '8', '1', '已上');
INSERT INTO `bill_all` VALUES ('161', '211782', '2021-06-04', '15612156587', '大厅1', 'TSC2', '素菜类', '山药', '10', '1', '已上');
INSERT INTO `bill_all` VALUES ('162', '211782', '2021-06-04', '15612156587', '大厅1', 'TSC3', '素菜类', '香菇', '8', '1', '未上');
INSERT INTO `bill_all` VALUES ('163', '211782', '2021-06-04', '15612156587', '大厅1', 'LW1', '料碗类', '小葱', '1', '1', '已上');
INSERT INTO `bill_all` VALUES ('164', '211782', '2021-06-04', '15612156587', '大厅1', 'LW2', '料碗类', '香菜', '1', '1', '已上');
INSERT INTO `bill_all` VALUES ('165', '211782', '2021-06-04', '15612156587', '大厅1', 'LW3', '料碗类', '蒜泥', '2', '1', '已上');
INSERT INTO `bill_all` VALUES ('166', '211782', '2021-06-04', '15612156587', '大厅1', 'LW4', '料碗类', '香辣酱', '3', '1', '已上');
INSERT INTO `bill_all` VALUES ('167', '211782', '2021-06-04', '15612156587', '大厅1', 'LW5', '料碗类', '香油', '5', '1', '已上');
INSERT INTO `bill_all` VALUES ('168', '211782', '2021-06-04', '15612156587', '大厅1', 'JS4', '酒水类', '大窑(黄)', '5', '2', '已上');
INSERT INTO `bill_all` VALUES ('207', '213690', '2021-06-06', '15612156587', '大厅1', 'GG2', '干锅类', '凤爪虾', '138', '1', '未上');
INSERT INTO `bill_all` VALUES ('208', '213690', '2021-06-06', '15612156587', '大厅1', 'TG4', '汤锅类', '麻辣锅', '20', '1', '已上');
INSERT INTO `bill_all` VALUES ('209', '213690', '2021-06-06', '15612156587', '大厅1', 'TSC1', '素菜类', '金针菇', '8', '1', '已上');
INSERT INTO `bill_all` VALUES ('210', '213690', '2021-06-06', '15612156587', '大厅1', 'TSC2', '素菜类', '山药', '10', '1', '已上');
INSERT INTO `bill_all` VALUES ('211', '213690', '2021-06-06', '15612156587', '大厅1', 'TSC3', '素菜类', '香菇', '8', '1', '已上');
INSERT INTO `bill_all` VALUES ('212', '213690', '2021-06-06', '15612156587', '大厅1', 'TSC4', '素菜类', '莲藕', '8', '1', '已上');
INSERT INTO `bill_all` VALUES ('213', '213690', '2021-06-06', '15612156587', '大厅1', 'TSC5', '素菜类', '面筋', '8', '1', '已上');

-- ----------------------------
-- Table structure for `bill_drink`
-- ----------------------------
DROP TABLE IF EXISTS `bill_drink`;
CREATE TABLE `bill_drink` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(50) NOT NULL,
  `drink_id` varchar(20) NOT NULL,
  `drink_name` varchar(50) NOT NULL,
  `drink_price` float NOT NULL,
  `drink_number` int(4) NOT NULL,
  PRIMARY KEY (`id`,`drink_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `bill_drink_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_form` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bill_drink
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_form`
-- ----------------------------
DROP TABLE IF EXISTS `bill_form`;
CREATE TABLE `bill_form` (
  `bill_id` varchar(50) NOT NULL COMMENT '账单编号',
  `bill_date` date NOT NULL,
  `P_room_id` varchar(10) NOT NULL COMMENT '包间号',
  `customer_number` int(4) NOT NULL COMMENT '顾客人数',
  `dinner_service_number` int(4) NOT NULL COMMENT '餐具数',
  `pay_type` varchar(20) NOT NULL,
  `pay_price` float NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `customer_number` (`customer_number`),
  KEY `P_room_id` (`P_room_id`),
  CONSTRAINT `bill_form_ibfk_2` FOREIGN KEY (`customer_number`) REFERENCES `order_form` (`customer_number`),
  CONSTRAINT `bill_form_ibfk_3` FOREIGN KEY (`P_room_id`) REFERENCES `order_form` (`P_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bill_form
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_griddle`
-- ----------------------------
DROP TABLE IF EXISTS `bill_griddle`;
CREATE TABLE `bill_griddle` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `bill_id` varchar(50) NOT NULL COMMENT '菜单编号',
  `griddle_id` varchar(20) NOT NULL COMMENT '锅号',
  `griddle_name` varchar(50) NOT NULL COMMENT '锅名称',
  `griddle_price` float NOT NULL COMMENT '锅价格',
  `griddle_number` int(4) NOT NULL COMMENT '锅数量',
  PRIMARY KEY (`id`,`griddle_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `bill_griddle_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_form` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bill_griddle
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_other`
-- ----------------------------
DROP TABLE IF EXISTS `bill_other`;
CREATE TABLE `bill_other` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(50) NOT NULL,
  `other_id` varchar(20) NOT NULL,
  `other_name` varchar(50) NOT NULL,
  `other_price` float NOT NULL,
  `other_number` int(4) NOT NULL,
  PRIMARY KEY (`id`,`other_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `bill_other_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_form` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bill_other
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_sauce`
-- ----------------------------
DROP TABLE IF EXISTS `bill_sauce`;
CREATE TABLE `bill_sauce` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bill_id` varchar(50) NOT NULL COMMENT '菜单号',
  `sauce_id` varchar(20) NOT NULL COMMENT '酱料号',
  `sauce_name` varchar(50) NOT NULL COMMENT '酱料名称',
  `sauce_price` float NOT NULL COMMENT '酱料单价',
  `sauce_number` int(4) NOT NULL COMMENT '酱料碗数量',
  PRIMARY KEY (`id`,`sauce_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `bill_sauce_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_form` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bill_sauce
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_vegetable`
-- ----------------------------
DROP TABLE IF EXISTS `bill_vegetable`;
CREATE TABLE `bill_vegetable` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(50) NOT NULL COMMENT '菜单编号',
  `vegetable_id` varchar(20) NOT NULL COMMENT '菜号',
  `vegetable_name` varchar(20) NOT NULL COMMENT '菜名',
  `vegetable_price` float NOT NULL COMMENT '菜价格',
  `vegetable_number` int(4) NOT NULL COMMENT '点菜数量',
  PRIMARY KEY (`id`,`vegetable_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `bill_vegetable_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_form` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bill_vegetable
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_nickname` varchar(50) NOT NULL,
  `customer_sex` varchar(10) NOT NULL,
  `customer_password` varchar(50) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`customer_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('秋谨的末齿', '先生', '123456', '15612156587', '李四', '1978-03-01');

-- ----------------------------
-- Table structure for `order_form`
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form` (
  `order_id` varchar(50) NOT NULL COMMENT '预订号',
  `P_room_id` varchar(10) NOT NULL COMMENT '包间号',
  `order_date` date NOT NULL,
  `order_time` time NOT NULL COMMENT '到店时间',
  `customer_number` int(4) NOT NULL COMMENT '顾客人数',
  `order_griddle` varchar(50) DEFAULT NULL COMMENT '预订干锅',
  `customer_phone` varchar(20) NOT NULL COMMENT '预订人联系方式',
  `customer_name` varchar(50) NOT NULL COMMENT '预订人姓名',
  PRIMARY KEY (`order_id`),
  KEY `customer_number` (`customer_number`),
  KEY `P_room_id` (`P_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_form
-- ----------------------------
INSERT INTO `order_form` VALUES ('021182Order', '大厅1', '2021-06-06', '18:40:00', '4', '凤爪虾', '15612156587', '秋谨的末齿');
INSERT INTO `order_form` VALUES ('344309Order', '包1', '2021-05-28', '17:20:00', '6', '翅中虾', '15612156587', '秋谨的末齿');

-- ----------------------------
-- Table structure for `pay_form`
-- ----------------------------
DROP TABLE IF EXISTS `pay_form`;
CREATE TABLE `pay_form` (
  `bill_id` varchar(50) NOT NULL,
  `p_room_id` varchar(10) NOT NULL,
  `pay_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pay_type` varchar(50) NOT NULL,
  `pay_price` float NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `p_room_id` (`p_room_id`),
  CONSTRAINT `pay_form_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_form` (`bill_id`),
  CONSTRAINT `pay_form_ibfk_2` FOREIGN KEY (`p_room_id`) REFERENCES `bill_form` (`P_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pay_form
-- ----------------------------

-- ----------------------------
-- Table structure for `rest_bill_of_fare`
-- ----------------------------
DROP TABLE IF EXISTS `rest_bill_of_fare`;
CREATE TABLE `rest_bill_of_fare` (
  `vegetable_id` varchar(20) NOT NULL,
  `vegetable_type` varchar(20) NOT NULL,
  `vegetable_name` varchar(50) NOT NULL,
  `vegetable_image` varchar(50) DEFAULT NULL,
  `vegetable_price` varchar(50) NOT NULL,
  `vegetable_number` varchar(10) NOT NULL,
  `vegetable_remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`vegetable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_bill_of_fare
-- ----------------------------
INSERT INTO `rest_bill_of_fare` VALUES ('GG1', '干锅类', '翅中虾', null, '128元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('GG2', '干锅类', '凤爪虾', null, '138元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('GG3', '干锅类', '香辣虾', null, '128元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('GG4', '干锅类', '蹄花虾', null, '148元', '20', '');
INSERT INTO `rest_bill_of_fare` VALUES ('GG5', '干锅类', '草鱼虾', null, '128元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('GG6', '干锅类', '梭边虾', null, '138元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('GG8', '干锅类', '排骨虾', null, '148元', '50', '');
INSERT INTO `rest_bill_of_fare` VALUES ('GG9', '干锅类', '炝锅鱼', null, '128元', '100', '梭边鱼刺少，江团营养价值高');
INSERT INTO `rest_bill_of_fare` VALUES ('HC1', '荤菜类', '顶级肥牛', null, '38元', '50', '');
INSERT INTO `rest_bill_of_fare` VALUES ('HC2', '荤菜类', '午餐肉', null, '14元', '40', '');
INSERT INTO `rest_bill_of_fare` VALUES ('HC3', '荤菜类', '大虾', null, '30元', '30', '');
INSERT INTO `rest_bill_of_fare` VALUES ('HC4', '荤菜类', '火腿肠', null, '6元', '80', '');
INSERT INTO `rest_bill_of_fare` VALUES ('HC5', '荤菜类', '极品肥牛', null, '28元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('HC6', '荤菜类', '鹌鹑蛋', null, '12元', '30', '');
INSERT INTO `rest_bill_of_fare` VALUES ('HC7', '荤菜类', '羊肉卷', null, '28元', '30', '');
INSERT INTO `rest_bill_of_fare` VALUES ('HC8', '荤菜类', '脆皮肠', null, '12元', '30', '');
INSERT INTO `rest_bill_of_fare` VALUES ('HC9', '荤菜类', '毛肚', null, '30元', '40', '');
INSERT INTO `rest_bill_of_fare` VALUES ('JS1', '酒水类', '黄河青稞', null, '4元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('JS2', '酒水类', '黄河王', null, '6元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('JS3', '酒水类', '黄河纯生', null, '10元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('JS4', '酒水类', '大窑(黄)', null, '5元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('JS5', '酒水类', '大窑(黑)', null, '5元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('JS6', '酒水类', '奇亚籽', null, '3元', '50', '');
INSERT INTO `rest_bill_of_fare` VALUES ('JS7', '酒水类', '青岛', null, '4元', '50', '');
INSERT INTO `rest_bill_of_fare` VALUES ('JS8', '酒水类', '崂山', null, '5元', '50', '');
INSERT INTO `rest_bill_of_fare` VALUES ('LW1', '料碗类', '小葱', null, '1元', '1000', '');
INSERT INTO `rest_bill_of_fare` VALUES ('LW2', '料碗类', '香菜', null, '1元', '1000', '');
INSERT INTO `rest_bill_of_fare` VALUES ('LW3', '料碗类', '蒜泥', null, '2元', '500', '');
INSERT INTO `rest_bill_of_fare` VALUES ('LW4', '料碗类', '香辣酱', null, '3元', '500', '');
INSERT INTO `rest_bill_of_fare` VALUES ('LW5', '料碗类', '香油', null, '5元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('LW6', '料碗类', '芝麻酱', null, '5元', '500', '');
INSERT INTO `rest_bill_of_fare` VALUES ('LW7', '料碗类', '耗油', null, '3元', '300', '');
INSERT INTO `rest_bill_of_fare` VALUES ('QT1', '其他类', '打包盒(大)', null, '5元', '500', '');
INSERT INTO `rest_bill_of_fare` VALUES ('QT2', '其他类', '打包盒(小)', null, '2元', '500', '');
INSERT INTO `rest_bill_of_fare` VALUES ('QT3', '其他类', '扑克', null, '1元', '500', '');
INSERT INTO `rest_bill_of_fare` VALUES ('QT4', '其他类', '苦荞茶', null, '3元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TG1', '汤锅类', '仔姜鱼', null, '128元', '100', '梭边鱼刺少，江团营养价值高');
INSERT INTO `rest_bill_of_fare` VALUES ('TG2', '汤锅类', '火锅鸡', null, '138元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TG3', '汤锅类', '酸菜鱼', null, '128元', '100', '梭边鱼刺少，江团营养价值高');
INSERT INTO `rest_bill_of_fare` VALUES ('TG4', '汤锅类', '麻辣锅', '', '20元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TG5', '汤锅类', '三鲜滋补锅', null, '18元', '1', null);
INSERT INTO `rest_bill_of_fare` VALUES ('TG6', '汤锅类', '酸菜锅', null, '28元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TG7', '汤锅类', '番茄锅', null, '28元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TG8', '汤锅类', '鸳鸯锅', null, '38元', '100', '一边辣，一边不辣');
INSERT INTO `rest_bill_of_fare` VALUES ('TG9', '汤锅类', '羊排火锅', null, '148元', '5', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TSC1', '素菜类', '金针菇', null, '8元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TSC2', '素菜类', '山药', null, '10元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TSC3', '素菜类', '香菇', null, '8元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TSC4', '素菜类', '莲藕', null, '8元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TSC5', '素菜类', '面筋', null, '8元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TSC6', '素菜类', '平菇', null, '8元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('TSC7', '素菜类', '土豆', null, '6元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('ZS1', '主食类', '金馒头', null, '16元', '100', '');
INSERT INTO `rest_bill_of_fare` VALUES ('ZS2', '主食类', '春卷', null, '12元', '50', '');
INSERT INTO `rest_bill_of_fare` VALUES ('ZS3', '主食类', '红薯饼', null, '10元', '100', '');

-- ----------------------------
-- Table structure for `rest_kitchen_ingredients_management`
-- ----------------------------
DROP TABLE IF EXISTS `rest_kitchen_ingredients_management`;
CREATE TABLE `rest_kitchen_ingredients_management` (
  `ingredient_id` varchar(20) NOT NULL,
  `ingredient_name` varchar(50) NOT NULL,
  `ingredient_type` varchar(20) NOT NULL,
  `purchase_mes` varchar(500) NOT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_kitchen_ingredients_management
-- ----------------------------

-- ----------------------------
-- Table structure for `rest_kitchen_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `rest_kitchen_purchase`;
CREATE TABLE `rest_kitchen_purchase` (
  `purchase_date` date NOT NULL,
  `purchase_id` varchar(20) NOT NULL,
  `purchase_name` varchar(50) NOT NULL,
  `purchase_type` varchar(20) NOT NULL,
  `purchase_person` varchar(100) NOT NULL,
  `purchase_phone` varchar(20) DEFAULT NULL,
  `vegetable_stock` float DEFAULT NULL,
  `purchase_number` float DEFAULT NULL,
  `purchase_price` float NOT NULL,
  PRIMARY KEY (`purchase_date`,`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_kitchen_purchase
-- ----------------------------
INSERT INTO `rest_kitchen_purchase` VALUES ('2021-02-26', 'XL1', '八角', '香料', '拼多多', 'xxxxx', '0', '1', '2.3');
INSERT INTO `rest_kitchen_purchase` VALUES ('2021-03-01', 'XL1', '桂皮', '香料', '拼多多xxx', '15612156587', '0', '5', '3.8');
INSERT INTO `rest_kitchen_purchase` VALUES ('2021-06-08', 'JS1', '崂山', '酒水', '老张xxx', 'xxxxx', '50', '20', '4');

-- ----------------------------
-- Table structure for `rest_pay_form`
-- ----------------------------
DROP TABLE IF EXISTS `rest_pay_form`;
CREATE TABLE `rest_pay_form` (
  `bill_id` varchar(50) NOT NULL,
  `p_room_id` varchar(10) DEFAULT NULL,
  `pay_date` date NOT NULL,
  `pay_time` time DEFAULT NULL,
  `is_takeaway` varchar(10) NOT NULL,
  `takeaway_type` varchar(20) DEFAULT NULL,
  `pay_type` varchar(50) NOT NULL,
  `pay_price` float NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_pay_form
-- ----------------------------
INSERT INTO `rest_pay_form` VALUES ('211782', '大厅1', '2021-06-04', '00:00:00', '否', '', '微信', '296');
INSERT INTO `rest_pay_form` VALUES ('213690', '大厅1', '2021-06-06', '00:00:00', '否', '', '支付宝', '200');
INSERT INTO `rest_pay_form` VALUES ('326950', '包2', '2021-05-27', '11:27:36', '否', null, '微信', '256');
INSERT INTO `rest_pay_form` VALUES ('326951', '包1', '2021-05-27', '16:26:46', '否', null, '微信', '234');
INSERT INTO `rest_pay_form` VALUES ('326952', '大厅1', '2021-05-27', '17:02:00', '否', '', '支付宝', '132');
INSERT INTO `rest_pay_form` VALUES ('326953', '包5', '2020-05-27', '18:56:00', '否', '', '微信', '342');
INSERT INTO `rest_pay_form` VALUES ('326954', '包3', '2020-05-27', '19:56:00', '否', '', '微信', '123');
INSERT INTO `rest_pay_form` VALUES ('326955', '包1', '2020-05-28', '11:56:00', '否', '', '微信', '103');
INSERT INTO `rest_pay_form` VALUES ('326956', '包2', '2020-05-28', '14:56:00', '否', '', '微信', '113');
INSERT INTO `rest_pay_form` VALUES ('326957', '包2', '2020-05-28', '16:56:00', '否', '', '微信', '143');
INSERT INTO `rest_pay_form` VALUES ('326958', '包2', '2020-05-28', '15:56:00', '否', '', '微信', '163');
INSERT INTO `rest_pay_form` VALUES ('326960', '包2', '2020-05-28', '16:56:00', '否', '', '微信', '163');
INSERT INTO `rest_pay_form` VALUES ('326961', '包2', '2020-05-29', '12:56:00', '否', '', '微信', '163');
INSERT INTO `rest_pay_form` VALUES ('326962', '包2', '2020-05-29', '16:56:00', '否', '', '微信', '163');
INSERT INTO `rest_pay_form` VALUES ('326963', '包2', '2020-05-29', '17:56:00', '否', '', '微信', '163');
INSERT INTO `rest_pay_form` VALUES ('326964', '包2', '2020-05-29', '18:56:00', '否', '', '微信', '163');
INSERT INTO `rest_pay_form` VALUES ('326965', '包2', '2020-05-30', '10:56:00', '否', '', '微信', '263');
INSERT INTO `rest_pay_form` VALUES ('326966', '包2', '2020-05-30', '16:56:00', '否', '', '微信', '263');
INSERT INTO `rest_pay_form` VALUES ('326967', '包2', '2020-05-30', '15:56:00', '否', '', '微信', '263');
INSERT INTO `rest_pay_form` VALUES ('326968', '包2', '2020-05-30', '16:56:00', '否', '', '微信', '263');
INSERT INTO `rest_pay_form` VALUES ('326970', '包2', '2020-05-31', '15:56:00', '否', '', '微信', '143');
INSERT INTO `rest_pay_form` VALUES ('326971', '包2', '2020-05-31', '16:56:00', '否', '', '微信', '143');
INSERT INTO `rest_pay_form` VALUES ('618044', '大厅1', '2021-06-04', '00:00:00', '否', '', '未支付', '351');
INSERT INTO `rest_pay_form` VALUES ('828856', '大厅1', '2021-05-22', '00:00:00', '否', '', '支付宝', '281');
INSERT INTO `rest_pay_form` VALUES ('CD0', '大厅1', '2021-06-04', '00:00:00', '否', '', '微信', '351');

-- ----------------------------
-- Table structure for `rest_p_room`
-- ----------------------------
DROP TABLE IF EXISTS `rest_p_room`;
CREATE TABLE `rest_p_room` (
  `P_room_id` varchar(10) NOT NULL COMMENT '包间号',
  `P_room_type` varchar(20) NOT NULL,
  `P_room_name` varchar(10) NOT NULL COMMENT '包间名',
  `P_room_image` longblob,
  `P_room_number` int(4) NOT NULL,
  `P_room_state` varchar(20) NOT NULL COMMENT '包间状态',
  `P_room_remark` varchar(500) DEFAULT NULL,
  `P_room_began` varchar(20) DEFAULT NULL,
  `P_room_finish` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`P_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_p_room
-- ----------------------------
INSERT INTO `rest_p_room` VALUES ('BJ1', '包间', '包1', null, '8', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ10', '包间', '包2+3', null, '16', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ2', '包间', '包2', null, '8', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ3', '包间', '包3', null, '8', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ4', '包间', '包5', null, '12', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ5', '包间', '包6', null, '10', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ6', '包间', '包8', null, '12', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ7', '包间', '包9①', null, '6', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ8', '包间', '包9②', null, '6', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('BJ9', '包间', '包9①+②', null, '12', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('DT1', '大厅', '大厅1', null, '5', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('YZ1', '雅座', '雅1', null, '5', '空闲', '', '', '');
INSERT INTO `rest_p_room` VALUES ('YZ2', '雅座', '雅2', null, '6', '空闲', '', '', '');

-- ----------------------------
-- Table structure for `rest_recipe_form`
-- ----------------------------
DROP TABLE IF EXISTS `rest_recipe_form`;
CREATE TABLE `rest_recipe_form` (
  `recipe_id` varchar(20) NOT NULL,
  `recipe_name` varchar(50) NOT NULL,
  `recipe_type` varchar(20) NOT NULL,
  `recipe_ingredient` varchar(500) NOT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_recipe_form
-- ----------------------------

-- ----------------------------
-- Table structure for `rest_staff_basic_form`
-- ----------------------------
DROP TABLE IF EXISTS `rest_staff_basic_form`;
CREATE TABLE `rest_staff_basic_form` (
  `staff_id` varchar(50) NOT NULL,
  `staff_password` varchar(50) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `staff_sex` varchar(10) NOT NULL,
  `staff_phone` varchar(20) NOT NULL,
  `staff_section` varchar(50) NOT NULL,
  `staff_salary` float NOT NULL,
  `staff_remuneration` float NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `staff_name` (`staff_name`),
  KEY `staff_sex` (`staff_sex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_staff_basic_form
-- ----------------------------
INSERT INTO `rest_staff_basic_form` VALUES ('YG1', 'YG1', '李四', '男', '15612156587', '服务员', '1800', '1800');
INSERT INTO `rest_staff_basic_form` VALUES ('YG2', 'YG2', '张三', '男', '15373050135', '服务员', '1800', '1800');
INSERT INTO `rest_staff_basic_form` VALUES ('YG3', 'YG3', '王五', '男', '15612154587', '服务员', '1800', '1800');

-- ----------------------------
-- Table structure for `rest_staff_check_form`
-- ----------------------------
DROP TABLE IF EXISTS `rest_staff_check_form`;
CREATE TABLE `rest_staff_check_form` (
  `date` varchar(20) NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `staff_sex` varchar(10) NOT NULL,
  `staff_check` varchar(20) NOT NULL,
  `staff_special_matters` varchar(500) NOT NULL,
  `staff_data_deduction` float NOT NULL,
  PRIMARY KEY (`date`,`staff_id`),
  KEY `staff_id` (`staff_id`),
  KEY `staff_name` (`staff_name`),
  KEY `staff_sex` (`staff_sex`),
  CONSTRAINT `rest_staff_check_form_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `rest_staff_basic_form` (`staff_id`),
  CONSTRAINT `rest_staff_check_form_ibfk_2` FOREIGN KEY (`staff_name`) REFERENCES `rest_staff_basic_form` (`staff_name`),
  CONSTRAINT `rest_staff_check_form_ibfk_3` FOREIGN KEY (`staff_sex`) REFERENCES `rest_staff_basic_form` (`staff_sex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_staff_check_form
-- ----------------------------
INSERT INTO `rest_staff_check_form` VALUES ('2021/2/24', 'YG1', '李四', '男', '迟到', '无', '20');
INSERT INTO `rest_staff_check_form` VALUES ('2021/6/8', 'YG1', '李四', '男', '已到', '无', '0');
INSERT INTO `rest_staff_check_form` VALUES ('2021/6/8', 'YG2', '张三', '男', '已到', '无', '0');

-- ----------------------------
-- Table structure for `rest_staff_leave_form`
-- ----------------------------
DROP TABLE IF EXISTS `rest_staff_leave_form`;
CREATE TABLE `rest_staff_leave_form` (
  `data` date NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `staff_phone` varchar(20) NOT NULL,
  `staff_leave_began` varchar(20) NOT NULL,
  `staff_leave_finish` varchar(20) NOT NULL,
  `staff_leave_verify_stage` varchar(20) NOT NULL,
  PRIMARY KEY (`data`,`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rest_staff_leave_form
-- ----------------------------
INSERT INTO `rest_staff_leave_form` VALUES ('2021-02-25', 'YG1', '李四', '15612156587', '2021-02-25 10:17', '2021-02-25 14:17', '允许请假');

-- ----------------------------
-- Table structure for `takeaway_order_form`
-- ----------------------------
DROP TABLE IF EXISTS `takeaway_order_form`;
CREATE TABLE `takeaway_order_form` (
  `takeaway_id` varchar(20) NOT NULL,
  `takeaway_type` varchar(20) NOT NULL,
  `takeaway_date` date NOT NULL,
  `takeaway_time` time NOT NULL,
  `takeaway_money` float NOT NULL,
  `customer_nickname` varchar(50) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  PRIMARY KEY (`takeaway_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of takeaway_order_form
-- ----------------------------
INSERT INTO `takeaway_order_form` VALUES ('YE7E6KG2021/5/15', '饿了么', '2021-05-15', '15:50:00', '130', '张三', '13830000087');
