USE master IF EXISTS(select * from sys.databases where name='bd_seuprojeto') 
DROP DATABASE bd_seuprojeto
GO 
-- CRIAR UM BANCO DE DADOS
CREATE DATABASE bd_seuprojeto
GO
-- ACESSAR O BANCO DE DADOS
USE bd_seuprojeto
GO

CREATE TABLE Usuario
( 
   id            INT			IDENTITY,
   nome          VARCHAR(100)	NOT NULL,
   email         VARCHAR(100)	UNIQUE NOT NULL,
   senha         VARCHAR(100)	NOT NULL,
   nivelAcesso   VARCHAR(10)    NULL, -- ADMIN ou USER
   foto			 VARBINARY(MAX) NULL,
   dataCadastro	 SMALLDATETIME	NOT NULL,
   statusUsuario VARCHAR(20)    NOT NULL, -- ATIVO ou INATIVO ou TROCAR_SENHA

   PRIMARY KEY (id)
)
GO
INSERT Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Fulano da Silva', 'fulano@email.com.br', 'MTIzNDU2Nzg=', 'ADMIN', NULL, GETDATE(), 'ATIVO')
INSERT Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Beltrana de Sá', 'beltrana@email.com.br', 'MTIzNDU2Nzg=', 'USER', NULL, GETDATE(), 'ATIVO')
INSERT Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Sicrana de Oliveira', 'sicrana@email.com.br', 'MTIzNDU2Nzg=', 'USER', NULL, GETDATE(), 'INATIVO')
INSERT Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Ordnael Zurc', 'ordnael@email.com.br', 'MTIzNDU2Nzg=', 'USER', NULL, GETDATE(), 'TROCAR_SENHA')
GO

SELECT * FROM Usuario

--Tabelas:Aluno, administrador, empresa, vaga, perfil profissional, perfil do escolar.

CREATE TABLE Aluno
(
	id_Aluno		INT				IDENTITY,
	nome			VARCHAR(100)	NOT NULL,
	rm				VARCHAR(100)	UNIQUE NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	foto			VARBINARY(MAX)	NULL,
	dataCadastro	SMALLDATETIME	NOT NULL,
	statusAluno		VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id_Aluno)
)
GO
INSERT Aluno (nome, rm, senha, foto, dataCadastro, statusAluno)
VALUES ('Fulano da Silva', 'rm12345@estudante.fieb.edu.br', GETDATE(), 'ATIVO')

INSERT Aluno (nome, rm, senha, foto, dataCadastro, statusUsuario)
VALUES ('Sicrando de Oliveira', 'rm12345','MTIzNDU2Nzg=', NULL,  GETDATE(), 'INATIVO')

INSERT Aluno (nome, rm, senha, foto, dataCadastro, statusUsuario)
VALUES ('Beltrana de Sá', 'rm12345', 'MTIzNDU2Nzg=', , NULL, GETDATE(), 'ATIVO')

GO

SELECT * FROM Aluno

CREATE TABLE Administrador(

	id_Administrador	INT				IDENTITY,
	nome				VARCHAR(100)	NOT NULL,
	senha				VARCHAR(100)	NOT NULL,
	email				VARCHAR(100)	NOT NULL,
	dataCadastro		SMALLDATETIME	NOT NULL,
	statusAdministrador	VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id_Administrador)
)
GO

INSERT Aluno (nome, email, senha, foto, dataCadastro, statusAluno)
VALUES ('Julia da Silva', 'user1@gmail.com', GETDATE(), 'ATIVO')

INSERT Aluno (nome, email, senha, foto, dataCadastro, statusUsuario)
VALUES ('José de Oliveira', 'user2gmail.com','MTIzNDU2Nzg=',  GETDATE(), 'INATIVO')

INSERT Aluno (nome, email, senha, foto, dataCadastro, statusUsuario)
VALUES ('João de Oliveira', 'user3@gmail.com', 'MTIzNDU2Nzg=', GETDATE(), 'ATIVO')

SELECT * FROM Administrador

GO



