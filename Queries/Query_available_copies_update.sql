DELIMITER //
 
CREATE FUNCTION	available_copies
(
	singer_name VARCHAR(100)
)
RETURNS INT NOT DETERMINISTIC READS SQL DATA
BEGIN
  DECLARE no_of_copies INT;

	SELECT SUM(availableCopies) INTO no_of_copies
	FROM music_store.products
	WHERE CONCAT(music_store.singer.firstName, ' ', music_store.singer.lastName) = singer_name ;
	
    RETURN no_of_copies;
END//