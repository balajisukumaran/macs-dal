-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `payment_id` INT NOT NULL,
  `payment_mode` VARCHAR(45) NULL,
  `rent` DECIMAL NULL,
  `paid` DECIMAL NULL,
  `user_id` INT NOT NULL,
  `booking_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_payment_booking1_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_booking1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `mydb`.`booking` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`booking` (
  `booking_id` INT NOT NULL,
  `created_on` DATETIME NULL,
  `modified_on` DATETIME NULL,
  `from_date` DATETIME NULL,
  `to_date` DATETIME NULL,
  `payment_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_booking_payment1_idx` (`payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_booking_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `phoneno` VARCHAR(45) NULL,
  `aboutme` VARCHAR(45) NULL,
  `booking_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_booking_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_booking`
    FOREIGN KEY (`booking_id`)
    REFERENCES `mydb`.`booking` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`guest` (
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NULL,
  `relationship` VARCHAR(45) NULL,
  `age` INT NULL,
  PRIMARY KEY (`fname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`service` (
  `service_id` INT NOT NULL,
  `service` VARCHAR(45) NULL,
  `service_charge` DECIMAL NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`support`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`support` (
  `ticket_id` INT NOT NULL,
  `support_fname` VARCHAR(45) NULL,
  `support_lname` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `service_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_support_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_support_service1_idx` (`service_id` ASC) VISIBLE,
  CONSTRAINT `fk_support_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_support_service1`
    FOREIGN KEY (`service_id`)
    REFERENCES `mydb`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`maintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`maintenance` (
  `maintenance_id` INT NOT NULL,
  `maintenance_staff_fname` VARCHAR(45) NULL,
  `maintenance_staff_lname` VARCHAR(45) NULL,
  `ticket_id` INT NOT NULL,
  PRIMARY KEY (`maintenance_id`),
  INDEX `fk_maintenance_support1_idx` (`ticket_id` ASC) VISIBLE,
  CONSTRAINT `fk_maintenance_support1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `mydb`.`support` (`ticket_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stay` (
  `stay_id` INT NOT NULL,
  `landmark` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`stay_id`),
  INDEX `fk_stay_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_stay_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`amenities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`amenities` (
  `amenity_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `charges` DECIMAL NULL,
  `age_limit` INT NULL,
  `stay_id` INT NOT NULL,
  PRIMARY KEY (`amenity_id`),
  INDEX `fk_amenities_stay1_idx` (`stay_id` ASC) VISIBLE,
  CONSTRAINT `fk_amenities_stay1`
    FOREIGN KEY (`stay_id`)
    REFERENCES `mydb`.`stay` (`stay_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`host`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`host` (
  `ssn` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `salary` DECIMAL NULL,
  `address` VARCHAR(500) NULL,
  `stay_id` INT NOT NULL,
  PRIMARY KEY (`ssn`),
  INDEX `fk_host_stay1_idx` (`stay_id` ASC) VISIBLE,
  CONSTRAINT `fk_host_stay1`
    FOREIGN KEY (`stay_id`)
    REFERENCES `mydb`.`stay` (`stay_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`owner` (
  `ssn` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `address` VARCHAR(500) NULL,
  `stay_id` INT NOT NULL,
  PRIMARY KEY (`ssn`),
  INDEX `fk_owner_stay1_idx` (`stay_id` ASC) VISIBLE,
  CONSTRAINT `fk_owner_stay1`
    FOREIGN KEY (`stay_id`)
    REFERENCES `mydb`.`stay` (`stay_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
