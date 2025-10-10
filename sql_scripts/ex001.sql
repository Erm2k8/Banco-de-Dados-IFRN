/* Quantidade de registros: Clientes */
SELECT COUNT(*) FROM Clientes

/* Quantidade de registros: Produtos */
SELECT COUNT(*) FROM Produtos

/* Todos os Clientes que possuem fax */
SELECT COUNT(fax) FROM Clientes

/* Todas as cidades que os clientes moram (sem repeti��o) */
SELECT DISTINCT(cidade) FROM Clientes

