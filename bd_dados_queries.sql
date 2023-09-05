-- inserção de dados  e queries

use ecommerce;

insert into Clients (Fname, Minit, Lname, CPF, Address, type_client)
		values('Maria', 'M', 'Silva', 12346789, 'Rua Silva de Prata 29, Carangola - Cidade das Flores', 'PJ'),
			  ('Matheus', 'O', 'Pimentel', 987654321, 'Rua Alameda 289, Centro - Cidade das Flores', 'PF'),
              ('Ricardo', 'F', 'Silva', 45678913, 'Rua Almeda Vinha 1009, Centro - Cidade das Flores', 'PF'),
              ('Julia', 'S', 'França', 789123456, 'Rua Lareijras 861, Centro - Cidade das Flores', 'PJ'),
              ('Roberta','G', 'Assis', 98745631, 'Avenidade Koller 19, Centro - Cidade das Flores','PF'),
              ('Isabela', 'M', 'Cruz', 654789123, 'Rua Alameda das Flores 28, Centro - Cidade das Flores', 'PJ');


insert into product (Pname, Classification_kids, Category, Rating, size)
		values('Fonde de ouvido',false,'Eletrônico','4', null),
			  ('Barbie Elsa',true,'Brinquedos','3', null),
              ('Body Carters',true,'Moda','5', null),
              ('Microfone Vedo Youtuber',false,'Eletrônico','4', null),
              ('Sofá retrátil',false,'Móveis','3','3x57x80'),
              ('Farinha de Arroz',false,'Alimentos','2', null),
              ('Fire Stick Amazon',false,'Eletrônico','3', null);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
		values(1, default, 'compra via aplicativo', null, 1),
			  (2, default, 'compra via aplicativo', 50, 0),
			  (3, 'Confirmado', null, null, 1),
              (4, default, 'compra via web site', 150,0);
          
          
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
		 values(1,1,2,null),
			   (2,1,1,null),
			   (3,2,1,null);
select*from productOrder;
               
insert into productStorage (storageLocation, quantity)
		values('Rio de Janeiro', 1000),
              ('Rio de Janeiro', 500),
		      ('São Paulo', 10),
              ('São Paulo', 100),
              ('São Paulo',10),
              ('Brasília', 60);
              
insert into storageLocation (idLproduct,idLstorage,location)
			values(1,2,'RJ'),
                  (2,6,'GO');

insert into supplier (SocialName, CNPJ, contact)
		values('Almeida e filhos', 123456789123456,'21985474'),
		      ('Eletronicos Silva', 854519649143457, '21985484'),
              ('Eletronicos Valma', 934567893934695, '21975474');
              
insert into productSupplier (idPsSupplier, idPsProduct, quantity)
		values(1,1,500),
              (1,2,400),
              (2,4,633),
              (3,3,5),
              (2,5,10);
              
              
insert into seller(SocialName, AbstName, CNPJ, CPF, location, contact)
		values('Tech eletronics', 'Tech eletronics', 123456789456321, null,'Rio de Janeiro', 219946287),
              ('Botique Durgas', 'Botique Durgas',null, 123456783, 'Rio de Janeiro', 219567895),
              ('Kids World', 'Kids World', 456789123654485, null, 'São Paulo', 1198657484);
              
              
insert into productSeller (idPseller, idPproduct, prodQuantity)
		values(1,6,80),
              (2,7,10);
              
insert into delivery (idDelivery, statusOrders,codeTracking)
		       values(1, 'Produto entregue ao destinatário', 12345678),
					 (2, 'Produto em transito', 45678923),
                     (3, 'Produto esta em rota de entrega', 34512367),
                     (4, 'Produto em transito', 76548329);
                     
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
		values(2,default, 'compra via aplicativo', null, 1);
        
update orders set IdDelivery = '1'
where idOrder = 1;
update orders set IdDelivery = '2'
where idOrder = 2;
update orders set IdDelivery = '3'
where idOrder = 3;
update orders set IdDelivery = '4'
where idOrder = 4;
