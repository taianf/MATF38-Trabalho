DELIMITER //
CREATE TRIGGER trigger_compra_estoque
    after INSERT
    on sorveteria.Itens_da_Compra
    for each row
begin
    call sorveteria.sp_compra_estoque(new.Id_Produto, new.Qtd_Compra);
END //
DELIMITER ;
