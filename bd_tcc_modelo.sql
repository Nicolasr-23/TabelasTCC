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
VALUES ('João Oliveira', 'rm12345', 'MTIzNDU2Nzg=', NULL, GETDATE(), 'INATIVO')

INSERT Aluno (nome, rm, senha, foto, dataCadastro, statusAluno)
VALUES ('Cleiton dos Santos', 'rm12345','MTIzNDU2Nzg=', NULL,  GETDATE(), 'ATIVO')

INSERT Aluno (nome, rm, senha, foto, dataCadastro, statusAluno)
VALUES ('Jorge da Silva', 'rm12345', 'MTIzNDU2Nzg=', NULL, GETDATE(), 'ATIVO')

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

INSERT Administrador(nome, email, senha, dataCadastro, statusAdministrador)
VALUES ('Julia da Silva', 'user1@gmail.com','MTIzNDU2Nzg=', GETDATE(), 'ATIVO')

INSERT Administrador (nome, email, senha, dataCadastro, statusAdministrador)
VALUES ('José de Oliveira', 'user2gmail.com','MTIzNDU2Nzg=',  GETDATE(), 'INATIVO')

INSERT Administrador(nome, email, senha, dataCadastro, statusAdministrador)
VALUES ('Carlos de Oliveira', 'user3@gmail.com', 'MTIzNDU2Nzg=', GETDATE(), 'ATIVO')

SELECT * FROM Administrador

GO

CREATE TABLE Empresa(
	id_Empresa		INT				IDENTITY,
	nome			VARCHAR(100)	NOT NULL,
	senha			VARCHAR(100)	NOT NULL,
	email			VARCHAR(100)	NOT NULL,
	cnpj			VARCHAR(18)		UNIQUE NOT NULL,
	endereço		VARCHAR(300)	NOT NULL,
	dataCadastro	SMALLDATETIME	NOT NULL,
	statusEmpresa	VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id_Empresa)
)
GO

INSERT Empresa (nome, senha, email, cnpj, endereço, dataCadastro, statusEmpresa)
VALUES ('InovaTech'), 'MTIzNDU2Nzg=', 'Inovatech@gmail.com', '11.222.333/0001-81', 'Avenida dos Girassóis N°200', GETDATE() , 'INATIVO')

INSERT Empresa (nome, senha, email, cnpj, endereço, dataCadastro, statusEmpresa)
VALUES ('CodeStorm'), 'MTIzNDU2Nzg=', 'CodeStorm@gmail.com', '12.345.678/0001-95', 'Rua São Benedito N°384', GETDATE() , 'ATIVO')

INSERT Empresa (nome, senha, email, cnpj, endereço, dataCadastro, statusEmpresa)
VALUES ('Biotec Pharma'), 'MTIzNDU2Nzg=', 'biotecpharma@gmail.com', '98.765.432/0001-10', 'Rua Marechal Deodoro N°490', GETDATE() , 'INATIVO')

SELECT * FROM Empresa
