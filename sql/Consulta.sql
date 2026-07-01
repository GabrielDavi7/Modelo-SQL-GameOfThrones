SELECT DISTINCT
    ps.Nome AS "Membro Stark",
    b.Nome AS "Batalha",
    g.Nome AS "Guerra",
    pv.Nome AS "Vitima Assassino",
    a.Nome AS "Arma Utilizada",
    m.descricao AS "Descricao da Morte"
FROM FazParte_Casa fc
JOIN Personagem ps ON fc.Codigo_Personagem = ps.CODIGO
-- Junções para buscar as Batalhas e Guerras
LEFT JOIN ParticipouEM part ON ps.CODIGO = part.Codigo_Personagem
LEFT JOIN Batalha b ON part.ID_Batalha = b.ID
LEFT JOIN Guerra g ON part.ID_Guerra = g.ID
-- Junções para buscar os Assassinatos, a Arma e a Vítima
LEFT JOIN Causam c ON ps.CODIGO = c.Codigo_Personagem
LEFT JOIN Personagem pv ON c.ID_Morte = pv.IDMorte
LEFT JOIN Morte m ON c.ID_Morte = m.ID
LEFT JOIN Arma a ON c.ID_Arma = a.ID
WHERE fc.NomeCasa = 'Stark';