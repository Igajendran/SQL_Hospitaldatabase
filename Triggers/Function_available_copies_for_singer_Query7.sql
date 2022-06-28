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