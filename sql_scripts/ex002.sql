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

/* Informações do produto com ID = 22 */
SELECT
	COUNT(*) as qtdVendas,
	SUM(quantidade) as qtdTotalVendida,
	AVG(quantidade) as avgQtdVendida,
	MIN(quantidade) as minQuantidade,
	MAX(quantidade) as maxQuantidade
FROM DetalhesPedido 
WHERE produtoID = 22

/* Quantidade vendida para Brasil, França e Alemanha */
SELECT COUNT(*) as qtdVendasBrazilFrancaAlemanha
FROM Pedidos
WHERE paisEntrega = 'Brazil' OR paisEntrega = 'France' OR paisEntrega = 'Germany' 

/* Quantidade de produtos vendidos para o Brasil */
SELECT SUM(quantidade) as somaProdutosVendidos
FROM DetalhesPedido
INNER JOIN Pedidos ON
	DetalhesPedido.PedidoID = Pedidos.pedidoID
	AND
	Pedidos.PaisEntrega = 'Brazil'


/* Quantidade Vendas do produto com ID 1 e com quantidade maior que 20 */
SELECT COUNT(*) as qtdVendas
FROM DetalhesPedido 
WHERE produtoID = 1 AND quantidade >= 20
