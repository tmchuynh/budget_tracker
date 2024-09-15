-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema budget_tracker
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `budget_tracker` ;

-- -----------------------------------------------------
-- Schema budget_tracker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `budget_tracker` DEFAULT CHARACTER SET utf8 ;
USE `budget_tracker` ;

-- -----------------------------------------------------
-- Table `budget_tracker`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget_tracker`.`user` ;

CREATE TABLE IF NOT EXISTS `budget_tracker`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`id`, `username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `budget_tracker`.`budget`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget_tracker`.`budget` ;

CREATE TABLE IF NOT EXISTS `budget_tracker`.`budget` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_budget_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_budget_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `budget_tracker`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `budget_tracker`.`expense`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget_tracker`.`expense` ;

CREATE TABLE IF NOT EXISTS `budget_tracker`.`expense` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_expense_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_expense_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `budget_tracker`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `budget_tracker`.`income`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget_tracker`.`income` ;

CREATE TABLE IF NOT EXISTS `budget_tracker`.`income` (
  `id` INT NOT NULL,
  `amount` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_income_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_income_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `budget_tracker`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `budget_tracker`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget_tracker`.`category` ;

CREATE TABLE IF NOT EXISTS `budget_tracker`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `filter` JSON NULL,
  PRIMARY KEY (`id`, `name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `budget_tracker`.`income_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget_tracker`.`income_has_category` ;

CREATE TABLE IF NOT EXISTS `budget_tracker`.`income_has_category` (
  `income_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`income_id`, `category_id`),
  INDEX `fk_income_has_category_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_income_has_category_income_idx` (`income_id` ASC) VISIBLE,
  CONSTRAINT `fk_income_has_category_income`
    FOREIGN KEY (`income_id`)
    REFERENCES `budget_tracker`.`income` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_income_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `budget_tracker`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `budget_tracker`.`budget_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget_tracker`.`budget_has_category` ;

CREATE TABLE IF NOT EXISTS `budget_tracker`.`budget_has_category` (
  `budget_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`budget_id`, `category_id`),
  INDEX `fk_budget_has_category_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_budget_has_category_budget1_idx` (`budget_id` ASC) VISIBLE,
  CONSTRAINT `fk_budget_has_category_budget1`
    FOREIGN KEY (`budget_id`)
    REFERENCES `budget_tracker`.`budget` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_budget_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `budget_tracker`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `budget_tracker`.`expense_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget_tracker`.`expense_has_category` ;

CREATE TABLE IF NOT EXISTS `budget_tracker`.`expense_has_category` (
  `expense_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`expense_id`, `category_id`),
  INDEX `fk_expense_has_category_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_expense_has_category_expense1_idx` (`expense_id` ASC) VISIBLE,
  CONSTRAINT `fk_expense_has_category_expense1`
    FOREIGN KEY (`expense_id`)
    REFERENCES `budget_tracker`.`expense` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_expense_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `budget_tracker`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
