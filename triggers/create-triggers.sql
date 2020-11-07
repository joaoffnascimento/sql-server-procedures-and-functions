-- Created by: João Felipe Fonseca Nascimento
-- joao.nascimento98@academico.ifs.edu.br - 2020

USE [Zoboomafoo]

GO

CREATE TRIGGER UTG_AUDITORIA_SALARIO ON cargos AFTER UPDATE
AS
IF UPDATE(salario)
BEGIN
    DECLARE
    @SALARIO_ANTERIOR NUMERIC(9,2),
    @SALARIO_ATUAL NUMERIC(9,2),
    @UPDATED_AT smalldatetime,
    @IP VARCHAR(150),
    @USUARIO VARCHAR(150)

    SET @UPDATED_AT = GETDATE()
    SET @IP = CONVERT(VARCHAR,CONNECTIONPROPERTY('client_net_address'))
    SET @USUARIO = SUSER_SNAME()

    SELECT @SALARIO_ANTERIOR = salario
    FROM DELETED
    SELECT @SALARIO_ATUAL = salario
    FROM INSERTED

    EXECUTE dbo.USP_INSERT_LOG 
    @SALARIO_ANTERIOR, 
    @SALARIO_ATUAL, 
    @UPDATED_AT, 
    @IP, 
    @USUARIO

END
GO