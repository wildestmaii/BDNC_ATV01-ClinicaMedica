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
(1, 1, '2006-06-12', '14:00'),
(1, 4, '2006-06-13', '10:00'),
(2, 1, '2006-06-13', '9:00'),
(2, 2, '2006-06-13', '11:00'),
(2, 3, '2006-06-14', '14:00'),
(2, 4, '2006-06-14', '17:00'),
(3, 1, '2006-06-19', '18:00'),
(3, 3, '2006-06-12', '10:00'),
(3, 4, '2006-06-19', '13:00'),
(4, 4, '2006-06-20', '13:00'),
(4, 4, '2006-06-22', '19:30');

-- 1. O paciente Paulo mudou-se para Ilhota
UPDATE `Clinica`.`Pacientes`
SET `cidade` = 'Ilhota'
WHERE `nome` = 'Paulo';

-- 2. A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Julho de 2006
UPDATE `Clinica`.`Consultas`
SET `data` = '2006-07-04', `hora` = '12:00'
WHERE `Medicos_codm` = 1 AND `Pacientes_codp` = 4;

-- 3. A paciente Ana fez aniversário e sua doença agora é cancer
UPDATE `Clinica`.`Pacientes`
SET `idade` = 21, `doenca` = 'cancer'
WHERE `nome` = 'Ana';

-- 4. A consulta do médico Pedro (codf = 3) com o paciente Carlos (codf = 4) passou para uma hora e meia depois
UPDATE `Clinica`.`Consultas`
SET `hora` = '14:30'
WHERE `Medicos_codm` = 3 AND `Pacientes_codp` = 4;

-- 5. O funcionário Carlos (codf = 4) deixou a clínica
DELETE FROM `Clinica`.`Funcionarios`
WHERE `Funcionarios`.`codf` = 4;


-- 6. As consultas marcadas após as 19 horas foram canceladas
DELETE FROM `Clinica`.`Consultas`
WHERE `Consultas`.`hora` > '19:00';


-- 7. Os pacientes com câncer ou idade inferior a 10 anos deixaram a clínica
DELETE FROM `Clinica`.`Pacientes`
WHERE `Pacientes`.`doenca` = 'cancer' OR `Pacientes`.`idade` < 10;

-- 8. Os médicos que residem em Biguacu e Palhoca deixaram a clínica
DELETE FROM `Clinica`.`Medicos`
WHERE `Medicos`.`cidade` = 'Palhoca' OR `Medicos`.`cidade` = 'Palhoca';

----- 0 row affected
DELETE FROM `Clinica`.`Pacientes`
WHERE `idade` < 10;

----- 20:06:01	DELETE FROM `Clinica`.`Medicos` WHERE `cidade` = `Biguacu`	Error Code: 1054. Unknown column 'Biguacu' in 'where clause'	0.016 sec
DELETE FROM `Clinica`.`Medicos`
WHERE `cidade` = `Biguacu`;

----- 20:06:28	DELETE FROM `Clinica`.`Medicos` WHERE `cidade` = `Palhoca`	Error Code: 1054. Unknown column 'Palhoca' in 'where clause'	0.016 sec
DELETE FROM `Clinica`.`Medicos`
WHERE `cidade` = `Palhoca`;


