use sorveteria;
SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                       'Id_Produto', p.Id_Produto,
                       'nome', p.Nome,
                       'preco_venda', p.Preco_Venda,
                       'preco_compra', p.Preco_Compra,
                       'categoria', c.info
                   )
           )
FROM Produto p
         LEFT JOIN (
    SELECT Id_Categoria,
           JSON_ARRAYAGG(
                   JSON_OBJECT(
                           'categoria', Nome,
                           'unidade_medida', Unidade_Medida
                       )
               ) info
    FROM Categoria
    GROUP BY Id_Categoria
) c ON c.Id_Categoria = p.Id_Categoria;
