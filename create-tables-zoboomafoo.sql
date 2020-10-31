/* SCRIPT DE CRIAÇÃO DAS TABELA DA PRATICA DE ADM DE BANCO - ZOBOOMAFOO */

USE [Zoboomafoo]

PRINT 'Creating tables with their CONSTRAINTs'

PRINT 'Table creation: Cargos'

CREATE TABLE cargos
(
    cod_cargo INT NOT NULL CHECK(cod_cargo > 0),
    nom_cargo VARCHAR(40) NOT NULL,
    salario NUMERIC(9,2) NOT NULL CHECK(salario > 0),
    CONSTRAINT cargo_pk PRIMARY KEY(cod_cargo)
);

--------------------------------------------------------------------

PRINT 'Table creation: Cidades'

CREATE TABLE cidades
(
    cod_cidade INT NOT NULL CHECK(cod_cidade > 0),
    nm_cidade VARCHAR(50) NOT NULL,
    CONSTRAINT cidade_pk PRIMARY KEY(cod_cidade)
);

--------------------------------------------------------------------

PRINT 'Table creation: Enderecos'

CREATE TABLE enderecos
(
    cod_endereco INT NOT NULL CHECK(cod_endereco > 0),
    cod_cidade INT NOT NULL,
    nm_rua VARCHAR(150) NOT NULL,
    nm_bairro VARCHAR(50) NOT NULL,
    numero NUMERIC(10) NOT NULL,
    CONSTRAINT endereco_pk PRIMARY KEY(cod_endereco),
    CONSTRAINT endereco_fk_cidade FOREIGN KEY(cod_cidade) REFERENCES cidades (cod_cidade)
);

--------------------------------------------------------------------

PRINT 'Table creation: Funcionarios'

CREATE TABLE funcionarios
(
    matricula INT NOT NULL CHECK( matricula > 0 ),
    cod_endereco INT NOT NULL,
    cod_cargo INT NOT NULL,
    cod_consulta INT NOT NULL,
    dt_consulta smalldatetime NOT NULL,
    rg NUMERIC(10) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    crmv NUMERIC(10) NOT NULL,
    nome NUMERIC(250) NOT NULL,
    cod_endereco INT NOT NULL,
    dt_nascimento smalldatetime NOT NULL,
    CONSTRAINT funcionario_pk PRIMARY KEY(matricula),
    CONSTRAINT funcionario_fk_endereco FOREIGN KEY(cod_endereco) REFERENCES enderecos (cod_endereco),
    CONSTRAINT funcionario_fk_cargo FOREIGN KEY(cod_cargo) REFERENCES cargos (cod_cargo)
);

--------------------------------------------------------------------

PRINT 'Table creation: Classes'

CREATE TABLE classes
(
    cod_classe INT NOT NULL CHECK(cod_classe > 0),
    nm_classe VARCHAR(50) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    CONSTRAINT classe_pk PRIMARY KEY(cod_classe)
);

--------------------------------------------------------------------

PRINT 'Table creation: Alas'

CREATE TABLE alas
(
    cod_ala INT NOT NULL CHECK(cod_ala > 0),
    cod_classe INT NOT NULL,
    num_ala NUMERIC(10) NOT NULL,
    CONSTRAINT ala_pk PRIMARY KEY(cod_ala),
    CONSTRAINT ala_fk_classe FOREIGN KEY(cod_classe) REFERENCES classes(cod_classe)
);

--------------------------------------------------------------------

PRINT 'Table creation: Conteiners'

CREATE TABLE conteiners
(
    cod_conteiner INT NOT NULL CHECK(cod_conteiner > 0),
    cod_ala INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    CONSTRAINT conteiner_pk PRIMARY KEY(cod_conteiner),
    CONSTRAINT conteiners_fk_ala FOREIGN KEY(cod_ala) REFERENCES alas(cod_ala)
);

--------------------------------------------------------------------

PRINT 'Table creation: Animais'

CREATE TABLE animais
(
    cod_animal INT NOT NULL CHECK(cod_animal > 0),
    cod_container INT NOT NULL,
    cod_classe INT NOT NULL,
    altura NUMERIC(5,2) NOT NULL,
    cor VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY(cod_animal),
    CONSTRAINT animal_fk_container FOREIGN KEY(cod_container) REFERENCES containers(cod_container),
    CONSTRAINT animal_fk_classe FOREIGN KEY(cod_classe) REFERENCES classes(cod_classe)
);

--------------------------------------------------------------------

PRINT 'Table creation: Historico de Consultas'

CREATE TABLE historico_consultas
(
    cod_consulta INT NOT NULL CHECK(cod_consulta > 0),
    cod_funcionario INT NOT NULL,
    cod_animal INT NOT NULL,
    dt_consulta smalldatetime NOT NULL,
    CONSTRAINT historico_consulta_pk PRIMARY KEY( cod_consulta ),
    CONSTRAINT historico_consulta_fk_funcionario FOREIGN KEY (cod_funcionario) REFERENCES funcionarios (cod_funcionario),
    CONSTRAINT historico_consulta_fk_animal FOREIGN KEY (cod_animal) REFERENCES animal (cod_animal)
);

--------------------------------------------------------------------

PRINT 'Table creation: Limpezas'

CREATE TABLE limpezas
(
    cod_limpeza INT NOT NULL CHECK(cod_limpeza > 0),
    cod_conteiner INT NOT NULL,
    cod_classe INT NOT NULL,
    dt_limpeza smalldatetime NOT NULL,
    CONSTRAINT limpeza_pk PRIMARY KEY(cod_limpeza),
    CONSTRAINT limpezas_fk_conteiner FOREIGN KEY (cod_container) REFERENCES conteiners (cod_container),
    CONSTRAINT limpezas_fk_classe FOREIGN KEY (cod_classe) REFERENCES classes (cod_classe)
);

--------------------------------------------------------------------

PRINT 'Table creation: Acompanha'

CREATE TABLE acompanha
(
    cod_animal INT NOT NULL CHECK(cod_consulta > 0),
    cod_funcionario INT NOT NULL CHECK(cod_funcionario > 0),
    CONSTRAINT acompanha_pk PRIMARY KEY(cod_animal, cod_funcionario),
    CONSTRAINT acompanha_fk_animal FOREIGN KEY (cod_animal) REFERENCES conteiners (cod_animal),
    CONSTRAINT acompanha_fk_funcionario FOREIGN KEY (cod_funcionario) REFERENCES classes (cod_funcionario)
);