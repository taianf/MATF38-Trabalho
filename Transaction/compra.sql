START TRANSACTION;

INSERT INTO sorveteria.Compra (Id_Comprador, CNPJ, Data_Hora, Preco_Total)
VALUES (2, '32415910000121', '2021-11-28 16:24:09', 5000.00);

INSERT INTO sorveteria.Itens_da_Compra (Id_Compra, Id_Produto, Qtd_Compra, Preco_do_Item)
VALUES (LAST_INSERT_ID(), 1, 1000.000, 2.00);
INSERT INTO sorveteria.Itens_da_Compra (Id_Compra, Id_Produto, Qtd_Compra, Preco_do_Item)
VALUES (LAST_INSERT_ID(), 2, 1000.000, 2.00);
INSERT INTO sorveteria.Itens_da_Compra (Id_Compra, Id_Produto, Qtd_Compra, Preco_do_Item)
VALUES (LAST_INSERT_ID(), 4, 500.000, 1.00);
INSERT INTO sorveteria.Itens_da_Compra (Id_Compra, Id_Produto, Qtd_Compra, Preco_do_Item)
VALUES (LAST_INSERT_ID(), 5, 500.000, 1.00);

COMMIT;
