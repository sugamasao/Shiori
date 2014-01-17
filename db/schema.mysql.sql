CREATE TABLE IF NOT EXISTS `bookmarks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
