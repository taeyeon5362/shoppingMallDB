CREATE OR REPLACE PROCEDURE place_order(
 p_member_id IN VARCHAR2,
 p_product_id IN VARCHAR2,
 p_order_id IN VARCHAR2,
 p_order_num IN NUMBER,
 p_delivery_location IN VARCHAR2,
 p_delivery_date IN VARCHAR2
) AS
BEGIN
 -- 상품 주문
 INSERT INTO "order" (id, pid, oid, onum, delloc, dedate)
 VALUES (p_member_id, p_product_id, p_order_id, p_order_num, p_delivery_location, 
p_delivery_date);
 COMMIT;
EXCEPTION
 WHEN OTHERS THEN
 ROLLBACK;
 RAISE;
END;
