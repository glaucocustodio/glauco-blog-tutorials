/*
SQLyog Ultimate v9.02 
MySQL - 5.5.28-0ubuntu0.12.04.3 : Database - first_django_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`first_django_project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `first_django_project`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add migration history',7,'add_migrationhistory'),(20,'Can change migration history',7,'change_migrationhistory'),(21,'Can delete migration history',7,'delete_migrationhistory'),(22,'Can add notícia',8,'add_news'),(23,'Can change notícia',8,'change_news'),(24,'Can delete notícia',8,'delete_news'),(25,'Can add log entry',9,'add_logentry'),(26,'Can change log entry',9,'change_logentry'),(27,'Can delete log entry',9,'delete_logentry');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`username`,`first_name`,`last_name`,`email`,`password`,`is_staff`,`is_active`,`is_superuser`,`last_login`,`date_joined`) values (1,'glauco','','','glauco.custodio@gmail.com','pbkdf2_sha256$10000$Vzws678oDUOq$cnSLazLS92fcVhvOu+kh+ODO4N2MTYDe8XbVWugrLHA=',1,1,1,'2013-01-10 20:32:46','2013-01-05 13:10:57');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`user_id`,`content_type_id`,`object_id`,`object_repr`,`action_flag`,`change_message`) values (1,'2013-01-08 18:40:50',1,8,'1','Lorem Ipsum',1,''),(2,'2013-01-08 18:41:02',1,8,'2','Quisque eget semper lorem. Nulla accumsan pellentesque massa vel',1,''),(3,'2013-01-08 18:41:15',1,8,'3','Nam enim leo',1,''),(4,'2013-01-08 18:41:50',1,8,'4','Vestibulum neque risus, placerat',1,''),(5,'2013-01-08 18:42:09',1,8,'5','Duis sit amet eros vel ligula',1,'');

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`name`,`app_label`,`model`) values (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'migration history','south','migrationhistory'),(8,'notícia','news','news'),(9,'log entry','admin','logentry');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('10ea27b9802860d98d63ee8af04b3951','NDFiYmY4Yzk4NzQzYjI1MDY1ZDBmOGE5ZmIxZWQyNmRjZTU4Zjk0OTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-01-24 20:33:04');

/*Table structure for table `django_site` */

DROP TABLE IF EXISTS `django_site`;

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `django_site` */

insert  into `django_site`(`id`,`domain`,`name`) values (1,'example.com','example.com');

/*Table structure for table `news_news` */

DROP TABLE IF EXISTS `news_news`;

CREATE TABLE `news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `publication_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `news_news` */

insert  into `news_news`(`id`,`title`,`publication_date`,`content`) values (1,'Lorem Ipsum','2013-01-08 18:40:50','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget semper lorem. Nulla accumsan pellentesque massa vel lobortis. Vestibulum vehicula tortor quis erat tristique placerat. Sed ac nisl non est vehicula tincidunt. Duis faucibus mauris vitae libero venenatis in sagittis libero condimentum. Pellentesque sapien nibh, venenatis quis ultrices in, eleifend ut diam. Donec id nunc non leo mollis vestibulum. Nam enim leo, pellentesque eget aliquet eget, condimentum in mauris. Mauris in odio sit amet arcu laoreet volutpat ut nec leo. Donec nisi metus, pharetra a aliquet in, pretium vitae justo. In porta condimentum diam, ac consectetur turpis sagittis vitae. Integer et viverra massa. Praesent quis nulla elit, sit amet consectetur quam. Praesent euismod commodo dui, a scelerisque erat fermentum non. Vestibulum eleifend dignissim gravida. '),(2,'Quisque eget semper lorem. Nulla accumsan pellentesque massa vel','2013-01-08 18:41:02','Quisque eget semper lorem. Nulla accumsan pellentesque massa vel lobortis. Vestibulum vehicula tortor quis erat tristique placerat. Sed ac nisl non est vehicula tincidunt. Duis faucibus mauris vitae libero venenatis in sagittis libero condimentum. Pellentesque sapien nibh, venenatis quis ultrices in, eleifend ut diam. Donec id nunc non leo mollis vestibulum. Nam enim leo, pellentesque eget aliquet eget, condimentum in mauris. Mauris in odio sit amet arcu laoreet volutpat ut nec leo. Donec nisi metus, pharetra a aliquet in, pretium vitae justo. In porta condimentum diam, ac consectetur turpis sagittis vitae. Integer et viverra massa. Praesent quis nulla elit, sit amet consectetur quam. Praesent euismod commodo dui, a scelerisque erat fermentum non. Vestibulum eleifend dignissim gravida. '),(3,'Nam enim leo','2013-01-08 18:41:15','Nam enim leo, pellentesque eget aliquet eget, condimentum in mauris. Mauris in odio sit amet arcu laoreet volutpat ut nec leo. Donec nisi metus, pharetra a aliquet in, pretium vitae justo. In porta condimentum diam, ac consectetur turpis sagittis vitae. Integer et viverra massa. Praesent quis nulla elit, sit amet consectetur quam. Praesent euismod commodo dui, a scelerisque erat fermentum non. Vestibulum eleifend dignissim gravida. '),(4,'Vestibulum neque risus, placerat','2013-01-08 18:41:50','Vestibulum neque risus, placerat ac elementum at, fringilla ut erat. Nunc ac metus non massa ultrices eleifend. Maecenas eget magna vel quam mattis scelerisque ac vel justo. Duis vehicula mauris at turpis euismod tincidunt. Duis tincidunt, lectus eget pharetra rhoncus, sem mi laoreet eros, sit amet mattis nibh quam et sapien. Ut ipsum felis, varius sed convallis et, euismod non lacus. Ut ut ipsum nec erat commodo placerat nec quis orci. Sed sem eros, porta vitae tincidunt quis, suscipit ac nunc. Maecenas molestie sodales purus, posuere porta metus tincidunt gravida. Nullam consectetur volutpat nibh sed blandit. Aliquam quis quam ut dolor cursus lacinia. Cras ultricies, nibh vitae gravida blandit, lorem libero molestie ante, eget sollicitudin elit quam id libero. Donec eu ante in turpis condimentum ultricies. Donec volutpat tincidunt dui, eget consequat ipsum dapibus non. '),(5,'Duis sit amet eros vel ligula','2013-01-08 18:42:09','Duis sit amet eros vel ligula aliquet vehicula. Duis porttitor erat in nunc suscipit at volutpat erat aliquam. Vestibulum ut nibh ut mauris tempus scelerisque quis ac elit. Fusce scelerisque dapibus enim, vitae adipiscing risus tempor ac. Duis enim nunc, convallis et pretium sed, laoreet eget nisl. Quisque fringilla diam vitae augue vestibulum ac faucibus ante lacinia. Aenean eget mi ac sapien imperdiet euismod. Proin et elit sit amet arcu fermentum ornare sed id dui. Ut tortor lorem, lacinia sit amet lobortis ac, blandit a nulla. ');

/*Table structure for table `south_migrationhistory` */

DROP TABLE IF EXISTS `south_migrationhistory`;

CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `south_migrationhistory` */

insert  into `south_migrationhistory`(`id`,`app_name`,`migration`,`applied`) values (1,'news','0001_initial','2013-01-05 15:16:30');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
