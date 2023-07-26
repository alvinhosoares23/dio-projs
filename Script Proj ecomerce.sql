drop database if exists ecmomerce;
create database if not exists ecomerce;

use ecomerce; 

create table if not exists Fornecedor(
	idFornecedor int not null auto_increment,
    Razao_Social varchar(45) ,
    CNPJ varchar(45) not null,
    Email VARCHAR(30),
    Telefone VARCHAR(20)not null,
    primary key (idFornecedor)
) ;

create table if not exists Produtos(
	idProduto int not null auto_increment,
    Categoria enum('Eletronicos','Brinquedos','Roupas','livros','Tenis','Outros') not null,
    Descricao varchar(45),
    Avaliacao float default 0,
    Preco DECIMAL(10, 2),
    primary key(idProduto)
);

create table if not exists Estoque (
	idEstoque int not null auto_increment,
    Endereco varchar(45),
    Quantidade int not null,
    primary key(idEstoque)
);
create table if not exists Clientes(
	idCliente int not null auto_increment,
    Nome varchar (45) not null,
    SobreNome varchar (45) ,
    Email varchar (45),
    CPF char(11) unique not null,
    CEP Varchar(10) not null,
    Telefone varchar(15),
    Endereco varchar(45),
    primary key (idCliente)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists Pagamentos(
	idPagamento int not null auto_increment,
    Cliente_idCliente INT NOT NULL,
    Tipo enum('Cartão Credito','Cartão Debito','Transferencia Bancaria','PayPal','Pix','Crypto'),
	Total_Valor DECIMAL(10, 2),
    DataPagamento DATE,
    primary key(idPagamento),
    CONSTRAINT FOREIGN KEY (Cliente_idCliente) REFERENCES Clientes(idCliente)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Pedido (
    idPedido INT NOT NULL AUTO_INCREMENT,
    Status_pedido ENUM('Em Andamento', 'Em Processamento', 'Enviado', 'Entregue') DEFAULT 'Em Processamento',
    Descricao VARCHAR(45),
    DataPedido DATE,
    Cliente_idcliente INT ,
    Frete FLOAT default 10,
	Pagamento_idPagamento INT not null,	
    PRIMARY KEY (idPedido),
    CONSTRAINT FOREIGN KEY (Cliente_idcliente) REFERENCES Clientes(idCliente),
    CONSTRAINT FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamentos(idPagamento)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists Relacao_Produto_pedido(
	Produto_idProduto int not null,
    Pedido_idPedido int not null,
    Quantidade varchar (45) not null,
    Status_R_P_P enum("Disponivel","Não Desponivel") default'Disponivel',
    constraint foreign key(Produto_idProduto) references Produtos(idProduto),
    constraint foreign key(Pedido_idPedido) references Pedido(idPedido)
);

create table if not exists Terceiro_Vendedor(
	idTerceiro_vendedor int not null,
    Razao_social varchar(45) not null unique,
    NomeFantasi varchar (45) not null,
    Endereco varchar(45),
    Terceiro varchar(45)not null,
    primary key (idTerceiro_vendedor)
);
create table if not exists Disp_um_produto(
	Fornecedor_idFornecedor int not null,
    Produto_idProduto int not null,
	constraint foreign key(Fornecedor_idFornecedor) references Fornecedor(idFornecedor),
    constraint foreign key(Produto_idProduto) references Produtos(idProduto)
);

create table if not exists Produto_Por_Vendedor(
	Terceiro_idTerceiro int not null,
    Produto_idProduto int not null,
    Quantidade int not null,
	constraint foreign key(Terceiro_idTerceiro) references Terceiro_Vendedor(idTerceiro_vendedor),
    constraint foreign key(Produto_idProduto) references Produtos(idProduto)
);

create table if not exists Produto_Por_Estoque(
	Estoque_idEstoque int not null,
    Produto_idProduto int not null,
    Quantidade int not null,
    DataAtualizacao DATE,
	constraint foreign key(Estoque_idEstoque ) references Estoque(idEstoque),
    constraint foreign key(Produto_idProduto) references Produtos(idProduto)
);





