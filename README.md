# Atividade 01 - Clínica Médica

## EXERCÍCIOS (MYSQL)

1. Crie um BD com nome **Clínica**
2. Crie as seguintes tabelas neste BD, considerando que os atributos
sublinhados são chaves primárias e os em itálico são chaves
estrangeiras:
    - **Ambulatorios**: nroa (int), andar (numeric(3)) (não nulo), capacidade
    (smallint)
    - **Medicos**: codm (int), nome (varchar(40)) (não nulo), idade (smallint)
    (não nulo), especialidade (char(20)), CPF (numeric(11)) (único),
    cidade (varchar(30)), nroa (int)
    - **Pacientes**: codp (int), nome (varchar(40)) (não nulo), idade
    (smallint) (não nulo), cidade (char(30)), CPF (numeric(11)) (único),
    doenca (varchar(40)) (não nulo)
    - **Funcionarios**: codf (int), nome (varchar(40)) (não nulo), idade
    (smallint), CPF (numeric(11)) (único), cidade (varchar(30)), salario
    (numeric(10)), cargo (varchar(20))
    - **Consultas**: codm (int), codp (int), data (date), hora (time)
    
3. Crie a coluna **nroa (int)** na tabela Funcionarios
4. Crie os seguintes índices:
    - Medicos: CPF (único)
    - Pacientes: doenca
    
5. Remover o índice **doenca** em Pacientes
6. Remover as colunas **cargo** e **nroa** da tabela de Funcionarios

### Popular tabelas:

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4c717f31-a26d-4f7b-a93a-41070ba007d5/Untitled.png)

### Realizar as seguintes atualizações no BD:

1. O paciente Paulo mudou-se para Ilhota
2. A consulta do médico 1 com o paciente 4 passou para às
12:00 horas do dia 4 de Julho de 2006
3. A paciente Ana fez aniversário e sua doença agora é
cancer
4. A consulta do médico Pedro (codf = 3) com o paciente
Carlos (codf = 4) passou para uma hora e meia depois
5. O funcionário Carlos (codf = 4) deixou a clínica
6. As consultas marcadas após as 19 horas foram
canceladas
7. Os pacientes com câncer ou idade inferior a 10 anos
deixaram a clínica
8. Os médicos que residem em Biguacu e Palhoca deixaram
a clínica