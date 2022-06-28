DELIMITER //

CREATE TRIGGER update_pending_copies
    AFTER INSERT 
    ON music_store.order FOR EACH ROW
BEGIN
   UPDATE music_store.products
   SET availableCopies = availableCopies - 1
   WHERE idproduct = music_store.order.product;
END//


