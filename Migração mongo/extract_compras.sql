use sorveteria;
SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                       'Id_Compra', c.Id_Compra,
                       'cnpj', c.CNPJ,
                       'hora', c.Data_Hora,
                       'total', c.Preco_Total,
                       'itens', i.itens
                   )
           )
FROM Compra c
         LEFT JOIN (
    SELECT Id_Compra,
           JSON_ARRAYAGG(
                   JSON_OBJECT(
                           'Id_Produto', Itens_da_Compra.Id_Produto,
                           'qtd', Qtd_Compra,
                           'preço', Preco_do_item
                       )
               ) itens
    FROM Itens_da_Compra
             LEFT JOIN (
        SELECT Id_Produto,
               Nome
        FROM Produto
    ) t ON Itens_da_Compra.Id_Produto = t.Id_Produto
    GROUP BY Id_Compra
) i ON c.Id_Compra = i.Id_Compra;