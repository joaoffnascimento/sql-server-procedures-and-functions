-- Created by: João Felipe Fonseca Nascimento
-- joao.nascimento98@academico.ifs.edu.br - 2020

USE Zoboomafoo

GO

CREATE PROCEDURE dbo.USP_CRIAR_CIDADE
  @p_cod_cidade int,
  @p_nm_cidade varchar(50)
AS
BEGIN
  INSERT INTO cidades
    (
    [cod_cidade],
    [nm_cidade]
    )
  VALUES
    (
      @p_cod_cidade,
      @p_nm_cidade 
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_CARGO
  @p_cod_cargo int,
  @p_nom_cargo varchar(40),
  @p_salario int
AS
BEGIN
  INSERT INTO cargos
    (
    [cod_cargo],
    [nom_cargo],
    [salario]
    )
  VALUES
    (
      @p_cod_cargo,
      @p_nom_cargo,
      @p_salario
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_ENDERECO
  @p_cod_endereco int,
  @p_cod_cidade int,
  @p_nm_rua VARCHAR(150),
  @p_nm_bairro VARCHAR(50),
  @p_numero int
AS
BEGIN
  INSERT INTO enderecos
    (
    [cod_endereco],
    [cod_cidade],
    [nm_rua],
    [nm_bairro],
    [numero]
    )
  VALUES
    (
      @p_cod_endereco,
      @p_cod_cidade,
      @p_nm_rua,
      @p_nm_bairro,
      @p_numero
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_FUNCIONARIO
  @p_matricula int,
  @p_cod_endereco int,
  @p_cod_cargo int,
  @p_rg int,
  @p_cpf VARCHAR(11),
  @p_crmv NUMERIC(10),
  @p_nome VARCHAR(250),
  @p_dt_nascimento Datetime
AS
BEGIN
  INSERT INTO funcionarios
    (
    [matricula],
    [cod_endereco],
    [cod_cargo],
    [rg],
    [cpf],
    [crmv],
    [nome],
    [dt_nascimento]
    )
  VALUES
    (
      @p_matricula,
      @p_cod_endereco,
      @p_cod_cargo,
      @p_rg,
      @p_cpf,
      @p_crmv,
      @p_nome,
      @p_dt_nascimento
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_CLASSE
  @p_cod_classe int,
  @p_nm_classe varchar(50),
  @p_descricao varchar(500)
AS
BEGIN
  INSERT INTO classes
    (
    [cod_classe],
    [nm_classe],
    [descricao]
    )
  VALUES
    (
      @p_cod_classe,
      @p_nm_classe,
      @p_descricao
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_ALA
  @p_cod_ala int,
  @p_cod_classe int,
  @p_num_ala int
AS
BEGIN
  INSERT INTO alas
    (
    [cod_ala],
    [cod_classe],
    [num_ala]
    )
  VALUES
    (
      @p_cod_ala,
      @p_cod_classe,
      @p_num_ala
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_CONTEINER
  @p_cod_conteiner int,
  @p_cod_ala int,
  @p_tipo varchar(50)
AS
BEGIN
  INSERT INTO conteiners
    (
    [cod_conteiner],
    [cod_ala],
    [tipo]
    )
  VALUES
    (
      @p_cod_conteiner,
      @p_cod_ala,
      @p_tipo
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_ANIMAL
  @p_cod_animal int,
  @p_cod_conteiner int,
  @p_cod_classe int,
  @p_altura FLOAT,
  @p_cor VARCHAR(50),
  @p_especie VARCHAR(50),
  @p_nome VARCHAR(150)
AS
BEGIN
  INSERT INTO animais
    (
    [cod_animal],
    [cod_conteiner],
    [cod_classe],
    [altura],
    [cor],
    [especie],
    [nome]
    )
  VALUES
    (
      @p_cod_animal,
      @p_cod_conteiner,
      @p_cod_classe,
      @p_altura,
      @p_cor,
      @p_especie,
      @p_nome
    )
END
    
GO

CREATE PROCEDURE dbo.USP_CRIAR_HISTORICO_DE_CONSULTA
  @p_cod_consulta int,
  @p_matricula int,
  @p_cod_animal int,
  @p_dt_consulta Datetime
AS
BEGIN
  INSERT INTO historico_consultas
    (
    [cod_consulta],
    [matricula],
    [cod_animal],
    [dt_consulta]
    )
  VALUES
    (
      @p_cod_consulta,
      @p_matricula,
      @p_cod_animal,
      @p_dt_consulta
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_LIMPEZA
  @p_cod_limpeza int,
  @p_cod_conteiner int,
  @p_cod_classe int,
  @p_dt_limpeza Datetime
AS
BEGIN
  INSERT INTO limpezas
    (
    [cod_limpeza],
    [cod_conteiner],
    [cod_classe],
    [dt_limpeza]
    )
  VALUES
    (
      @p_cod_limpeza,
      @p_cod_conteiner,
      @p_cod_classe,
      @p_dt_limpeza
    )
END

GO

CREATE PROCEDURE dbo.USP_CRIAR_ACOMPANHA
  @p_cod_animal int,
  @p_matricula int
AS
BEGIN
  INSERT INTO acompanha
    (
    [cod_animal],
    [matricula]
    )
  VALUES
    (
      @p_cod_animal,
      @p_matricula
    )
END

GO

CREATE PROCEDURE dbo.USP_INSERT_LOG
  @SALARIO_ANTERIOR NUMERIC(9,2),
  @SALARIO_ATUAL NUMERIC(9,2),
  @UPDATED_AT smalldatetime,
  @IP VARCHAR(150),
  @USUARIO VARCHAR(150)
AS
BEGIN
  INSERT INTO admlog
    (
    [salario_anterior],
    [salario_atual],
    [updated_at],
    [ip],
    [usuario]
    )
  VALUES
    (
      @SALARIO_ANTERIOR,
      @SALARIO_ATUAL,
      @UPDATED_AT,
      @IP,
      @USUARIO
    )
END

GO

CREATE PROCEDURE dbo.USP_INSERT_SUMARIO_ESPECIE_ANIMAL
  @p_especie VARCHAR(150),
  @p_quantidade NUMERIC(9)
AS
BEGIN
  INSERT INTO sumario_especies
    (
    [especie],
    [quantidade]
    )
  VALUES
    (
      @p_especie,
      @p_quantidade
    )
END