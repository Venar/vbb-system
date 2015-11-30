-- Venar's Bulletin System
-- Author: John J. Koniges (Venar) john@koniges.net
-- License: MIT
-- Please contribute at github.com/venar/vbb-system

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE `board` (
  `board_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `open_read` tinyint(1) NOT NULL DEFAULT '0',
  `open_write` tinyint(1) NOT NULL DEFAULT '0',
  `admin_read` tinyint(1) NOT NULL DEFAULT '0',
  `admin_write` tinyint(1) NOT NULL DEFAULT '0',
  `admin_manage` tinyint(1) NOT NULL DEFAULT '0',
  `anon_post` tinyint(1) NOT NULL DEFAULT '0',
  `cost_join` int(11) NOT NULL DEFAULT '0',
  `cost_read` int(11) NOT NULL DEFAULT '0',
  `cost_post` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `ic_board` tinyint(1) NOT NULL DEFAULT '0',
  `show_masterorg` tinyint(1) NOT NULL DEFAULT '1',
  `show_org` tinyint(1) NOT NULL DEFAULT '0',
  `show_from` tinyint(1) NOT NULL DEFAULT '1',
  `show_position` tinyint(1) NOT NULL DEFAULT '0',
  `show_rank` tinyint(1) NOT NULL DEFAULT '0',
  `show_stardate` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`board_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `joined`
--

DROP TABLE IF EXISTS `joined`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joined` (
  `joined_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  `newpost_exempt` tinyint(1) DEFAULT '0',
  `skip_time` varchar(10) DEFAULT '1',
  PRIMARY KEY (`joined_id`)
) ENGINE=MyISAM AUTO_INCREMENT=185 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(32) DEFAULT NULL,
  `org_dbref` varchar(10) DEFAULT NULL,
  `org_objid` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org_permissions`
--

DROP TABLE IF EXISTS `org_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_permissions` (
  `permission_key` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  `board_write` tinyint(1) DEFAULT '0',
  `board_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`permission_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_objid` varchar(20) DEFAULT NULL,
  `player_name` varchar(20) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `org_name` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `last_view` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_permissions`
--

DROP TABLE IF EXISTS `player_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_permissions` (
  `permission_key` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  `board_write` tinyint(1) DEFAULT '0',
  `board_read` tinyint(1) DEFAULT '0',
  `manager` tinyint(1) DEFAULT '0',
  `ban_write` tinyint(1) DEFAULT '0',
  `ban_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`permission_key`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) DEFAULT NULL,
  `player_rankname` varchar(32) DEFAULT NULL,
  `player_name` varchar(32) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `timeposted` varchar(10) DEFAULT NULL,
  `org_name` varchar(32) DEFAULT NULL,
  `subject` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post_read`
--

DROP TABLE IF EXISTS `post_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_read` (
  `read_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `timeread` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`read_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2168 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post_text`
--

DROP TABLE IF EXISTS `post_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_text` (
  `post_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `post_text` text,
  PRIMARY KEY (`post_text_id`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
