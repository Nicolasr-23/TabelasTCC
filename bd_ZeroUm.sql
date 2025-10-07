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
   id                   INT             IDENTITY,
   nome                 VARCHAR(100)    NOT NULL,
   email                VARCHAR(100)    UNIQUE NOT NULL,
   senha                VARBINARY(64)   NOT NULL, -- Senha armazenada com hash
   nivelAcesso          VARCHAR(10)     NULL, -- ADMIN, ALUNO ou EMPRESA
   foto                 VARBINARY(MAX)  NULL,
   dataCadastro         SMALLDATETIME   NOT NULL,
   statusUsuario        VARCHAR(20)     NOT NULL, -- ATIVO, INATIVO ou TROCAR_SENHA
 
   PRIMARY KEY (id)
);
GO
 
-- Inserir dados na tabela Usuario
-- Senha codificada com HASHBYTES(SHA2_256, 'senha')
INSERT INTO Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES 
('Fulano da Silva', 'fulano@email.com.br', HASHBYTES('SHA2_256', 'senha123'), 'ADMIN', NULL, GETDATE(), 'ATIVO'),
('Beltrana de Sá', 'beltrana@email.com.br', HASHBYTES('SHA2_256', 'senha123'), 'ALUNO', NULL, GETDATE(), 'ATIVO'),
('Sicrana de Oliveira', 'sicrana@email.com.br', HASHBYTES('SHA2_256', 'senha123'), 'ALUNO', NULL, GETDATE(), 'INATIVO'),
('Ordnael Zurc', 'ordnael@email.com.br', HASHBYTES('SHA2_256', 'senha123'), 'ALUNO', NULL, GETDATE(), 'TROCAR_SENHA');
GO
 

CREATE TABLE Aluno
(
   id                   INT             IDENTITY,
   usuario_id           INT             NOT NULL,
   nome                 VARCHAR(100)    NOT NULL,
   rm                   VARCHAR(10)     UNIQUE NOT NULL,
   curso                VARCHAR(50)     NOT NULL,
   conclusao            VARCHAR(20)     NOT NULL, -- DEZEMBRO/2026
   curriculo            VARBINARY(MAX)  NULL,
   dataNascimento       DATE            NOT NULL,
   dataCadastro         SMALLDATETIME   NOT NULL,
   statusAluno          VARCHAR(20)     NOT NULL,
 
   PRIMARY KEY (id),
   FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);
GO
 

INSERT INTO Aluno (usuario_id, nome, rm, curso, conclusao, dataNascimento, dataCadastro, statusAluno)
VALUES 
(1, 'João Oliveira', 'rm12345', 'Informática', 'DEZEMBRO/2026', '2006-08-15', GETDATE(), 'INATIVO'),
(2, 'Cleiton dos Santos', 'rm12346', 'Informática', 'DEZEMBRO/2026', '2006-07-22', GETDATE(), 'ATIVO'),
(3, 'Jorge da Silva', 'rm12347', 'Informática', 'DEZEMBRO/2026', '2006-09-10', GETDATE(), 'ATIVO');
GO
 

CREATE TABLE Empresa
(
   id                   INT             IDENTITY,
   usuario_id           INT             NOT NULL,
   nome                 VARCHAR(100)    NOT NULL,
   cnpj                 VARCHAR(18)     UNIQUE NOT NULL,
   informacao           VARCHAR(300)    NOT NULL,
   cep                  CHAR(8)         NOT NULL,
   numero               VARCHAR(10)     NOT NULL,
   webSite              VARCHAR(50)     NULL,
   telefone             VARCHAR(20)     NOT NULL,
   dataCadastro         SMALLDATETIME   NOT NULL,
   statusEmpresa        VARCHAR(20)     NOT NULL,
 
   PRIMARY KEY (id),
   FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);
GO
 

INSERT INTO Empresa (usuario_id, nome, cnpj, informacao, cep, numero, webSite, telefone, dataCadastro, statusEmpresa)
VALUES 
(2, 'InovaTech', '11.222.333/0001-81', 'Sede administrativa', '12345678', '200', 'https://inovatech.com', '11999990000', GETDATE(), 'INATIVO'),
(3, 'CodeStorm', '11.222.333/0001-82', 'Escritório central', '12345678', '210', 'https://codestorm.com', '11988880000', GETDATE(), 'INATIVO'),
(4, 'Biotec Pharma', '11.222.333/0001-83', 'Laboratório principal', '12345678', '220', 'https://biotecpharma.com', '11987770000', GETDATE(), 'INATIVO');
GO
 

CREATE TABLE Vaga
(
   id                   INT             IDENTITY,
   empresa_id           INT             NOT NULL,
   nome                 VARCHAR(100)    NOT NULL,
   descricao            VARCHAR(500)    NOT NULL,
   cidade               VARCHAR(100)    NULL,
   bairro               VARCHAR(100)    NULL,
   cargaHoraria         VARCHAR(100)    NULL,
   salario              VARCHAR(100)    NULL,
   area                 VARCHAR(100)    NOT NULL,
   dataCadastro         SMALLDATETIME   NOT NULL,
   statusVaga           VARCHAR(20)     NOT NULL,
 
   PRIMARY KEY (id),
   FOREIGN KEY (empresa_id) REFERENCES Empresa(id)
);
GO
 

INSERT INTO Vaga (empresa_id, nome, descricao, cidade, bairro, cargaHoraria, salario, area, dataCadastro, statusVaga)
VALUES 
(1, 'Vaga X', 'Desenvolvedor web', 'São Paulo', 'Centro', '30 horas', '600 reais', 'Informática', GETDATE(), 'ATIVO'),
(2, 'Vaga Y', 'Engenheiro de software', 'Campinas', 'Taquaral', '29 horas', '700 reais', 'Informática', GETDATE(), 'ATIVO'),
(3, 'Vaga Z', 'Analista de sistemas', 'Santos', 'Ponta da Praia', '35 horas', '750 reais', 'Informática', GETDATE(), 'ATIVO');
GO
 

CREATE TABLE ContatoAluno
(
   id                   INT             IDENTITY,
   aluno_id             INT             NOT NULL,
   nomeContato          VARCHAR(50)     NOT NULL,
   link                 VARCHAR(200)    NOT NULL,
 
   PRIMARY KEY (id),
   FOREIGN KEY (aluno_id) REFERENCES Aluno(id)
);
GO
 

INSERT INTO ContatoAluno(aluno_id, nomeContato, link)
VALUES
(1, 'estudante1@gmail.com', 'www.githubJoão.com' ),
(2, 'estudante2@gmail.com', 'www.linkedinCleiton.com'),
(3, 'estudante3@gmail.com', 'www.linkedinJorge.com');
GO


CREATE TABLE Candidatura
(
   id                   INT             IDENTITY,
   aluno_id             INT             NOT NULL,
   vaga_id              INT             NOT NULL,
   data_cadastro       SMALLDATETIME   NOT NULL,
   status_candidatura  VARCHAR(20)     NOT NULL,
   
   PRIMARY KEY (id),
   FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
   FOREIGN KEY (vaga_id)  REFERENCES Vaga(id)
);
GO
 

SELECT * FROM Usuario;
SELECT * FROM Aluno;
SELECT * FROM Empresa;
SELECT * FROM Vaga;
SELECT * FROM ContatoAluno;
SELECT * FROM Candidatura;
