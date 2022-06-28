/*-List how many customers the system has by location (Country, Province, and City), and then sort them.--*/

-- SELECT * FROM CUSTOMER;
-- SELECT * FROM COUNTRY;
-- SELECT * FROM CITY;
-- SELECT * FROM PROVINCE;

SELECT COUNT(IDCUSTOMER) AS "CUSTOMERS PER LOCATION", C.NAME AS CITY, PR.NAME AS PROVINCE, COU.NAME AS COUNTRY FROM CUSTOMER CU 
JOIN CITY C 
ON C.IDCITY = CU.CITY
JOIN PROVINCE PR 
ON PR.IDPROVINCE = CU.PROVINCE
JOIN COUNTRY COU 
ON COU.IDCOUNTRY = PR.COUNTRY
GROUP BY CITY
ORDER BY CITY, PROVINCE,COUNTRY
