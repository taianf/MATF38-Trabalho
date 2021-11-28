CREATE DATABASE IF NOT EXISTS sorveteria;

USE sorveteria;

CREATE TABLE `Venda`
(
    `id_venda`    INT            NOT NULL AUTO_INCREMENT,
    `Id_Vendedor` INT            NOT NULL,
    `Data_Hora`   DATETIME       NOT NULL,
    `Preco_Total` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`id_venda`)
);

CREATE TABLE `Produto`
(
    `Id_Produto`   INT            NOT NULL AUTO_INCREMENT,
    `Id_Categoria` INT            NOT NULL,
    `Nome`         varchar(50)    NOT NULL UNIQUE,
    `Preco_Venda`  DECIMAL(10, 2) NOT NULL,
    `Preco_Compra` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`Id_Produto`)
);

CREATE TABLE `Categoria`
(
    `Id_Categoria`   INT         NOT NULL AUTO_INCREMENT,
    `Nome`           varchar(20) NOT NULL UNIQUE,
    `Unidade_Medida` varchar(10) NOT NULL,
    PRIMARY KEY (`Id_Categoria`)
);

CREATE TABLE `Estoque`
(
    `Id_Produto`  INT            NOT NULL,
    `Qtd_Estoque` DECIMAL(10, 3) NOT NULL,
    PRIMARY KEY (`Id_Produto`)
);

CREATE TABLE `Estoque_Hist`
(
    `Data`        DATE           NOT NULL,
    `Id_Produto`  INT            NOT NULL,
    `Qtd_Estoque` DECIMAL(10, 3) NOT NULL,
    PRIMARY KEY (`Data`, `Id_Produto`)
);

CREATE TABLE `Vendedor`
(
    `Id_Vendedor`       INT         NOT NULL AUTO_INCREMENT,
    `Id_Funcionario`    INT,
    `Nome`              varchar(50) NOT NULL,
    `Turno_de_Trabalho` varchar(1)  NOT NULL,
    PRIMARY KEY (`Id_Vendedor`)
);

CREATE TABLE `Compra`
(
    `Id_Compra`    INT            NOT NULL AUTO_INCREMENT,
    `Id_Comprador` INT            NOT NULL,
    `CNPJ`         varchar(14)    NOT NULL,
    `Data_Hora`    DATETIME       NOT NULL,
    `Preco_Total`  DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`Id_Compra`)
);

CREATE TABLE `Fornecedor`
(
    `CNPJ`          varchar(14) NOT NULL,
    `Id_Endereco`   INT         NOT NULL,
    `Nome_Fantasia` varchar(50),
    `Razao_Social`  varchar(50) NOT NULL,
    `Telefone`      varchar(15),
    `Email`         varchar(50),
    PRIMARY KEY (`CNPJ`)
);

CREATE TABLE `Endereco`
(
    `Id_Endereco` INT         NOT NULL AUTO_INCREMENT,
    `CEP`         varchar(8)  NOT NULL,
    `Logradouro`  varchar(50) NOT NULL,
    `Numero`      varchar(10),
    `Complemento` varchar(20),
    `Bairro`      varchar(20) NOT NULL,
    `Cidade`      varchar(32) NOT NULL,
    `Estado`      varchar(30) NOT NULL,
    `Referencia`  varchar(50),
    PRIMARY KEY (`Id_Endereco`)
);

CREATE TABLE `Itens_da_Venda`
(
    `Id_Venda`      INT            NOT NULL,
    `Id_Produto`    INT            NOT NULL,
    `Qtd_venda`     DECIMAL(10, 3) NOT NULL,
    `Preco_do_item` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`Id_Venda`, `Id_Produto`)
);

CREATE TABLE `Itens_da_Compra`
(
    `Id_Compra`     INT            NOT NULL,
    `Id_Produto`    INT            NOT NULL,
    `Qtd_Compra`    DECIMAL(10, 3) NOT NULL,
    `Preco_do_Item` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`Id_Compra`, `Id_Produto`)
);

CREATE TABLE `Comprador`
(
    `Id_Comprador`   INT         NOT NULL AUTO_INCREMENT,
    `Id_Funcionario` INT         NOT NULL,
    `Nome`           varchar(50) NOT NULL,
    PRIMARY KEY (`Id_Comprador`)
);

ALTER TABLE `Venda`
    ADD CONSTRAINT `Venda_fk0` FOREIGN KEY (`Id_Vendedor`) REFERENCES `Vendedor` (`Id_Vendedor`);

ALTER TABLE `Produto`
    ADD CONSTRAINT `Produto_fk0` FOREIGN KEY (`Id_Categoria`) REFERENCES `Categoria` (`Id_Categoria`);

ALTER TABLE `Estoque`
    ADD CONSTRAINT `Estoque_fk0` FOREIGN KEY (`Id_Produto`) REFERENCES `Produto` (`Id_Produto`);

ALTER TABLE `Estoque_Hist`
    ADD CONSTRAINT `Estoque_Hist_fk0` FOREIGN KEY (`Id_Produto`) REFERENCES `Produto` (`Id_Produto`);

ALTER TABLE `Compra`
    ADD CONSTRAINT `Compra_fk0` FOREIGN KEY (`Id_Comprador`) REFERENCES `Comprador` (`Id_Comprador`);

ALTER TABLE `Compra`
    ADD CONSTRAINT `Compra_fk1` FOREIGN KEY (`CNPJ`) REFERENCES `Fornecedor` (`CNPJ`);

ALTER TABLE `Fornecedor`
    ADD CONSTRAINT `Fornecedor_fk0` FOREIGN KEY (`Id_Endereco`) REFERENCES `Endereco` (`Id_Endereco`);

ALTER TABLE `Itens_da_Venda`
    ADD CONSTRAINT `Itens_da_Venda_fk0` FOREIGN KEY (`Id_Venda`) REFERENCES `Venda` (`id_venda`);

ALTER TABLE `Itens_da_Venda`
    ADD CONSTRAINT `Itens_da_Venda_fk1` FOREIGN KEY (`Id_Produto`) REFERENCES `Produto` (`Id_Produto`);

ALTER TABLE `Itens_da_Compra`
    ADD CONSTRAINT `Itens_da_Compra_fk0` FOREIGN KEY (`Id_Compra`) REFERENCES `Compra` (`Id_Compra`);

ALTER TABLE `Itens_da_Compra`
    ADD CONSTRAINT `Itens_da_Compra_fk1` FOREIGN KEY (`Id_Produto`) REFERENCES `Produto` (`Id_Produto`);
