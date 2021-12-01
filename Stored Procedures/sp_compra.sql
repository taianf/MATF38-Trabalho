DELIMITER //
CREATE PROCEDURE sp_compra_estoque(
    IN id_produto_st integer,
    IN qtd_compra_st decimal(10, 3)
)
BEGIN
    INSERT INTO sorveteria.Estoque (Id_Produto, Qtd_Estoque)
    VALUES (id_produto_st, qtd_compra_st)
    ON DUPLICATE KEY UPDATE sorveteria.Estoque.Qtd_Estoque = sorveteria.Estoque.Qtd_Estoque + qtd_compra_st;
END //
DELIMITER ;
