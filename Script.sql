-- CRIAR A TABELA DE FUNCIONARIO
CREATE TABLE FUNCIONARIO(
	IDFUNCIONARIO		UNIQUEIDENTIFIER	NOT NULL,
	NOME				NVARCHAR(150)		NOT NULL,
	CPF					NVARCHAR(11)		NOT NULL,
	MATRICULA			NVARCHAR(10)		NOT NULL,
	DATAADMISSAO		DATE				NOT NULL,
	DATACADASTRO		DATETIME			NOT NULL,
	DATAULTIMAALTERACAO	DATETIME			NOT NULL,
	PRIMARY KEY(IDFUNCIONARIO))
GO

-- CRIAR A PROCEDURE (ROTINA) PARA REALIZAR 
-- O CADASTRO DE UM FUNCIONÁRIO NA TABELA
CREATE PROCEDURE SP_INSERIR_FUNCIONARIO
	@NOME			NVARCHAR(150), --ARGUMENTO (ENTRADA)
	@CPF			NVARCHAR(11),  --ARGUMENTO (ENTRADA)
	@MATRICULA		NVARCHAR(10),  --ARGUMENTO (ENTRADA)
	@DATAADMISSAO	DATE           --ARGUMENTO (ENTRADA)
AS
BEGIN
	BEGIN TRANSACTION
		INSERT INTO FUNCIONARIO(
			IDFUNCIONARIO,
			NOME,
			CPF,
			MATRICULA,
			DATAADMISSAO,
			DATACADASTRO,
			DATAULTIMAALTERACAO)
		VALUES(
			NEWID(),
			@NOME,
			@CPF,
			@MATRICULA,
			@DATAADMISSAO,
			GETDATE(),
			GETDATE())
	COMMIT
END
GO

-- CRIAR A PROCEDURE (ROTINA) PARA REALIZAR 
-- A ATUALIZAÇ O DE UM FUNCIONÁRIO NA TABELA
CREATE PROCEDURE SP_ALTERAR_FUNCIONARIO
    @IDFUNCIONARIO	UNIQUEIDENTIFIER,	--ARGUMENTO (ENTRADA)
	@NOME			NVARCHAR(150),		--ARGUMENTO (ENTRADA)
	@CPF			NVARCHAR(11),		--ARGUMENTO (ENTRADA)
	@MATRICULA		NVARCHAR(10),		--ARGUMENTO (ENTRADA)
	@DATAADMISSAO	DATE				--ARGUMENTO (ENTRADA)
AS
BEGIN
	BEGIN TRANSACTION
		UPDATE FUNCIONARIO SET
			NOME = @NOME,
			CPF = @CPF,
			MATRICULA = @MATRICULA,
			DATAADMISSAO = @DATAADMISSAO,
			DATAULTIMAALTERACAO = GETDATE()
		WHERE
			IDFUNCIONARIO = @IDFUNCIONARIO
	COMMIT
END
GO

-- CRIAR A PROCEDURE (ROTINA) PARA REALIZAR 
-- A EXCLUSÃO DE UM FUNCIONÁRIO NA TABELA
CREATE PROCEDURE SP_EXCLUIR_FUNCIONARIO
    @IDFUNCIONARIO	UNIQUEIDENTIFIER	--ARGUMENTO (ENTRADA)
AS
BEGIN
	BEGIN TRANSACTION
		DELETE FROM FUNCIONARIO
		WHERE
			IDFUNCIONARIO = @IDFUNCIONARIO
	COMMIT
END
GO

-- CRIAR A PROCEDURE (ROTINA) PARA REALIZAR 
-- A CONSULTA DE TODOS OS FUNCIONÁRIOS DA TABELA
CREATE PROCEDURE SP_CONSULTAR_FUNCIONARIOS
AS
BEGIN
	SELECT * FROM FUNCIONARIO
	ORDER BY NOME ASC
END
GO

-- CRIAR A PROCEDURE (ROTINA) PARA REALIZAR 
-- A CONSULTA DE 1 FUNCIONÁRIOS ATRAVÉS DO ID
CREATE PROCEDURE SP_OBTER_FUNCIONARIO
	@IDFUNCIONARIO		UNIQUEIDENTIFIER
AS
BEGIN
	SELECT * FROM FUNCIONARIO
	WHERE IDFUNCIONARIO = @IDFUNCIONARIO
END
GO
