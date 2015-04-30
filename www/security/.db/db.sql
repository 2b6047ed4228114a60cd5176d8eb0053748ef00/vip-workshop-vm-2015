-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: security
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `evil_commentmeta`
--

DROP TABLE IF EXISTS `evil_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_commentmeta`
--

LOCK TABLES `evil_commentmeta` WRITE;
/*!40000 ALTER TABLE `evil_commentmeta` DISABLE KEYS */;
INSERT INTO `evil_commentmeta` VALUES (6,2,'_test_type','attack'),(7,4,'_test_type','defend'),(8,3,'_test_type','attack'),(9,4,'_next_post','2-xss'),(10,5,'_test_type','defend'),(14,5,'_next_post','8-sql-injection'),(15,8,'_test_type','attack'),(16,9,'_test_type','defend'),(17,9,'_next_post','4-xss-css'),(18,10,'_test_type','attack'),(19,11,'_test_type','defend'),(20,11,'_next_post','5-csrf-again'),(21,12,'_test_type','attack'),(22,13,'_test_type','defend'),(23,13,'_next_post','9-create-function'),(24,14,'_test_type','attack'),(25,15,'_test_type','defend'),(26,15,'_next_post','3-xss-js'),(27,16,'_test_type','attack'),(28,17,'_test_type','defend'),(29,17,'_next_post','13-logic-errors'),(30,18,'_test_type','attack'),(31,19,'_test_type','defend'),(32,19,'_next_post','10-preg-replace'),(33,20,'_test_type','attack'),(34,21,'_test_type','defend'),(35,21,'_next_post','12-xxe'),(36,22,'_test_type','attack'),(37,23,'_test_type','defend'),(38,23,'_next_post','7-clickjacking'),(39,24,'_test_type','attack'),(40,25,'_test_type','defend'),(41,25,'_next_post','14-md5'),(42,26,'_test_type','attack'),(43,27,'_test_type','defend'),(44,27,'_next_post','11-os-injection'),(45,28,'_test_type','attack'),(46,29,'_test_type','defend'),(47,29,'_next_post','15-configuration'),(48,30,'_test_type','attack'),(49,31,'_test_type','defend'),(50,31,'_next_post','16-the-end'),(51,32,'_test_type','attack'),(52,33,'_test_type','defend'),(53,33,'_next_post','1-csrf');
/*!40000 ALTER TABLE `evil_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_comments`
--

DROP TABLE IF EXISTS `evil_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_comments`
--

LOCK TABLES `evil_comments` WRITE;
/*!40000 ALTER TABLE `evil_comments` DISABLE KEYS */;
INSERT INTO `evil_comments` VALUES (2,8,'admin','evil@example.borscht','','127.0.0.1','2014-03-20 03:55:22','2014-03-20 03:55:22','Mwahaha! The attack works.\r\n\r\nNow let\'s [url post=1-csrf page=3]fix it[/url].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(3,29,'admin','evil@example.borscht','','127.0.0.1','2014-03-20 22:21:41','2014-03-20 22:21:41','Such exploit.\nVery Mwahaha.\n\nOn to [url post=2-xss page=3]the fix[/url].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(4,8,'admin','evil@example.borscht','','127.0.0.1','2014-03-21 04:33:04','2014-03-21 04:33:04','Huzzah!\n\nPing your instructors and brag that you’re done :-)\n\nThen we\'ll move on to [next]the next vulnerability[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(5,29,'admin','evil@example.borscht','','127.0.0.1','2014-03-21 04:49:43','2014-03-21 04:49:43','Beautimous.\n\nWhen everyone\'s ready, we\'ll skip ahead to [next]a different kind of injection attack[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(8,68,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 03:42:09','2014-03-28 03:42:09','Hack the planet!\n\n[url post=3-xss-js page=3]Save the planet[/url]',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(9,68,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 03:42:12','2014-03-28 03:42:12','Yay! The world is safe again :)\n\n[next]Or is it...[/next]',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(10,79,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 03:52:31','2014-03-28 03:52:31','All your blog are belong to us.\n\n[url post=4-xss-css page=3]For great justice[/url]',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(11,79,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 03:52:33','2014-03-28 03:52:33','Rock on.\n\nNow to visit [next]an old friend...[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(12,61,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 04:04:53','2014-03-28 04:04:53','You\'re getting good at getting evil.\n\n[url post=5-csrf-again page=3]Back to defense[/url].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(13,61,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 04:04:55','2014-03-28 04:04:55','Wasn\'t that fun? :)\n\nYou\'re going to really like the [next]next one[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(14,102,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 04:15:51','2014-03-28 04:15:51','That\'s some fancy clicking.\n\nLet\'s see how to [url post=7-clickjacking page=3]fix it[/url].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(15,102,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 04:15:54','2014-03-28 04:15:54','Simple :)\n\nNo more pretty pictures [next]back to the grind[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(16,116,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 04:23:26','2014-03-28 04:23:26','Not my precious email address!\n\nCan you [url post=8-sql-injection page=3]fix it please[/url]?',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(17,116,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 04:23:28','2014-03-28 04:23:28','My email is safe from spammers once again, thanks to you.\n\n[next]On to more nefarious attacks[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(18,111,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 04:33:14','2014-03-28 04:33:14','Mmmmm... Salty...\n\n[url post=9-create-function page=3]Fixing it[/url] is pretty straightforward.',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(19,111,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 04:33:17','2014-03-28 04:33:17','Sweet :)\n\nReady for more [next]salty goodness[/next]?',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(20,109,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 05:30:21','2014-03-28 05:30:21','Yarrr Matey! ... I don\'t know? Salt? Hacking? There\'s got to be a pirate joke in there somewhere.\n\n... Let\'s just pretend that didn\'t happen and [url post=10-preg-replace page=3]move on[/url].\n\nYarr.',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(21,109,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 05:30:23','2014-03-28 05:30:23','I guess it\'s good for us that fixing these bugs is simpler than exploiting them.\n\nBut exploiting them is so much fun! Let\'s [next]do it again[/next]!',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(22,118,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 05:38:54','2014-03-28 05:38:54','Too Many Secrets.\n\n[url post=11-os-injection page=3]Be a beacon[/url].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(23,118,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 05:38:57','2014-03-28 05:38:57','Nice work :) You deserve a trip to Tahiti.\r\n\r\nSadly, all you get is [next]another bug[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(24,120,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 05:46:26','2014-03-28 05:46:26','Indeed.  XML is Awesome.\n\nThankfully, unawesomifying it is [url post=12-xxe page=3]pretty simple[/url].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(25,120,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 05:46:28','2014-03-28 05:46:28','See? Simple.\n\nSometimes it\'s the [next]simple things[/next] that get us though.',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(26,220,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 06:49:08','2014-03-28 06:49:08','Logic Errors cause bugs.  So if there\'s a bug, there must be a logic error.\n\nThere are 100% fewer fallacies of the converse on [url post=13-logic-errors page=3]the next page[/url].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(27,220,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 06:49:11','2014-03-28 06:49:11','goto success!\r\n\r\nThis was pretty nit-picky.  The next one is [next]pretty not[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(28,228,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 06:57:51','2014-03-28 06:57:51','Holy Length Extension Attack, Batman!\n\nCongratulations :)\n\nIt\'ll be a let down that [url post=14-md5 page=3]the fix[/url] is so easy.',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(29,228,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 06:57:53','2014-03-28 06:57:53','HMACs Make Attackers Contrarian.\n\nTake that, attackers.\n\n[next]The end is near...[/next]',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(30,241,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 07:20:48','2014-03-28 07:20:48','Nyanyanyanyanyanyanya!\n\n[url post=15-configuration page=3]CLICK FASTER[/url].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(31,241,'admin','evil@example.borscht','','127.0.0.1','2014-03-28 07:20:51','2014-03-28 07:20:51','Ah the sweet smell of success.\n\n[next]Bask in glory[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36','',0,1),(32,104,'admin','evil@example.borscht','','10.86.73.1','2015-03-18 01:09:41','2015-03-18 01:09:41','Yay! You\'ve exploited your first vulnerability :)\n\n[url post=0-open-redirect page=3]Now let\'s fix it[/url]',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36','',0,1),(33,104,'admin','evil@example.borscht','','10.86.73.1','2015-03-18 01:10:42','2015-03-18 01:10:42','Nice!\r\n\r\nThat\'s how this will work for all the exercises: Attack, then Defend.\r\n\r\nOn to the [next]next bug[/next].',0,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36','',0,1);
/*!40000 ALTER TABLE `evil_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_links`
--

DROP TABLE IF EXISTS `evil_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_links`
--

LOCK TABLES `evil_links` WRITE;
/*!40000 ALTER TABLE `evil_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `evil_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_options`
--

DROP TABLE IF EXISTS `evil_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_options`
--

LOCK TABLES `evil_options` WRITE;
/*!40000 ALTER TABLE `evil_options` DISABLE KEYS */;
INSERT INTO `evil_options` VALUES (1,'siteurl','http://vip-workshop.dev/security/wordpress','yes'),(2,'blogname','Security','yes'),(3,'blogdescription','Just another WordPress site','yes'),(4,'users_can_register','0','yes'),(5,'admin_email','evil@example.borscht','yes'),(6,'start_of_week','1','yes'),(7,'use_balanceTags','0','yes'),(8,'use_smilies','1','yes'),(9,'require_name_email','1','yes'),(10,'comments_notify','','yes'),(11,'posts_per_rss','10','yes'),(12,'rss_use_excerpt','0','yes'),(13,'mailserver_url','mail.example.com','yes'),(14,'mailserver_login','login@example.com','yes'),(15,'mailserver_pass','password','yes'),(16,'mailserver_port','110','yes'),(17,'default_category','1','yes'),(18,'default_comment_status','closed','yes'),(19,'default_ping_status','closed','yes'),(20,'default_pingback_flag','','yes'),(21,'posts_per_page','1','yes'),(22,'date_format','F j, Y','yes'),(23,'time_format','g:i a','yes'),(24,'links_updated_date_format','F j, Y g:i a','yes'),(28,'comment_moderation','','yes'),(29,'moderation_notify','','yes'),(30,'permalink_structure','/%postname%/','yes'),(31,'gzipcompression','0','yes'),(32,'hack_file','0','yes'),(33,'blog_charset','UTF-8','yes'),(34,'moderation_keys','','no'),(35,'active_plugins','a:1:{i:0;s:44:\"background-color-picker/background-color.php\";}','yes'),(36,'home','http://vip-workshop.dev/security','yes'),(37,'category_base','','yes'),(38,'ping_sites','http://rpc.pingomatic.com/','yes'),(39,'advanced_edit','0','yes'),(40,'comment_max_links','2','yes'),(41,'gmt_offset','0','yes'),(42,'default_email_category','1','yes'),(43,'recently_edited','','no'),(44,'template','twentyfourteen','yes'),(45,'stylesheet','evil','yes'),(46,'comment_whitelist','','yes'),(47,'blacklist_keys','','no'),(48,'comment_registration','1','yes'),(49,'html_type','text/html','yes'),(50,'use_trackback','0','yes'),(51,'default_role','subscriber','yes'),(52,'db_version','31532','yes'),(53,'uploads_use_yearmonth_folders','1','yes'),(54,'upload_path','','yes'),(55,'blog_public','0','yes'),(56,'default_link_category','2','yes'),(57,'show_on_front','page','yes'),(58,'tag_base','','yes'),(59,'show_avatars','','yes'),(60,'avatar_rating','G','yes'),(61,'upload_url_path','','yes'),(62,'thumbnail_size_w','150','yes'),(63,'thumbnail_size_h','150','yes'),(64,'thumbnail_crop','1','yes'),(65,'medium_size_w','300','yes'),(66,'medium_size_h','300','yes'),(67,'avatar_default','mystery','yes'),(68,'large_size_w','1024','yes'),(69,'large_size_h','1024','yes'),(70,'image_default_link_type','file','yes'),(71,'image_default_size','','yes'),(72,'image_default_align','','yes'),(73,'close_comments_for_old_posts','1','yes'),(74,'close_comments_days_old','14','yes'),(75,'thread_comments','1','yes'),(76,'thread_comments_depth','5','yes'),(77,'page_comments','','yes'),(78,'comments_per_page','50','yes'),(79,'default_comments_page','newest','yes'),(80,'comment_order','asc','yes'),(81,'sticky_posts','a:0:{}','yes'),(82,'widget_categories','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:0:{}}','yes'),(83,'widget_text','a:2:{i:2;a:3:{s:5:\"title\";s:8:\"Contents\";s:4:\"text\";s:733:\"[url post=0-open-redirect]0: Open Redirect[/url]\r\n[url post=1-csrf]1: CSRF[/url]\r\n[url post=2-xss]2: XSS[/url]\r\n[url post=3-xss-js]3: XSS in JavaScript[/url]\r\n[url post=4-xss-css]4: XSS Everywhere :)[/url]\r\n[url post=5-csrf-again]5: CSRF Again[/url]\r\n[url post=7-clickjacking]7: Clickjacking[/url]\r\n[url post=8-sql-injection]8: SQL Injection[/url]\r\n[url post=9-create-function]9: Code Execution[/url]\r\n[url post=10-preg-replace]10: More Code Execution[/url]\r\n[url post=11-os-injection]11: OS Injection[/url]\r\n[url post=12-xxe]12: XXE[/url]\r\n[url post=13-logic-errors]13: Logic Errors[/url]\r\n[url post=14-md5]14: md5() Is Not a Good MAC[/url]\r\n[url post=15-configuration]15: Configuration[/url]\r\n[url post=16-the-end]16: The End[/url]\";s:6:\"filter\";b:1;}s:12:\"_multiwidget\";i:1;}','yes'),(84,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(85,'uninstall_plugins','a:0:{}','no'),(86,'timezone_string','','yes'),(87,'page_for_posts','0','yes'),(88,'page_on_front','346','yes'),(89,'default_post_format','0','yes'),(90,'link_manager_enabled','0','yes'),(91,'initial_db_version','26691','yes'),(92,'evil_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'widget_search','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:0:{}}','yes'),(94,'widget_recent-posts','a:3:{i:2;a:3:{s:5:\"title\";s:15:\"Vulnerabilities\";s:6:\"number\";i:100;s:9:\"show_date\";b:0;}i:3;a:3:{s:5:\"title\";s:16:\"Recent Exercises\";s:6:\"number\";i:100;s:9:\"show_date\";b:0;}s:12:\"_multiwidget\";i:1;}','yes'),(95,'widget_recent-comments','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:0:{}}','yes'),(96,'widget_archives','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:0:{}}','yes'),(97,'widget_meta','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:0:{}}','yes'),(98,'sidebars_widgets','a:5:{s:19:\"wp_inactive_widgets\";a:1:{i:0;s:14:\"recent-posts-2\";}s:9:\"sidebar-1\";a:2:{i:0;s:14:\"recent-posts-3\";i:1;s:6:\"text-2\";}s:9:\"sidebar-2\";a:1:{i:0;s:29:\"vip_background_color_picker-2\";}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}','yes'),(99,'cron','a:5:{i:1429946280;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1429954734;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1429997937;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1430000771;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(126,'category_children','a:0:{}','yes'),(127,'recently_activated','a:0:{}','yes'),(129,'theme_mods_twentyfourteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1395265872;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(130,'current_theme','EVIL, Inc.','yes'),(131,'theme_mods_evil','a:8:{i:0;b:0;s:16:\"header_textcolor\";s:3:\"fff\";s:16:\"background_color\";s:6:\"f5f5f5\";s:16:\"background_image\";s:0:\"\";s:17:\"background_repeat\";s:6:\"repeat\";s:21:\"background_position_x\";s:4:\"left\";s:21:\"background_attachment\";s:5:\"fixed\";s:23:\"featured_content_layout\";s:4:\"grid\";}','yes'),(132,'theme_switched','','yes'),(147,'_transient_random_seed','8178f4cbb940b39c9d32b65e1f228213','yes'),(379,'widget_vip_background_color_picker','a:3:{i:1;a:0:{}i:2;a:1:{s:5:\"title\";s:10:\"Background\";}s:12:\"_multiwidget\";i:1;}','yes'),(1519,'db_upgraded','','yes'),(1545,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1429914775;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}','yes'),(1546,'include-wp_footer','yes','yes'),(1610,'widget_pages','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(1611,'widget_calendar','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(1612,'widget_tag_cloud','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(1613,'widget_nav_menu','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(1614,'widget_widget_twentyfourteen_ephemera','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(1685,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:19:\"you@example.borscht\";s:7:\"version\";s:5:\"4.1.2\";s:9:\"timestamp\";i:1429635465;}','yes'),(1698,'WPLANG','','yes'),(1704,'_transient_timeout_plugin_slugs','1429921031','no'),(1705,'_transient_plugin_slugs','a:1:{i:0;s:44:\"background-color-picker/background-color.php\";}','no'),(2011,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1429914775;s:7:\"checked\";a:2:{s:4:\"evil\";s:0:\"\";s:14:\"twentyfourteen\";s:3:\"1.4\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','yes'),(2012,'_site_transient_timeout_browser_7a6cce0b740e13f09d82507ff53d91cc','1430439212','yes'),(2013,'_site_transient_browser_7a6cce0b740e13f09d82507ff53d91cc','a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"42.0.2311.90\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}','yes'),(2052,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.2.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.2-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.2\";s:7:\"version\";s:3:\"4.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1429920262;s:15:\"version_checked\";s:3:\"4.2\";s:12:\"translations\";a:0:{}}','yes'),(2053,'can_compress_scripts','1','yes'),(2066,'rewrite_rules','a:77:{s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:43:\"html5presentation/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:53:\"html5presentation/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:73:\"html5presentation/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:68:\"html5presentation/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:68:\"html5presentation/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:36:\"html5presentation/(.+?)/trackback/?$\";s:63:\"index.php?post_type=html5presentation&pagename=$matches[1]&tb=1\";s:44:\"html5presentation/(.+?)/page/?([0-9]{1,})/?$\";s:76:\"index.php?post_type=html5presentation&pagename=$matches[1]&paged=$matches[2]\";s:51:\"html5presentation/(.+?)/comment-page-([0-9]{1,})/?$\";s:76:\"index.php?post_type=html5presentation&pagename=$matches[1]&cpage=$matches[2]\";s:36:\"html5presentation/(.+?)(/[0-9]+)?/?$\";s:75:\"index.php?post_type=html5presentation&pagename=$matches[1]&page=$matches[2]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:40:\"index.php?&page_id=346&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";}','yes');
/*!40000 ALTER TABLE `evil_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_postmeta`
--

DROP TABLE IF EXISTS `evil_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_postmeta`
--

LOCK TABLES `evil_postmeta` WRITE;
/*!40000 ALTER TABLE `evil_postmeta` DISABLE KEYS */;
INSERT INTO `evil_postmeta` VALUES (7,6,'_edit_last','1'),(8,6,'_edit_lock','1426669104:1'),(10,8,'_edit_last','1'),(11,8,'_edit_lock','1426669121:1'),(31,29,'_edit_last','1'),(32,29,'_edit_lock','1426669135:1'),(96,6,'_wp_old_slug','evil-inc-and-you'),(99,61,'_edit_last','1'),(100,61,'_edit_lock','1426670626:1'),(110,68,'_edit_last','1'),(111,68,'_edit_lock','1426674765:1'),(121,79,'_edit_last','1'),(122,79,'_edit_lock','1429932660:1'),(147,29,'_wp_old_slug','3-xss'),(150,61,'_wp_old_slug','2-csrf-again'),(152,102,'_edit_last','1'),(153,102,'_edit_lock','1426672527:1'),(155,104,'_edit_last','1'),(156,104,'_edit_lock','1426669114:1'),(161,1,'hello','hola'),(162,109,'_edit_last','1'),(163,109,'_edit_lock','1426670693:1'),(165,111,'_edit_last','1'),(166,111,'_edit_lock','1426670690:1'),(169,109,'_wp_old_slug','8-preg-replace'),(173,116,'_edit_last','1'),(174,116,'_edit_lock','1429925129:1'),(177,118,'_edit_last','1'),(178,118,'_edit_lock','1426669201:1'),(180,120,'_edit_last','1'),(181,120,'_edit_lock','1429934920:1'),(184,102,'_wp_old_slug','6-clickjacking'),(186,104,'_wp_old_slug','7-open-redirect'),(267,111,'_wp_old_slug','10-create-function'),(269,109,'_wp_old_slug','9-preg-replace'),(288,220,'_edit_last','1'),(289,220,'_edit_lock','1426669227:1'),(292,220,'_wp_old_slug','13-logical-failures'),(294,220,'_wp_old_slug','13-logic'),(296,220,'_post_restored_from','a:3:{s:20:\"restored_revision_id\";i:223;s:16:\"restored_by_user\";i:1;s:13:\"restored_time\";i:1395808774;}'),(301,228,'_edit_last','1'),(302,228,'_edit_lock','1429935322:1'),(319,241,'_edit_last','1'),(320,241,'_edit_lock','1426670731:1'),(323,241,'_wp_old_slug','15-the-end'),(327,247,'_edit_last','1'),(328,247,'_edit_lock','1426670735:1'),(341,104,'_wp_old_slug','6-open-redirect'),(374,29,'_post_restored_from','a:3:{s:20:\"restored_revision_id\";i:253;s:16:\"restored_by_user\";i:1;s:13:\"restored_time\";i:1395977623;}'),(410,120,'_post_restored_from','a:3:{s:20:\"restored_revision_id\";i:277;s:16:\"restored_by_user\";i:1;s:13:\"restored_time\";i:1395985908;}'),(433,102,'_post_restored_from','a:3:{s:20:\"restored_revision_id\";i:262;s:16:\"restored_by_user\";i:1;s:13:\"restored_time\";i:1395993626;}'),(434,116,'_post_restored_from','a:3:{s:20:\"restored_revision_id\";i:282;s:16:\"restored_by_user\";i:1;s:13:\"restored_time\";i:1395993727;}'),(435,109,'_post_restored_from','a:3:{s:20:\"restored_revision_id\";i:205;s:16:\"restored_by_user\";i:1;s:13:\"restored_time\";i:1395994060;}'),(483,328,'_edit_last','1'),(484,328,'_edit_lock','1403051046:1'),(485,328,'html5slide_type','title_slide'),(486,329,'_edit_last','1'),(487,329,'_edit_lock','1426672266:1'),(488,329,'_wp_page_template','default'),(489,329,'associated_presentation_ID','328'),(490,333,'_edit_last','1'),(491,333,'_edit_lock','1403051081:1'),(492,333,'html5slide_type','title_slide'),(493,334,'_edit_last','1'),(494,334,'_edit_lock','1403051215:1'),(495,334,'html5slide_class','build'),(496,335,'_edit_last','1'),(497,335,'html5slide_type','segue_slide'),(499,335,'_edit_lock','1403051321:1'),(500,336,'_edit_last','1'),(501,336,'_edit_lock','1403051369:1'),(502,336,'html5slide_type','title_slide'),(503,337,'_edit_last','1'),(504,337,'_edit_lock','1403051409:1'),(505,337,'html5slide_type','title_slide'),(506,338,'_edit_last','1'),(507,338,'_edit_lock','1403051445:1'),(508,338,'html5slide_type','title_slide'),(509,339,'_edit_last','1'),(510,339,'_edit_lock','1403111657:1'),(511,339,'html5slide_type','title_slide'),(512,340,'_edit_last','1'),(513,340,'_edit_lock','1403111774:1'),(514,340,'html5slide_type','title_slide'),(515,341,'_edit_last','1'),(516,341,'_edit_lock','1403111827:1'),(517,341,'html5slide_type','title_slide'),(518,342,'_edit_last','1'),(519,342,'_edit_lock','1403112096:1'),(520,342,'html5slide_type','title_slide'),(521,343,'_edit_last','1'),(522,343,'_edit_lock','1403112301:1'),(523,343,'html5slide_type','title_slide'),(524,344,'_edit_last','1'),(525,344,'_edit_lock','1403114676:1'),(526,344,'html5slide_type','title_slide'),(527,345,'_edit_last','1'),(528,345,'_edit_lock','1403115751:1'),(529,345,'html5slide_type','title_slide'),(530,346,'_edit_last','1'),(531,346,'_edit_lock','1426634956:1'),(532,346,'_wp_page_template','default'),(534,348,'_edit_last','1'),(535,348,'_edit_lock','1403116009:1'),(536,348,'html5slide_type','title_slide'),(540,104,'_wp_trash_meta_comments_status','a:2:{i:6;s:1:\"0\";i:7;s:1:\"1\";}'),(593,29,'_oembed_890764cbcd1191737dd270a1919a96ff','{{unknown}}'),(663,432,'_wp_attached_file','2015/03/Clickjacking-1.png'),(664,432,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:627;s:6:\"height\";i:337;s:4:\"file\";s:26:\"2015/03/Clickjacking-1.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"Clickjacking-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:26:\"Clickjacking-1-300x161.png\";s:5:\"width\";i:300;s:6:\"height\";i:161;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}'),(665,433,'_wp_attached_file','2015/03/Clickjacking-2.png'),(666,433,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:739;s:6:\"height\";i:466;s:4:\"file\";s:26:\"2015/03/Clickjacking-2.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"Clickjacking-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:26:\"Clickjacking-2-300x189.png\";s:5:\"width\";i:300;s:6:\"height\";i:189;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:26:\"Clickjacking-2-672x372.png\";s:5:\"width\";i:672;s:6:\"height\";i:372;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
/*!40000 ALTER TABLE `evil_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_term_relationships`
--

DROP TABLE IF EXISTS `evil_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_term_relationships`
--

LOCK TABLES `evil_term_relationships` WRITE;
/*!40000 ALTER TABLE `evil_term_relationships` DISABLE KEYS */;
INSERT INTO `evil_term_relationships` VALUES (6,1,0),(8,1,0),(29,1,0),(61,1,0),(68,1,0),(79,1,0),(102,1,0),(104,1,0),(109,1,0),(111,1,0),(116,1,0),(118,1,0),(120,1,0),(220,1,0),(228,1,0),(241,1,0),(247,1,0);
/*!40000 ALTER TABLE `evil_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_term_taxonomy`
--

DROP TABLE IF EXISTS `evil_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_term_taxonomy`
--

LOCK TABLES `evil_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `evil_term_taxonomy` DISABLE KEYS */;
INSERT INTO `evil_term_taxonomy` VALUES (1,1,'category','',0,1);
/*!40000 ALTER TABLE `evil_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_terms`
--

DROP TABLE IF EXISTS `evil_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_terms`
--

LOCK TABLES `evil_terms` WRITE;
/*!40000 ALTER TABLE `evil_terms` DISABLE KEYS */;
INSERT INTO `evil_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `evil_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_usermeta`
--

DROP TABLE IF EXISTS `evil_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_usermeta`
--

LOCK TABLES `evil_usermeta` WRITE;
/*!40000 ALTER TABLE `evil_usermeta` DISABLE KEYS */;
INSERT INTO `evil_usermeta` VALUES (1,1,'first_name',''),(2,1,'last_name',''),(3,1,'nickname','admin'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','sunrise'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'evil_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'evil_user_level','10'),(12,1,'dismissed_wp_pointers','wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks,wp390_widgets,wp410_dfw'),(13,1,'show_welcome_panel','0'),(14,1,'evil_dashboard_quick_press_last_post_id','437'),(15,1,'closedpostboxes_dashboard','a:0:{}'),(16,1,'metaboxhidden_dashboard','a:2:{i:0;s:21:\"dashboard_quick_press\";i:1;s:17:\"dashboard_primary\";}'),(17,1,'meta-box-order_dashboard','a:4:{s:6:\"normal\";s:18:\"dashboard_activity\";s:4:\"side\";s:59:\"dashboard_quick_press,dashboard_right_now,dashboard_primary\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),(18,1,'evil_user-settings','editor=html&libraryContent=browse&imgsize=full&posts_list_mode=list'),(19,1,'evil_user-settings-time','1429935471'),(20,1,'closedpostboxes_post','a:0:{}'),(21,1,'metaboxhidden_post','a:9:{i:0;s:9:\"formatdiv\";i:1;s:11:\"categorydiv\";i:2;s:16:\"tagsdiv-post_tag\";i:3;s:12:\"postimagediv\";i:4;s:11:\"postexcerpt\";i:5;s:13:\"trackbacksdiv\";i:6;s:10:\"postcustom\";i:7;s:7:\"slugdiv\";i:8;s:9:\"authordiv\";}'),(22,1,'session_tokens','a:2:{s:64:\"f434fb68b621b81fd496961487c58d7a5b17be01ddbfbd3e63d57aa94022d7fe\";a:4:{s:10:\"expiration\";i:1430007211;s:2:\"ip\";s:10:\"10.86.73.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36\";s:5:\"login\";i:1429834411;}s:64:\"fddfe15f5ccc4c35f9c188361731eb6b1759633efec58ec414e7c6ad960a8c55\";a:4:{s:10:\"expiration\";i:1430093061;s:2:\"ip\";s:10:\"10.86.73.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36\";s:5:\"login\";i:1429920261;}}');
/*!40000 ALTER TABLE `evil_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_users`
--

DROP TABLE IF EXISTS `evil_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_users`
--

LOCK TABLES `evil_users` WRITE;
/*!40000 ALTER TABLE `evil_users` DISABLE KEYS */;
INSERT INTO `evil_users` VALUES (1,'admin','$P$BD2LBB22XVU.9x5IpKg4g3XTqFEBIY/','admin','evil@example.borscht','','2014-03-19 21:38:52','',0,'admin');
/*!40000 ALTER TABLE `evil_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evil_recent_colors`
--

DROP TABLE IF EXISTS `evil_recent_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evil_recent_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(200) NOT NULL DEFAULT '',
  `reason` varchar(200) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evil_recent_colors`
--

LOCK TABLES `evil_recent_colors` WRITE;
/*!40000 ALTER TABLE `evil_recent_colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `evil_recent_colors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-25  4:39:30
