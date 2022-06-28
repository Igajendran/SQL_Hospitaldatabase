DELIMITER //
DROP TRIGGER IF EXISTS update_product_audit_table;
CREATE TRIGGER update_product_audit_table
  AFTER UPDATE ON products
  FOR EACH ROW
BEGIN
    INSERT INTO product_Audit
    (product, albumName, genre, price, singer, language, avaliableCopies, modifiedBy, modifiedDate)VALUES
    (NEW.idproducts, NEW.albumName, NEW.genre, NEW.price, NEW.singer, NEW.language, 
    NEW.avaliableCopies, NEW.modifiedBy, NOW());
END//

