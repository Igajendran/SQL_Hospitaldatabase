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






