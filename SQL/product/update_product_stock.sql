CREATE OR REPLACE PROCEDURE update_product_stock(
 p_product_id IN VARCHAR2,
 p_quantity IN NUMBER
) AS
 v_current_stock NUMBER;
BEGIN
 -- 현재 재고 조회
 SELECT p.pnum INTO v_current_stock
 FROM product p
 WHERE p.pid = p_product_id;
 -- 재고 업데이트
 v_current_stock := v_current_stock + p_quantity;
 -- 재고 업데이트
 UPDATE product
 SET pnum = v_current_stock
 WHERE pid = p_product_id;
 COMMIT;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 상품이 존재하지 않는 경우 예외 처리
 RAISE_APPLICATION_ERROR(-20001, '상품이 존재하지 않습니다.');
 WHEN OTHERS THEN
 ROLLBACK;
 RAISE;
END;
