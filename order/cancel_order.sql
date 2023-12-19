CREATE OR REPLACE PROCEDURE cancel_order(
 p_order_id IN VARCHAR2
) AS
 v_product_id VARCHAR2(20);
 v_order_num NUMBER;
BEGIN
 -- 주문 정보 조회
 SELECT pid, onum INTO v_product_id, v_order_num
 FROM "order"
 WHERE oid = p_order_id;
 -- 주문 취소
 DELETE FROM "order"
 WHERE oid = p_order_id;
 -- 상품 재고 복원
 UPDATE product
 SET pnum = pnum + v_order_num
 WHERE pid = v_product_id;
 COMMIT;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 주문이 존재하지 않는 경우 예외 처리
 RAISE_APPLICATION_ERROR(-20001, '주문이 존재하지 않습니다.');
 WHEN OTHERS THEN
 ROLLBACK;
 RAISE;
END;
