use  ecomerce;

-- Inserindo dados na tabela "Clientes"
INSERT INTO Clientes (Nome, Sobrenome, Email, Telefone, Endereco, CPF, CEP)
VALUES
    ('Maria', 'Silva', 'maria@example.com', '(11) 98765-4321', 'Rua A, 123', '123.456.789-00', '01234-567'),
    ('João', 'Santos', 'joao@example.com', '(21) 98765-4321', 'Av. B, 456', '987.654.321-00', '21000-123'),
    ('Pedro', 'Ferreira', 'pedro@example.com', '(31) 98765-4321', 'Praça C, 789', '456.789.123-00', '30123-456');
    
-- Inserindo dados na tabela "Fornecedor"
INSERT INTO Fornecedor (Razao_Social, CNPJ, Email, Telefone)
VALUES
    ('Fornecedor A LTDA', '12.345.678/0001-90', 'fornecedorA@example.com', '(11) 9999-8888'),
    ('Fornecedor B ME', '98.765.432/0001-21', 'fornecedorB@example.com', '(21) 8888-7777'),
    ('Fornecedor C EIRELI', '56.789.123/0001-54', 'fornecedorC@example.com', '(31) 7777-6666');


-- Inserindo dados na tabela "Produtos"
INSERT INTO Produtos (Categoria, Descricao, Avaliacao, Preco)
VALUES
    ('Eletronicos', 'Smartphone modelo X', 4.5, 1500.00),
    ('Roupas', 'Camiseta estampada', 4.2, 50.00),
    ('Livros', 'Livro de ficção', 4.8, 30.00),
    ('Brinquedos', 'Carrinho de controle remoto', 4.6, 100.00);


-- Inserindo dados na tabela "Estoque"
INSERT INTO Estoque (Endereco, Quantidade)
VALUES
    ('Rua A, 123', 50),
    ('Av. B, 456', 100),
    ('Praça C, 789', 30);
    
-- Inserindo dados na tabela "Pagamentos"
INSERT INTO Pagamentos (Cliente_idCliente, Tipo, Total_Valor, DataPagamento)
VALUES
    (1, 'Cartão Crédito', 150.00, '2023-07-19'),
    (2, 'PayPal', 200.50, '2023-07-18'),
    (3, 'Pix', 75.80, '2023-07-17');
    
-- Inserindo dados na tabela "Pedido"
INSERT INTO Pedido (Status_pedido, Descricao, DataPedido, Cliente_idcliente, Frete, Pagamento_idPagamento)
VALUES
    ('Em Andamento', 'Pedido 1', '2023-07-19', 1, 15.50, 1),
    ('Em Processamento', 'Pedido 2', '2023-07-18', 2, 12.00, 2),
    ('Enviado', 'Pedido 3', '2023-07-17', 3, 8.75, 3);



INSERT INTO Relacao_Produto_pedido (Produto_idProduto,Pedido_idPedido, Quantidade, Status_R_P_P)
VALUES
    (1, 1, 200,'Disponivel'),
    (2, 2, 50,'Disponivel'),
    (3, 3, 400,'Disponivel');
    
    -- Inserindo dados  na tabela "Terceiro_Vendedor"
INSERT INTO Terceiro_Vendedor (idTerceiro_vendedor, Razao_social, NomeFantasi, Endereco, Terceiro)
VALUES
    (1, 'Empresa X LTDA', 'VendedorX', 'Rua A, 123', 'Terceiro 1'),
    (2, 'Empresa Y S.A.', 'VendedorY', 'Av. B, 456', 'Terceiro 2'),
    (3, 'Empresa Z EIRELI', 'VendedorZ', 'Praça C, 789', 'Terceiro 3');

-- Inserindo dados de exemplo na tabela "Disp_um_produto"
INSERT INTO Disp_um_produto (Fornecedor_idFornecedor, Produto_idProduto)
VALUES
    (1, 1), 
    (2, 2), 
    (3, 1); 


-- Inserindo dados  na tabela "Produto_Por_Vendedor"
INSERT INTO Produto_Por_Vendedor (Terceiro_idTerceiro, Produto_idProduto, Quantidade)
VALUES
    (1, 1, 100), 
    (2, 2, 50), 
    (3, 1, 200); 


-- Inserindo dados  na tabela "Produto_Por_Estoque"
INSERT INTO Produto_Por_Estoque (Estoque_idEstoque, Produto_idProduto, Quantidade, DataAtualizacao)
VALUES
    (1, 1, 50, '2023-07-19'), 
    (2, 2, 30, '2023-07-18'), 
    (3, 3, 100, '2023-07-17'); 


-- Inserindo dados na tabela Produtos
INSERT INTO Produtos (Descricao, Preco, Categoria) VALUES
    ('Celular', 999.99, 'Eletronicos');

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (Endereco, Quantidade) VALUES
    ('Rua A, Número 123', 10),
    ('Avenida B, Número 456', 10);


INSERT INTO Produto_Por_Estoque (Produto_idProduto, Estoque_idEstoque, Quantidade) VALUES
    (1, 1, 10),
    (1, 2, 10);

-- Inserindo dados de exemplo na tabela Pagamentos
INSERT INTO Pagamentos (Cliente_idCliente, Tipo, Total_Valor, DataPagamento) VALUES
    (1, 'Cartão Credito', 150.00, '2023-07-18'),
    (2, 'Cartão Debito', 150.00, '2023-07-18'),
    (3, 'Pix', 150.00, '2023-07-18'),
    (1, 'Cartão Credito', 150.00, '2023-07-18');
