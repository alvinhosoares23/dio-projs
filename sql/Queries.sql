use  ecomerce;

select *from Produtos;

-- Quais são os produtos disponíveis para venda em estoque 1?
SELECT
    P.idProduto,
    P.Descricao,
    P.Preco,
    EP.Quantidade,
    E.Endereco AS EnderecoEstoque
FROM
    Produtos P
JOIN
    Produto_Por_Estoque EP ON P.idProduto = EP.Produto_idProduto
JOIN
    Estoque E ON EP.Estoque_idEstoque = E.idEstoque
WHERE
    E.idEstoque = 1;


-- Quais são os clientes que fizeram pedidos e seus respectivos pagamentos?
SELECT
    C.idCliente,
    CONCAT(C.Nome, ' ', C.SobreNome) AS NomeCompleto,
    P.Tipo AS TipoPagamento,
    P.Total_Valor
FROM
    Clientes C
JOIN
    Pagamentos P ON C.idCliente = P.Cliente_idCliente;
    
-- Quais são os produtos disponíveis para venda por terceiros vendedores e suas respectivas quantidades?
SELECT
    PV.idTerceiro_vendedor,
    PV.NomeFantasi AS NomeVendedor,
    P.Descricao,
    PPV.Quantidade
FROM
    Produto_Por_Vendedor PPV
JOIN
    Produtos P ON PPV.Produto_idProduto = P.idProduto
JOIN
    Terceiro_Vendedor PV ON PPV.Terceiro_idTerceiro = PV.idTerceiro_vendedor;
    
-- Quais são os produtos que estão disponíveis em determinado estoque e também são vendidos por terceiros vendedores?
SELECT
    P.idProduto,
    P.Descricao,
    P.Preco,
    EP.Quantidade AS QuantidadeEmEstoque,
    PPV.Quantidade AS QuantidadePorVendedor,
    E.Endereco AS EnderecoEstoque,
    PV.NomeFantasi AS NomeVendedor
FROM
    Produtos P
LEFT JOIN
    Produto_Por_Estoque EP ON P.idProduto = EP.Produto_idProduto
LEFT JOIN
    Estoque E ON EP.Estoque_idEstoque = E.idEstoque
LEFT JOIN
    Produto_Por_Vendedor PPV ON P.idProduto = PPV.Produto_idProduto
LEFT JOIN
    Terceiro_Vendedor PV ON PPV.Terceiro_idTerceiro = PV.idTerceiro_vendedor
WHERE
    E.idEstoque = 1 AND PV.idTerceiro_vendedor IS NOT NULL;

-- Quais são os clientes que fizeram pedidos No dia 2023-07-17 ?
SELECT DISTINCT
    C.idCliente,
    CONCAT(C.Nome, ' ', C.SobreNome) AS NomeCompleto,
    C.Email,
    C.Telefone,
    C.Endereco
FROM
    Clientes C
JOIN
    Pedido P ON C.idCliente = P.Cliente_idcliente
WHERE
    P.DataPedido = '2023-07-17'; 

-- Qual é a quantidade disponível de um produto em todos os estoques
SELECT
    P.idProduto,
    P.Descricao,
    SUM(EP.Quantidade) AS QuantidadeDisponivel
FROM
    Produtos P
JOIN
    Produto_Por_Estoque EP ON P.idProduto = EP.Produto_idProduto
GROUP BY
    P.idProduto, P.Descricao;
    
-- Qual é o valor total das vendas por tipo de pagamento em um determinado período?
SELECT
    P.Tipo AS TipoPagamento,
    SUM(P.Total_Valor) AS ValorTotalVendas
FROM
    Pagamentos P
WHERE
    P.DataPagamento BETWEEN '2023-07-18' AND '2023-07-21' 
GROUP BY
    P.Tipo;
    
-- Filtrar apenas pagamentos com valor total de vendas maior que 500
SELECT
    Tipo AS TipoPagamento,
    SUM(Total_Valor) AS ValorTotalVendas
FROM
    Pagamentos
GROUP BY
    Tipo
HAVING
    SUM(Total_Valor) > 500; 

-- Filtrar apenas clientes com valor total de compras maior que 500
SELECT
    C.Nome AS NomeCliente,
    SUM(P.Total_Valor) AS ValorTotalVendas
FROM
    Clientes C
JOIN
    Pagamentos P ON C.idCliente = P.Cliente_idCliente
WHERE
    P.DataPagamento BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    C.idCliente
HAVING
    SUM(P.Total_Valor) > 500; 


-- Filtrar apenas produtos com quantidade disponível maior que 0
SELECT
    PR.idProduto,
    PR.Descricao AS DescricaoProduto,
    SUM(PE.Quantidade) AS QuantidadeDisponivel
FROM
    Produtos PR
JOIN
    Produto_Por_Estoque PE ON PR.idProduto = PE.Produto_idProduto
GROUP BY
    PR.idProduto, PR.Descricao
HAVING
    SUM(PE.Quantidade) > 0; 

