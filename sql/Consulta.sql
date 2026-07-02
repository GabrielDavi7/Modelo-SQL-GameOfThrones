SELECT DISTINCT
    p.Nome AS "Membro Stark",
    b.Nome AS "Batalha",
    g.Nome AS "Guerra",
    vitima.Nome AS "Vítima Assassinada",
    a.Nome AS "Arma Utilizada",
    m.descricao AS "Descrição da Morte"
FROM FazParte_Casa fc
JOIN Personagem p ON fc.Codigo_Personagem = p.CODIGO
LEFT JOIN ParticipouEM pe ON p.CODIGO = pe.Codigo_Personagem
LEFT JOIN Batalha b ON pe.ID_Batalha = b.ID
LEFT JOIN Guerra g ON pe.ID_Guerra = g.ID
LEFT JOIN Causam c ON p.CODIGO = c.Codigo_Personagem
LEFT JOIN Personagem vitima ON c.ID_Morte = vitima.IDMorte
LEFT JOIN Arma a ON c.ID_Arma = a.ID
LEFT JOIN Morte m ON c.ID_Morte = m.ID
WHERE fc.NomeCasa = 'Stark';


/*
-- CONSULTAS EXTRAS PARA TESTES durante desenvolvimento do modelo de dados aqui temos consultadas para grande partes do nosso modelo de dados

-- 1. Teste de Dragões e seus Cavaleiros
SELECT 
    p.Nome AS "Cavaleiro", 
    d.Nome AS "Dragão", 
    d.Tamanho, 
    d.Estado,
    j.Data_Inicio AS "Ano que montou"
FROM JaMontou j
JOIN Personagem p ON j.Codigo_Personagem = p.CODIGO
JOIN Dragao d ON j.Nome_Dragao = d.Nome;

-- 2. Teste da Árvore Genealógica (Auto-relacionamento)
SELECT 
    filho.Nome AS "Filho(a)", 
    pai.Nome AS "Pai", 
    mae.Nome AS "Mãe"
FROM Afilia a
JOIN Personagem filho ON a.Codigo = filho.CODIGO
LEFT JOIN Personagem pai ON a.Pai = pai.CODIGO
LEFT JOIN Personagem mae ON a.Mae = mae.CODIGO;

-- 3. Teste de Batalhas, Guerras e Vencedores
SELECT 
    b.Nome AS "Batalha", 
    g.Nome AS "Guerra Maior", 
    v.NomeCasa AS "Casa Vencedora"
FROM Batalha b
JOIN Guerra g ON b.ID_Guerra = g.ID
LEFT JOIN Vencedor v ON b.ID = v.ID_Batalha
ORDER BY g.Nome, b.Nome;

-- 4. Teste de Profissões e Localização dos Humanos
SELECT 
    p.Nome AS "Personagem", 
    i.Nome_Profissao AS "Ofício/Profissão", 
    c.Nome AS "Cidade de Atuação"
FROM Integra_se i
JOIN Humanos h ON i.Codigo_Personagem = h.Codigo_Personagem
JOIN Personagem p ON h.Codigo_Personagem = p.CODIGO
JOIN Cidade c ON i.ID_cidade = c.ID;

*/

/*
-- 5. Lordes e suas Casas
SELECT 
    g.NomeCasa AS "Casa Nobre",
    p.Nome AS "Lorde Governante",
    g.Data_Inicio AS "Início do Governo",
    g.Data_Fim AS "Fim do Governo",
    c.Lema_da_casa AS "Lema da Casa",
    i.Nome_Profissao AS "Título/Profissão",
    cid.Nome AS "Cidade Sede"
FROM Governa g
JOIN Personagem p ON g.Codigo_Personagem = p.CODIGO
JOIN Casa c ON g.NomeCasa = c.Nome
LEFT JOIN Integra_se i ON p.CODIGO = i.Codigo_Personagem
LEFT JOIN Cidade cid ON i.ID_cidade = cid.ID
ORDER BY g.NomeCasa;

*/