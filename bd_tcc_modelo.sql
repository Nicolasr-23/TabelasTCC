USE master;
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'bd_ZeroUm') 
BEGIN
    DROP DATABASE bd_ZeroUm;
END;
GO
 
-- Criar o banco de dados
CREATE DATABASE bd_ZeroUm;
GO
 
-- Acessar o banco de dados
USE bd_ZeroUm;
GO
 
-- Criar a tabela Usuario
CREATE TABLE Usuario
( 
   id            INT			IDENTITY,
   nome          VARCHAR(100)	NOT NULL,
   email         VARCHAR(100)	UNIQUE NOT NULL,
   senha         VARCHAR(100)	NOT NULL,
   nivelAcesso   VARCHAR(10)    NULL, -- ADMIN, ALUNO ou EMPRESA
   foto			 VARBINARY(MAX) NULL,
   dataCadastro	 SMALLDATETIME	NOT NULL,
   statusUsuario VARCHAR(20)    NOT NULL, -- ATIVO, INATIVO ou TROCAR_SENHA
 
   PRIMARY KEY (id)
);
GO
 
-- Inserir dados na tabela Usuario
INSERT INTO Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES 
('Fulano da Silva', 'fulano@email.com.br', 'MTIzNDU2Nzg=', 'ADMIN', NULL, GETDATE(), 'ATIVO'),
('Beltrana de Sá', 'beltrana@email.com.br', 'MTIzNDU2Nzg=', 'ALUNO', NULL, GETDATE(), 'ATIVO'),
('Sicrana de Oliveira', 'sicrana@email.com.br', 'MTIzNDU2Nzg=', 'ALUNO', NULL, GETDATE(), 'INATIVO'),
('Ordnael Zurc', 'ordnael@email.com.br', 'MTIzNDU2Nzg=', 'ALUNO', NULL, GETDATE(), 'TROCAR_SENHA');
GO
 
-- Selecionar dados da tabela Usuario
SELECT * FROM Usuario;
 
-- Criar a tabela Aluno
CREATE TABLE Aluno
(
   id				INT				IDENTITY,
   usuario_id		INT				NOT NULL,
   nome				VARCHAR(100)	NOT NULL,
   rm				VARCHAR(10)		UNIQUE NOT NULL,
   curso			VARCHAR(20)		NOT NULL,
   conclusao		VARCHAR(20)		NOT NULL, -- DEZEMBRO/2026
   curriculo		VARBINARY(MAX)	NULL,
   dataNascimento	DATE			NOT NULL,
   dataCadastro		SMALLDATETIME	NOT NULL,
   statusAluno		VARCHAR(20)		NOT NULL,
 
   PRIMARY KEY (id),
   FOREIGN KEY (usuario_id) REFERENCES Usuario (id)
);
GO
 
-- Inserir dados na tabela Aluno
INSERT Aluno (usuario_id, nome, rm, curso, conclusao, dataNascimento, dataCadastro, statusAluno)
VALUES 
(1, 'João Oliveira', 'rm12345', 'Informática', 'DEZEMBRO/2026', '2006-08-15', GETDATE(), 'INATIVO'),
(2, 'Cleiton dos Santos', 'rm12346', 'Informática', 'DEZEMBRO/2026', '2006-07-22', GETDATE(), 'ATIVO'),
(3, 'Jorge da Silva', 'rm12347', 'Informática', 'DEZEMBRO/2026', '2006-09-10', GETDATE(), 'ATIVO')
 
-- Criar a tabela Empresa
CREATE TABLE Empresa
(
   id				INT				IDENTITY,
   usuario_id		INT				NOT NULL,
   nome				VARCHAR(100)	NOT NULL,
   cnpj				VARCHAR(18)		UNIQUE NOT NULL,
   informacao		VARCHAR(300)	NOT NULL,
   cep				CHAR(8)			NOT NULL,
   numero			VARCHAR(10)		NOT NULL,
   webSite			VARCHAR(50)		NULL,
   telefone			VARCHAR(20)		NOT NULL,
   dataCadastro		SMALLDATETIME	NOT NULL,
   statusEmpresa	VARCHAR(20)		NOT NULL,
 
   PRIMARY KEY (id),
   FOREIGN KEY (usuario_id) REFERENCES Usuario (id)
);
GO
 
-- Inserir dados na tabela Empresa
INSERT Empresa (usuario_id, nome, cnpj, informacao, cep, numero, webSite, telefone, dataCadastro, statusEmpresa)
VALUES 
(4,'InovaTech', '11.222.333/0001-81', 'Sede administrativa', '12345678', '200', 'https://inovatech.com', '11999990000', GETDATE(), 'INATIVO'),
(5, 'CodeStorm', '11.222.333/0001-82', 'Escritório central', '12345678', '210', 'https://codestorm.com', '11988880000', GETDATE(), 'INATIVO'),
(6, 'Biotec Pharma', '11.222.333/0001-83', 'Laboratório principal', '12345678', '220', 'https://biotecpharma.com', '11987770000', GETDATE(), 'INATIVO')
 
-- Criar a tabela Vaga
CREATE TABLE Vaga
(
   id				INT				IDENTITY,
   empresa_id		INT				NOT NULL,
   nome				VARCHAR(100)	NOT NULL,
   descricao		VARCHAR(500)	NOT NULL,
   cidade			VARCHAR(100)	NULL,
   bairro			VARCHAR(100)	NULL,
   cargaHoraria		VARCHAR(100)    NULL,
   salario		    VARCHAR(100)	NULL,
   area				VARCHAR(100)	NOT NULL,
   dataCadastro		SMALLDATETIME	NOT NULL,
   statusVaga		VARCHAR(20)		NOT NULL,
 
   PRIMARY KEY (id),
   FOREIGN KEY (empresa_id) REFERENCES Empresa(id)
);
GO
 
-- Inserir dados na tabela Vaga
INSERT Vaga (empresa_id, nome, descricao, cidade, bairro, cargaHoraria, salario, area, dataCadastro, statusVaga)
VALUES 
(1, 'Vaga X', 'Desenvolvedor web', 'São Paulo', 'Centro', '30 horas', '600 reais', 'Informática', GETDATE(), 'ATIVO'),
(2, 'Vaga Y', 'Engenheiro de software', 'Campinas', 'Taquaral', '29 horas', '700 reais', 'Informática', GETDATE(), 'ATIVO'),
(3, 'Vaga Z', 'Analista de sistemas', 'Santos', 'Ponta da Praia', '35 horas', '750 reais', 'Informática', GETDATE(), 'ATIVO')
 
 
-- Criar a tabela PerfilAluno
CREATE TABLE ContatoAluno
(
   id					INT				IDENTITY,
   aluno_id				INT				NOT NULL,
   nomeContato			VARCHAR(50)		NOT NULL,
   link					VARCHAR(200)	NOT NULL,
 
   PRIMARY KEY (id),
   FOREIGN KEY (Aluno_id) REFERENCES Aluno (id)
);
GO
 
-- Inserir dados na tabela PerfilAluno
INSERT ContatoAluno(aluno_id, nomeContato, link)
VALUES 
('Informática', '2', '11900220000', 'estudante@email.com', 'Sem experiência', 'ATIVO'),
('Informática para Internet', '3', '11913050000', 'estudante2@email.com', 'Serviço comunitário', 'INATIVO'),
('Edificações', '1', '11924960000', 'estudante3@email.com', 'Participação na Olimpíada de Informática 2025', 'INATIVO')
GO

CREATE TABLE Candidatura
(
   id					INT				IDENTITY,
   aluno_id				INT				NOT NULL,
   vaga_id				INT				NOT NULL,
   data_cadastro		SMALLDATETIME	NOT NULL,
   status_candidatura	VARCHAR(20)		NOT NULL,
   
 
   PRIMARY KEY (id),
   FOREIGN KEY (aluno_id) REFERENCES Aluno (id),
   FOREIGN KEY (vaga_id)  REFERENCES Vaga (id)
);
GO
 
-- Selecionar dados das tabelas criadas
SELECT * FROM Usuario;
SELECT * FROM Aluno;
SELECT * FROM Empresa;
SELECT * FROM Vaga;
SELECT * FROM ContatoAluno;
SELECT * FROM Candidatura
