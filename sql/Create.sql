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
    Codigo_Personagem INT PRIMARY KEY,
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


--  Entidades com Dependências Complexas e Entidades Fracas

CREATE TABLE Alianca (
    Nome VARCHAR(100) PRIMARY KEY,
    Data_Inicio INT, -- Representando o ano
    Data_fim INT
);

CREATE TABLE Guerra (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Data_inicio INT,
    Data_fim INT 
);

CREATE TABLE Arma(
    ID SERIAL PRIMARY KEY,  
    Nome VARCHAR(50),
    Tipo VARCHAR(50),
    Material VARCHAR(50),

    Nome_Casa VARCHAR(50),
    CONSTRAINT fk_arma_casa FOREIGN KEY (Nome_Casa) REFERENCES Casa(Nome)
);

CREATE TABLE Dragao(
    Nome VARCHAR(50) PRIMARY KEY,
    Cor VARCHAR(30),
    Tamanho VARCHAR(30),
    Estado VARCHAR(15) CHECK (Estado IN ('Vivo', 'Morto', 'Desaparecido')),

    NomePersonagem INT,
    ID_Morte int,
    CONSTRAINT fk_dragao_personagem FOREIGN KEY (NomePersonagem) REFERENCES Personagem(CODIGO),
    CONSTRAINT fk_dragao_morte FOREIGN KEY (ID_Morte) REFERENCES Morte(ID)
);

CREATE TABLE Batalha(
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Localizacao VARCHAR(100),
    Impacto TEXT, 

    NomeDragao VARCHAR(50),
    ID_Guerra INT,
    CONSTRAINT fk_batalha_dragao FOREIGN KEY (NomeDragao) REFERENCES Dragao(Nome),
    CONSTRAINT fk_batalha_guerra FOREIGN KEY (ID_Guerra) REFERENCES Guerra(ID)
);

CREATE TABLE Reino(
    Nome VARCHAR(50) PRIMARY KEY,
    Descricao TEXT,
    Tipo_Governo VARCHAR(30),

    -- chaves estrangeiras
    IDCidade_Capital INT,
    NomeContinente VARCHAR(50),
    NomeCasa VARCHAR(50),

    IDPersonagem INT,
    Data_Inicio_Governo INT,
    Data_Fim_Governo INT,
    Predecessor_Governo INT,
    Sucessor_Governo INT,

    CONSTRAINT fk_reino_cidade_capital FOREIGN KEY (IDCidade_Capital) REFERENCES Cidade(ID),
    CONSTRAINT fk_reino_continente FOREIGN KEY (NomeContinente) REFERENCES Continente(Nome),
    CONSTRAINT fk_reino_casa FOREIGN KEY (NomeCasa) REFERENCES Casa(Nome), 
    CONSTRAINT fk_reino_personagem FOREIGN KEY (IDPersonagem) REFERENCES Personagem(CODIGO), 
    CONSTRAINT fk_reino_predecessor FOREIGN KEY (Predecessor_Governo) REFERENCES Personagem(CODIGO), 
    CONSTRAINT fk_reino_sucessor FOREIGN KEY (Sucessor_Governo) REFERENCES Personagem(CODIGO) 
);

CREATE TABLE Animais(
    Nome VARCHAR(50),
    Codigo INT, -- FK que vira parte da PK
    AnoNas INT,
    AnoMorte INT,
    Especie VARCHAR(50),
    
    -- Chave Primária Composta (exigência da Entidade Fraca)
    PRIMARY KEY (Nome, Codigo),
    CONSTRAINT fk_animais_personagem FOREIGN KEY (Codigo) REFERENCES Personagem(Codigo)
);  