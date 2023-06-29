-- ATIVIDADE 11 - BANCO DE DADOS 1

-- @author eng-gabrielscardoso

--

-- CRIAÇÃO DAS TABELAS E CHAVES PRIMÁRIAS

--

CREATE TABLE
    empregado (
        rg VARCHAR(15),
        rg_supervisor VARCHAR(15),
        depto NUMBER(2, 0),
        nome VARCHAR(50),
        cpf CHAR(11),
        salario NUMBER(6, 2),
        CONSTRAINT pk_empregado PRIMARY KEY (rg)
    );

CREATE TABLE
    departamento (
        numero NUMBER(2, 0),
        rg_gerente VARCHAR(15),
        nome VARCHAR(40),
        CONSTRAINT pk_departamento PRIMARY KEY (numero)
    );

CREATE TABLE
    dependente (
        nome_dependente VARCHAR(40),
        rg_responsavel VARCHAR(15),
        nascimento date,
        relacao VARCHAR(20),
        sexo CHAR(1),
        CONSTRAINT pk_dependente PRIMARY KEY (
            nome_dependente,
            rg_responsavel
        )
    );

CREATE TABLE
    empregado_projeto (
        numero_projeto NUMBER(2, 0),
        rg_empregado VARCHAR(15),
        horas NUMBER(2, 0),
        CONSTRAINT pk_empregado_projeto PRIMARY KEY (numero_projeto, rg_empregado)
    );

CREATE TABLE
    departamento_projeto (
        numero_depto NUMBER(2, 0),
        numero_projeto NUMBER(2, 0),
        CONSTRAINT pk_departamento_projeto PRIMARY KEY (numero_depto, numero_projeto)
    );

CREATE TABLE
    projeto (
        numero NUMBER(2, 0),
        nome VARCHAR(30),
        localizacao VARCHAR(40),
        CONSTRAINT pk_projeto PRIMARY KEY (numero)
    );

--

-- CRIAÇÃO DOS RELACIONAMENTOS

--

ALTER TABLE empregado
ADD
    CONSTRAINT fk_empregado_empregado FOREIGN KEY (rg_supervisor) REFERENCES empregado (rg);

ALTER TABLE dependente
ADD
    CONSTRAINT fk_dependente_empregado FOREIGN KEY (rg_responsavel) REFERENCES empregado (rg);

ALTER TABLE departamento
ADD
    CONSTRAINT fk_departamento_empregado FOREIGN KEY (rg_gerente) REFERENCES empregado (rg);

ALTER TABLE empregado_projeto
ADD
    CONSTRAINT fk_empregado_projeto_projeto FOREIGN KEY (numero_projeto) REFERENCES projeto (numero);

ALTER TABLE empregado_projeto
ADD
    CONSTRAINT fk_empregado_projeto_empregado FOREIGN KEY (rg_empregado) REFERENCES empregado (rg);

ALTER TABLE
    departamento_projeto
ADD
    CONSTRAINT fk_departamento_projeto_departamento FOREIGN KEY (numero_depto) REFERENCES departamento (numero);

ALTER TABLE
    departamento_projeto
ADD
    CONSTRAINT fk_departamento_projeto_projeto FOREIGN KEY (numero_projeto) REFERENCES projeto (numero);

--

-- MODIFICAÇÃO NA ESTRUTURA DAS TABELAS

--

ALTER TABLE departamento ADD data_ger DATE DEFAULT SYSDATE NOT NULL;

ALTER TABLE dependente DROP COLUMN relacao;

ALTER TABLE empregado MODIFY nome VARCHAR(70);

CREATE TABLE
    localizacao_depto (
        numero_loc NUMBER(2, 0),
        numero_depto NUMBER(2, 0),
        nome_loc VARCHAR(30)
    );

ALTER TABLE localizacao_depto
ADD
    CONSTRAINT fk_localizacao_depto_departamento FOREIGN KEY (numero_depto) REFERENCES departamento (numero);

ALTER TABLE localizacao_depto
ADD
    CONSTRAINT pk_localizacao_depto PRIMARY KEY (numero_loc, numero_depto);

--

-- INSERÇÃO DE DADOS

--

INSERT INTO
    empregado (
        rg,
        rg_supervisor,
        depto,
        nome,
        cpf,
        salario
    )
VALUES (
        '123456789',
        NULL,
        1,
        'João Silva',
        '12345678901',
        5000.00
    );

INSERT INTO
    departamento (numero, rg_gerente, nome)
VALUES (
        1,
        '123456789',
        'Departamento 1'
    );

INSERT INTO
    dependente (
        nome_dependente,
        rg_responsavel,
        nascimento,
        sexo
    )
VALUES (
        'Maria Silva',
        '123456789',
        DATE '2000-01-01',
        'F'
    );

INSERT INTO
    projeto (numero, nome, localizacao)
VALUES (
        1,
        'Projeto 1',
        'Localização 1'
    );

INSERT INTO
    empregado_projeto (
        numero_projeto,
        rg_empregado,
        horas
    )
VALUES (1, '123456789', 40);

INSERT INTO
    departamento_projeto (numero_depto, numero_projeto)
VALUES (1, 1);

INSERT INTO
    localizacao_depto (
        numero_loc,
        numero_depto,
        nome_loc
    )
VALUES (
        1,
        1,
        'Localização Departamento 1'
    );

INSERT INTO
    empregado (
        rg,
        rg_supervisor,
        depto,
        nome,
        cpf,
        salario
    )
VALUES (
        '987654321',
        NULL,
        2,
        'Maria Santos',
        '98765432109',
        4500.00
    );

INSERT INTO
    departamento (numero, rg_gerente, nome)
VALUES (
        2,
        '987654321',
        'Departamento 2'
    );

INSERT INTO
    dependente (
        nome_dependente,
        rg_responsavel,
        nascimento,
        sexo
    )
VALUES (
        'Pedro Santos',
        '987654321',
        DATE '2005-03-15',
        'M'
    );

INSERT INTO
    projeto (numero, nome, localizacao)
VALUES (
        2,
        'Projeto 2',
        'Localização 2'
    );

INSERT INTO
    empregado_projeto (
        numero_projeto,
        rg_empregado,
        horas
    )
VALUES (2, '987654321', 30);

INSERT INTO
    departamento_projeto (numero_depto, numero_projeto)
VALUES (2, 2);

INSERT INTO
    localizacao_depto (
        numero_loc,
        numero_depto,
        nome_loc
    )
VALUES (
        2,
        2,
        'Localização Departamento 2'
    );

INSERT INTO
    empregado (
        rg,
        rg_supervisor,
        depto,
        nome,
        cpf,
        salario
    )
VALUES (
        '111111111',
        '123456789',
        1,
        'Pedro Santos',
        '11111111111',
        4000.00
    );

INSERT INTO
    departamento (numero, rg_gerente, nome)
VALUES (
        3,
        '111111111',
        'Departamento 3'
    );

INSERT INTO
    dependente (
        nome_dependente,
        rg_responsavel,
        nascimento,
        sexo
    )
VALUES (
        'Ana Santos',
        '111111111',
        DATE '2002-08-20',
        'F'
    );

INSERT INTO
    projeto (numero, nome, localizacao)
VALUES (
        3,
        'Projeto 3',
        'Localização 3'
    );

INSERT INTO
    empregado_projeto (
        numero_projeto,
        rg_empregado,
        horas
    )
VALUES (3, '111111111', 20);

INSERT INTO
    departamento_projeto (numero_depto, numero_projeto)
VALUES (3, 3);

INSERT INTO
    localizacao_depto (
        numero_loc,
        numero_depto,
        nome_loc
    )
VALUES (
        3,
        3,
        'Localização Departamento 3'
    );

INSERT INTO
    empregado (
        rg,
        rg_supervisor,
        depto,
        nome,
        cpf,
        salario
    )
VALUES (
        '222222222',
        '123456789',
        1,
        'Paula Oliveira',
        '22222222222',
        5500.00
    );

INSERT INTO
    departamento (numero, rg_gerente, nome)
VALUES (
        4,
        '222222222',
        'Departamento 4'
    );

INSERT INTO
    dependente (
        nome_dependente,
        rg_responsavel,
        nascimento,
        sexo
    )
VALUES (
        'Pedro Oliveira',
        '222222222',
        DATE '2004-05-10',
        'M'
    );

INSERT INTO
    projeto (numero, nome, localizacao)
VALUES (
        4,
        'Projeto 4',
        'Localização 4'
    );

INSERT INTO
    empregado_projeto (
        numero_projeto,
        rg_empregado,
        horas
    )
VALUES (4, '222222222', 35);

INSERT INTO
    departamento_projeto (numero_depto, numero_projeto)
VALUES (4, 4);

INSERT INTO
    localizacao_depto (
        numero_loc,
        numero_depto,
        nome_loc
    )
VALUES (
        4,
        4,
        'Localização Departamento 4'
    );

INSERT INTO
    empregado (
        rg,
        rg_supervisor,
        depto,
        nome,
        cpf,
        salario
    )
VALUES (
        '333333333',
        '123456789',
        1,
        'Ana Lima',
        '33333333333',
        4800.00
    );

INSERT INTO
    departamento (numero, rg_gerente, nome)
VALUES (
        5,
        '333333333',
        'Departamento 5'
    );

INSERT INTO
    dependente (
        nome_dependente,
        rg_responsavel,
        nascimento,
        sexo
    )
VALUES (
        'João Lima',
        '333333333',
        DATE '2003-11-27',
        'M'
    );

INSERT INTO
    projeto (numero, nome, localizacao)
VALUES (
        5,
        'Projeto 5',
        'Localização 5'
    );

INSERT INTO
    empregado_projeto (
        numero_projeto,
        rg_empregado,
        horas
    )
VALUES (5, '333333333', 25);

INSERT INTO
    departamento_projeto (numero_depto, numero_projeto)
VALUES (5, 5);

INSERT INTO
    localizacao_depto (
        numero_loc,
        numero_depto,
        nome_loc
    )
VALUES (
        5,
        5,
        'Localização Departamento 5'
    );

--

-- EXIBIÇÃO DOS DADOS INSERIDOS

--

SELECT * FROM projeto;

SELECT * FROM departamento;

SELECT * FROM empregado;

SELECT * FROM dependente;

SELECT * FROM empregado_projeto;

SELECT * FROM departamento_projeto;

SELECT * FROM localizacao_depto;