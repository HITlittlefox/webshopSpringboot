/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : mmall2

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 29/11/2021 15:36:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `cost` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productId`(`product_id`) USING BTREE,
  INDEX `userId`(`user_id`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (161, NULL, NULL, NULL, 10, '2020-05-15 16:07:05', '2020-05-15 16:08:37');
INSERT INTO `cart` VALUES (167, 744, 10, 19990, 30, '2021-11-25 07:16:43', '2021-11-29 07:16:49');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单主键',
  `product_id` int(11) NOT NULL COMMENT '商品主键',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `cost` float NOT NULL COMMENT '消费',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___66E1BD8E2F10007B`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (86, 109, 745, 2, 304);
INSERT INTO `order_detail` VALUES (87, 109, 745, 2, 1178);
INSERT INTO `order_detail` VALUES (88, 110, 745, 1, 152);
INSERT INTO `order_detail` VALUES (89, 111, 745, 1, 152);
INSERT INTO `order_detail` VALUES (90, 112, 745, 1, 152);
INSERT INTO `order_detail` VALUES (91, 113, 745, 1, 152);
INSERT INTO `order_detail` VALUES (92, 114, 746, 1, 152);
INSERT INTO `order_detail` VALUES (93, 115, 746, 1, 152);
INSERT INTO `order_detail` VALUES (94, 116, 746, 1, 152);
INSERT INTO `order_detail` VALUES (95, 116, 746, 3, 1767);
INSERT INTO `order_detail` VALUES (96, 116, 746, 1, 5896);
INSERT INTO `order_detail` VALUES (97, 117, 747, 4, 632);
INSERT INTO `order_detail` VALUES (98, 118, 747, 1, 158);
INSERT INTO `order_detail` VALUES (99, 119, 747, 1, 11000);
INSERT INTO `order_detail` VALUES (100, 120, 747, 1, 11000);
INSERT INTO `order_detail` VALUES (101, 120, 747, 1, 589);
INSERT INTO `order_detail` VALUES (102, 121, 750, 6, 41994);
INSERT INTO `order_detail` VALUES (103, 123, 744, 3, 5997);
INSERT INTO `order_detail` VALUES (104, 124, 744, 1, 1999);
INSERT INTO `order_detail` VALUES (105, 125, 747, 6, 23994);
INSERT INTO `order_detail` VALUES (106, 126, 747, 10, 39990);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `cost` float NULL DEFAULT NULL COMMENT '总金额',
  `serialnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (109, 10, 'test', '家', 1482, 'E96F8AF1E5E0D5BF1646F9344E31DA14', '2019-10-22 21:20:24', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (110, 10, 'test', '家', 152, '6E9A8991CCCBDC6B9840BA0613B3C4E4', '2019-10-22 21:21:49', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (111, 10, 'test', '家', 152, '18C4B6CCAE6F6CF9232DD97529B82E23', '2019-10-23 01:15:25', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (112, 10, 'test', '家', 152, '69FF8CEBCC5F8DF67EA2BB56C45FA11E', '2019-10-23 01:16:57', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (113, 10, 'test', '家', 152, '2FA4CE1A3421F2A873277C6E872630B1', '2019-10-23 01:24:40', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (114, 10, 'test', '家', 152, '4E9F18DA0EB4B5C7C7DD90414B2BB868', '2019-10-23 01:25:28', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (115, 10, 'test', '家', 152, '6D0466402E4C4CB2430910BF9C3A3582', '2019-10-23 01:27:44', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (116, 10, 'test', '家', 7815, '493F330AABFC3713EE36FC5DF7E05035', '2019-10-23 02:02:35', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (117, 10, 'test', '家', 632, '62D16D64D1F35D87B5D1C76AB1901A42', '2019-10-23 20:37:29', '0000-00-00 00:00:00');
INSERT INTO `orders` VALUES (118, 27, 'admin', '公司', 158, 'B8A59D7A33274DB314CBE6A76E9A2BFF', '2021-11-26 09:01:05', '2021-11-26 09:01:05');
INSERT INTO `orders` VALUES (119, 27, 'admin', '公司', 11000, 'F5217C583049B9A84C5648BAF4136382', '2021-11-27 01:57:52', '2021-11-27 01:57:52');
INSERT INTO `orders` VALUES (120, 27, 'admin', '公司', 11589, 'BC52CC642EFC7A5242AE81226601CF05', '2021-11-27 02:19:57', '2021-11-27 02:19:57');
INSERT INTO `orders` VALUES (121, 27, 'admin', '威海市4', 41994, '2AB54931E11EBCFD61E22F0527A6787A', '2021-11-28 03:57:58', '2021-11-28 03:57:58');
INSERT INTO `orders` VALUES (122, 27, 'admin', '威海市4', 41994, '0F9CE8B550FDCC3DA3F56CEB269B288C', '2021-11-28 03:58:08', '2021-11-28 03:58:08');
INSERT INTO `orders` VALUES (123, 28, 'admin2', '威海市5', 5997, 'FF82AED99D1AA3153D9234D3B4BE4887', '2021-11-29 07:07:31', '2021-11-29 07:07:31');
INSERT INTO `orders` VALUES (124, 27, 'admin', '默认地址：威海市', 1999, 'A597DE70759CF91AFB46142E3693C3D5', '2021-11-29 07:20:14', '2021-11-29 07:20:14');
INSERT INTO `orders` VALUES (125, 31, 'admin5', '默认地址：威海市', 23994, '97EDA4EBE746406D18703E8DFF367020', '2021-11-29 07:22:30', '2021-11-29 07:22:30');
INSERT INTO `orders` VALUES (126, 31, 'admin5', '默认地址：威海市', 39990, 'D2C68C74B5661D3CE50F14CFA1BCDAA6', '2021-11-29 07:28:09', '2021-11-29 07:28:09');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `price` float NOT NULL COMMENT '价格',
  `stock` int(11) NOT NULL COMMENT '库存',
  `categorylevelone_id` int(11) NULL DEFAULT NULL COMMENT '分类1',
  `categoryleveltwo_id` int(11) NULL DEFAULT NULL COMMENT '分类2',
  `categorylevelthree_id` int(11) NULL DEFAULT NULL COMMENT '分类3',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___94F6E55132E0915F`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 776 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (744, '华为nova8', '', 1999, 990, 670, 671, 672, 'nova8.jpg');
INSERT INTO `product` VALUES (745, '荣耀20', '', 2999, 2000, 670, 671, 676, 'honor20.jpg');
INSERT INTO `product` VALUES (746, '小米mix4', '', 1999, 5000, 670, 674, 675, 'mix4.jpg');
INSERT INTO `product` VALUES (747, '华为mate40', '', 3999, 5970, 670, 671, 672, 'mate40.jpg');
INSERT INTO `product` VALUES (750, '联想y7000p', '', 6999, 499, 670, 690, 677, 'y7000p.jpg');
INSERT INTO `product` VALUES (770, '摩托罗拉', '', 2000, 300, 670, 671, 673, 'p50.jpg');
INSERT INTO `product` VALUES (771, '联想R9000K', NULL, 7999, 1000, 670, 690, 677, 'R9000K.jpg');
INSERT INTO `product` VALUES (772, '夏洛的网', NULL, 80, 1000, 680, 681, 682, 'xialuo.jpg');
INSERT INTO `product` VALUES (773, '小猪佩奇', NULL, 30, 1000, 680, 681, 683, 'xiaozhu.jpg');
INSERT INTO `product` VALUES (774, '解忧杂货店', NULL, 40, 1000, 680, 684, 685, 'jieyou.jpg');
INSERT INTO `product` VALUES (775, '追风筝的人', NULL, 50, 1000, 680, 684, 686, 'fengzheng.jpg');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL COMMENT '父级目录id',
  `type` int(11) NULL DEFAULT NULL COMMENT '级别(1:一级 2：二级 3：三级)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___9EC2A4E236B12243`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 696 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (670, '电子商品', 0, 1);
INSERT INTO `product_category` VALUES (671, '手机', 670, 2);
INSERT INTO `product_category` VALUES (672, '华为手机', 671, 3);
INSERT INTO `product_category` VALUES (673, '联想手机', 671, 3);
INSERT INTO `product_category` VALUES (674, '笔记本', 670, 2);
INSERT INTO `product_category` VALUES (675, '小米手机', 671, 3);
INSERT INTO `product_category` VALUES (676, '荣耀手机', 671, 3);
INSERT INTO `product_category` VALUES (677, '联想笔记本', 674, 3);
INSERT INTO `product_category` VALUES (680, '图书', 0, 1);
INSERT INTO `product_category` VALUES (681, '少儿图书', 680, 2);
INSERT INTO `product_category` VALUES (682, '儿童文学', 681, 3);
INSERT INTO `product_category` VALUES (683, '涂色绘本', 681, 3);
INSERT INTO `product_category` VALUES (684, '小说', 680, 2);
INSERT INTO `product_category` VALUES (685, '畅销小说', 684, 3);
INSERT INTO `product_category` VALUES (686, '文学经典', 684, 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '性别(1:男 0：女)',
  `identity_code` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___C96109CC3A81B327`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10, 'test', '测试用户1', '123456', 1, '140225189987854589', '123456@qq.com', '13366055011', '2.jpg', '2021-11-28 06:22:34', '2021-11-28 06:22:37');
INSERT INTO `user` VALUES (27, 'admin', '测试用户2', '123456', 1, '182322232923239182', '923@qq.com', '13982323927', NULL, '2021-11-24 06:51:44', '2021-11-24 06:51:44');
INSERT INTO `user` VALUES (28, 'admin2', '测试用户', '123456', 1, '371422202382472837', '213@qq.com', '13278274823', NULL, '2021-11-29 06:52:15', '2021-11-29 06:52:15');
INSERT INTO `user` VALUES (29, 'admin3', '你好你好', '123456', 1, '371422200029324873', '123@qq.com', '13289742976', NULL, '2021-11-29 07:11:59', '2021-11-29 07:11:59');
INSERT INTO `user` VALUES (30, 'admin4', '你好你好你好', '123456', 1, '371400000000000000', '963614756@qq.com', '13768765756', NULL, '2021-11-29 07:16:09', '2021-11-29 07:16:09');
INSERT INTO `user` VALUES (31, 'admin5', '你好你好', '123456', 1, '371400000000000000', '963614756@qq.com', '13768676800', NULL, '2021-11-29 07:21:41', '2021-11-29 07:21:41');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `isdefault` int(11) NULL DEFAULT 0 COMMENT '是否是默认地址（1:是 0否）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (11, 10, '默认地址：威海市', '默认地址：威海市', 0, '2021-11-28 02:32:39', '2021-11-28 02:32:39');
INSERT INTO `user_address` VALUES (34, 10, '默认地址：威海市', '默认地址：威海市', 0, '2021-11-28 02:32:39', '2021-11-28 02:32:39');
INSERT INTO `user_address` VALUES (35, 10, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-28 02:32:39', '2021-11-28 02:32:39');
INSERT INTO `user_address` VALUES (48, 27, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-28 02:32:39', '2021-11-28 02:32:39');
INSERT INTO `user_address` VALUES (49, 28, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:06:30', '2021-11-29 15:06:33');
INSERT INTO `user_address` VALUES (50, 29, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (51, 30, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:17:23');
INSERT INTO `user_address` VALUES (52, 31, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (53, 32, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (54, 33, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (55, 34, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (56, 35, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (57, 36, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (58, 37, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (59, 38, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (60, 39, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (61, 40, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');
INSERT INTO `user_address` VALUES (62, 41, '默认地址：威海市', '默认地址：威海市', 1, '2021-11-29 15:07:20', '2021-11-29 15:07:22');

SET FOREIGN_KEY_CHECKS = 1;
