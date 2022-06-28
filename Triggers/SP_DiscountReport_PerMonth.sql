SELECT * FROM music_store.products;DELIMITER //
DROP PROCEDURE IF EXISTS generate_discount_report;

CREATE PROCEDURE generate_discount_report
(
  IN  mth INT
)
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;

  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

/*--SET viewname = CONCAT(mth, '_discount_report');--*/

	SELECT iddiscount, product, startDate, endDate, discountAmount
	FROM music_store.discount
	WHERE MONTH(startDate) = mth;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;	
END//