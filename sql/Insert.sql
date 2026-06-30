-- Entidades Fortes

CREATE TABLE Continente (
    Nome VARCHAR(50) PRIMARY KEY,
    Descricao TEXT,
    Clima VARCHAR(50),
    Tipo_Producao VARCHAR(100)
);

CREATE TABLE Raca (
    Nome VARCHAR(50) PRIMARY KEY,
    Caracteristicas TEXT
);

CREATE TABLE Profissao (
    Nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Profecia (
    Id_profecia SERIAL PRIMARY KEY,
    Nome VARCHAR(80),
    descricao TEXT,
    origem VARCHAR(50)
);



-- Entidades com Dependências Simples

CREATE TABLE Morte (
    ID SERIAL PRIMARY KEY,
    data_morte int, -- data da morte em ANO
    descricao TEXT,
    Localizacao VARCHAR(100)
);

CREATE TABLE Cidade (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL,
    Data_Construcao int, -- data da construcao em ANO
    Historia TEXT,
    
    -- chave estrangeira
    IDMorte INT,
    CONSTRAINT fk_cidade_morte FOREIGN KEY (IDMorte) REFERENCES Morte(ID)
);

CREATE TABLE Casa (
    Nome VARCHAR(50) PRIMARY KEY,
    Bandeira VARCHAR(100),
    Lema_da_casa VARCHAR(150),

    -- chaves estrangeiras
    IDCidade INT,
    IDCidade_capital INT,
    CONSTRAINT fk_casa_cidade FOREIGN KEY (IDCidade) REFERENCES Cidade(ID),
    CONSTRAINT fk_casa_cidade_capital FOREIGN KEY (IDCidade_capital) REFERENCES Cidade(ID)
);

CREATE TABLE Personagem (
    CODIGO SERIAL PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL,

    -- representação de tipo
    tipo_personagem CHAR(1) CHECK (tipo_personagem IN ('H', 'N')),
    IDMorte int,
    CONSTRAINT fk_personagem_morte FOREIGN KEY (IDMorte) REFERENCES Morte(ID)   
);

CREATE TABLE Humanos(
    Codigo_Personagem INT PRIMARY KEY, -- Coluna essencial que estava faltando
    Sobrenome VARCHAR(50),
    Cor_olhos VARCHAR(20),
    Cor_cabelo VARCHAR(20),
    Genero CHAR(1) CHECK (Genero IN ('M', 'F')),
    Data_nascimento int, -- data de nascimento em ANO

    NomeRaca VARCHAR(50),
    IDCidade INT,
    CONSTRAINT fk_humanos_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO),
    CONSTRAINT fk_humanos_raca FOREIGN KEY (NomeRaca) REFERENCES Raca(Nome),
    CONSTRAINT fk_humanos_cidade FOREIGN KEY (IDCidade) REFERENCES Cidade(ID)
);

CREATE TABLE Nao_Humanos (
    Codigo_personagem INT PRIMARY KEY,
    Nome varchar(80),
    Especie VARCHAR(50),
    
    CONSTRAINT fk_nao_humanos_personagem FOREIGN KEY (Codigo_personagem) REFERENCES Personagem(CODIGO)
);