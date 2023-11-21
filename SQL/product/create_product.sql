CREATE OR REPLACE PROCEDURE create_product(
 p_product_id IN VARCHAR2,
 p_product_name IN VARCHAR2,
 p_product_num IN NUMBER,
 p_product_price IN NUMBER,
 p_delivery_name IN VARCHAR2,
 p_delivery_date IN VARCHAR2,
 p_delivery_num IN NUMBER
) AS
BEGIN
 -- 상품 등록
 INSERT INTO product (pid, pname, pnum, pprice, dname, ddate, dnum)
 VALUES (p_product_id, p_product_name, p_product_num, p_product_price, p_delivery_name, 
p_delivery_date, p_delivery_num);
 COMMIT;
EXCEPTION
 WHEN OTHERS THEN
 ROLLBACK;
 RAISE;
END;
