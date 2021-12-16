use sorveteria;
SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                       'cnpj', f.CNPJ,
                       'nome_fantasia', f.Nome_Fantasia,
                       'razao_social', f.Razao_Social,
                       'telefone', f.Telefone,
                       'email', f.Email,
                       'endereco', t.endereço
                   )
           )
FROM Fornecedor f
         LEFT JOIN (
    SELECT Id_Endereco,
           JSON_OBJECT(
                   'cep', CEP,
                   'logradouro', Logradouro,
                   'numero', Numero,
                   'complemento', Complemento,
                   'bairro', Bairro,
                   'cidade', Cidade,
                   'estado', Estado,
                   'referencia', Referencia
               )
               endereço
    FROM Endereco
    GROUP BY Id_Endereco
) t ON t.Id_Endereco = f.Id_Endereco;

