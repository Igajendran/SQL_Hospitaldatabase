insert into music_store.order (customerID, product, purchaseAmount, discount, purchaseDate)
values (5, 1, '150', '1', '2021-11-11'),
       (6, 2, '160', '2', '2021-12-11'),
       (7, 3, '220', '3', '2021-12-11'),
       (8, 4, '240', '3', '2021-12-11'),
       (9, 5, '250', '3', '2021-12-11'),
       (10, 6, '260', NULL, '2021-12-11'),
       (11, 7, '320', '3', '2021-12-11'),
       (12, 1, '420', '3', '2021-12-11'),
       (5, 2, '470', null, '2021-12-11'),
       (6, 3, '220', '3', '2021-12-11'),
       (7, 4, '300', '3', '2021-12-11'),
       (8, 5, '400', '3', '2021-12-11'),
       (9, 6, '500', '3', '2021-12-11'),
       (10, 7, '320', '3', NOW()),
       (11, 4, '120', '3', NOW()),
       (12, 5, '2', '3', NOW()),
       (1, 6, '2', null, NOW()),
       (2, 7, '2', null, NOW()),
       (3, 1, '2', null, NOW()),
       (4, 2, '2', null, NOW()),
	   (5, 3, '2', '3', NOW()),
	   (6, 4, '2', '3', NOW()),
	   (7, 5, '2', '3', NOW());
       
       INSERT INTO customer
   (idcustomer, `name`, mobilenumber, emailaddress, city, province, gender)
VALUES
(6,'John', '5482456789', 'John@gmail.com', 5, 1, 1),
(7,'Wesley', '2422456789', 'Wesley@gmail.com', 7, 3, 1),
(8,'Albert', '3452456789', 'Albert@gmail.com', 9, 2, 1),
(9,'Robert', '6452456789', 'Robert@gmail.com', 10, 1, 1),
(10,'Angeline', '7892456789', 'Angeline@gmail.com', 4, 2, 1),
(11,'Scarlett', '3212456789', 'Scarlett@gmail.com', 3, 3, 1),
(12,'Jennifer', '2432456789', 'Jennifer@gmail.com', 2, 3, 1);

-- Display a list of clients that spent more than the average spent by client in the past month.
select c.*,O.purchaseAmount
from `order` O
inner join customer C on C.idcustomer = O.customerid
where O.purchaseAmount > (select P.AverageAmount from (select AVG(purchaseAmount) AS AverageAmount, 
DATE_FORMAT(purchaseDate, "%M-%Y") AS PurchaseMonth
from `order`
where MONTH(purchaseDate) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
group by DATE_FORMAT(purchaseDate, "%M-%Y")) AS P);


-- The top sold products and least sold products over a week.
SELECT P.albumName,G.genreName,CONCAT(S.firstname, S.lastname) AS SingerName
       ,SUM(OO.Count) as `Total Sold Copies`
FROM products P
INNER JOIN (SELECT * FROM (SELECT COUNT(O.product) AS Count, O.product
           FROM `ORDER` O
           WHERE DAY(O.purchaseDate) BETWEEN (DAY(O.purchaseDate) - 7) AND DAY(O.purchaseDate)
           GROUP BY O.product) AS O) OO on OO.product = P.idproducts
INNER JOIN genre G ON G.idgenre = P.genre
INNER JOIN singer S ON S.idsinger = P.singer
GROUP BY P.albumName,G.genreName,CONCAT(S.firstname, S.lastname);

-- The maximum price of products in the same genre (for example, rock, pop, country, hip-hop). 
-- Use GROUP BY to list all the genres and their maximum price.
SELECT G.genreName,MAX(P.price) AS `Expensive Products`
FROM products P
INNER JOIN genre G ON G.idgenre = P.genre
GROUP BY G.genreName











       
       