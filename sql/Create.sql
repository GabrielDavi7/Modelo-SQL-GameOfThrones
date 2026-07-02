-- ENTIDADES FORTES

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
    Nome VARCHAR(80) NOT NULL, 
    descricao TEXT,
    origem VARCHAR(50)
);

-- ENTIDADES COM DEPENDÊNCIAS SIMPLES

CREATE TABLE Morte (
    ID SERIAL PRIMARY KEY,
    data_morte INT CHECK (data_morte > 0), 
    descricao TEXT,
    Localizacao VARCHAR(100)
);

CREATE TABLE Cidade (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL,
    Data_Construcao INT, 
    Historia TEXT,
    IDMorte INT,
    CONSTRAINT fk_cidade_morte FOREIGN KEY (IDMorte) REFERENCES Morte(ID) ON DELETE SET NULL
);

CREATE TABLE Reino (
    Nome VARCHAR(50) PRIMARY KEY,
    Descricao TEXT,
    Tipo_Governo VARCHAR(30) DEFAULT 'Monarquia', 
    IDCidade_Capital INT,
    NomeContinente VARCHAR(50),
    IDPersonagem INT,
    Data_Inicio_Governo INT,
    Data_Fim_Governo INT,
    Predecessor_Governo INT,
    Sucessor_Governo INT,
    CONSTRAINT ck_reino_datas CHECK (Data_Fim_Governo >= Data_Inicio_Governo), 
    CONSTRAINT fk_reino_cidade_capital FOREIGN KEY (IDCidade_Capital) REFERENCES Cidade(ID) ON DELETE SET NULL,
    CONSTRAINT fk_reino_continente FOREIGN KEY (NomeContinente) REFERENCES Continente(Nome) ON DELETE SET NULL
);

CREATE TABLE Casa (
    Nome VARCHAR(50) PRIMARY KEY,
    Bandeira VARCHAR(100),
    Lema_da_casa VARCHAR(150),
    IDCidade INT,
    IDCidade_capital INT,
    NomeReino VARCHAR(50),
    CONSTRAINT fk_casa_cidade FOREIGN KEY (IDCidade) REFERENCES Cidade(ID) ON DELETE SET NULL,
    CONSTRAINT fk_casa_cidade_capital FOREIGN KEY (IDCidade_capital) REFERENCES Cidade(ID) ON DELETE SET NULL,
    CONSTRAINT fk_casa_reino FOREIGN KEY (NomeReino) REFERENCES Reino(Nome) ON DELETE SET NULL
);

-- Resolvendo dependência circular do Reino com a Casa
ALTER TABLE Reino ADD COLUMN NomeCasa VARCHAR(50);
ALTER TABLE Reino ADD CONSTRAINT fk_reino_casa FOREIGN KEY (NomeCasa) REFERENCES Casa(Nome) ON DELETE SET NULL;

CREATE TABLE Personagem (
    CODIGO SERIAL PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL,
    tipo_personagem CHAR(1) DEFAULT 'H' CHECK (tipo_personagem IN ('H', 'N')), 
    IDMorte INT,
    CONSTRAINT fk_personagem_morte FOREIGN KEY (IDMorte) REFERENCES Morte(ID) ON DELETE SET NULL
);

-- Resolvendo dependências circulares do Reino com Personagem
ALTER TABLE Reino ADD CONSTRAINT fk_reino_personagem FOREIGN KEY (IDPersonagem) REFERENCES Personagem(CODIGO) ON DELETE SET NULL;
ALTER TABLE Reino ADD CONSTRAINT fk_reino_predecessor FOREIGN KEY (Predecessor_Governo) REFERENCES Personagem(CODIGO) ON DELETE SET NULL;
ALTER TABLE Reino ADD CONSTRAINT fk_reino_sucessor FOREIGN KEY (Sucessor_Governo) REFERENCES Personagem(CODIGO) ON DELETE SET NULL;

CREATE TABLE Humanos (
    Codigo_Personagem INT PRIMARY KEY,
    Sobrenome VARCHAR(50),
    Cor_olhos VARCHAR(20),
    Cor_cabelo VARCHAR(20),
    Genero CHAR(1) CHECK (Genero IN ('M', 'F')),
    Data_nascimento INT, 
    NomeRaca VARCHAR(50),
    IDCidade INT,
    CONSTRAINT fk_humanos_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE, 
    CONSTRAINT fk_humanos_raca FOREIGN KEY (NomeRaca) REFERENCES Raca(Nome) ON DELETE SET NULL,
    CONSTRAINT fk_humanos_cidade FOREIGN KEY (IDCidade) REFERENCES Cidade(ID) ON DELETE SET NULL
);

CREATE TABLE Nao_Humanos (
    Codigo_personagem INT PRIMARY KEY,
    Nome VARCHAR(80),
    Especie VARCHAR(50),
    CONSTRAINT fk_nao_humanos_personagem FOREIGN KEY (Codigo_personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE 
);

-- ENTIDADES COM DEPENDÊNCIAS COMPLEXAS E ENTIDADES FRACAS

CREATE TABLE Alianca (
    Nome VARCHAR(100) PRIMARY KEY,
    Data_Inicio INT, 
    Data_fim INT
);

CREATE TABLE Guerra (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(100) UNIQUE, 
    Data_inicio INT,
    Data_fim INT 
);

CREATE TABLE Arma (
    ID SERIAL PRIMARY KEY,  
    Nome VARCHAR(50),
    Tipo VARCHAR(50),
    Material VARCHAR(50),
    Nome_Casa VARCHAR(50),
    CONSTRAINT fk_arma_casa FOREIGN KEY (Nome_Casa) REFERENCES Casa(Nome) ON DELETE SET NULL
);

CREATE TABLE Dragao (
    Nome VARCHAR(50) PRIMARY KEY,
    Cor VARCHAR(30),
    Tamanho VARCHAR(30),
    Estado VARCHAR(15) DEFAULT 'Vivo' CHECK (Estado IN ('Vivo', 'Morto', 'Desaparecido')), 
    NomePersonagem INT,
    ID_Morte INT,
    CONSTRAINT fk_dragao_personagem FOREIGN KEY (NomePersonagem) REFERENCES Personagem(CODIGO) ON DELETE SET NULL,
    CONSTRAINT fk_dragao_morte FOREIGN KEY (ID_Morte) REFERENCES Morte(ID) ON DELETE SET NULL
);

CREATE TABLE Batalha (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Localizacao VARCHAR(100),
    Impacto TEXT, 
    NomeDragao VARCHAR(50),
    ID_Guerra INT,
    CONSTRAINT fk_batalha_dragao FOREIGN KEY (NomeDragao) REFERENCES Dragao(Nome) ON DELETE SET NULL,
    CONSTRAINT fk_batalha_guerra FOREIGN KEY (ID_Guerra) REFERENCES Guerra(ID) ON DELETE CASCADE
);

CREATE TABLE Animais (
    Nome VARCHAR(50),
    Codigo INT, 
    AnoNas INT,
    AnoMorte INT,
    Especie VARCHAR(50),
    PRIMARY KEY (Nome, Codigo), 
    CONSTRAINT fk_animais_personagem FOREIGN KEY (Codigo) REFERENCES Personagem(CODIGO) ON DELETE CASCADE
);   

-- RELAÇÕES

CREATE TABLE Casou (
    Codigo_Personagem1 INT,
    Codigo_Personagem2 INT,
    DataComeco INT,
    DataFim INT,
    Periodo INT,
    MotivoFim VARCHAR(100),
    PRIMARY KEY (Codigo_Personagem1, Codigo_Personagem2, DataComeco),
    CONSTRAINT ck_casou_datas CHECK (DataFim >= DataComeco), 
    CONSTRAINT fk_casou_p1 FOREIGN KEY (Codigo_Personagem1) REFERENCES Personagem(CODIGO) ON DELETE CASCADE,
    CONSTRAINT fk_casou_p2 FOREIGN KEY (Codigo_Personagem2) REFERENCES Personagem(CODIGO) ON DELETE CASCADE
);

CREATE TABLE Afilia (
    Codigo INT PRIMARY KEY,
    Pai INT,
    Mae INT,
    CONSTRAINT fk_afilia_personagem FOREIGN KEY (Codigo) REFERENCES Personagem(CODIGO) ON DELETE CASCADE,
    CONSTRAINT fk_afilia_pai FOREIGN KEY (Pai) REFERENCES Personagem(CODIGO) ON DELETE SET NULL,
    CONSTRAINT fk_afilia_mae FOREIGN KEY (Mae) REFERENCES Personagem(CODIGO) ON DELETE SET NULL
);

CREATE TABLE JaMontou (
    Codigo_Personagem INT,
    Nome_Dragao VARCHAR(50),
    Data_Inicio INT,
    Data_Fim INT,
    PRIMARY KEY (Codigo_Personagem, Nome_Dragao),
    CONSTRAINT fk_jamontou_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE,
    CONSTRAINT fk_jamontou_dragao FOREIGN KEY (Nome_Dragao) REFERENCES Dragao(Nome) ON DELETE CASCADE
);

CREATE TABLE Interpreta (
    IDProfecia INT,
    Codigo_Personagem INT,
    Descricao TEXT,
    Previsao INT,
    Realizacao INT,
    PRIMARY KEY (IDProfecia, Codigo_Personagem),
    CONSTRAINT fk_interpreta_profecia FOREIGN KEY (IDProfecia) REFERENCES Profecia(Id_profecia) ON DELETE CASCADE,
    CONSTRAINT fk_interpreta_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE
);

CREATE TABLE Integra_se (
    Codigo_Personagem INT,
    Nome_Profissao VARCHAR(50),
    ID_cidade INT,
    PRIMARY KEY (Codigo_Personagem, Nome_Profissao, ID_cidade),
    CONSTRAINT fk_integra_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Humanos(Codigo_Personagem) ON DELETE CASCADE,
    CONSTRAINT fk_integra_profissao FOREIGN KEY (Nome_Profissao) REFERENCES Profissao(Nome) ON DELETE CASCADE,
    CONSTRAINT fk_integra_cidade FOREIGN KEY (ID_cidade) REFERENCES Cidade(ID) ON DELETE CASCADE
);

CREATE TABLE Pertencimento (
    ID SERIAL PRIMARY KEY,
    Periodo INT DEFAULT 1,
    IDArma INT,
    Codigo_Personagem INT,
    CONSTRAINT fk_pertencimento_arma FOREIGN KEY (IDArma) REFERENCES Arma(ID) ON DELETE CASCADE,
    CONSTRAINT fk_pertencimento_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE
);

CREATE TABLE Participa_Profecia (
    IDProfecia INT,
    Codigo_Personagem INT,
    Associacao VARCHAR(50),
    DataInicio INT,
    DataFim INT,
    PRIMARY KEY (IDProfecia, Codigo_Personagem),
    CONSTRAINT fk_participa_profecia FOREIGN KEY (IDProfecia) REFERENCES Profecia(Id_profecia) ON DELETE CASCADE,
    CONSTRAINT fk_participa_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE
);

CREATE TABLE Causam (
    Codigo_Personagem INT,
    ID_Morte INT,
    ID_Arma INT,
    PRIMARY KEY (Codigo_Personagem, ID_Morte),
    CONSTRAINT fk_causam_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE,
    CONSTRAINT fk_causam_morte FOREIGN KEY (ID_Morte) REFERENCES Morte(ID) ON DELETE CASCADE,
    CONSTRAINT fk_causam_arma FOREIGN KEY (ID_Arma) REFERENCES Arma(ID) ON DELETE SET NULL 
);

CREATE TABLE ParticipouEM (
    Codigo_Personagem INT,
    ID_Batalha INT,
    ID_Guerra INT,
    PRIMARY KEY (Codigo_Personagem, ID_Batalha, ID_Guerra),
    CONSTRAINT fk_part_em_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE,
    CONSTRAINT fk_part_em_batalha FOREIGN KEY (ID_Batalha) REFERENCES Batalha(ID) ON DELETE CASCADE,
    CONSTRAINT fk_part_em_guerra FOREIGN KEY (ID_Guerra) REFERENCES Guerra(ID) ON DELETE CASCADE
);

CREATE TABLE MortoEm (
    ID_Morte INT PRIMARY KEY,
    ID_Batalha INT,
    ID_Guerra INT,
    CONSTRAINT fk_mortoem_morte FOREIGN KEY (ID_Morte) REFERENCES Morte(ID) ON DELETE CASCADE,
    CONSTRAINT fk_mortoem_batalha FOREIGN KEY (ID_Batalha) REFERENCES Batalha(ID) ON DELETE CASCADE,
    CONSTRAINT fk_mortoem_guerra FOREIGN KEY (ID_Guerra) REFERENCES Guerra(ID) ON DELETE CASCADE
);

CREATE TABLE FazParte_Casa (
    NomeCasa VARCHAR(50),
    Codigo_Personagem INT,
    Data_Inicio INT,
    Data_Fim INT,
    PRIMARY KEY (NomeCasa, Codigo_Personagem, Data_Inicio),
    CONSTRAINT ck_fazparte_casa_datas CHECK (Data_Fim >= Data_Inicio), 
    CONSTRAINT fk_fazparte_casa FOREIGN KEY (NomeCasa) REFERENCES Casa(Nome) ON DELETE CASCADE,
    CONSTRAINT fk_fazparte_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE
);

CREATE TABLE Fundou (
    NomeCasa VARCHAR(50) PRIMARY KEY,
    Codigo_Personagem INT,
    CONSTRAINT fk_fundou_casa FOREIGN KEY (NomeCasa) REFERENCES Casa(Nome) ON DELETE CASCADE,
    CONSTRAINT fk_fundou_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE
);

CREATE TABLE Participou_Batalha (
    ID_Batalha INT,
    NomeCasa VARCHAR(50),
    PRIMARY KEY (ID_Batalha, NomeCasa),
    CONSTRAINT fk_part_bat_batalha FOREIGN KEY (ID_Batalha) REFERENCES Batalha(ID) ON DELETE CASCADE,
    CONSTRAINT fk_part_bat_casa FOREIGN KEY (NomeCasa) REFERENCES Casa(Nome) ON DELETE CASCADE
);

CREATE TABLE Atua (
    ID_Guerra INT,
    NomeCasa VARCHAR(50),
    PRIMARY KEY (ID_Guerra, NomeCasa),
    CONSTRAINT fk_atua_guerra FOREIGN KEY (ID_Guerra) REFERENCES Guerra(ID) ON DELETE CASCADE,
    CONSTRAINT fk_atua_casa FOREIGN KEY (NomeCasa) REFERENCES Casa(Nome) ON DELETE CASCADE
);

CREATE TABLE Vencedor (
    ID_Batalha INT,
    NomeCasa VARCHAR(50),
    PRIMARY KEY (ID_Batalha, NomeCasa),
    CONSTRAINT fk_vencedor_batalha FOREIGN KEY (ID_Batalha) REFERENCES Batalha(ID) ON DELETE CASCADE,
    CONSTRAINT fk_vencedor_casa FOREIGN KEY (NomeCasa) REFERENCES Casa(Nome) ON DELETE CASCADE
);

CREATE TABLE Participa_Alianca (
    Nome_Alianca VARCHAR(100),
    NomeReino VARCHAR(50),
    PRIMARY KEY (Nome_Alianca, NomeReino),
    CONSTRAINT fk_part_ali_alianca FOREIGN KEY (Nome_Alianca) REFERENCES Alianca(Nome) ON DELETE CASCADE,
    CONSTRAINT fk_part_ali_reino FOREIGN KEY (NomeReino) REFERENCES Reino(Nome) ON DELETE CASCADE
);

CREATE TABLE FazParteRC (
    IDCidade INT,
    NomeReino VARCHAR(50),
    DataInicio INT,
    DataFim INT,
    PRIMARY KEY (IDCidade, NomeReino, DataInicio),
    CONSTRAINT fk_fazparterc_cidade FOREIGN KEY (IDCidade) REFERENCES Cidade(ID) ON DELETE CASCADE,
    CONSTRAINT fk_fazparterc_reino FOREIGN KEY (NomeReino) REFERENCES Reino(Nome) ON DELETE CASCADE
);

CREATE TABLE Causa (
    IDMorte INT,
    NomeAnimal VARCHAR(50),
    CodigoAnimal INT,
    NomeDragao VARCHAR(50),
    PRIMARY KEY (IDMorte),
    CONSTRAINT fk_causa_morte FOREIGN KEY (IDMorte) REFERENCES Morte(ID) ON DELETE CASCADE,
    CONSTRAINT fk_causa_animal FOREIGN KEY (NomeAnimal, CodigoAnimal) REFERENCES Animais(Nome, Codigo) ON DELETE CASCADE,
    CONSTRAINT fk_causa_dragao FOREIGN KEY (NomeDragao) REFERENCES Dragao(Nome) ON DELETE CASCADE
);

CREATE TABLE Governa (
    Codigo_Personagem INT,
    NomeCasa VARCHAR(50),
    Data_Inicio INT,
    Data_Fim INT,
    PRIMARY KEY (Codigo_Personagem, NomeCasa),
    CONSTRAINT fk_governa_personagem FOREIGN KEY (Codigo_Personagem) REFERENCES Personagem(CODIGO) ON DELETE CASCADE,
    CONSTRAINT fk_governa_casa FOREIGN KEY (NomeCasa) REFERENCES Casa(Nome) ON DELETE CASCADE
);