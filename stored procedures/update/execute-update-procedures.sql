USE Zoboomafoo

GO

EXECUTE dbo.USP_MODIFICAR_CIDADE
    1,
    "Simão Dias"
GO

EXECUTE dbo.USP_MODIFICAR_CARGO
    1,
    "Especialista em mamíferos",
    3000
GO


EXECUTE dbo.USP_MODIFICAR_ENDERECO
    1,
    1,
    "Avenida Zacarias Júnior",
    "Centro",
    143
GO

EXECUTE dbo.USP_MODIFICAR_FUNCIONARIO
    20180057,
    1,
    1,
    2068,
    "03717981080",
    654321,
    "Andrade",
    "2000-08-14 12:00:00"
GO

EXECUTE dbo.USP_MODIFICAR_CLASSE
    1,
    "Onivorus",
    "Os que comem ovos"
GO

EXECUTE dbo.USP_MODIFICAR_ALA
    1,
    1,
    1
GO

EXECUTE dbo.USP_MODIFICAR_CONTEINER
    1,
    1,
    "Conteiner de teste"
GO

EXECUTE dbo.USP_MODIFICAR_ANIMAL
    1,
    1,
    1,
    2.90,
    "Cor de burro quando volta",
    "Mamalophitecos",
    "Lucas"
GO

EXECUTE dbo.USP_MODIFICAR_HISTORICO_DE_CONSULTA
    1,
    20180057,
    1,
    "2021-10-31 12:00:00"
GO

EXECUTE dbo.USP_MODIFICAR_LIMPEZA
    1,
    1,
    1,
    "2021-10-31 12:00:00"
GO