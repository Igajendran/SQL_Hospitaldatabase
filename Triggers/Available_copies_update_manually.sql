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
    WHERE idproducts  = product_id;
END//


