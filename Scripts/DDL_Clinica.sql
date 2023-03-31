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
-- 1. Crie um BD com o nome Clinica
CREATE SCHEMA IF NOT EXISTS `Clinica` DEFAULT CHARACTER SET utf8 ;
USE `Clinica` ;

-- 2. Criação das tabelas no presente banco

-- -----------------------------------------------------
-- Table `Clinica`.`Ambulatorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Ambulatorios` (
  `nroa` INT NOT NULL,
  `andar` DECIMAL(3) NOT NULL,
  `capacidade` SMALLINT,
  PRIMARY KEY (`nroa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Medicos` (
  `codm` INT NOT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT NOT NULL,
  `especialidade` CHAR(20),
  `CPF` DECIMAL(11),
  `cidade` VARCHAR(30),
  `Ambulatorios_nroa` INT,
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
  `codp` INT NOT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT NOT NULL,
  `cidade` CHAR(30),
  `CPF` DECIMAL(11),
  `doenca` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`codp`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Funcionarios` (
  `codf` INT NOT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT,
  `CPF` DECIMAL(11),
  `cidade` VARCHAR(30),
  `salario` DECIMAL(10),
  `cargo` VARCHAR(20),
  PRIMARY KEY (`codf`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Consultas` (
  `data` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `Medicos_codm` INT NOT NULL,
  `Pacientes_codp` INT,
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

-- 3. Crie a coluna nroa (int) na tabela Funcionarios
ALTER TABLE `Clinica`.`Funcionarios`
ADD COLUMN `nroa` INT;

-- 4. Crie os índices para: Medicos [CPF (único)] e Pacientes [doenca]
CREATE INDEX `Medicos_CPF`
ON `Clinica`.`Medicos` (CPF);

CREATE INDEX `Pacientes_Doenca`
ON `Clinica`.`Pacientes`(Doenca);

-- 5. Remover o índice doenca em Pacientes
ALTER TABLE `Pacientes`
DROP INDEX `Pacientes_Doenca`;

-- 6. Remover as colunas cargo e nroa da tabela de Funcionarios
ALTER TABLE `Clinica`.`Funcionarios`
DROP COLUMN `cargo`;

ALTER TABLE `Clinica`.`Funcionarios`
DROP COLUMN `nroa`;

-- -----------------------------------------------------
-- Alterações futuras
-- -----------------------------------------------------

-- Por conta da ACL nas tabelas, que impedia o update
SET SQL_SAFE_UPDATES = 0;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
