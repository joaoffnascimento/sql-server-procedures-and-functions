-- Created by: João Felipe Fonseca Nascimento
-- joao.nascimento98@academico.ifs.edu.br - 2020

USE Zoboomafoo

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_CIDADE
    @p_cod_cidade int,
    @p_nm_cidade varchar(50)
AS
BEGIN
    UPDATE cidades
            SET 
                nm_cidade = ISNULL(@p_nm_cidade, nm_cidade)
            WHERE cod_cidade = @p_cod_cidade
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_CARGO
    @p_cod_cargo int,
    @p_nom_cargo varchar(40),
    @p_salario int
AS
BEGIN
    UPDATE cargos
            SET 
            nom_cargo = ISNULL(@p_nom_cargo, nom_cargo),
            salario = ISNULL(@p_salario, salario)
            WHERE cod_cargo = @p_cod_cargo
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_ENDERECO
    @p_cod_endereco int,
    @p_cod_cidade int,
    @p_nm_rua VARCHAR(150),
    @p_nm_bairro VARCHAR(50),
    @p_numero int
AS
BEGIN
    UPDATE enderecos
            SET 
            cod_cidade  = ISNULL(@p_cod_cidade, cod_cidade),
            nm_rua = ISNULL(@p_nm_rua, nm_rua),
            nm_bairro = ISNULL(@p_nm_bairro, nm_bairro),
            numero = ISNULL(@p_numero, numero)
            WHERE cod_endereco = @p_cod_endereco
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_FUNCIONARIO
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
    UPDATE funcionarios
            SET 
            cod_endereco  = ISNULL(@p_cod_endereco, cod_endereco),
            cod_cargo = ISNULL(@p_cod_cargo, cod_cargo),
            rg = ISNULL(@p_rg, rg),
            cpf = ISNULL(@p_cpf, cpf),
            crmv  = ISNULL(@p_crmv, crmv),
            nome = ISNULL(@p_nome, nome),
            dt_nascimento = ISNULL(@p_dt_nascimento, dt_nascimento)

            WHERE matricula = @p_matricula
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_CLASSE
    @p_cod_classe int,
    @p_nm_classe varchar(50),
    @p_descricao varchar(500)
AS
BEGIN
    UPDATE classes
            SET 
            nm_classe = ISNULL(@p_nm_classe, nm_classe),
            descricao = ISNULL(@p_descricao, descricao)
            
            WHERE cod_classe = @p_cod_classe
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_ALA
  @p_cod_ala int,
  @p_cod_classe int,
  @p_num_ala int
AS
BEGIN
    UPDATE alas
            SET 
            cod_classe = ISNULL(@p_cod_classe, cod_classe),
            num_ala = ISNULL(@p_num_ala, num_ala)
            
            WHERE cod_ala = @p_cod_ala
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_CONTEINER
  @p_cod_conteiner int,
  @p_cod_ala int,
  @p_tipo varchar(50)
AS
BEGIN
    UPDATE conteiners
            SET 
            cod_ala = ISNULL(@p_cod_ala, cod_ala),
            tipo = ISNULL(@p_tipo, tipo)
            
            WHERE cod_conteiner = @p_cod_conteiner
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_ANIMAL
  @p_cod_animal int,
  @p_cod_conteiner int,
  @p_cod_classe int,
  @p_altura FLOAT,
  @p_cor VARCHAR(50),
  @p_especie VARCHAR(50),
  @p_nome VARCHAR(150)
AS
BEGIN
    UPDATE animais
            SET 
            cod_conteiner = ISNULL(@p_cod_conteiner, cod_conteiner),
            cod_classe = ISNULL(@p_cod_classe, cod_classe),
            altura = ISNULL(@p_altura, altura),
            cor = ISNULL(@p_cor, cor),
            especie = ISNULL(@p_especie, especie),
            nome = ISNULL(@p_nome, nome)
            
            WHERE cod_animal = @p_cod_animal
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_HISTORICO_DE_CONSULTA
  @p_cod_consulta int,
  @p_matricula int,
  @p_cod_animal int,
  @p_dt_consulta Datetime
AS
BEGIN
    UPDATE historico_consultas
            SET 
            matricula = ISNULL(@p_matricula, matricula),
            cod_animal = ISNULL(@p_cod_animal, cod_animal),
            dt_consulta = ISNULL(@p_dt_consulta, dt_consulta)
            
            WHERE cod_consulta = @p_cod_consulta
END

GO

CREATE PROCEDURE dbo.USP_MODIFICAR_LIMPEZA
  @p_cod_limpeza int,
  @p_cod_conteiner int,
  @p_cod_classe int,
  @p_dt_limpeza Datetime
AS
BEGIN
    UPDATE limpezas
            SET 
            cod_conteiner = ISNULL(@p_cod_conteiner, cod_conteiner),
            cod_classe = ISNULL(@p_cod_classe, cod_classe),
            dt_limpeza = ISNULL(@p_dt_limpeza, dt_limpeza)
            
            WHERE cod_limpeza = @p_cod_limpeza
END