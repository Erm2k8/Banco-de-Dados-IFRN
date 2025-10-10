-- ================================================
-- EXERCÍCIO: CRIAÇÃO DE VIEWS NO BANCO DE DADOS
-- ================================================

-- 1. Retornar, sem duplicação, os valores do campo UF da tabela de Municípios. 
--    Ordenar pelo nome da UF.
CREATE VIEW view_ufs AS
SELECT DISTINCT uf
FROM Municipio
ORDER BY uf;

-- 2. Retornar os nomes dos cursos que possuem >= 2000 ofertas,
--    ordenados inversamente por quantidade de ofertas.
CREATE VIEW view_cursos_populares AS
SELECT 
    c.nome AS nome_curso,
    COUNT(coc.id) AS quantidade_ofertas
FROM Curso c
INNER JOIN Cursos_Oferecidos_por_Campus coc ON c.id_curso = coc.id_curso
GROUP BY c.id_curso, c.nome
HAVING COUNT(coc.id) >= 2000
ORDER BY quantidade_ofertas DESC;

-- 3. Retornar a média do ENADE agrupada por área e curso,
--    somente para aquelas áreas e cursos com a média do ENADE >= 3.
--    Ordenar por área e curso.
CREATE VIEW view_enade_por_area_curso AS
SELECT 
    a.descricao AS area,
    c.nome AS curso,
    AVG(coc.enade) AS media_enade
FROM Area a
INNER JOIN Cursos_Oferecidos_por_Campus coc ON a.id_area = coc.id_area
INNER JOIN Curso c ON coc.id_curso = c.id_curso
WHERE coc.enade IS NOT NULL
GROUP BY a.id_area, a.descricao, c.id_curso, c.nome
HAVING AVG(coc.enade) >= 3.0
ORDER BY a.descricao, c.nome;