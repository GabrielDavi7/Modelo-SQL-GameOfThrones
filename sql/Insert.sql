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