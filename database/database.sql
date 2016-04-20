SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `userId` INT NOT NULL,
  `userName` VARCHAR(16) NOT NULL,
  `userEmail` VARCHAR(255) NULL,
  `userPassword` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`project` (
  `projectId` INT NOT NULL AUTO_INCREMENT,
  `projectName` VARCHAR(255) NOT NULL,
  `startTime` TIME NOT NULL,
  `endTime` TIME NOT NULL,
  `introduction` VARCHAR(255) NOT NULL,
  `type` INT NOT NULL,
  PRIMARY KEY (`projectId`));


-- -----------------------------------------------------
-- Table `mydb`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`task` (
  `taskId` INT NOT NULL AUTO_INCREMENT,
  `taskName` VARCHAR(255) NOT NULL,
  `startTime` TIME NOT NULL,
  `endTime` TIME NOT NULL,
  `introduction` VARCHAR(225) NOT NULL,
  `taskStatus` INT NOT NULL,
  `projectId` INT NULL,
  PRIMARY KEY (`taskId`),
  INDEX `projectId_idx` (`projectId` ASC),
  CONSTRAINT `projectId`
    FOREIGN KEY (`projectId`)
    REFERENCES `mydb`.`project` (`projectId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`check`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`check` (
  `checkId` INT NOT NULL AUTO_INCREMENT,
  `checkName` VARCHAR(255) NOT NULL,
  `taskId` INT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`checkId`),
  INDEX `taskId_idx` (`taskId` ASC),
  INDEX `userId_idx` (`userId` ASC),
  CONSTRAINT `taskId`
    FOREIGN KEY (`taskId`)
    REFERENCES `mydb`.`task` (`taskId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_project` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `mydb`.`user` (`userId`),
  FOREIGN KEY (`project_id`) REFERENCES `mydb`.`project` (`projectId`)
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `task_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `task_id_idx` (`task_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `task_id`
    FOREIGN KEY (`task_id`)
    REFERENCES `mydb`.`task` (`taskId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
