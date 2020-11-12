-- Created by: João Felipe Fonseca Nascimento
-- joao.nascimento98@academico.ifs.edu.br - 2020

USE Zoboomafoo

GO

CREATE PROCEDURE dbo.SUMARIO_ESPECIES_ANIMAIS
   
AS

 DECLARE @especie VARCHAR(150)
 DECLARE @quantidade NUMERIC(9)
 DECLARE @cursor_sumario CURSOR

 SET @cursor_sumario = CURSOR STATIC FOR 
 
    SELECT especie, count(especie) as quantidade 
    FROM Zoboomafoo.dbo.animais 
    GROUP BY especie

OPEN @cursor_sumario

FETCH NEXT FROM @cursor_sumario INTO @especie, @quantidade

WHILE @@FETCH_STATUS = 0

    BEGIN
        IF (SELECT dbo.FN_GET_ESPECIE_DO_SUMARIO(@especie) ) >= 1 
	        EXECUTE dbo.USP_UPDATE_QUANTIDADE_ESPECIE_SUMARIZADA @especie, @quantidade
        ELSE 
	        EXECUTE dbo.USP_INSERT_SUMARIO_ESPECIE_ANIMAL @especie, @quantidade

        FETCH NEXT FROM @cursor_sumario INTO @especie, @quantidade
    END

CLOSE @cursor_sumario
DEALLOCATE @cursor_sumario
