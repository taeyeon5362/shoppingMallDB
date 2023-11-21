CREATE OR REPLACE FUNCTION get_order_info(
 p_order_id IN VARCHAR2
) RETURN VARCHAR2 AS
 v_order_info VARCHAR2(200);
BEGIN
 -- 주문 정보 조회
 SELECT '주문 ID: ' || o.oid || ', 회원 ID: ' || o.id || ', 상품 ID: ' || o.pid ||
 ', 주문 수량: ' || o.onum || ', 배송 위치: ' || o.delloc || ', 배송일자: ' || o.dedate
 INTO v_order_info
 FROM "order" o
 WHERE o.oid = p_order_id;
 RETURN v_order_info;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 주문 ID에 대한 정보가 없는 경우 예외 처리
 RETURN '주문 정보를 찾을 수 없습니다.';
 WHEN OTHERS THEN
 -- 예외 발생 시 예외 메시지 반환
 RETURN SQLERRM;
END;
