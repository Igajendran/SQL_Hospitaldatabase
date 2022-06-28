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

UPDATE PRODUCTS SET 

select * from music_store.order;
select * from product_audit
select * from music_store.order;
INSERT INTO `music_store`.`order`
(`idorder`,
`customerID`,
`product`,
`purchaseAmount`,
`discount`,
`purchaseDate`)
VALUES
(1,
<{customerID: }>,
<{product: }>,
<{purchaseAmount: }>,
<{discount: }>,
<{purchaseDate: }>);



/*--City--*/
INSERT INTO `music_store`.`city`
(`idcity`,
`name`)
VALUES
(1,'Kitchener');


INSERT INTO `music_store`.`city`
(`idcity`,
`name`)
VALUES
(2,'Brampton');


INSERT INTO `music_store`.`city`
(`idcity`,
`name`)
VALUES
(3,'Mississauga');

/*--Country--*/

INSERT INTO `music_store`.`country`
(`idcountry`,
`name`)
VALUES
(1,'Canada');


INSERT INTO `music_store`.`country`
(`idcountry`,
`name`)
VALUES
(2,'India');


INSERT INTO `music_store`.`country`
(`idcountry`,
`name`)
VALUES
(3,'US');

/*--Province--*/

INSERT INTO `music_store`.`province`
(`idprovince`,
`name`,
`country`)
VALUES
(1,
'Ontario',
1);

INSERT INTO `music_store`.`province`
(`idprovince`,
`name`,
`country`)
VALUES
(2,
'Alberta',
1);

INSERT INTO `music_store`.`province`
(`idprovince`,
`name`,
`country`)
VALUES
(3,
'Manitoba',
1);

/*--Gender--*/

INSERT INTO `music_store`.`gender`
(`idgender`,
`genderName`)
VALUES
(1,'Male');


INSERT INTO `music_store`.`gender`
(`idgender`,
`genderName`)
VALUES
(2,'Female');


INSERT INTO `genremusic_store`.`gender`
(`idgender`,
`genderName`)
VALUES
(3,'Others');

/*--Genre--*/
INSERT INTO `music_store`.`genre`
(`idgenre`,
`genreName`)
VALUES
(1,'Rock');

INSERT INTO `music_store`.`genre`
(`idgenre`,
`genreName`)
VALUES
(2,'Pop');

INSERT INTO `music_store`.`genre`
(`idgenre`,
`genreName`)
VALUES
(3,'Country');

INSERT INTO `music_store`.`genre`
(`idgenre`,
`genreName`)
VALUES
(4,'Hip-Hop');

/*--Language--*/
INSERT INTO `music_store`.`language`
(`idlanguage`,
`name`)
VALUES
(1,
'English');

INSERT INTO `music_store`.`language`
(`idlanguage`,
`name`)
VALUES
(2,
'Tamil');

INSERT INTO `music_store`.`language`
(`idlanguage`,
`name`)
VALUES
(3,
'Hindi');

INSERT INTO `music_store`.`language`
(`idlanguage`,
`name`)
VALUES
(4,
'French');




/*--Customer--*/


INSERT INTO `music_store`.`customer`
(`idcustomer`,
`name`,
`mobileNumber`,
`emailAddress`,
`city`,
`province`,
`gender`)
VALUES
(1,
'Ashwin',
'1122334455',
'adavleysureshra6461@conestogac.on.ca',
1,
1,
1);



INSERT INTO `music_store`.`customer`
(`idcustomer`,
`name`,
`mobileNumber`,
`emailAddress`,
`city`,
`province`,
`gender`)
VALUES
(2,
'Ishwarya',
'1122338955',
'Igajendran3105@conestogac.on.ca',
1,
1,
2);


INSERT INTO `music_store`.`customer`
(`idcustomer`,
`name`,
`mobileNumber`,
`emailAddress`,
`city`,
`province`,
`gender`)
VALUES
(3,
'Sanjana',
'1223389550',
'ssurendran2142@conestogac.on.ca',
1,
1,
2);


INSERT INTO `music_store`.`customer`
(`idcustomer`,
`name`,
`mobileNumber`,
`emailAddress`,
`city`,
`province`,
`gender`)
VALUES
(4,
'Paveen',
'1223389557',
'Pthiruvazhi4536@conestogac.on.ca',
1,
1,
1);


INSERT INTO `music_store`.`customer`
(`idcustomer`,
`name`,
`mobileNumber`,
`emailAddress`,
`city`,
`province`,
`gender`)
VALUES
(5,
'Shiva',
'1223389556',
'shivasankari3456@conestogac.on.ca',
1,
1,
2);


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



/*--Singer--*/
/**--pop---*/
INSERT INTO `music_store`.`singer`
(`idsinger`,
`firstName`,
`lastName`,
`gender`)
VALUES
(1,
'Avril',
'Lavigne',
2);



INSERT INTO `music_store`.`singer`
(`idsinger`,
`firstName`,
`lastName`,
`gender`)
VALUES
(2,
'Justin',
'Bieber',
1);

/*---rock---*/

INSERT INTO `music_store`.`singer`
(`idsinger`,
`firstName`,
`lastName`,
`gender`)
VALUES
(3,
'Bryan',
'Adams',
1);

INSERT INTO `music_store`.`singer`
(`idsinger`,
`firstName`,
`lastName`,
`gender`)
VALUES
(4,
'Joni',
'Mitchelle',
2);

/*---countrysingers---*/
INSERT INTO `music_store`.`singer`
(`idsinger`,
`firstName`,
`lastName`,
`gender`)
VALUES
(5,
'Shania',
'Twain',
2);

INSERT INTO `music_store`.`singer`
(`idsinger`,
`firstName`,
`lastName`,
`gender`)
VALUES
(6,
'Anne',
'Murray',
2);

/*---hiphop--*/


INSERT INTO `music_store`.`singer`
(`idsinger`,
`firstName`,
`lastName`,
`gender`)
VALUES
(7,
'Aubrey',
'Drake',
1);


INSERT INTO `music_store`.`singer`
(`idsinger`,
`firstName`,
`lastName`,
`gender`)
VALUES
(8,
'Michie',
'Mee',
2);

/*--products---*/

INSERT INTO `music_store`.`products`
(`idproducts`,
`albumName`,
`genre`,
`price`,
`singer`,
`language`,
`avaliableCopies`,
`isActive`,
`createdBy`,
`createdDate`,
`modifiedDate`,
`modifiedBy`)
VALUES
(1,
'The Best Damn Thing',
1,
'80',
1,
1,
10,
1,
'xxx',
'2015-03-28 09:40:28',
'2015-03-28 09:40:28',
'Salesperson');



INSERT INTO `music_store`.`products`
(`idproducts`,
`albumName`,
`genre`,
`price`,
`singer`,
`language`,
`avaliableCopies`,
`isActive`,
`createdBy`,
`createdDate`,
`modifiedDate`,
`modifiedBy`)
VALUES
(2,
'Blue',
2,
'90',
1,
1,
10,
1,
'xxx',
'2015-03-28 09:40:28',
'2015-03-28 09:40:28',
'Salesperson');

INSERT INTO `music_store`.`products`
(`idproducts`,
`albumName`,
`genre`,
`price`,
`singer`,
`language`,
`avaliableCopies`,
`isActive`,
`createdBy`,
`createdDate`,
`modifiedDate`,
`modifiedBy`)
VALUES
(3,
'Goldenhour',
3,
'100',
1,
1,
10,
1,
'xxx',
'2015-03-28 09:40:28',
'2015-03-28 09:40:28',
'Salesperson');


INSERT INTO `music_store`.`products`
(`idproducts`,
`albumName`,
`genre`,
`price`,
`singer`,
`language`,
`avaliableCopies`,
`isActive`,
`createdBy`,
`createdDate`,
`modifiedDate`,
`modifiedBy`)
VALUES
(4,
'ReadytoDie',
4,
'100',
1,
1,
10,
1,
'xxx',
'2015-03-28 09:40:28',
'2015-03-28 09:40:28',
'Salesperson');

INSERT INTO `music_store`.`products`
(`idproducts`,
`albumName`,
`genre`,
`price`,
`singer`,
`language`,
`avaliableCopies`,
`isActive`,
`createdBy`,
`createdDate`,
`modifiedDate`,
`modifiedBy`)
VALUES
(5,
'ReadytoDie',
4,
'100',
1,
1,
10,
1,
'xxx',
'2015-03-28 09:40:28',
'2015-03-28 09:40:28',
'Salesperson');

INSERT INTO `music_store`.`products`
(`idproducts`,
`albumName`,
`genre`,
`price`,
`singer`,
`language`,
`avaliableCopies`,
`isActive`,
`createdBy`,
`createdDate`,
`modifiedDate`,
`modifiedBy`)
VALUES
(6,
'Goldenhour',
3,
'100',
1,
1,
10,
1,
'xxx',
'2015-03-28 09:40:28',
'2015-03-28 09:40:28',
'Salesperson');

INSERT INTO `music_store`.`products`
(`idproducts`,
`albumName`,
`genre`,
`price`,
`singer`,
`language`,
`avaliableCopies`,
`isActive`,
`createdBy`,
`createdDate`,
`modifiedDate`,
`modifiedBy`)
VALUES
(7,
'Goldenhour',
3,
'100',
1,
1,
10,
1,
'xxx',
'2015-03-28 09:40:28',
'2015-03-28 09:40:28',
'Salesperson');





/*---Discount--*/

INSERT INTO `music_store`.`discount`
(`iddiscount`,
`product`,
`promocode`,
`isActive`,
`startDate`,
`endDate`,
`discountAmount`)
VALUES
(1,
1,
'Rock50',
1,
'2021-03-28 09:40:28',
'2022-01-28 09:40:28',
20);

INSERT INTO `music_store`.`discount`
(`iddiscount`,
`product`,
`promocode`,
`isActive`,
`startDate`,
`endDate`,
`discountAmount`)
VALUES
(2,
2,
'POP50',
1,
'2021-03-28 09:40:28',
'2022-03-28 09:40:28',
50);

INSERT INTO `music_store`.`discount`
(`iddiscount`,
`product`,
`promocode`,
`isActive`,
`startDate`,
`endDate`,
`discountAmount`)
VALUES
(3,
3,
'Country60',
1,
'2021-01-20 09:40:28',
'2022-01-28 09:40:28',
60);

/*---order----*/

insert into music_store.order ( idorder, customerID, product, purchaseAmount, discount, purchaseDate)
values ('1', '1', '1', '150', '1', '2021-11-11');


insert into music_store.order ( idorder, customerID, product, purchaseAmount, discount, purchaseDate)
values ('2', '2', '3', '160', '2', '2021-12-11');


insert into music_store.order ( idorder, customerID, product, purchaseAmount, discount, purchaseDate)
values ('6', '2', '2', '200', '3', NOW());