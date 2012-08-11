SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `miapp` DEFAULT CHARACTER SET latin1 ;
USE `miapp` ;

-- -----------------------------------------------------
-- Table `miapp`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `miapp`.`categoria` ;

CREATE  TABLE IF NOT EXISTS `miapp`.`categoria` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(250) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `miapp`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `miapp`.`user` ;

CREATE  TABLE IF NOT EXISTS `miapp`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(60) NOT NULL ,
  `password` VARCHAR(100) NOT NULL ,
  `email` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miapp`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `miapp`.`post` ;

CREATE  TABLE IF NOT EXISTS `miapp`.`post` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(120) NOT NULL ,
  `contenido` TEXT NOT NULL ,
  `fecha_creacion` DATE NOT NULL ,
  `user_id` INT(11) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_post_user1` (`user_id` ASC) ,
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `miapp`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `miapp`.`categoria_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `miapp`.`categoria_post` ;

CREATE  TABLE IF NOT EXISTS `miapp`.`categoria_post` (
  `categoria_id` INT(11) NOT NULL ,
  `post_id` INT(11) NOT NULL ,
  PRIMARY KEY (`categoria_id`, `post_id`) ,
  INDEX `fk_categoria_id` (`categoria_id` ASC) ,
  INDEX `fk_post_id` (`post_id` ASC) ,
  CONSTRAINT `categoria_post_ibfk_1`
    FOREIGN KEY (`categoria_id` )
    REFERENCES `miapp`.`categoria` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `categoria_post_ibfk_2`
    FOREIGN KEY (`post_id` )
    REFERENCES `miapp`.`post` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `miapp`.`comentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `miapp`.`comentario` ;

CREATE  TABLE IF NOT EXISTS `miapp`.`comentario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `comentario` TEXT NOT NULL ,
  `fecha` DATE NOT NULL ,
  `post_id` INT(11) NOT NULL ,
  `user_id` INT(11) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_post_id` (`post_id` ASC) ,
  INDEX `fk_comentario_user1` (`user_id` ASC) ,
  CONSTRAINT `comentario_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `miapp`.`post` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comentario_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `miapp`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
