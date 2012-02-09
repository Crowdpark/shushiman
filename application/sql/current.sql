CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `fb_id` bigint(20) NOT NULL DEFAULT '0',
  `twitter_id` bigint(20) DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`fb_id`),
  KEY `by_user` (`id`,`created`),
  KEY `by_created` (`created`,`id`),
  KEY `twitter_id` (`twitter_id`),
  KEY `id` (`id`),
  KEY `last_login` (`last_login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;