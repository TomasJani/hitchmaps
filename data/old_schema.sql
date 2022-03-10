/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_points` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `user` int DEFAULT NULL COMMENT 'user id',
                         `type` int DEFAULT NULL,
                         `trip_id` int DEFAULT NULL,
                         `lat` double NOT NULL DEFAULT '0',
                         `lon` double NOT NULL DEFAULT '0',
                         `elevation` int DEFAULT NULL COMMENT 'altitude in meters from the sea level',
                         `date_begin` date DEFAULT NULL,
                         `date_end` date DEFAULT NULL,
                         `rating` int NOT NULL DEFAULT '0',
                         `rating_count` int NOT NULL DEFAULT '0' COMMENT 'count of ratings',
                         `waitingtime` int DEFAULT NULL COMMENT 'in minutes',
                         `waitingtime_count` int NOT NULL DEFAULT '0',
                         `country` varchar(64) NOT NULL DEFAULT '' COMMENT 'ISO-code',
                         `continent` varchar(2) DEFAULT NULL COMMENT 'shortcode',
                         `locality` varchar(128) DEFAULT NULL COMMENT 'city name',
                         `datetime` datetime DEFAULT NULL COMMENT 'markers added before 08/2010 are usually NULL.',
                         `views` int NOT NULL DEFAULT '0' COMMENT 'Number of views',
                         `debug` varchar(11) DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27554 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_points_descriptions` (
                                      `id` int NOT NULL AUTO_INCREMENT,
                                      `datetime` datetime DEFAULT NULL,
                                      `language` varchar(6) NOT NULL DEFAULT 'en_UK',
                                      `fk_point` varchar(11) NOT NULL,
                                      `fk_user` varchar(11) DEFAULT NULL,
                                      `ip` varchar(15) DEFAULT NULL,
                                      `description` text,
                                      PRIMARY KEY (`id`),
                                      KEY `secondary` (`fk_point`,`language`,`datetime`)
) ENGINE=MyISAM AUTO_INCREMENT=36304 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ratings` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `fk_user` int DEFAULT NULL,
                          `fk_point` int NOT NULL DEFAULT '0',
                          `rating` int NOT NULL DEFAULT '0',
                          `datetime` datetime DEFAULT NULL,
                          `ip` varchar(15) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `idx_point` (`fk_point`)
) ENGINE=MyISAM AUTO_INCREMENT=60115 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_comments` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `fk_place` int NOT NULL,
                           `fk_user` int DEFAULT NULL,
                           `nick` varchar(80) DEFAULT NULL,
                           `comment` text NOT NULL,
                           `datetime` datetime NOT NULL,
                           `hidden` tinyint(1) DEFAULT NULL,
                           `ip` varchar(15) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14381 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_waitingtimes` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `fk_user` int DEFAULT NULL,
                               `fk_point` int NOT NULL DEFAULT '0',
                               `waitingtime` int NOT NULL COMMENT 'in minutes',
                               `datetime` datetime DEFAULT NULL,
                               `ip` varchar(15) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `idx_point` (`fk_point`)
) ENGINE=MyISAM AUTO_INCREMENT=32600 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_users_countries` (
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `fk_user` int NOT NULL,
                                  `country` int NOT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_users` (
                        `id` int NOT NULL,
                        `name` varchar(255) NOT NULL,
                        `email` varchar(255) NOT NULL DEFAULT '',
                        `registered` date DEFAULT NULL,
                        `last_seen` datetime DEFAULT NULL,
                        `location` varchar(255) DEFAULT NULL COMMENT 'most likely a city',
                        `country` varchar(2) DEFAULT NULL COMMENT 'country iso code',
                        `language` varchar(11) DEFAULT 'en_UK' COMMENT 'languagecode, eg. de_DE',
                        `private_location` tinyint(1) DEFAULT NULL COMMENT '1=true',
                        `google_latitude` varchar(30) DEFAULT NULL COMMENT 'google latitude ID',
                        `centered_glatitude` tinyint(1) DEFAULT NULL COMMENT 'Is Maps centered to Google Latitude point?',
                        `allow_gravatar` tinyint(1) DEFAULT NULL,
                        `disallow_facebook` tinyint(1) DEFAULT NULL COMMENT '1=disallows fb for user',
                        `map_google` tinyint(1) DEFAULT '1',
                        `map_ovi` tinyint(1) DEFAULT NULL,
                        `map_bing` tinyint(1) DEFAULT NULL,
                        `map_default_layer` varchar(10) DEFAULT NULL,
                        `admin` tinyint(1) DEFAULT NULL COMMENT '1=yes',
                        PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1662 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ptransport` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `city` varchar(80) DEFAULT NULL,
                             `country` varchar(2) DEFAULT NULL,
                             `URL` varchar(255) DEFAULT '',
                             `title` varchar(255) DEFAULT NULL,
                             `type` varchar(255) DEFAULT NULL,
                             `datetime` datetime DEFAULT NULL,
                             `user_id` int DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_trips` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `fk_user` int DEFAULT NULL,
                        `title` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_trips_points` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `fk_place` int DEFAULT NULL COMMENT 'point id from t_points',
                               `fk_user` int DEFAULT NULL COMMENT 'user id',
                               `hidden` tinyint(1) DEFAULT NULL COMMENT 'hidden=1',
                               `fk_trip` int DEFAULT NULL,
                               `lat` double NOT NULL DEFAULT '0',
                               `lon` double NOT NULL DEFAULT '0',
                               `end_trip` tinyint(1) DEFAULT NULL COMMENT 'marks the end of the trip',
                               `elevation` int DEFAULT NULL COMMENT 'altitude in meters from the sea level',
                               `average_elevation` tinyint(1) DEFAULT NULL COMMENT '1=true,NULL=false',
                               `accuracy` int DEFAULT NULL COMMENT 'in meters',
                               `heading` int DEFAULT NULL COMMENT '0-360 deg',
                               `speed` int DEFAULT NULL,
                               `country` varchar(64) NOT NULL DEFAULT '' COMMENT 'ISO-code',
                               `continent` varchar(2) DEFAULT NULL COMMENT 'shortcode',
                               `ocean_or_sea` varchar(255) DEFAULT NULL COMMENT 'name of the sea or ocean VS null',
                               `locality` varchar(128) DEFAULT NULL COMMENT 'city name',
                               `datetime` datetime DEFAULT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1457 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_countries` (
                            `iso` char(2) NOT NULL,
                            `en_UK` varchar(80) NOT NULL COMMENT 'Name in English',
                            `lv_LV` varchar(80) DEFAULT NULL COMMENT 'Latvian',
                            `en@pirate` varchar(80) DEFAULT NULL COMMENT 'In English (pirate)',
                            `de_DE` varchar(80) DEFAULT NULL COMMENT 'German',
                            `fi_FI` varchar(80) DEFAULT NULL COMMENT 'Finnish',
                            `es_ES` varchar(80) DEFAULT NULL COMMENT 'Spanish',
                            `ru_RU` varchar(80) DEFAULT NULL COMMENT 'Russian',
                            `lt_LT` varchar(80) DEFAULT NULL COMMENT 'Lithuanian',
                            `nl_NL` varchar(80) DEFAULT NULL COMMENT 'Dutch',
                            `ro_RO` varchar(80) DEFAULT NULL COMMENT 'Romanian',
                            `pt_PT` varchar(80) DEFAULT NULL COMMENT 'Portuguese',
                            `pl_PL` varchar(80) DEFAULT NULL COMMENT 'Polish',
                            `zh_CN` varchar(80) DEFAULT NULL COMMENT 'Simplified Chinese',
                            `sv_SE` varchar(80) DEFAULT NULL COMMENT 'Swedish',
                            `fr_FR` varchar(80) DEFAULT NULL COMMENT 'French',
                            `it_IT` varchar(80) DEFAULT NULL COMMENT 'Italian',
                            `hu_HU` varchar(80) DEFAULT NULL COMMENT 'Hungarian',
                            `tr_TR` varchar(80) DEFAULT NULL COMMENT 'Turkish',
                            `iso3` char(3) DEFAULT NULL,
                            `numcode` smallint DEFAULT NULL,
                            `continent` varchar(2) DEFAULT NULL,
                            `lat` float DEFAULT NULL COMMENT 'in google projection',
                            `lon` float DEFAULT NULL COMMENT 'in google projection',
                            `zoom` int DEFAULT '5',
                            `bBoxWest` float DEFAULT NULL,
                            `bBoxNorth` float DEFAULT NULL,
                            `bBoxEast` float DEFAULT NULL,
                            `bBoxSouth` float DEFAULT NULL,
                            PRIMARY KEY (`iso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_oauth2_tokens` (
                                `fk_user` int NOT NULL,
                                `access_token` varchar(255) DEFAULT NULL,
                                `expires_in` int DEFAULT NULL,
                                `token_refreshed` timestamp NULL DEFAULT NULL,
                                `refresh_token` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`fk_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Storage of OAuth2.0 tokens';
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countryinfo_ext` (
                                `bad_alpha2` char(2) NOT NULL,
                                `wiki_name` varchar(255) DEFAULT NULL,
                                `iso_alpha2` char(2) DEFAULT NULL,
                                `iso_alpha3` char(3) DEFAULT NULL,
                                `iso_numeric` int DEFAULT NULL,
                                `fips_code` varchar(3) DEFAULT NULL,
                                `name` varchar(200) DEFAULT NULL,
                                `capital` varchar(200) DEFAULT NULL,
                                `areainsqkm` double DEFAULT NULL,
                                `population` int DEFAULT NULL,
                                `continent` char(2) DEFAULT NULL,
                                `tld` char(3) DEFAULT NULL,
                                `currency` char(3) DEFAULT NULL,
                                `currencyName` char(20) DEFAULT NULL,
                                `Phone` char(10) DEFAULT NULL,
                                `postalCodeFormat` varchar(100) DEFAULT NULL,
                                `postalCodeRegex` varchar(255) DEFAULT NULL,
                                `geonameId` int DEFAULT NULL,
                                `languages` varchar(200) DEFAULT NULL,
                                `neighbours` char(100) DEFAULT NULL,
                                `equivalentFipsCode` char(10) DEFAULT NULL,
                                UNIQUE KEY `bad_alpha2` (`bad_alpha2`),
                                KEY `iso_alpha2` (`iso_alpha2`),
                                KEY `iso_alpha3` (`iso_alpha3`),
                                KEY `iso_numeric` (`iso_numeric`),
                                KEY `fips_code` (`fips_code`),
                                KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_cities` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `country` varchar(2) NOT NULL,
                           `city` varchar(128) NOT NULL,
                           `lat` double NOT NULL,
                           `lng` double NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41230 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log` (
                      `id` int NOT NULL,
                      `datetime` datetime DEFAULT NULL,
                      `action` varchar(255) DEFAULT NULL,
                      `data` text,
                      `fk_user` int DEFAULT NULL,
                      `ip` varchar(15) DEFAULT NULL,
                      PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_countries` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `fk_stats_main_id` int NOT NULL,
                                `country` varchar(64) NOT NULL,
                                `count` int NOT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21815 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_main` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `date` date NOT NULL,
                           `liftershalte` int NOT NULL,
                           `hitchbase` int NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
