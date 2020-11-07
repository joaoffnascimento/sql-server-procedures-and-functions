-- Created by: João Felipe Fonseca Nascimento
-- joao.nascimento98@academico.ifs.edu.br - 2020

USE Zoboomafoo

GO

CREATE FUNCTION FN_GET_TAMANHO_NM_CIDADE (@cod_cidade int)
RETURNS int
AS
BEGIN
    DECLARE @nm_cidade_length int

    SET @nm_cidade_length = (
    SELECT LEN(REPLACE(nm_cidade, 'N', ''))
    FROM cidades
    WHERE cod_cidade = @cod_cidade
    )

    RETURN ISNULL(@nm_cidade_length, 0)
END

GO

CREATE FUNCTION FN_GET_CARGOS_MAIORES_QUE (@salario float)
RETURNS varchar(MAX)
AS
BEGIN

    DECLARE @Resultado VARCHAR(MAX)

    DECLARE @Cargos VARCHAR(MAX)

    SELECT @Cargos = COALESCE(@Cargos + ', ', '') + nom_cargo
    FROM cargos

    SET @Resultado = (
    SELECT @Cargos
    )

    RETURN ISNULL(@Resultado, 'Nenhum cargo encontrado.')
END

GO

CREATE FUNCTION FN_GET_ENDERECO_COMPLETO_BY_ENDERECO_ID (@cod_endereco int)
RETURNS varchar(150)
AS
BEGIN
    DECLARE @endereco_completo varchar(150)

    SET @endereco_completo = (
    SELECT
        CONCAT
        (
            IsNull(nm_rua, ''),', ',
            IsNull(numero, 0),', ',
            IsNull(nm_bairro,'')
        )
    FROM enderecos
    WHERE cod_endereco = @cod_endereco
    )

    RETURN ISNULL(@endereco_completo, 'Nenhum endereço encontrado.')
END

GO

CREATE FUNCTION FN_GET_DADOS_BASICOS_FUNCIONARIO (@matricula int)
RETURNS varchar(150)
AS
BEGIN

    DECLARE @dados_basicos_funcionario varchar(150)

    SET @dados_basicos_funcionario = (
    SELECT
        CONCAT
        (
            IsNull(nome, ''),', ',
            IsNull(dt_nascimento, ''),', ',
            IsNull(crmv, 0)
        )
    FROM funcionarios
    WHERE matricula = @matricula
    )

    RETURN ISNULL(@dados_basicos_funcionario, 'Nenhum funcionário encontrado.')
END

GO

CREATE FUNCTION FN_GET_CLASSE_BY_ID (@cod_classe int)
RETURNS varchar(50)
AS
BEGIN

    DECLARE @classe varchar(50)

    SET @classe = (
    SELECT nm_classe
    FROM classes
    WHERE cod_classe = @cod_classe
    )

    RETURN ISNULL(@classe, 'Nenhuma classe encontrada.')
END

GO

CREATE FUNCTION FN_GET_NUM_ALA_BY_ID (@cod_ala int)
RETURNS varchar(50)
AS
BEGIN

    DECLARE @num_ala varchar(50)

    SET @num_ala = (
    SELECT num_ala
    FROM alas
    WHERE cod_ala = @cod_ala
    )

    RETURN ISNULL(@num_ala, 'Nenhuma ala encontrada.')
END

GO

CREATE FUNCTION FN_GET_TIPO_CONTAINER (@cod_conteiner int)
RETURNS varchar(50)
AS
BEGIN

    DECLARE @tipo_conteiner varchar(50)

    SET @tipo_conteiner = (
    SELECT tipo
    FROM conteiners
    WHERE cod_conteiner = @cod_conteiner
    )

    RETURN ISNULL(@tipo_conteiner, 'Nenhuma conteiner encontrado.')
END

GO

CREATE FUNCTION FN_GET_NOME_ESPECIE_ANIMAL (@cod_animal int)
RETURNS varchar(250)
AS
BEGIN

    DECLARE @nome_especie varchar(250)

    SET @nome_especie = (
    SELECT
        CONCAT
        (
            IsNull(nome, ''),', ',
            IsNull(especie, '')
        )
    FROM animais
    WHERE cod_animal = @cod_animal
    )

    RETURN ISNULL(@nome_especie, 'Nenhuma animal encontrado.')
END

GO

CREATE FUNCTION FN_GET_DATA_CONSULTA_BY_ID (@cod_consulta int)
RETURNS DATETIME
AS
BEGIN

    DECLARE @dt_consulta DATETIME

    SET @dt_consulta = (
    SELECT
        dt_consulta
    FROM historico_consultas
    WHERE cod_consulta = @cod_consulta
    )

    RETURN ISNULL(@dt_consulta, 'Nenhuma consulta encontrada.')
END

GO

CREATE FUNCTION FN_GET_CURRENT_IP ()
RETURNS varchar(255)
AS
BEGIN
    DECLARE @IP_Address varchar(255);

    SELECT @IP_Address = client_net_address
    FROM sys.dm_exec_connections
    WHERE Session_id = @@SPID;

    Return @IP_Address;
END
