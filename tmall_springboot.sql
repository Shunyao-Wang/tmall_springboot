# Host: 127.0.0.1  (Version 5.5.15)
# Date: 2019-04-17 09:55:20
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "category"
#

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

#
# Data for table "category"
#

INSERT INTO `category` VALUES (1,'测试分类1'),(2,'测试分类2'),(3,'测试分类3'),(4,'测试分类4'),(5,'测试分类5'),(6,'测试分类6'),(7,'测试分类7'),(8,'测试分类8'),(9,'测试分类9'),(10,'测试分类10'),(11,'测试分类1'),(12,'测试分类2'),(13,'测试分类3'),(14,'测试分类4'),(15,'测试分类5'),(16,'测试分类6'),(17,'测试分类7'),(18,'测试分类8'),(19,'测试分类9'),(20,'测试分类10'),(21,'tttt'),(22,'测试分类1'),(23,'测试分类2'),(24,'测试分类3'),(25,'测试分类4'),(26,'测试分类5'),(27,'测试分类6'),(28,'测试分类7'),(30,'测试分类9'),(31,'测试分类10'),(32,'电视'),(33,'我的车');

#
# Structure for table "product"
#

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subTitle` varchar(255) DEFAULT NULL,
  `originalPrice` float DEFAULT NULL,
  `promotePrice` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`cid`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "product"
#

INSERT INTO `product` VALUES (1,'海信111','牛逼电视',99.98,19.98,99,32,'2019-04-11 13:53:33'),(2,'tclasd','zzz',99.98,19.98,99,32,'2019-04-11 14:35:24'),(3,'wcddd','zzz',99.98,19.98,99,32,'2019-04-11 14:35:33'),(4,'addd','zz',99.98,19.98,99,32,'2019-04-11 14:35:37'),(5,'小汽车','哈哈哈汽车',99.98,99999,81,33,'2019-04-16 01:12:02');

#
# Structure for table "productimage"
#

CREATE TABLE `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productimage_product` (`pid`),
  CONSTRAINT `fk_productimage_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "productimage"
#

INSERT INTO `productimage` VALUES (1,1,'single');

#
# Structure for table "property"
#

CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`cid`),
  CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "property"
#

INSERT INTO `property` VALUES (1,32,'cpu'),(2,32,'内存'),(3,32,'能耗'),(4,32,'颜色'),(5,31,'xzfqwsad'),(6,31,'czxcasda'),(7,31,'cxzcadasd'),(8,31,'zcasdasd');

#
# Structure for table "propertyvalue"
#

CREATE TABLE `propertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propertyvalue_property` (`ptid`),
  KEY `fk_propertyvalue_product` (`pid`),
  CONSTRAINT `fk_propertyvalue_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_propertyvalue_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "propertyvalue"
#

INSERT INTO `propertyvalue` VALUES (1,1,1,'i9'),(2,1,2,'16'),(3,1,3,'100'),(4,1,4,'蓝色');

#
# Structure for table "user"
#

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'测试用户1','password1',NULL),(2,'测试用户2','password2',NULL),(3,'测试用户3','password3',NULL),(4,'测试用户4','password4',NULL),(5,'测试用户5','password5',NULL),(6,'测试用户1','password1',NULL),(7,'测试用户2','password2',NULL),(8,'测试用户3','password3',NULL),(9,'测试用户4','password4',NULL),(10,'测试用户5','password5',NULL),(11,'测试用户1','password1',NULL),(12,'测试用户2','password2',NULL),(13,'测试用户3','password3',NULL),(14,'测试用户4','password4',NULL),(15,'测试用户5','password5',NULL),(16,'测试用户1','password1',NULL),(17,'测试用户2','password2',NULL),(18,'测试用户3','password3',NULL),(19,'测试用户4','password4',NULL),(20,'测试用户5','password5',NULL),(21,'wang','wang111',NULL),(22,'&lt;script&gt;alert(&#39;papapa&#39;)&lt;/script&gt;','123456',NULL),(23,'a','2894529335f56b4e6ed0233163bca88c','x9jh0n0o2VE1xmdOe7OmYw==');

#
# Structure for table "review"
#

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`pid`),
  KEY `fk_review_user` (`uid`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "review"
#

INSERT INTO `review` VALUES (1,'棒棒棒！',21,3,'2019-04-15 22:26:33');

#
# Structure for table "order_"
#

CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `userMessage` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `deliveryDate` datetime DEFAULT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "order_"
#

INSERT INTO `order_` VALUES (1,'201608241638122609867','某某市，某某区，某某街道，某某号 ','610000','某某某','15111111111',NULL,'2016-12-30 00:00:00',NULL,NULL,NULL,14,'waitDelivery'),(2,'201904152146052769938','jinfeng street','753000','wang','13241225515','老板好帅！','2019-04-15 21:46:05','2019-04-15 21:47:16','2019-04-15 22:24:38','2019-04-15 22:25:55',21,'finish');

#
# Structure for table "orderitem"
#

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_user` (`uid`),
  KEY `fk_orderitem_product` (`pid`),
  KEY `fk_orderitem_order` (`oid`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_orderitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "orderitem"
#

INSERT INTO `orderitem` VALUES (1,2,1,14,2),(2,3,1,14,2),(3,1,2,21,6),(5,3,2,21,4);
