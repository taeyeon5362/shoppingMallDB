CREATE OR REPLACE PROCEDURE register_member(
 p_member_id IN VARCHAR2,
 p_password IN VARCHAR2,
 p_name IN VARCHAR2,
 p_age IN NUMBER,
 p_job IN VARCHAR2
) AS
BEGIN
 -- 회원 등록
 INSERT INTO member (id, password, name, age, job, grade, reward)
 VALUES (p_member_id, p_password, p_name, p_age, p_job, 'silver', 0);
 COMMIT;
EXCEPTION
 WHEN DUP_VAL_ON_INDEX THEN
 -- 중복된 회원 아이디인 경우 예외 처리
 RAISE_APPLICATION_ERROR(-20001, '이미 사용 중인 회원 아이디입니다.');
 WHEN OTHERS THEN
 ROLLBACK;
 RAISE;
END;
