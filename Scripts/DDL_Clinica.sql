-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Clinica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Clinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Clinica` DEFAULT CHARACTER SET utf8 ;
USE `Clinica` ;

-- -----------------------------------------------------
-- Table `Clinica`.`Ambulatorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Ambulatorios` (
  `nroa` INT NULL,
  `andar` DECIMAL(3) NOT NULL,
  `capacidade` SMALLINT NULL,
  PRIMARY KEY (`nroa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Medicos` (
  `codm` INT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT NOT NULL,
  `especialidade` CHAR(20) NULL,
  `CPF` DECIMAL(11) NULL,
  `cidade` VARCHAR(30) NULL,
  `Ambulatorios_nroa` INT NOT NULL,
  PRIMARY KEY (`codm`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  INDEX `fk_Medicos_Ambulatorios1_idx` (`Ambulatorios_nroa` ASC) VISIBLE,
  CONSTRAINT `fk_Medicos_Ambulatorios1`
    FOREIGN KEY (`Ambulatorios_nroa`)
    REFERENCES `Clinica`.`Ambulatorios` (`nroa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Pacientes` (
  `codp` INT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT NOT NULL,
  `cidade` CHAR(30) NULL,
  `CPF` DECIMAL(11) NULL,
  `doenca` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`codp`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Funcionarios` (
  `codf` INT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT NULL,
  `CPF` DECIMAL(11) NULL,
  `cidade` VARCHAR(30) NULL,
  `salario` DECIMAL(10) NULL,
  `cargo` VARCHAR(20) NULL,
  PRIMARY KEY (`codf`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Consultas` (
  `data` DATE NULL,
  `hora` TIME NULL,
  `Medicos_codm` INT NULL,
  `Pacientes_codp` INT NULL,
  PRIMARY KEY (`Medicos_codm`, `hora`, `data`),
  INDEX `fk_Consultas_Pacientes1_idx` (`Pacientes_codp` ASC) VISIBLE,
  CONSTRAINT `fk_Consultas_Medicos`
    FOREIGN KEY (`Medicos_codm`)
    REFERENCES `Clinica`.`Medicos` (`codm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultas_Pacientes1`
    FOREIGN KEY (`Pacientes_codp`)
    REFERENCES `Clinica`.`Pacientes` (`codp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Alterações na criação
-- -----------------------------------------------------
ALTER TABLE `Clinica`.`Funcionarios`
ADD COLUMN `nroa` INT;

CREATE INDEX `Medicos_CPF`
ON `Clinica`.`Medicos` (CPF);

CREATE INDEX `Pacientes_Doenca`
ON `Clinica`.`Pacientes`(Doenca);

ALTER TABLE `Pacientes`
DROP INDEX `Pacientes_Doenca`;

ALTER TABLE `Clinica`.`Funcionarios`
DROP COLUMN `cargo`;

ALTER TABLE `Clinica`.`Funcionarios`
DROP COLUMN `nroa`;

-- -----------------------------------------------------
-- Alterações futuras
-- -----------------------------------------------------



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
