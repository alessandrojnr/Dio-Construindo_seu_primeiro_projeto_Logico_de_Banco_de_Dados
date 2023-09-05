-- Quantos pedidos foram feitos por cada cliente?
use ecommerce;

select c.idClient, Fname, count(*) as Number_of_orders from clients c
			inner join orders o ON c.idClient = o.idOrderClient
			group by idClient;
            
		
-- Algum vendedor também é fornecedor?
select s.idSeller, p.idSupplier
	from seller s
    inner join supplier p ON s.SocialName = p.SocialName;
    

--  Relação de produtos cadastrados na base. ORDENE POR IdProduct, Pname, Category, Avaliação, size, Classification_kids, size
select IdProduct, Pname, Category, Rating, size, Classification_kids
from Product
order by IdProduct, Pname, Category, Rating, size, Classification_kids;


-- RELAÇÃO DOS PRODUTOS VENDIDOS PARA O CLIENTE "Matheus".
SELECT Pname AS 'Nome do Produto'
FROM Product P
INNER JOIN productOrder PO ON p.idProduct = PO.idPOproduct
INNER JOIN orders O ON O.idOrder = PO.idPOorder
INNER JOIN clients C ON C.idClient = O.idOrderClient
WHERE C.fName = 'Matheus';

-- Relação de nomes dos fornecedores e nomes dos produtos. 
select SocialName, Pname AS 'Nome dos Produtos'
from supplier s
inner join product p ON s.idSupplier = p.idProduct;

-- Quantidade total de produtos que foram vendidos da categoria "ELETRONICO".
SELECT sum(i.prodQuantity) AS "QUANTIDADE TOTAL", p.Category, p.Pname
FROM Product P
INNER JOIN productSeller I ON P.idProduct = I.idPproduct
WHERE p.Category IN ('Eletronico')
GROUP BY Category, p.Pname;

-- 	Relação de produtos, fornecedores e estoques;
select SocialName, Pname AS 'Nome dos Produtos'
from supplier s
inner join product p ON s.idSupplier = p.idProduct
inner join storageLocation SL ON idLproduct = p.idProduct;

-- Somar a quantidade total de todos os produtos e filtrar apenas os que a somatoria é maior que 10.
SELECT sum(i.prodQuantity) AS "QUANTIDADE TOTAL", p.Category, p.Pname
FROM Product P
INNER JOIN productSeller I ON P.idProduct = I.idPproduct
-- WHERE p.Category IN ('Eletronico')
GROUP BY Category, p.Pname
Having sum(i.prodQuantity) > 10;