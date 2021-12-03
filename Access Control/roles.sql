CREATE ROLE 'admin'@'localhost'; # ok
CREATE ROLE 'developer'@'localhost'; # ok
CREATE ROLE 'gerente'@'localhost'; # ok
CREATE ROLE 'vendedor'@'localhost';
CREATE ROLE 'supervisor'@'localhost';
CREATE ROLE 'comprador'@'localhost';
CREATE ROLE 'supervisor_compras'@'localhost';
CREATE ROLE 'estoquista'@'localhost';

# verificar roles criadas
SELECT DISTINCT User 'Role Name', if(from_user is NULL, 0, 1) Active
FROM mysql.user
         LEFT JOIN mysql.role_edges ON from_user = user
WHERE account_locked = 'Y'
  AND password_expired = 'Y'
  AND authentication_string = '';

# todos os acessos para admin, desenvolvedores e gerente
GRANT ALL ON sorveteria.* TO 'admin'@'localhost', 'developer'@'localhost', 'gerente'@'localhost';

# acessos de vendedor
GRANT SELECT ON sorveteria.Categoria TO 'vendedor'@'localhost';
# REVOKE ALL ON sorveteria.Compra FROM 'vendedor'@'localhost';
# REVOKE ALL ON sorveteria.Comprador FROM 'vendedor'@'localhost';
# REVOKE ALL ON sorveteria.Endereco FROM 'vendedor'@'localhost';
GRANT SELECT ON sorveteria.Estoque TO 'vendedor'@'localhost';
# REVOKE ALL ON sorveteria.Estoque_Hist FROM 'vendedor'@'localhost';
# REVOKE ALL ON sorveteria.Fornecedor FROM 'vendedor'@'localhost';
# REVOKE ALL ON sorveteria.Itens_da_Compra FROM 'vendedor'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Itens_da_Venda TO 'vendedor'@'localhost';
GRANT SELECT ON sorveteria.Produto TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Venda TO 'vendedor'@'localhost';
GRANT SELECT ON sorveteria.Vendedor TO 'vendedor'@'localhost';

# acessos de supervisor
GRANT SELECT ON sorveteria.Categoria TO 'supervisor'@'localhost';
# REVOKE ALL ON sorveteria.Compra FROM 'supervisor'@'localhost';
# REVOKE ALL ON sorveteria.Comprador FROM 'supervisor'@'localhost';
# REVOKE ALL ON sorveteria.Endereco FROM 'supervisor'@'localhost';
GRANT SELECT ON sorveteria.Estoque TO 'supervisor'@'localhost';
# REVOKE ALL ON sorveteria.Estoque_Hist FROM 'supervisor'@'localhost';
# REVOKE ALL ON sorveteria.Fornecedor FROM 'supervisor'@'localhost';
# REVOKE ALL ON sorveteria.Itens_da_Compra FROM 'supervisor'@'localhost';
GRANT SELECT, INSERT, DELETE ON sorveteria.Itens_da_Venda TO 'supervisor'@'localhost';
GRANT SELECT ON sorveteria.Produto TO 'supervisor'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Venda TO 'supervisor'@'localhost';
GRANT SELECT ON sorveteria.Vendedor TO 'supervisor'@'localhost';

# acessos de comprador
GRANT SELECT ON sorveteria.Categoria TO 'comprador'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Compra TO 'comprador'@'localhost';
GRANT SELECT ON sorveteria.Comprador TO 'comprador'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Endereco TO 'comprador'@'localhost';
GRANT SELECT ON sorveteria.Estoque TO 'comprador'@'localhost';
# REVOKE ALL ON sorveteria.Estoque_Hist FROM 'comprador'@'localhost';
GRANT SELECT, INSERT, UPDATE ON sorveteria.Fornecedor TO 'comprador'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Itens_da_Compra TO 'comprador'@'localhost';
# REVOKE ALL ON sorveteria.Itens_da_Venda FROM 'comprador'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Produto TO 'comprador'@'localhost';
# REVOKE ALL ON sorveteria.Venda FROM 'comprador'@'localhost';
# REVOKE ALL ON sorveteria.Vendedor FROM 'comprador'@'localhost';

# acessos de supervisor_compras
GRANT SELECT, INSERT, UPDATE ON sorveteria.Categoria TO 'supervisor_compras'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Compra TO 'supervisor_compras'@'localhost';
GRANT SELECT ON sorveteria.Comprador TO 'supervisor_compras'@'localhost';
GRANT SELECT, INSERT ON sorveteria.Endereco TO 'supervisor_compras'@'localhost';
GRANT SELECT ON sorveteria.Estoque TO 'supervisor_compras'@'localhost';
# REVOKE ALL ON sorveteria.Estoque_Hist FROM 'supervisor_compras'@'localhost';
GRANT SELECT, INSERT, UPDATE ON sorveteria.Fornecedor TO 'supervisor_compras'@'localhost';
GRANT SELECT, INSERT, DELETE ON sorveteria.Itens_da_Compra TO 'supervisor_compras'@'localhost';
# REVOKE ALL ON sorveteria.Itens_da_Venda FROM 'supervisor_compras'@'localhost';
GRANT SELECT, INSERT, UPDATE ON sorveteria.Produto TO 'supervisor_compras'@'localhost';
# REVOKE ALL ON sorveteria.Venda FROM 'supervisor_compras'@'localhost';
# REVOKE ALL ON sorveteria.Vendedor FROM 'supervisor_compras'@'localhost';

# acessos de estoquista
GRANT SELECT ON sorveteria.Categoria TO 'estoquista'@'localhost';
GRANT SELECT ON sorveteria.Compra TO 'estoquista'@'localhost';
GRANT SELECT ON sorveteria.Comprador TO 'estoquista'@'localhost';
# REVOKE ALL ON sorveteria.Endereco FROM 'estoquista'@'localhost';
GRANT SELECT, UPDATE ON sorveteria.Estoque TO 'estoquista'@'localhost';
GRANT SELECT ON sorveteria.Estoque_Hist TO 'estoquista'@'localhost';
# REVOKE ALL ON sorveteria.Fornecedor FROM 'estoquista'@'localhost';
GRANT SELECT ON sorveteria.Itens_da_Compra TO 'estoquista'@'localhost';
GRANT SELECT ON sorveteria.Itens_da_Venda TO 'estoquista'@'localhost';
GRANT SELECT ON sorveteria.Produto TO 'estoquista'@'localhost';
GRANT SELECT ON sorveteria.Venda TO 'estoquista'@'localhost';
GRANT SELECT ON sorveteria.Vendedor TO 'estoquista'@'localhost';

CREATE USER 'arlindo'@'localhost' IDENTIFIED BY 'arlindo';
CREATE USER 'leduan'@'localhost' IDENTIFIED BY 'leduan';
CREATE USER 'luiz'@'localhost' IDENTIFIED BY 'luiz';
CREATE USER 'taian'@'localhost' IDENTIFIED BY 'taian';

CREATE USER 'pedro_dev'@'localhost' IDENTIFIED BY 'dev';
CREATE USER 'ana_vend'@'localhost' IDENTIFIED BY 'read1';
CREATE USER 'maria_comp'@'localhost' IDENTIFIED BY 'read2';
CREATE USER 'joao_comp'@'localhost' IDENTIFIED BY 'read2';
CREATE USER 'miguel_rw'@'localhost' IDENTIFIED BY 'rw';

GRANT 'developer'@'localhost' TO 'arlindo'@'localhost','pedro_dev'@'localhost';
GRANT 'gerente'@'localhost' TO 'leduan'@'localhost';
GRANT 'admin'@'localhost' TO 'taian'@'localhost';
GRANT 'supervisor'@'localhost' TO 'luiz'@'localhost';

GRANT 'vendedor'@'localhost' TO 'ana_vend'@'localhost';
GRANT 'comprador'@'localhost' TO 'maria_comp'@'localhost', 'joao_comp'@'localhost';
GRANT 'supervisor_compras'@'localhost' TO 'miguel_rw'@'localhost';
GRANT 'estoquista'@'localhost' TO 'miguel_rw'@'localhost';
