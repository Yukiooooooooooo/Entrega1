-- Create table Mercado_db

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mercado_BD
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Mercado_db` ;

-- -----------------------------------------------------
-- Schema Mercado_BD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mercado_db` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `Mercado_db` ;

-- -----------------------------------------------------
-- Table `ESTOQUE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ESTOQUE` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ESTOQUE` (
  `CD_ESTOQUE` INT NOT NULL AUTO_INCREMENT,
  `DS_ESTOQUE` VARCHAR(45) NOT NULL,
  `CD_MATRIZ` INT NOT NULL,
  PRIMARY KEY (`CD_ESTOQUE`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ITEM_PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITEM_PEDIDO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ITEM_PEDIDO` (
  `CD_PEDIDO` INT NOT NULL AUTO_INCREMENT,
  `CD_PRODUTO` INT NOT NULL,
  `CD_MATRIZ` DECIMAL(4,2) NOT NULL,
  `QUANTIDADE` INT NOT NULL,
  PRIMARY KEY (`CD_PEDIDO`, `CD_PRODUTO`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `MATRIZ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MATRIZ` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `MATRIZ` (
  `CD_MATRIZ` INT NOT NULL,
  `RAZAO_SOCIAL` VARCHAR(50) NOT NULL,
  `NR_CNPJ` VARCHAR(18) NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `DS_ENDERECO` VARCHAR(45) NOT NULL,
  `COMPLEMENTO` VARCHAR(45) NOT NULL,
  `NR_ENDERECO` INT NOT NULL,
  PRIMARY KEY (`CD_MATRIZ`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CNPJ_UNIQUE` ON `MATRIZ` (`NR_CNPJ` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PEDIDO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PEDIDO` (
  `CD_PEDIDO` INT NOT NULL AUTO_INCREMENT,
  `VL_TOTAL` DECIMAL(5,2) NOT NULL,
  `CD_MATRIZ` INT NOT NULL,
  `LAST_UPDATE` DATE NOT NULL,
  PRIMARY KEY (`CD_PEDIDO`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUTO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PRODUTO` (
  `CD_PRODUTO` INT NOT NULL AUTO_INCREMENT,
  `DS_PRODUTO` VARCHAR(45) NOT NULL,
  `CD_ESTOQUE` INT NOT NULL,
  `VL_UNITARIO` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`CD_PRODUTO`, `CD_ESTOQUE`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CD_ESTOQUE_UNIQUE` ON `PRODUTO` (`CD_ESTOQUE` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `STATUS_PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `STATUS_PEDIDO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `STATUS_PEDIDO` (
  `CD_PEDIDO` INT NOT NULL,
  `CD_COMPRADOR` VARCHAR(50) NOT NULL,
  `CD_STATUS` INT NOT NULL,
  PRIMARY KEY (`CD_PEDIDO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FORNECEDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FORNECEDOR` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `FORNECEDOR` (
  `CD_PRODUTO` INT NOT NULL AUTO_INCREMENT,
  `DS_ESTOQUE` VARCHAR(45) NOT NULL,
  `CD_FORNECEDOR` INT NOT NULL,
	`DS_END` VARCHAR(45) NOT NULL,
	`NR_END_NUM` VARCHAR(45) NOT NULL,
    `NR_CNPJ` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CD_PRODUTO`))
ENGINE = InnoDB;

SHOW WARNINGS;
USE `Mercado_BD` ;

