-- Created by: João Felipe Fonseca Nascimento
-- joao.nascimento98@academico.ifs.edu.br - 2020

USE Zoboomafoo

GO

CREATE FUNCTION FN_CONSULTAR_CIDADES(@id int)
RETURNS @table TABLE (
    cod_cidade int,
    nm_cidade VARCHAR(10)
    )
AS
BEGIN
    INSERT @table
    SELECT cod_cidade, nm_cidade
    FROM cidades
    WHERE cod_cidade = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_CARGOS(@id int)
RETURNS @table TABLE (
    cod_cargo int,
    nom_cargo VARCHAR(40),
    salario float
    )
AS
BEGIN
    INSERT @table
    SELECT cod_cargo, nom_cargo, salario
    FROM cargos
    WHERE cod_cargo = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_ENDERECOS(@id int)
RETURNS @table TABLE (
    cod_endereco int,
    cod_cidade int,
    nm_rua VARCHAR(150),
    nm_bairro VARCHAR(50),
    numero NUMERIC(10)
    )
AS
BEGIN
    INSERT @table
    SELECT cod_endereco, cod_cidade, nm_rua, nm_bairro, numero
    FROM enderecos
    WHERE cod_endereco = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_FUNCIONARIOS(@id int)
RETURNS @table TABLE (
    matricula int,
    cod_endereco int,
    cod_cargo int,
    rg NUMERIC(10),
    cpf VARCHAR(11),
    crmv NUMERIC(10),
    nome VARCHAR(250),
    dt_nascimento smalldatetime
    )
AS
BEGIN
    INSERT @table
    SELECT matricula, cod_endereco, cod_cargo, rg, cpf, crmv, nome, dt_nascimento
    FROM funcionarios
    WHERE matricula = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_CLASSES(@id int)
RETURNS @table TABLE (
    cod_classe INT,
    nm_classe VARCHAR(50),
    descricao VARCHAR(500)
    )
AS
BEGIN
    INSERT @table
    SELECT cod_classe, nm_classe, descricao
    FROM classes
    WHERE cod_classe = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_ALAS(@id int)
RETURNS @table TABLE (
    cod_ala INT,
    cod_classe INT,
    num_ala NUMERIC(10)
    )
AS
BEGIN
    INSERT @table
    SELECT cod_ala, cod_classe, num_ala
    FROM alas
    WHERE cod_ala = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_CONTEINERS(@id int)
RETURNS @table TABLE (
    cod_conteiner INT,
    cod_ala INT,
    tipo VARCHAR(50)
    )
AS
BEGIN
    INSERT @table
    SELECT cod_conteiner, cod_ala, tipo
    FROM conteiners
    WHERE cod_conteiner = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_ANIMAIS(@id int)
RETURNS @table TABLE (
    cod_animal INT,
    cod_conteiner INT,
    cod_classe INT,
    altura NUMERIC(5,2),
    cor VARCHAR(50),
    especie VARCHAR(50),
    nome VARCHAR(150)
    )
AS
BEGIN
    INSERT @table
    SELECT cod_animal, cod_conteiner, cod_classe, altura, cor, especie, nome
    FROM animais
    WHERE cod_animal = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_HISTORICO_CONSULTAS(@id int)
RETURNS @table TABLE (
    cod_consulta INT,
    matricula INT,
    cod_animal INT,
    dt_consulta smalldatetime
    )
AS
BEGIN
    INSERT @table
    SELECT cod_consulta, matricula, cod_animal, dt_consulta
    FROM historico_consultas
    WHERE cod_consulta = @id
    RETURN
END

GO

CREATE FUNCTION FN_CONSULTAR_LIMPEZAS(@id int)
RETURNS @table TABLE (
    cod_limpeza INT,
    cod_conteiner INT,
    cod_classe INT,
    dt_limpeza smalldatetime
    )
AS
BEGIN
    INSERT @table
    SELECT cod_limpeza, cod_conteiner, cod_classe, dt_limpeza
    FROM limpezas
    WHERE cod_limpeza = @id
    RETURN
END
