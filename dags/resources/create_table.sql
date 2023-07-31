CREATE TABLE `mateus_db`.`transactions` (
  `step` INT NOT NULL,
  `customer` VARCHAR(20) NOT NULL,
  `age` VARCHAR(3) NOT NULL,
  `gender` VARCHAR(1) NOT NULL,
  `zipcodeOri` VARCHAR(8) NOT NULL,
  `merchant` VARCHAR(20) NOT NULL,
  `zipMerchant` VARCHAR(8) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `amount` DECIMAL(6,2) NOT NULL,
  `fraud` TINYINT(1) NOT NULL,
  PRIMARY KEY (`step`, `customer`, `age`, `gender`, `zipcodeOri`, `merchant`, `zipMerchant`, `category`, `amount`, `fraud`));
