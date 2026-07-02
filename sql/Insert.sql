/* a celula abaixo foi usada durante teste para deletar o banco de dados e inserir os dados novamente, caso queira usar, descomente e rode o script 
DELETE FROM FazParteRC;
DELETE FROM Participa_Alianca;
DELETE FROM Vencedor;
DELETE FROM Atua;
DELETE FROM Participou_Batalha;
DELETE FROM Fundou;
DELETE FROM FazParte_Casa;
DELETE FROM MortoEm;
DELETE FROM ParticipouEM;
DELETE FROM Causam;
DELETE FROM Participa_Profecia;
DELETE FROM Pertencimento;
DELETE FROM Integra_se;
DELETE FROM Interpreta;
DELETE FROM JaMontou;
DELETE FROM Afilia;
DELETE FROM Casou;
DELETE FROM Animais;
DELETE FROM Batalha;
DELETE FROM Dragao;
DELETE FROM Arma;
DELETE FROM Guerra;
DELETE FROM Alianca;
DELETE FROM Nao_Humanos;
DELETE FROM Humanos;
DELETE FROM Reino;
DELETE FROM Casa;
DELETE FROM Cidade;
DELETE FROM Morte;
DELETE FROM Profecia;
DELETE FROM Profissao;
DELETE FROM Raca;
DELETE FROM Continente;
DELETE FROM Personagem;*/



-- 1. MORTES
INSERT INTO Morte (ID, data_morte, descricao, Localizacao) VALUES
(1, 302, 'Decapitado por insubordinação.', 'Castelo Negro'), -- morte de Janos Slynt
(2, 303, 'Garganta cortada.', 'As Gêmeas'), -- morte de Walder Frey
(3, 299, 'Mortos no Casamento Vermelho.', 'As Gêmeas'), -- mortes de Robb e Catelyn Stark
(6, 298, 'Decapitado por deserção da Patrulha da Noite.', 'Arredores de Winterfell'), -- morte de Will
(7, 303, 'Executado após julgamento em Winterfell por traição.', 'Winterfell'), -- Morte de Midinho com dedo de Bran Stark
(8, 299, 'Morto em combate durante confronto com o exército do Norte.', 'Campina do Norte'), -- Morte de um personagem desconhecido
(10, 303, 'Devorado por cães de caça.', 'Winterfell'),           -- Morte de Ramsay Bolton
(11, 303, 'Flecha no coração antes do combate.', 'Winterfell'),  -- Morte de Rickon Stark
(12, 303, 'Múltiplas flechadas e lanças.', 'Winterfell'),        -- Morte de Wun Wun
(13, 283, 'Golpe de martelo de guerra no peito.', 'Tridente'),   -- Morte de Rhaegar Targaryen
(14, 283, 'Ferimentos graves em combate.', 'Tridente'),          -- Morte de Lewyn Martell
(20, 305, 'Queimado vivo por fogo de dragão.', 'Porto Real'),
(21, 305, 'Devorado por um lobo gigante.', 'Winterfell'),
(22, 299, 'Garganta arrancada em combate.', 'Terras Fluviais'),
(23, 1, 'Incineração durante a Guerra da Conquista.', 'Campo de Fogo'),
(24, 300, 'Ataque surpresa na floresta.', 'Acampamento Lannister');

-- 2. PERSONAGENS
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
(10, 'Roose Bolton', 'H', NULL),
(11, 'Rickon Stark', 'H', NULL), -- filho mais novo dos Stark
(12, 'Tywin Lannister', 'H', NULL), -- patriarca Lannister
(13, 'Daenerys Targaryen', 'H', NULL), -- Mãe dos Dragões
(14, 'Robert Baratheon', 'H', NULL), -- Rei Robert
(15, 'Balon Greyjoy', 'H', NULL), -- líder Greyjoy
(16, 'Aegon I Targaryen', 'H', NULL), -- conquistador de Westeros
(17, 'Petyr Baelish', 'H', 7), -- Midinho
(18, 'Soldado Lannister', 'H', 8), -- Soldado random
(20, 'Rei da Noite', 'N', NULL), -- Rei da Noite, líder dos Caminhantes Brancos
(21, 'Wun Wun', 'N', NULL), -- Gigante aliado dos Stark
(22, 'Mag Mar Tun Doh Weg', 'N', NULL), -- Gigante aliado dos Stark
(23, 'Folha', 'N', NULL), -- Filha da Floresta, aliada dos Stark
(24, 'Senhor dos Ossos', 'N', NULL), -- Caminhante Branco
(30, 'Cersei Lannister', 'H', NULL),
(31, 'Khal Drogo', 'H', NULL),
(32, 'Talisa Maegyr', 'H', 3), -- Vítima do Casamento Vermelho (ID 3)
(33, 'Walda Frey', 'H', NULL),
(40, 'Visenya Targaryen', 'H', NULL),
(41, 'Melisandre', 'H', NULL),
(50, 'Brandon, o Construtor', 'H', NULL),
(51, 'Lann, o Esperto', 'H', NULL),
(52, 'Orys Baratheon', 'H', NULL),
(53, 'Frey da Travessia', 'H', NULL);

-- 3. CASAS
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

-- 4. ARMAS
INSERT INTO Arma (ID, Nome, Tipo, Material, Nome_Casa) VALUES
(1, 'Garra Longa', 'Espada Bastarda', 'Aço Valiriano', 'Stark'), -- espada de Jon Snow
(2, 'Agulha', 'Espada Fina', 'Aço de Castelo', 'Stark'), -- espada de Arya Stark
(3, 'Gelo', 'Montante', 'Aço Valiriano', 'Stark'), -- espada ancestral dos Stark
(4, 'Víbora Vermelha', 'Lança', 'Aço e Veneno', 'Martell'), -- arma de Oberyn Martell
(5, 'Lamento da Viúva', 'Espada Longa', 'Aço Valiriano', 'Lannister'), -- espada dos Lannister
(6, 'Espada de Aço', 'Espada Longa', 'Aço de Castelo', null), -- representa espada comum
(7, 'Espada de Aço Stark', 'Espada Longa', 'Aço de Castelo', 'Stark'), -- representa espada do rob
(8, 'Palavras', 'Julgamento', 'Justiça', 'Stark'); -- representativo pra colocar na tabela da morte do midinho

-- 5. GUERRAS
INSERT INTO Guerra (ID, Nome) VALUES
(1, 'Guerra dos Cinco Reis'), -- guerra pela sucessão do Trono de Ferro
(2, 'Rebelião de Robert'), -- guerra que derrubou os Targaryen
(3, 'Conquista de Aegon'), -- conquista de Westeros pelos Targaryen
(4, 'Rebelião Greyjoy'), -- revolta das Ilhas de Ferro
(5, 'Guerra contra os Vagantes Brancos'); -- guerra contra os White Walkers

-- 6. BATALHAS
INSERT INTO Batalha (ID, Nome, ID_Guerra) VALUES
(1, 'Batalha dos Bastardos', 1), -- Jon Snow vs Ramsay Bolton
(2, 'Batalha do Tridente', 2), -- Robert vs Rhaegar
(3, 'Campo de Fogo', 3), -- Aegon conquista Westeros
(4, 'Cerco de Pyke', 4), -- Robert contra Greyjoy
(5, 'Batalha de Winterfell', 5), -- guerra contra os mortos
(6, 'Batalha da Água Negra', 1), -- defesa de Porto Real
(7, 'Bosque dos Murmúrios', 1); -- Batalha onde o Jaime é capturado

-- 7. FAZ PARTE DA CASA
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

-- 8. PARTICIPAÇÃO EM BATALHAS
INSERT INTO ParticipouEM (Codigo_Personagem, ID_Batalha, ID_Guerra) VALUES
(2, 1, 1), -- Jon Snow na Batalha dos Bastardos
(11, 1, 1), -- Rickon na Batalha dos Bastardos onde morre
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

-- 9. CAUSAM (assassinatos)
INSERT INTO Causam (Codigo_Personagem, ID_Morte, ID_Arma) VALUES
(2, 1, 1), -- Jon matou Janos Slynt com Garra Longa
(3, 2, 2), -- Arya matou Walder Frey com Agulha
(1, 6, 3), -- Ned executou Will com Gelo
(7, 8, 7), -- Robb Stark mata soldado Lannister em batalha (Guerra dos Cinco Reis)
(9, 7, 8); -- Bran Stark causa indiretamente a morte de Petyr Baelish ao revelar suas ações em Winterfell

-- 10. Continentes

INSERT INTO Continente (Nome, Descricao, Clima, Tipo_Producao) VALUES
('Westeros', 'Continente onde se passam os principais eventos.', 'Temperado/Frio', 'Agricultura e Mineração'),
('Essos', 'Vasto continente a leste de Westeros.', 'Árido/Tropical', 'Comércio e Escravos'),
('Sothoryos', 'Continente selvagem e pouco explorado.', 'Tropical', 'Especiarias'),
('Ulthos', 'Terras misteriosas ao sul de Essos.', 'Desconhecido', 'Desconhecido'),
('Terras de Sempre Inverno', 'Extremo norte gelado.', 'Ártico', 'Nenhuma');


-- 11. Raça
INSERT INTO Raca (Nome, Caracteristicas) VALUES
('Humano', 'Seres versáteis que dominam os Sete Reinos.'),
('Dragão', 'Criaturas aladas que cospem fogo e magia.'),
('Gigante', 'Seres imensos que vivem além da Muralha.'),
('Filhos da Floresta', 'Povo antigo com magia ligada à natureza.'),
('Caminhante Branco', 'Criaturas de gelo que lideram os exércitos de mortos.');

-- 12. Profissão
INSERT INTO Profissao (Nome) VALUES
('Rei'), 
('Mão do Rei'), 
('Cavaleiro'), 
('Meistre'), 
('Patrulheiro da Noite');

--  13. Profecias
INSERT INTO Profecia (Id_profecia, Nome, descricao, origem) VALUES
(1, 'O Príncipe Que Foi Prometido', 'Aquele que trará o amanhecer e derrotará a escuridão.', 'Religião de R''hllor'),
(2, 'O Garanhão Que Monta o Mundo', 'Um líder Khal que unirá todos os Dothraki em um só khalasar.', 'Cultura Dothraki'),
(3, 'O Valonqar', 'A reencarnação do herói que forjou a Luminífera.', 'Alto Valiriano'),
(4, 'A Profecia da Maggy', 'A rainha mais jovem e bela tomará tudo que lhe é querido.', 'Magia do Sangue'),
(5, 'O Dragão de Três Cabeças', 'O dragão deve ter três cabeças para que a linhagem vença.', 'Dinastia Targaryen');

-- 14. Cidades
INSERT INTO Cidade (ID, Nome, Data_Construcao, Historia, IDMorte) VALUES
(1, 'Winterfell', 0, 'Sede ancestral da Casa Stark e capital do Norte.', NULL),
(2, 'Porto Real', 1, 'Capital dos Sete Reinos, fundada por Aegon.', 1),
(3, 'As Gêmeas', 500, 'Sede da Casa Frey, local do Casamento Vermelho.', 2),
(4, 'Pedra do Dragão', 100, 'Antiga fortaleza da Casa Targaryen.', NULL),
(5, 'Lannisporto', 200, 'Principal porto do Oeste e fortaleza Lannister.', NULL);

-- 15. REINO (Depende de Cidade para a Capital e Continente)
INSERT INTO Reino (Nome, Descricao, Tipo_Governo, IDCidade_Capital, NomeContinente) VALUES
('Norte', 'Terras vastas, frias e implacáveis.', 'Monarquia', 1, 'Westeros'),
('Terras Ocidentais', 'Região rica em minas de ouro.', 'Monarquia', 5, 'Westeros'),
('Terras da Coroa', 'Região central governada pelo Trono de Ferro.', 'Monarquia', 2, 'Westeros'),
('Campina', 'O grande celeiro dos Sete Reinos.', 'Monarquia', NULL, 'Westeros'),
('Vale de Arryn', 'Região isolada e protegida por montanhas.', 'Monarquia', NULL, 'Westeros');

-- 16. HUMANOS
INSERT INTO Humanos (Codigo_Personagem, Sobrenome, Cor_olhos, Cor_cabelo, Genero, Data_nascimento, NomeRaca, IDCidade) VALUES
(1, 'Stark', 'Cinza', 'Castanho', 'M', 263, 'Humano', 1), -- Ned Stark (Nasceu em Winterfell)
(2, 'Snow', 'Cinza', 'Preto', 'M', 281, 'Humano', 1), -- Jon Snow
(3, 'Stark', 'Cinza', 'Castanho', 'F', 289, 'Humano', 1), -- Arya Stark
(12, 'Lannister', 'Verde', 'Loiro', 'M', 242, 'Humano', 5), -- Tywin Lannister
(13, 'Targaryen', 'Violeta', 'Prateado', 'F', 284, 'Humano', 4), -- Daenerys Targaryen
(30, 'Lannister', 'Verde', 'Loiro', 'F', 266, 'Humano', 5), -- Cersei Lannister
(31, 'Drogo', 'Preto', 'Preto', 'M', 268, 'Humano', NULL), -- Khal Drogo 
(32, 'Maegyr', 'Castanho', 'Castanho', 'F', 278, 'Humano', NULL), -- Talisa Maegyr
(33, 'Frey', 'Azul', 'Loiro', 'F', 284, 'Humano', 3), -- Walda Frey
(10, 'Bolton', Null, Null,'M', 255, 'Humano', 1), -- Roose 
(40, 'Targaryen', 'Violeta', 'Prateado', 'F', -29, 'Humano', 4), -- Visenya Targaryen
(41, 'Desconhecido', 'Vermelho', 'Vermelho', 'F', 100, 'Humano', NULL), -- Melisandre
(50, 'Stark', 'Cinza', 'Castanho', 'M', -8000, 'Humano', 1), -- Fundou Winterfell (1)
(51, 'Lannister', 'Verde', 'Loiro', 'M', -6000, 'Humano', 5), -- Em Lannisporto (5)
(52, 'Baratheon', 'Azul', 'Preto', 'M', -20, 'Humano', NULL),
(53, 'Frey', 'Azul', 'Castanho', 'M', -600, 'Humano', 3); -- Gêmeas (3)

-- 17. NÃO-HUMANOS
INSERT INTO Nao_Humanos (Codigo_personagem, Nome, Especie) VALUES
(20, 'Rei da Noite', 'Caminhante Branco'),
(21, 'Wun Wun', 'Gigante'),
(22, 'Mag Mar Tun Doh Weg', 'Gigante'),
(23, 'Folha', 'Filhos da Floresta'),
(24, 'Senhor dos Ossos', 'Caminhante Branco');

-- 18. ALIANÇAS
INSERT INTO Alianca (Nome, Data_Inicio, Data_fim) VALUES
('Pacto de Gelo e Fogo', 129, 131),
('Aliança Rebelde', 282, 283),
('Aliança Lannister-Frey-Bolton', 299, 303),
('A Grande Aliança do Norte', 303, NULL), -- NULL porque a aliança ainda vigora
('Pacto dos Primeiros Homens', 0, 1000);

-- 19. DRAGÕES
INSERT INTO Dragao (Nome, Cor, Tamanho, Estado, NomePersonagem, ID_Morte) VALUES
('Drogon', 'Preto e Vermelho', 'Colossal', 'Vivo', 13, NULL), -- Cavaleiro atual: Daenerys
('Rhaegal', 'Verde e Bronze', 'Grande', 'Vivo', 13, NULL), 
('Viserion', 'Creme e Dourado', 'Grande', 'Vivo', 13, NULL),
('Balerion', 'Preto', 'Titânico', 'Morto', 16, NULL), -- Cavaleiro antigo: Aegon
('Vhagar', 'Bronze', 'Colossal', 'Morto', NULL, NULL);

-- 20. ANIMAIS (Entidade Fraca que depende do dono na tabela Personagem)
INSERT INTO Animais (Nome, Codigo, AnoNas, AnoMorte, Especie) VALUES
('Fantasma', 2, 298, NULL, 'Lobo Gigante'), -- Dono: Jon Snow (2)
('Nymeria', 3, 298, NULL, 'Lobo Gigante'), -- Dona: Arya Stark (3)
('Verão', 9, 298, NULL, 'Lobo Gigante'), -- Dono: Bran Stark (9)
('Vento Cinzento', 7, 298, 299, 'Lobo Gigante'), -- Dono: Robb Stark (7)
('Felpudo', 11, 298, 303, 'Lobo Gigante'); -- Dono: Rickon Stark (11)

-- 21. PERTENCIMENTO (Entidade Fraca que depende do dono na tabela Personagem e Arma)
INSERT INTO Pertencimento (Periodo, IDArma, Codigo_Personagem) VALUES
(10, 3, 1), -- Ned Stark (1) foi dono da Gelo (3) por 10 anos.
(5, 1, 2),  -- Jon Snow (2) é dono da Garra (1) por 5 anos.
(3, 2, 3),  -- Arya Stark (3) é dona da Agulha (2) por 3 anos.
(1, 3, 12), -- Tywin Lannister (12) pegou a Gelo (3) para derreter após a morte do Ned.
(15, 6, 1); -- Ned Stark (1) usando a Espada de Aço comum (6) no passado durante a Rebelião.

-- 22. CASOU
INSERT INTO Casou (Codigo_Personagem1, Codigo_Personagem2, DataComeco, DataFim, Periodo, MotivoFim) VALUES
(1, 8, 282, 298, 16, 'Morte do Ned Stark por decapitação.'), -- Ned (1) e Catelyn (8)
(14, 30, 284, 298, 14, 'Morte do Rei Robert por um javali.'), -- Robert (14) e Cersei (30)
(13, 31, 297, 298, 1, 'Morte de Khal Drogo via magia de sangue.'), -- Daenerys (13) e Drogo (31)
(7, 32, 299, 299, 0, 'Ambos assassinados no Casamento Vermelho.'), -- Robb (7) e Talisa (32)
(10, 33, 299, 302, 3, 'Morte de Roose Bolton por traição.'); -- Roose Bolton (10) e Walda Frey (33)

-- 23. AFILIA
INSERT INTO Afilia (Codigo, Pai, Mae) VALUES
(7, 1, 8),  -- Robb Stark (7) é filho de Ned Stark (1) e Catelyn Stark (8)
(3, 1, 8),  -- Arya Stark (3) é filha de Ned Stark (1) e Catelyn Stark (8)
(9, 1, 8),  -- Bran Stark (9) é filho de Ned Stark (1) e Catelyn Stark (8)
(11, 1, 8), -- Rickon Stark (11) é filho de Ned Stark (1) e Catelyn Stark (8)
(30, 12, NULL); -- Cersei Lannister (30) é filha de Tywin (12).

-- 24. JA MONTOU
INSERT INTO JaMontou (Codigo_Personagem, Nome_Dragao, Data_Inicio, Data_Fim) VALUES
(13, 'Drogon', 299, NULL),    -- Daenerys (13) montou Drogon
(2, 'Rhaegal', 304, NULL),    -- Jon Snow (2) montou Rhaegal
(16, 'Balerion', 0, 37),      -- Aegon I (16) montou Balerion na Conquista
(40, 'Vhagar', 0, 44),        -- Visenya (40) montou Vhagar
(20, 'Viserion', 304, 305);   -- O Rei da Noite (20) montou o Viserion (zumbificado)

-- 25. INTERPRETA (Relaciona Profecias com Personagens e suas interpretações)
INSERT INTO Interpreta (IDProfecia, Codigo_Personagem, Descricao, Previsao, Realizacao) VALUES
(1, 41, 'Melisandre acreditava cegamente que Stannis Baratheon era o Príncipe Prometido.', 298, NULL),
(2, 30, 'Cersei Lannister sempre achou que seu irmão Tyrion era o Valonqar que a mataria.', 276, NULL),
(3, 31, 'Khal Drogo interpretou que seu filho com Daenerys seria o Garanhão.', 298, NULL),
(4, 13, 'Daenerys aguardava as três traições (por sangue, por ouro e por amor).', 299, NULL),
(5, 16, 'Aegon I previu a ameaça do Norte através do seu Sonho de Gelo e Fogo.', 0, NULL);

-- 26. INTEGRA-SE
INSERT INTO Integra_se (Codigo_Personagem, Nome_Profissao, ID_cidade) VALUES
(1, 'Mão do Rei', 2),          -- Ned Stark (1) atuou como Mão do Rei em Porto Real (2)
(12, 'Mão do Rei', 2),         -- Tywin Lannister (12) também atuou como Mão do Rei em Porto Real (2)
(2, 'Patrulheiro da Noite', 1),-- Jon Snow (2) começou como Patrulheiro associado a Winterfell (1)
(12, 'Cavaleiro', 5),          -- Tywin Lannister (12) atuava como Cavaleiro de Lannisporto (5)
(13, 'Rei', 4);                -- Daenerys Targaryen (13) atuando como Monarca (Rei/Rainha) em Pedra do Dragão (4)

--27 PARTICIPAÇÃO EM PROFECIAS 
INSERT INTO Participa_Profecia (IDProfecia, Codigo_Personagem, Associacao, DataInicio, DataFim) VALUES
(1, 2, 'Possível Príncipe Prometido', 298, NULL), -- Jon Snow (2) na profecia de Azor Ahai (1)
(1, 13, 'Possível Princesa Prometida', 298, NULL), -- Daenerys (13) também na profecia de Azor Ahai (1)
(3, 30, 'Vítima do Valonqar', 276, NULL),         -- Cersei Lannister (30) como a rainha vítima da profecia (3)
(2, 31, 'Pai do Garanhão', 297, 298),             -- Khal Drogo (31) envolvido na profecia Dothraki (2)
(5, 16, 'A Primeira Cabeça do Dragão', 0, 37);    -- Aegon I (16) na profecia das Três Cabeças (5)

--28 MORTO AQUI
INSERT INTO MortoEm (ID_Morte, ID_Batalha, ID_Guerra) VALUES
(10, 1, 1), -- A Morte 10 ocorreu na Batalha dos Bastardos (Batalha 1 / Guerra 1)
(11, 1, 1), -- A Morte 11 (Rickon) na Batalha dos Bastardos (Batalha 1 / Guerra 1)
(12, 1, 1), -- A Morte 12 (Wun Wun) na Batalha dos Bastardos (Batalha 1 / Guerra 1)
(13, 2, 2), -- A Morte 13 (Rhaegar) na Batalha do Tridente (Batalha 2 / Guerra 2)
(14, 2, 2); -- A Morte 14 (Lewyn) na Batalha do Tridente (Batalha 2 / Guerra 2)

--29. FUNDOU
INSERT INTO Fundou (NomeCasa, Codigo_Personagem) VALUES
('Stark', 50),       -- Brandon, o Construtor (50) fundou a Casa Stark
('Lannister', 51),   -- Lann, o Esperto (51) fundou a Casa Lannister
('Baratheon', 52),   -- Orys (52) fundou a Casa Baratheon
('Frey', 53),        -- Frey da Travessia (53) fundou a Casa Frey
('Targaryen', 16);   -- Aegon I (16) fundou a Casa Targaryen

--30. PARTICIPOU_BATALHA (Quais Casas participaram das batalhas)
INSERT INTO Participou_Batalha (ID_Batalha, NomeCasa) VALUES
(1, 'Stark'),      -- Stark lutou na Batalha dos Bastardos (ID 1)
(1, 'Bolton'),     -- Bolton lutou na Batalha dos Bastardos (ID 1)
(2, 'Baratheon'),  -- Baratheon lutou no Tridente (ID 2)
(2, 'Targaryen'),  -- Targaryen lutou no Tridente (ID 2)
(6, 'Lannister');  -- Lannister lutou na Água Negra (ID 6)

-- 31. TABELA Atua (Quais Casas declararam apoio nas Grandes Guerras)
INSERT INTO Atua (ID_Guerra, NomeCasa) VALUES
(1, 'Stark'),      -- Stark na Guerra dos Cinco Reis (ID 1)
(1, 'Lannister'),  -- Lannister na Guerra dos Cinco Reis (ID 1)
(2, 'Baratheon'),  -- Baratheon na Rebelião de Robert (ID 2)
(3, 'Targaryen'),  -- Targaryen na Conquista de Aegon (ID 3)
(4, 'Greyjoy');    -- Greyjoy na Rebelião Greyjoy (ID 4)

-- 32. TABELA Vencedor
INSERT INTO Vencedor (ID_Batalha, NomeCasa) VALUES
(1, 'Stark'),      -- Starks venceram a Batalha dos Bastardos (ID 1)
(2, 'Baratheon'),  -- Baratheons venceram o Tridente (ID 2)
(3, 'Targaryen'),  -- Targaryens venceram o Campo de Fogo (ID 3)
(4, 'Baratheon'),  -- Baratheons venceram o Cerco de Pyke (ID 4)
(6, 'Lannister');  -- Lannisters venceram a Água Negra (ID 6)

-- 33. TABELA Participa_AliancA
INSERT INTO Participa_Alianca (Nome_Alianca, NomeReino) VALUES
('A Grande Aliança do Norte', 'Norte'),
('Aliança Rebelde', 'Norte'),
('Aliança Rebelde', 'Vale de Arryn'),
('Aliança Lannister-Frey-Bolton', 'Terras Ocidentais'),
('Pacto de Gelo e Fogo', 'Norte');

-- 34. TABELA FazParteRC (Cidades pertencentes aos Reinos e o período)
INSERT INTO FazParteRC (IDCidade, NomeReino, DataInicio, DataFim) VALUES
(1, 'Norte', 0, NULL),             -- Winterfell (1) sempre pertenceu ao Norte
(3, 'Norte', 0, NULL),             -- As Gêmeas (3) associada geograficamente ao Norte
(2, 'Terras da Coroa', 1, NULL),   -- Porto Real (2) na Coroa desde Aegon
(4, 'Terras da Coroa', 0, NULL),   -- Pedra do Dragão (4) nas Terras da Coroa
(5, 'Terras Ocidentais', 0, NULL); -- Lannisporto (5) nas Terras Ocidentais

-- 35. CAUSAM
INSERT INTO Causa (IDMorte, NomeAnimal, CodigoAnimal, NomeDragao) VALUES
(20, NULL, NULL, 'Drogon'),      -- Causado por Dragão
(21, 'Fantasma', 2, NULL),       -- Causado pelo lobo do Jon Snow
(22, 'Vento Cinzento', 7, NULL), -- Causado pelo lobo do Robb Stark
(23, NULL, NULL, 'Balerion'),    -- Causado por Dragão
(24, 'Nymeria', 3, NULL);        -- Causado pelo lobo da Arya Stark

-- 36. Governa (Quais personagens governaram quais casas e por quanto tempo)
INSERT INTO Governa (Codigo_Personagem, NomeCasa, Data_Inicio, Data_Fim) VALUES  
(1, 'Stark', 282, 298),      -- Ned Stark governa a Casa Stark
(12, 'Lannister', 267, 300), -- Tywin Lannister governa a Casa Lannister
(14, 'Baratheon', 283, 298), -- Robert Baratheon governa a Casa Baratheon
(15, 'Greyjoy', 289, 299),   -- Balon Greyjoy governa a Casa Greyjoy
(10, 'Bolton', 299, 303);    -- Roose Bolton governa a Casa Bolton

-- 37. TABELA Participou (Quais casas participaram das batalhas)
INSERT INTO Participou (IDBatalha, NomeCasa) VALUES
(1, 'Stark'),
(1, 'Bolton'),
(2, 'Baratheon'),
(2, 'Lannister'),
(3, 'Greyjoy');

-- 38. TABELA ECapital 
INSERT INTO ECapital (NomeAlianca, IDCidade, DataInicio, DataFim) VALUES
('Aliança do Norte', 1, 298, 300),
('Pacto de Gelo e Fogo', 1, 303, 305),
('Aliança Lannister-Frey', 2, 299, 301),
('Coroa e Fé', 2, 300, 302),
('Pacto de Dorne', 5, 299, 300);