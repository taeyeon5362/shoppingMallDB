create or replace NONEDITIONABLE FUNCTION get_delivery_info(
 p_delivery_name IN VARCHAR2
) RETURN VARCHAR2 AS
 v_delivery_info VARCHAR2(200);
BEGIN
 --운송업체 정보 조회
 SELECT '운송업체명: ' || d.dname || ', 전화번호: ' || d.dnumber || ', 위치: ' || d.dloc ||
 ', 담당자: ' || d.dmanager
 INTO v_delivery_info
 FROM delivery d
 WHERE d.dname = p_delivery_name;
 RETURN v_delivery_info;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 정보가 없는 경우 예외 처리
 RETURN '운송업체 정보를 찾을 수 없습니다.';
 WHEN OTHERS THEN
 -- 예외 발생 시 예외 메시지 반환
 RETURN SQLERRM;
END;
