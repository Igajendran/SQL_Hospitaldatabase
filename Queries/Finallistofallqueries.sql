/***---Tables---*/

select * from city;
select * from country;
select * from customer;
select * from province;
select * from singer;
select * from gender;
select * from discount;
select * from genre;
select * from language;
select * from products;
select * from music_store.order;
select * from product_audit;

/*--query 1--*/
-- Display a list of clients that spent more than the average spent by client in the past month.
select c.*,O.purchaseAmount
from `order` O
inner join customer C on C.idcustomer = O.customerid
where O.purchaseAmount > (select P.AverageAmount from (select AVG(purchaseAmount) AS AverageAmount, 
DATE_FORMAT(purchaseDate, "%M-%Y") AS PurchaseMonth
from `order`
where MONTH(purchaseDate) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
group by DATE_FORMAT(purchaseDate, "%M-%Y")) AS P);

/*--query2--*/
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


/*--query3--*/
/*--3.	The maximum price of products in the same genre (for example, rock, pop, country, hip-hop). Use GROUP BY to list all the genres and their maximum price.--*/
SELECT G.genreName,MAX(P.price) AS `Expensive Products`
FROM products P
INNER JOIN genre G ON G.idgenre = P.genre
GROUP BY G.genreName;

/*--query4--*/
/*-List how many customers the system has by location (Country, Province, and City), and then sort them.--*/
SELECT COUNT(IDCUSTOMER) AS "CUSTOMERS PER LOCATION", C.NAME AS CITY, PR.NAME AS PROVINCE, COU.NAME AS COUNTRY FROM CUSTOMER CU 
JOIN CITY C 
ON C.IDCITY = CU.CITY
JOIN PROVINCE PR 
ON PR.IDPROVINCE = CU.PROVINCE
JOIN COUNTRY COU 
ON COU.IDCOUNTRY = PR.COUNTRY
GROUP BY CITY
ORDER BY CITY, PROVINCE,COUNTRY;

/*--query5--*/
/*---List how many products the store has sold for a particular month.--*/

SELECT PRODUCT, 
COUNT(*) AS TOTALNOOFPRODUCTS,
EXTRACT(MONTH FROM PURCHASEDATE) AS MONTH,
monthname(PURCHASEDATE) AS MONTHNAME 
FROM MUSIC_STORE.ORDER ORD
JOIN 
MUSIC_STORE.PRODUCTS PR 
ON
PR.IDPRODUCTS=ORD.PRODUCT
GROUP BY MONTH(PURCHASEDATE);

/*-query6--*/
/*----List how many distinct albums each singer has.  */
SELECT CONCAT(S.FIRSTNAME, ' ', S.LASTNAME) AS SINGERNAME, 
COUNT(DISTINCT ALBUMNAME) AS total_no_albums
FROM 
PRODUCTS P 
JOIN 
SINGER S
ON
P.SINGER=S.IDSINGER
GROUP BY IDSINGER
ORDER BY SINGERNAME ;

/*---query7--*/
/*--7.	List how many copies of an album are available of a particular singer.--*/
select * from singer;
SELECT * FROM PRODUCTS;
select available_copies("Shania Twain") AS AVALABLENOOFCOPIES,'Shania Twain' AS SINGERNAME;

SELECT P.albumName AS ALBUMNAME
,SUM(available_copies(CONCAT(S.firstName, ' ', S.lastName))) as AVAILABLECOPIES
FROM singer S
INNER JOIN products P ON P.singer = S.idsinger
WHERE idsinger = 1
GROUP BY p.albumname


DELIMITER //
 
DROP FUNCTION IF EXISTS available_copies;
CREATE FUNCTION	available_copies
(
	singer_name VARCHAR(100)
)
RETURNS INT NOT DETERMINISTIC READS SQL DATA
BEGIN
  DECLARE no_of_copies INT;
  SELECT SUM(avaliableCopies) INTO no_of_copies
	FROM music_store.products
	WHERE music_store.products.singer =  
	  (SELECT idsinger 
	   FROM singer
	   WHERE CONCAT(music_store.singer.firstName, ' ', music_store.singer.lastName) = singer_name);
	
    RETURN no_of_copies;
END//

/*--query8--*/
/*--8.	Automatic Update of the Available copies with respect to the Order update.--*/
/*--query to be executed--*/
select * from products;

INSERT into music_store.order ( idorder, customerID, product, purchaseAmount, discount, purchaseDate)
values ('68', '1', '3', '150', '1', '2021-1-11');

select * from music_store.order;
select * from products;


DELIMITER //
DROP TRIGGER IF EXISTS update_pending_copies;

CREATE TRIGGER update_pending_copies
AFTER INSERT
ON music_store.order FOR EACH ROW
BEGIN
DECLARE product_id INT;
DECLARE available_copies INT;

SET product_id = NEW.product;

SELECT avaliableCopies INTO available_copies
FROM music_store.products
WHERE idproducts = product_id;

UPDATE music_store.products
SET music_store.products.avaliableCopies = available_copies -1
WHERE idproducts = product_id;
END//

/*--query9--*/
/*--9.	Automatic update of the Product Audit table for every update occurring in the product table.--*/

SELECT * FROM PRODUCTS;
SELECT * FROM PRODUCT_AUDIT;

UPDATE PRODUCTS SET ALBUMNAME='Goldennhour' WHERE IDPRODUCTS=3

DELIMITER //
DROP TRIGGER IF EXISTS update_product_audit_table;
CREATE TRIGGER update_product_audit_table
  AFTER UPDATE ON products
  FOR EACH ROW
BEGIN
    INSERT INTO product_Audit
    (product, albumName, genre, price, singer, language, avaliableCopies, modifiedBy, modifiedDate)VALUES
    (OLD.idproducts, OLD.albumName, OLD.genre, OLD.price, OLD.singer, OLD.language, 
    OLD.avaliableCopies, OLD.modifiedBy, NOW());
END//

/*--query10--*/
/*--VIEW FOR DISCOUNTREPORT-CUSTOMERWISE--*/
CREATE VIEW CustomerDiscountReport
AS
SELECT P.name,SUM(O.purchaseAmount) AS TotalSaleAmount,SUM(C.price) AS TotalProductPrice
,SUM(D.discountAmount) AS DiscountAmount
FROM `order` O
INNER JOIN customer P ON P.idcustomer = O.customerID
INNER JOIN discount D ON D.iddiscount = O.discount
INNER JOIN products C ON C.idproducts = O.product
WHERE O.discount IS NOT NULL
GROUP BY P.name;

select * from CustomerDiscountReport


/*--VIEW FOR DISCOUNTREPORT-MONTHWISE--*/
CREATE VIEW MonthWiseDiscountReport
AS
SELECT DATE_FORMAT(purchaseDate, "%M-%Y") as `Month`,SUM(O.purchaseAmount) AS TotalSaleAmount,SUM(C.price) AS TotalProductPrice
,SUM(D.discountAmount) AS DiscountAmount
FROM `order` O
INNER JOIN customer P ON P.idcustomer = O.customerID
INNER JOIN discount D ON D.iddiscount = O.discount
INNER JOIN products C ON C.idproducts = O.product
WHERE O.discount IS NOT NULL
GROUP BY DATE_FORMAT(purchaseDate, "%M-%Y")

select * from MonthWiseDiscountReport

/*--VIEW FOR DISCOUNTREPORT-MONTHWISE -STOREDPROCEDURE--*/
CALL generate_discount_report (1);
