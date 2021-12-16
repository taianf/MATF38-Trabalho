INSERT INTO sorveteria.Produto (Id_Categoria, Nome, Preco_Venda, Preco_Compra)
VALUES (1, 'Sorvete de chocolate', 5.00, 2.00);
INSERT INTO sorveteria.Produto (Id_Categoria, Nome, Preco_Venda, Preco_Compra)
VALUES (1, 'Sorvete de morango', 5.00, 2.00);
INSERT INTO sorveteria.Produto (Id_Categoria, Nome, Preco_Venda, Preco_Compra)
VALUES (1, 'Sorvete para deletar', 5.00, 2.00);
INSERT INTO sorveteria.Produto (Id_Categoria, Nome, Preco_Venda, Preco_Compra)
VALUES (2, 'Picolé de chocolate', 3.00, 1.00);
INSERT INTO sorveteria.Produto (Id_Categoria, Nome, Preco_Venda, Preco_Compra)
VALUES (2, 'Picolé de jaca', 3.00, 1.00);
INSERT INTO sorveteria.Produto (Id_Categoria, Nome, Preco_Venda, Preco_Compra)
VALUES (2, 'Picolé de baunilha', 3.00, 1.00);

DELETE
FROM sorveteria.Produto
WHERE Id_Produto = 3;

UPDATE sorveteria.Produto t
SET t.Nome = 'Picolé de manga'
WHERE t.Id_Produto = 5;
