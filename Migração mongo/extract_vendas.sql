use sorveteria;
SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                       'id_venda', v.id_venda,
                       'Id_Vendedor', v.Id_Vendedor,
                       'hora', v.Data_Hora,
                       'total', v.Preco_Total,
                       'itens', i.itens
                   )
           )
FROM Venda v
         LEFT JOIN (
    SELECT Id_Venda,
           JSON_ARRAYAGG(
                   JSON_OBJECT(
                           'Id_Produto', Itens_da_Venda.Id_Produto,
                           'qtd', Qtd_venda,
                           'preço', Preco_do_item
                       )
               ) itens
    FROM Itens_da_Venda
             LEFT JOIN (
        SELECT Id_Produto,
               Nome
        FROM Produto
    ) t ON Itens_da_Venda.Id_Produto = t.Id_Produto
    GROUP BY Id_Venda
) i ON v.id_venda = i.Id_Venda;