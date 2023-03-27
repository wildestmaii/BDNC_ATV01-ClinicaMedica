-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
-- -----------------------------------------------------

INSERT INTO `Clinica`.`Ambulatorios` (`nroa`, `andar`, `capacidade`)
VALUES
(1, '1', '30'),
(2, '1', '50'),
(3, '2', '40'),
(4, '2', '25'),
(5, '2', '55');


INSERT INTO `Clinica`.`Medicos` (`codm`, `nome`, `idade`, `especialidade`, `CPF`, `cidade`, `Ambulatorios_nroa`)
VALUES
(1, 'João', '40', 'ortopedia', '10000100000', 'Florianopolis', 1),
(2, 'Maria', '42', 'traumatologia', '10000110000', 'Blumenau', 2),
(3, 'Pedro', '51', 'pediatria', '11000100000', 'São José', 2),
(4, 'Carlos', '28', 'ortopedia', '11000110000', 'Joinville', 0),
(5, 'Marcia', '33', 'neurologia', '11000111000', 'Biguacu', 3);


INSERT INTO `Clinica`.`Pacientes` (`codp`, `nome`, `idade`, `cidade`, `CPF`, `doenca`)
VALUES
(1, 'Ana', '20', 'Florianopolis', '20000200000', 'gripe'),
(2, 'Paulo', '24', 'Palhoca', '20000220000', 'fratura'),
(3, 'Lucia', '30', 'Biguacu', '22000200000', 'tendinite'),
(4, 'Carlos', '28', 'Joinville', '11000110000', 'sarampo');


INSERT INTO `Clinica`.`Funcionarios` (`codf`, `nome`, `idade`, `cidade`, `salario`, `CPF`)
VALUES
(1, 'Rita', '32', 'Sao Jose', '1200', '20000100000'),
(2, 'Maria', '55', 'Palhoca', '1220', '30000110000'),
(3, 'Caio', '45', 'Florianopolis', '1100', '41000100000'),
(4, 'Carlos', '44', 'Florianopolis', '1200', '51000110000'),
(5, 'Paula', '33', 'Florianopolis', '2500', '61000111000');


INSERT INTO `Clinica`.`Consultas` (`Medicos_codm`, `Pacientes_codp`, `data`, `hora`)
VALUES
(1, 1, '2006/06/12', '14:00'),
(1, 4, '2006/06/13', '10:00'),
(2, 1, '2006/06/13', '9:00'),
(2, 2, '2006/06/13', '11:00'),
(2, 3, '2006/06/14', '14:00'),
(2, 4, '2006/06/14', '17:00'),
(3, 1, '2006/06/19', '18:00'),
(3, 3, '2006/06/12', '10:00'),
(3, 4, '2006/06/19', '13:00'),
(4, 4, '2006/06/20', '13:00'),
(4, 4, '2006/06/22', '19:30');


UPDATE `Clinica`.`Funcionarios`
SET `cidade` = `Ilhota`
WHERE `nome` = `Paulo`;


UPDATE `Clinica`.`Consultas`
SET `data` = '2006/07/04', `hora` = '12:00'
WHERE `Medicos_codm` = 1 AND `Pacientes_codp` = 4;


UPDATE `Clinica`.`Pacientes`
SET `idade` = 21, `doenca` = `cancer`
WHERE `nome` = `Ana`;


UPDATE `Clinica`.`Consultas`
SET `hora` = '14:30'
WHERE `Medicos_codm` = 3 AND `Pacientes_codp` = 4;


DELETE FROM `Clinica`.`Funcionarios`
WHERE `codf` = 4;


DELETE FROM `Clinica`.`Consultas`
WHERE `codf` = '19:30';


DELETE FROM `Clinica`.`Pacientes`
WHERE `doenca` = `cancer`;


DELETE FROM `Clinica`.`Pacientes`
WHERE `idade` < 10;


DELETE FROM `Clinica`.`Medicos`
WHERE `cidade` = `Biguacu`;


DELETE FROM `Clinica`.`Medicos`
WHERE `cidade` = `Palhoca`;


