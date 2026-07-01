/* a celula abaixo foi usada durante teste para deletar o banco de dados e inserir os dados novamente, caso queira usar, descomente e rode o script */

DELETE FROM Causam; -- Remove relações de assassinato
DELETE FROM ParticipouEM; -- Remove participações em batalhas
DELETE FROM FazParte_Casa; -- Remove vínculos entre personagens e casas
DELETE FROM Batalha; -- Remove batalhas cadastradas
DELETE FROM Guerra; -- Remove guerras cadastradas
DELETE FROM Arma; -- Remove armas cadastradas
DELETE FROM Personagem; -- Remove personagens cadastrados
DELETE FROM Casa; -- Remove casas cadastradas
DELETE FROM Morte; -- Remove registros de mortes

-- 2. MORTES
INSERT INTO Morte (ID, data_morte, descricao, Localizacao) VALUES
(1, 302, 'Decapitado por insubordinação.', 'Castelo Negro'), -- morte de Janos Slynt
(2, 303, 'Garganta cortada.', 'As Gêmeas'), -- morte de Walder Frey
(3, 299, 'Mortos no Casamento Vermelho.', 'As Gêmeas'), -- mortes de Robb e Catelyn Stark
(6, 298, 'Decapitado por deserção da Patrulha da Noite.', 'Arredores de Winterfell'), -- morte de Will
(7, 303, 'Executado após julgamento em Winterfell por traição.', 'Winterfell'), -- Morte de Midinho com dedo de Bran Stark
(8, 299, 'Morto em combate durante confronto com o exército do Norte.', 'Campina do Norte'); -- Morte de um personagem desconhecido

-- 3. PERSONAGENS
INSERT INTO Personagem (CODIGO, Nome, tipo_personagem, IDMorte) VALUES
(1, 'Eddard Stark', 'H', NULL), -- Ned Stark vivo antes da execução
(2, 'Jon Snow', 'H', NULL), -- Jon Snow da Patrulha da Noite
(3, 'Arya Stark', 'H', NULL), -- Arya Stark sobrevivente
(4, 'Janos Slynt', 'H', 1), -- executado por Jon Snow
(5, 'Walder Frey', 'H', 2), -- assassinado por Arya Stark
(6, 'Will (Desertor da Muralha)', 'H', 6), -- executado por Ned Stark
(7, 'Robb Stark', 'H', 3), -- morto no Casamento Vermelho
(8, 'Catelyn Stark', 'H', 3), -- morta no Casamento Vermelho
(9, 'Bran Stark', 'H', NULL), -- o Corvo de Três Olhos
(11, 'Rickon Stark', 'H', NULL), -- filho mais novo dos Stark
(12, 'Tywin Lannister', 'H', NULL), -- patriarca Lannister
(13, 'Daenerys Targaryen', 'H', NULL), -- Mãe dos Dragões
(14, 'Robert Baratheon', 'H', NULL), -- Rei Robert
(15, 'Balon Greyjoy', 'H', NULL), -- líder Greyjoy
(16, 'Aegon I Targaryen', 'H', NULL), -- conquistador de Westeros
(17, 'Petyr Baelish', 'H', 7), -- Midinho
(18, 'Soldado Lannister', 'H', 8); -- Soldado random

-- 4. CASAS
INSERT INTO Casa (Nome, Bandeira, Lema_da_casa) VALUES
('Stark', 'Lobo Gigante', 'O Inverno Está Chegando'), -- Casa Stark do Norte
('Lannister', 'Leão Dourado', 'Ouça-me Rugir'), -- Casa Lannister de Rochedo Casterly
('Targaryen', 'Dragão de Três Cabeças', 'Fogo e Sangue'), -- Casa Targaryen de Pedra do Dragão
('Baratheon', 'Cervo Coroado', 'Nossa é a Fúria'), -- Casa Baratheon de Ponta Tempestade
('Greyjoy', 'Lula-Gigante Dourada', 'Nós Não Semeamos'), -- Casa Greyjoy das Ilhas de Ferro
('Martell', 'Sol e Lança', 'Insubmissos, Não Subjugados, Não Dobrados'), -- Casa Martell de Dorne
('Tyrell', 'Rosa Dourada', 'Cresce Forte'), -- Casa Tyrell de Jardim de Cima
('Arryn', 'Falcão Branco', 'Tão Alto Quanto a Honra'), -- Casa Arryn do Vale
('Tully', 'Peixe Prateado', 'Família, Dever, Honra'), -- Casa Tully de Correrrio
('Frey', 'Torres Gêmeas', NULL), -- Casa Frey das Gêmeas
('Bolton', 'Homem Esfolado', 'Nossas Lâminas São Afiadas'); -- Casa Bolton do Forte do Pavor

-- 5. ARMAS
INSERT INTO Arma (ID, Nome, Tipo, Material, Nome_Casa) VALUES
(1, 'Garra Longa', 'Espada Bastarda', 'Aço Valiriano', 'Stark'), -- espada de Jon Snow
(2, 'Agulha', 'Espada Fina', 'Aço de Castelo', 'Stark'), -- espada de Arya Stark
(3, 'Gelo', 'Montante', 'Aço Valiriano', 'Stark'), -- espada ancestral dos Stark
(4, 'Víbora Vermelha', 'Lança', 'Aço e Veneno', 'Martell'), -- arma de Oberyn Martell
(5, 'Lamento da Viúva', 'Espada Longa', 'Aço Valiriano', 'Lannister'), -- espada dos Lannister
(7, 'Espada de Aço Stark', 'Espada Longa', 'Aço de Castelo', 'Stark'); -- representa espada do rob

-- 6. GUERRAS
INSERT INTO Guerra (ID, Nome) VALUES
(1, 'Guerra dos Cinco Reis'), -- guerra pela sucessão do Trono de Ferro
(2, 'Rebelião de Robert'), -- guerra que derrubou os Targaryen
(3, 'Conquista de Aegon'), -- conquista de Westeros pelos Targaryen
(4, 'Rebelião Greyjoy'), -- revolta das Ilhas de Ferro
(5, 'Guerra contra os Vagantes Brancos'); -- guerra contra os White Walkers

-- 7. BATALHAS
INSERT INTO Batalha (ID, Nome, ID_Guerra) VALUES
(1, 'Batalha dos Bastardos', 1), -- Jon Snow vs Ramsay Bolton
(2, 'Batalha do Tridente', 2), -- Robert vs Rhaegar
(3, 'Campo de Fogo', 3), -- Aegon conquista Westeros
(4, 'Cerco de Pyke', 4), -- Robert contra Greyjoy
(5, 'Batalha de Winterfell', 5), -- guerra contra os mortos
(6, 'Batalha da Água Negra', 1), -- defesa de Porto Real
(7, 'Bosque dos Murmúrios', 1); -- Batalha onde o Jaime é capturado

-- 8. FAZ PARTE DA CASA
INSERT INTO FazParte_Casa (NomeCasa, Codigo_Personagem, Data_Inicio) VALUES
('Stark', 1, 263), -- Ned Stark na Casa Stark
('Stark', 2, 281), -- Jon Snow na Patrulha da Noite/Stark
('Stark', 3, 289), -- Arya Stark
('Stark', 7, 283), -- Robb Stark
('Stark', 8, 264), -- Catelyn Stark
('Stark', 9, 290), -- Bran Stark
('Stark', 11, 295), -- Rickon Stark
('Lannister', 12, 242), -- Tywin Lannister
('Targaryen', 13, 284), -- Daenerys Targaryen
('Baratheon', 14, 262), -- Robert Baratheon
('Greyjoy', 15, 260), -- Balon Greyjoy
('Targaryen', 16, 2); -- Aegon I Targaryen

-- 9. PARTICIPAÇÃO EM BATALHAS
INSERT INTO ParticipouEM (Codigo_Personagem, ID_Batalha, ID_Guerra) VALUES
(2, 1, 1), -- Jon Snow na Batalha dos Bastardos
(1, 2, 2), -- Ned Stark no Tridente
(14, 2, 2), -- Robert Baratheon no Tridente
(16, 3, 3), -- Aegon I no Campo de Fogo
(15, 4, 4), -- Balon Greyjoy no Cerco de Pyke
(9, 5, 5), -- Bran Stark em Winterfell
(13, 5, 5), -- Daenerys em Winterfell
(12, 6, 1), -- Tywin Lannister na Água Negra
(3, 5, 5), -- Arya retorna e participa da guerra contra os Caminhantes Brancos (Winterfell)
(7, 7, 1), -- Robb Stark na captura de Jaime Lannister
(8, 7, 1); -- Catelyn Stark na captura de Jaime Lannister (mesma batalha que Robb, apenas participação)

-- 10. CAUSAM (assassinatos)
INSERT INTO Causam (Codigo_Personagem, ID_Morte, ID_Arma) VALUES
(2, 1, 1), -- Jon matou Janos Slynt com Garra Longa
(3, 2, 2), -- Arya matou Walder Frey com Agulha
(1, 6, 3), -- Ned executou Will com Gelo
(7, 8, 7), -- Robb Stark mata soldado Lannister em batalha (Guerra dos Cinco Reis)
(9, 7, NULL); -- Bran Stark causa indiretamente a morte de Petyr Baelish ao revelar suas ações em Winterfell