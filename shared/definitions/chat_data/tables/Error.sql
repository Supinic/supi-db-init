CREATE TABLE IF NOT EXISTS `chat_data`.`Error` (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Type` enum('Backend','Command','Database','Website','Website - API','Other','Request') NOT NULL,
  `Origin` enum('Internal','External') DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `Stack` text NOT NULL DEFAULT '',
  `Arguments` text DEFAULT NULL,
  `Context` text DEFAULT NULL,
  `Timestamp` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
