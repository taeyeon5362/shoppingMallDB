CREATE OR REPLACE PROCEDURE update_reward(
 p_member_id IN VARCHAR2,
 p_reward_amount IN NUMBER
) AS
 v_current_reward NUMBER;
BEGIN
 -- 현재 적립금 조회
 SELECT reward INTO v_current_reward
 FROM member
 WHERE id = p_member_id;
 
 -- 적립금 업데이트
 v_current_reward := v_current_reward + p_reward_amount;
 
 -- 적립금 업데이트
 UPDATE member
 SET reward = v_current_reward
 WHERE id = p_member_id;
 
 COMMIT;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 회원이 존재하지 않는 경우 예외 처리
 RAISE_APPLICATION_ERROR(-20001, '회원이 존재하지 않습니다.');
 WHEN OTHERS THEN
 -- 예외 발생 시 롤백하지 않고 예외를 다시 발생시킴
 RAISE;
END;
