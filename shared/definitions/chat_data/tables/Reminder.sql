CREATE TABLE IF NOT EXISTS `chat_data`.`Reminder` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `User_From` INT(10) UNSIGNED NOT NULL,
  `User_To` INT(10) UNSIGNED NOT NULL,
  `Channel` INT(10) UNSIGNED DEFAULT NULL,
  `Platform` INT(10) UNSIGNED DEFAULT NULL,
  `Type` ENUM('Reminder','Pingme') NOT NULL DEFAULT 'Reminder' COLLATE 'utf8mb4_general_ci',
  `Text` VARCHAR(2000) DEFAULT NULL,
  `Created` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `Schedule` DATETIME(3) DEFAULT NULL,
  `Active` TINYINT(1) NOT NULL DEFAULT 1,
  `Private_Message` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `Reminder_User_Alias_From` (`User_From`),
  KEY `FK_Reminder_Channel` (`Channel`),
  KEY `FK_Reminder_User_Alias` (`User_To`),
  KEY `FK_Reminder_Platform` (`Platform`),
  KEY `Active_Lookup` (`Active`),
  KEY `Schedule_Lookup` (`Schedule`),
  CONSTRAINT `FK_Reminder_Channel` FOREIGN KEY (`Channel`) REFERENCES `Channel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reminder_Platform` FOREIGN KEY (`Platform`) REFERENCES `Platform` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reminder_User_Alias` FOREIGN KEY (`User_To`) REFERENCES `User_Alias` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Reminder_User_Alias_From` FOREIGN KEY (`User_From`) REFERENCES `User_Alias` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
