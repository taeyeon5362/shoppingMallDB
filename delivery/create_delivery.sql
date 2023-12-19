CREATE OR REPLACE PROCEDURE create_delivery(
 p_delivery_name IN VARCHAR2,
 p_delivery_number IN VARCHAR2,
 p_delivery_location IN VARCHAR2,
 p_delivery_manager IN VARCHAR2
) AS
BEGIN
 -- 운송업체 등록
 INSERT INTO delivery (dname, dnumber, dloc, dmanager)
 VALUES (p_delivery_name, p_delivery_number, p_delivery_location, p_delivery_manager);
 COMMIT;
EXCEPTION
 WHEN OTHERS THEN
 ROLLBACK;
 RAISE;
END;
