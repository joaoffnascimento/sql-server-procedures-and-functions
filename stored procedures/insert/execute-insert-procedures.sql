EXECUTE dbo.USP_CRIAR_CIDADE
    1,
    "Lagarto"
GO

EXECUTE dbo.USP_CRIAR_CARGO
    1,
    "Especialista em repteis",
    3000
GO


EXECUTE dbo.USP_CRIAR_ENDERECO
    1,
    1,
    "Rua Coronel Souza Freire",
    "Centro",
    164
GO

EXECUTE dbo.USP_CRIAR_FUNCIONARIO
    20180057,
    1,
    1,
    20686387,
    "07293475599",
    123456,
    "Rayssa",
    "1998-08-14 12:00:00"
GO

EXECUTE dbo.USP_CRIAR_CLASSE
    1,
    "Aves",
    "Local que possui as mais belas aves do planetaaa."
GO

EXECUTE dbo.USP_CRIAR_ALA
    1,
    1,
    1
GO

EXECUTE dbo.USP_CRIAR_CONTEINER
    1,
    1,
    "Conteiner de teste"
GO

EXECUTE dbo.USP_CRIAR_ANIMAL
    1,
    1,
    1,
    1.75,
    "Cor de burro quando foge",
    "australopithecus",
    "Jão"
GO

EXECUTE dbo.USP_CRIAR_HISTORICO_DE_CONSULTA
    1,
    20180057,
    1,
    "2020-10-31 12:00:00"
GO

EXECUTE dbo.USP_CRIAR_LIMPEZA
    1,
    1,
    1,
    "2020-10-31 12:00:00"
GO

EXECUTE dbo.USP_CRIAR_ACOMPANHA
    1,
    20180057
GO