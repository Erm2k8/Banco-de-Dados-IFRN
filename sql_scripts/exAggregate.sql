/* 1. 5 Produtos mais vendidos */
SELECT TOP(5) NomeProduto
FROM DetalhesPedido
INNER JOIN Pedidos ON DetalhesPedido.PedidoID = Pedidos.PedidoID
INNER JOIN Produtos ON DetalhesPedido.ProdutoID = Produtos.ProdutoID
ORDER BY quantidade DESC


/* 2. 3 países para qual a empresa mais vende */
SELECT TOP(3) PaisEntrega, COUNT(*) as qtd
FROM Pedidos
GROUP BY PaisEntrega
ORDER BY qtd DESC, PaisEntrega

/* 3. 2 funcionários com menos vendas */
SELECT TOP(2) FuncionarioID, COUNT(*) as vendas
FROM Pedidos
GROUP BY FuncionarioID
ORDER BY vendas 


/* 4. 10 Cidades com menos vendas  */
SELECT TOP(10) CidadeEntrega, COUNT(*) as qtd
FROM Pedidos
GROUP BY CidadeEntrega
ORDER BY qtd ASC, CidadeEntrega


/* 5. Quantidade de estoque por fornecedor e categoria */
SELECT NomeEmpresa as Fornecedor, NomeCategoria as Categoria, SUM(UnidadesEmEstoque) as Estoque
FROM Produtos
INNER JOIN Categorias ON Categorias.CategoriaID = Produtos.CategoriaID
INNER JOIN Fornecedores ON Fornecedores.FornecedorID = Produtos.FornecedorID
GROUP BY NomeEmpresa, NomeCategoria

