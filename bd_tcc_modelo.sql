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
   nivelAcesso   VARCHAR(10)    NULL, -- ADMIN ou ALUNO ou EMPRESA
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
	id				INT			IDENTITY,
	usuario_id		INT			NOT NULL,
	nome			VARCHAR(100)	NOT NULL,
	rm				VARCHAR(10)		UNIQUE NOT NULL,
	curso			VARCHAR(20)		NOT NULL,
	formacao		VARCHAR(20)		NOT NULL, -- DEZEMBRO/2026
	dataNascimento	DATE			NOT NULL,
	dataCadastro	SMALLDATETIME	NOT NULL,
	statusAluno		VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (usuario_id) REFERENCES Usuario (id)
)
GO
INSERT Aluno (nome, rm, senha, foto, dataCadastro, statusAluno)
VALUES ('João Oliveira', 'rm12345', 'MTIzNDU2Nzg=', NULL, GETDATE(), 'INATIVO')

INSERT Aluno (nome, rm, senha, foto, dataCadastro, statusAluno)
VALUES ('Cleiton dos Santos', 'rm12345','MTIzNDU2Nzg=', NULL,  GETDATE(), 'ATIVO')

INSERT Aluno (nome, rm, senha, foto, dataCadastro, statusAluno)
VALUES ('Jorge da Silva', 'rm12345', 'MTIzNDU2Nzg=', NULL, GETDATE(), 'ATIVO')

GO




GO

CREATE TABLE Empresa(
	id				INT				IDENTITY,
	usuario_id		INT				NOT NULL,
	nome			VARCHAR(100)	NOT NULL,
	cnpj			VARCHAR(18)		UNIQUE NOT NULL,
	complemento		VARCHAR(300)	NOT NULL,
	cep				CHAR(8)			NOT NULL,
	numero			VARCHAR(10)		NOT NULL,
	webSite			VARCHAR(50)		NULL,
	telefone		VARCHAR(20)		NOT NULL,
	dataCadastro	SMALLDATETIME	NOT NULL,
	statusEmpresa	VARCHAR(20)		NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (usuario_id) REFERENCES Usuario (id)

)
GO

INSERT Empresa (nome, senha, email, cnpj, endereço, dataCadastro, statusEmpresa)
VALUES ('InovaTech', 'MTIzNDU2Nzg=', 'Inovatech@gmail.com', '11.222.333/0001-81', 'Avenida dos Girassóis N°200', GETDATE() , 'INATIVO')

INSERT Empresa (nome, senha, email, cnpj, endereço, dataCadastro, statusEmpresa)
VALUES ('CodeStorm', 'MTIzNDU2Nzg=', 'CodeStorm@gmail.com', '12.345.678/0001-95', 'Rua São Benedito N°384', GETDATE() , 'ATIVO')

INSERT Empresa (nome, senha, email, cnpj, endereço, dataCadastro, statusEmpresa)
VALUES ('Biotec Pharma'), 'MTIzNDU2Nzg=', 'biotecpharma@gmail.com', '98.765.432/0001-10', 'Rua Marechal Deodoro N°490', GETDATE() , 'INATIVO')

SELECT * FROM Empresa

SELECT * FROM Aluno

CREATE TABLE Vaga(
 
	id				INT		IDENTITY,
	empresa_id		INT		NOT NULL,
	nome			VARCHAR(100)	NOT NULL,
	descricao		VARCHAR(500)	NOT NULL,
	cidade			VARCHAR(100)	NULL,
	bairro			VARCHAR(100)	NULL,
	cargaHoraria	VARCHAR(100)    NULL,
	salario		    VARCHAR(100)	NULL,
	area			VARCHAR(100)	NOT NULL,
	dataCadastro	SMALLDATETIME	NOT NULL,
	statusVaga		VARCHAR(20)		NOT NULL,
 
	PRIMARY KEY (id),
	FOREIGN KEY (empresa_id) REFERENCES Empresa(id)

)
GO
 
INSERT Vaga (nome, descricao, endereco, cargaHoraria, salario, curso, validadeVaga, statusVaga)
VALUES ('Vaga x', 'Desenvolvedor web', 'rua marte 123', '30 horas', '600 reais', 'informática', '2025-2026', 'ATIVO')
 
INSERT Vaga (nome, descricao, endereco, cargaHoraria, salario, curso, validadeVaga)
VALUES ('Vaga y', 'Desenvolvedor front-end','rua terra 748', '20 horas', '700 reais',  'informatica', '2026-2028', 'INATIVO' )
 
INSERT Vaga (nome, descricao, endereco, cargaHoraria, salario, curso, validadeVaga)
VALUES ('Vaga z', 'Desenvolvedor back-end', 'rua lua 709', '20 horas', '900 reais', 'Edificações', '2025-2027', 'ATIVO')
 
SELECT * FROM Vaga
 
GO

CREATE TABLE PerfilAluno(
	id				INT			IDENTITY,
	curso			VARCHAR(20)		NOT NULL,
	ano				CHAR(1)			NOT NULL,
	telefone		CHAR(11)		NOT NULL,
	email			VARCHAR(30)		NOT NULL,
	experiencia		VARCHAR(1000)	NOT NULL,
	statusProf		VARCHAR(20)		NOT NULL,

PRIMARY KEY (id)

)

GO

INSERT PerfilProf(curso, ano, telefone, email, experiencia, statusProf)
VALUES ('informática', '2', '11 90022000', 'estudante@email.com', 'sem experiência', 'ATIVO')

INSERT PerfilProf(curso, ano, telefone, email, experiencia, statusProf)
VALUES ('irformática para Internet', '3', '11 91305000', 'estudante2@email.com', 'Serviço comunitário', 'INATIVO')

INSERT PerfilProf(curso, ano, telefone, email, experiencia, statusProf)
VALUES ('Edficações', '1', '11 92496000', 'estudante3@email.com', 'Participação da Olímpiada de informática 2025', 'INATIVO')
--Descrição, HardSkill, SoftSkill, hisórico.