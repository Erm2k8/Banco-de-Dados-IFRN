/* Países que os clientes moram em ordem alfabética sem repetição */
SELECT DISTINCT(pais) as paises FROM Clientes ORDER BY pais

/* Quantidade de Clientes que moram na Espanha */
SELECT COUNT(*) as moramNaEspanha FROM Clientes WHERE pais='Spain'

/* Quantidade de Produtos que possuem estoque menor ou igual a 10 */
SELECT COUNT(*) as estoqueBaixo FROM Produtos WHERE precoUnitario<=10 

/* Produtos que são condimentos e que possuem quantidade em estoque menor ou igual a 6 */
SELECT COUNT(DISTINCT(Produtos.nomeProduto)) as condimentos
FROM Produtos
INNER JOIN Categorias ON Produtos.categoriaID=2
WHERE Produtos.UnidadesEmEstoque <= 6


/* Quantidade Vendida do produto Outback Lager */
SELECT COUNT(*) as qtdPedidos FROM DetalhesPedido WHERE ProdutoID = 70


