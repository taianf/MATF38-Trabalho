DELIMITER //
CREATE TRIGGER trigger_venda_estoque
    after INSERT
    on sorveteria.Itens_da_Venda
    for each row
begin
    call sorveteria.sp_venda_estoque(new.Id_Produto, new.Qtd_venda);
END //
DELIMITER ;

