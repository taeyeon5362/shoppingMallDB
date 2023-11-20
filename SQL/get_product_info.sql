CREATE OR REPLACE FUNCTION get_product_info(
 p_product_id IN VARCHAR2
) RETURN VARCHAR2 AS
 v_product_info VARCHAR2(200);
BEGIN
 -- 상품 정보 조회
 SELECT '상품 ID: ' || p.pid || ', 상품명: ' || p.pname || ', 재고: ' || p.pnum ||
 ', 가격: ' || p.pprice || ', 배송 업체: ' || p.dname || ', 배송일자: ' || p.ddate ||
 ', 배송 수량: ' || p.dnum
 INTO v_product_info
 FROM product p
 WHERE p.pid = p_product_id;
 RETURN v_product_info;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 상품 ID에 대한 정보가 없는 경우 예외 처리
 RETURN '상품 정보를 찾을 수 없습니다.';
 WHEN OTHERS THEN
 -- 예외 발생 시 예외 메시지 반환
 RETURN SQLERRM;
END;
