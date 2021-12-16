START TRANSACTION;

INSERT INTO sorveteria.Venda (Id_Vendedor, Data_Hora, Preco_Total)
VALUES (1, '2021-11-28 16:36:08', 100.00);

INSERT INTO sorveteria.Itens_da_Venda (Id_Venda, Id_Produto, Qtd_venda, Preco_do_item)
VALUES (LAST_INSERT_ID(), 1, 2.000, 5.00);
INSERT INTO sorveteria.Itens_da_Venda (Id_Venda, Id_Produto, Qtd_venda, Preco_do_item)
VALUES (LAST_INSERT_ID(), 2, 1.000, 5.00);
INSERT INTO sorveteria.Itens_da_Venda (Id_Venda, Id_Produto, Qtd_venda, Preco_do_item)
VALUES (LAST_INSERT_ID(), 4, 1.000, 3.00);
INSERT INTO sorveteria.Itens_da_Venda (Id_Venda, Id_Produto, Qtd_venda, Preco_do_item)
VALUES (LAST_INSERT_ID(), 5, 10.000, 3.00);

COMMIT;
