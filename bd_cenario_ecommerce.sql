-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criando tabelas

-- tabela cliente

CREATE TABLE clients (
	idClient INT auto_increment primary key,
    Fname VARCHAR(10),
    Minit VARCHAR(3),
    Lname varchar(20),
    CPF char(11) NOT NULL,
    typle_client enum('PF','PJ'),
    Address varchar(255),
    constraint unique_cpf_client UNIQUE (CPF)   
);
alter table clients add type_client enum('PF','PJ');

-- tabela produto 
CREATE TABLE product (
	idProduct INT auto_increment primary key,
    Pname VARCHAR(100),
    Classification_kids bool default false,
    Category ENUM('Eletrônico','Moda','Brinquedos','Alimentos','Móveis') not null,
	Rating float default 0,
    size VARCHAR(10)
);

-- tabelas	pagamentos

create table payment_type (
	idPayment int auto_increment primary key,
    typePayment varchar(100),
    constraint unique_payment unique(typePayment)
);

CREATE TABLE payments(
	idClient int,
    id_payment int,
    limitAvaiable float,
    primary key (idClient, id_payment),
    constraint fk_payments foreign key (id_payment) references payment_type(idPayment)
);

-- tabela pedido
CREATE TABLE orders (
	idOrder INT auto_increment primary key,
    idOrderClient int,
	orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,	
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);
alter table Orders add idDelivery int,
					add constraint fk_delivery_ordes foreign key (idDelivery) references delivery(idDelivery);

-- tabela estoque
create table productStorage (
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
	SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(10) not null,
    constraint unique_supplier unique (CNPJ)
);

-- tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF CHAR(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);
 
 -- tabela produto vendedor
 create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
 );
 
 -- tabela produto / pedido
 create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível',	'Sem estoque') default 'Disponível',
    primary key (idPOproduct,idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
 );
 
-- localização da loja
 create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key(idLstorage) references productStorage(idProdStorage)
 );
 
-- tabela produto/fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
-- incluindo tabela delivery 
create table delivery(
	idDelivery int auto_increment primary key,
    statusOrders enum('Produto em transito', 'Produto entregue ao destinatário', 'Produto esta em rota de entrega'),
    codeTracking int,
    constraint fk_product_delivery foreign key (idDelivery) references orders(idOrderClient)
);
