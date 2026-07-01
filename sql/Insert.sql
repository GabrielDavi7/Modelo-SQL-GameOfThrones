-- MORTE
INSERT INTO Morte (ID, data_morte, descricao, Localizacao) VALUES
(1, 302, 'Decapitado por insubordinação.', 'Castelo Negro'),
(2, 303, 'Garganta cortada.', 'As Gêmeas'),
(6, 298, 'Decapitado por deserção da Patrulha da Noite.', 'Arredores de Winterfell');


-- PERSONAGEM
INSERT INTO Personagem (CODIGO, Nome, tipo_personagem, IDMorte) VALUES
(1, 'Eddard Stark', 'H', NULL),
(2, 'Jon Snow', 'H', NULL),
(3, 'Arya Stark', 'H', NULL),
(4, 'Janos Slynt', 'H', 1), -- Vítima do Jon Snow
(5, 'Walder Frey', 'H', 2),  -- Vítima da Arya
(6, 'Will (Desertor da Muralha)', 'H', 6); -- Vítima da ned


-- CASA
INSERT INTO Casa (Nome, Bandeira, Lema_da_casa) VALUES 
('Stark', 'Lobo Gigante', 'O Inverno Está Chegando');

-- ARMA
INSERT INTO Arma (ID, Nome, Tipo, Material, Nome_Casa) VALUES
(1, 'Garra', 'Espada Bastarda', 'Aço Valiriano', 'Stark'),
(2, 'Agulha', 'Espada Fina', 'Aço de Castelo', 'Stark');

-- GUERRA
INSERT INTO Guerra (ID, Nome) VALUES
(1, 'Guerra dos Cinco Reis'),
(2, 'Rebelião de Robert');

-- BATALHA
INSERT INTO Batalha (ID, Nome, ID_Guerra) VALUES
(1, 'Bastardos', 1),
(2, 'Tridente', 2);

-- FAZ PARTE DA CASA
INSERT INTO FazParte_Casa (NomeCasa, Codigo_Personagem, Data_Inicio) VALUES
('Stark', 1, 263), 
('Stark', 2, 281), 
('Stark', 3, 289); 

-- PARTICIPOU EM
INSERT INTO ParticipouEM (Codigo_Personagem, ID_Batalha, ID_Guerra) VALUES
(2, 1, 1), 
(3, 1, 1), 
(1, 2, 2); 

-- CAUSAM
INSERT INTO Causam (Codigo_Personagem, ID_Morte, ID_Arma) VALUES
(2, 1, 1), 
(3, 2, 2),
(1, 6, 1);