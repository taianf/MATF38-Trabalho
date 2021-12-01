DELIMITER //
CREATE PROCEDURE sp_venda_estoque(
    IN id_produto_st integer,
    IN qtd_venda_st decimal(10, 3)
)
BEGIN
    UPDATE sorveteria.Estoque
    set sorveteria.Estoque.Qtd_Estoque = sorveteria.Estoque.Qtd_Estoque - qtd_venda_st
    where Id_Produto = id_produto_st;
END //
DELIMITER ;
