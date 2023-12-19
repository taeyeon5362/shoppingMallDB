CREATE OR REPLACE PROCEDURE update_member_grade(p_member_id IN VARCHAR2) AS
 v_member_reward NUMBER;
 v_member_grade VARCHAR2(20);
BEGIN
 -- 업데이트된 회원의 적립금 가져오기
 SELECT reward INTO v_member_reward
 FROM member
 WHERE id = p_member_id;
 -- 회원 등급 업데이트
 IF v_member_reward >= 1000 THEN
 v_member_grade := 'VIP';
 ELSIF v_member_reward >= 500 THEN
 v_member_grade := 'gold';
 ELSE
 v_member_grade := 'silver';
 END IF;
 -- 회원 등급 업데이트
 UPDATE member
 SET grade = v_member_grade
 WHERE id = p_member_id;
 COMMIT;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 회원이 존재하지 않는 경우 예외 처리
 RAISE_APPLICATION_ERROR(-20001, '회원이 존재하지 않습니다.');
 WHEN OTHERS THEN
 ROLLBACK;
 RAISE;
END;
