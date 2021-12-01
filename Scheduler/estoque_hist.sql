SET GLOBAL event_scheduler = ON;

CREATE EVENT estoque_hist
    ON SCHEDULE EVERY 1 DAY
        STARTS '2021-11-01 00:00:00'
    DO
    INSERT INTO sorveteria.Estoque_Hist
    SELECT (CURRENT_DATE() + INTERVAL 2 DAY) as Data, Id_Produto, Qtd_Estoque
    from sorveteria.Estoque;
