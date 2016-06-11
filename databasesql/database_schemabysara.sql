/*
SQLyog Trial v12.2.4 (64 bit)
MySQL - 5.6.17 : Database - cms_ictg1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cms_ictg1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cms_ictg1`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `article` */

insert  into `article`(`article_id`,`title`,`body`) values 
(1,'Duis bibendum, felis sed','Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(2,'Maecenas leo odio','Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(3,'Morbi porttitor lorem','Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(4,'Maecenas tristique','Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(5,'Suspendisse potenti','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(6,'Duis bibendum','Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(7,'Integer ac leo','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(8,'Quisque id justo sit amet','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(9,'Phasellus in felis','In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(10,'Nullam sit amet turpis','Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(11,'Aenean fermentum','Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(12,'In sagittis dui vel nisl','Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(13,'Donec diam neque, vestibulum','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(14,'Cras mi pede, malesuada in ','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(15,'Integer tincidunt ante vel ','Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(16,'Cum sociis natoque penatibus','Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(17,'Curabitur at ipsum ac','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(18,'Aliquam quis turpis eget','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(19,'Praesent blandit. Nam nulla','Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(20,'Duis aliquam convallis nunc','Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');

/*Table structure for table `usertable` */

DROP TABLE IF EXISTS `usertable`;

CREATE TABLE `usertable` (
  `favourite` varchar(100) DEFAULT NULL,
  `travel` varchar(100) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `title` char(10) DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_Email` varchar(100) DEFAULT NULL,
  `user_Confirm` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `usertable` */

insert  into `usertable`(`favourite`,`travel`,`country`,`city`,`title`,`occupation`,`birthday`,`name`,`user_name`,`user_password`,`user_Email`,`user_Confirm`,`user_id`) values 
(NULL,NULL,NULL,NULL,'Mr','techSupport','1987-10-15','sara','saran','kasi','kasi@gmail.com','password',1),
('I have given varchar 100 for the te colmn hope it works\nabs jkasdcakjsdjasfcnsdvcskjdnvcsndvcsndjvn ','I have given varchar 100 for this column\nabs jkasdcakjsdjasfcnsdvcskjdnvcsndvcsndjvn jnfdjandsfjajnf','India','Mummbai','Miss','techSupport','1987-10-15','Kasigopa','kaasi@123','kasi','kasi.hot@gmail.com','kasi',3),
(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ponnu','password','poonu@gmail.com','password',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
