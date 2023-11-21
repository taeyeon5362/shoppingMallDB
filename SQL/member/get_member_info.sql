CREATE OR REPLACE FUNCTION get_member_info(
 p_member_id IN VARCHAR2
) RETURN VARCHAR2 AS
 v_member_info VARCHAR2(200);
BEGIN
 -- 회원 정보 조회
 SELECT '회원 ID: ' || m.id || ', 이름: ' || m.name || ', 나이: ' || m.age ||
 ', 직업: ' || m.job || ', 등급: ' || m.grade || ', 적립금: ' || m.reward
 INTO v_member_info
 FROM member m
 WHERE m.id = p_member_id;
 RETURN v_member_info;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 회원 ID에 대한 정보가 없는 경우 예외 처리
 RETURN '회원 정보를 찾을 수 없습니다.';
 WHEN OTHERS THEN
 -- 예외 발생 시 예외 메시지 반환
 RETURN SQLERRM;
END;
