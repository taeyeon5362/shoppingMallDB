### register_member.sql
- ‘INSERT IN’문을 사용하여 회원을 등록하고 ‘COMMIT’으로 트랜잭션을 커밋한다. 중복된 회원 아이디인 경우 ‘DUP_ VAL_ON_INDEX’ 예외를 처리하고, 다른 예외가 발생한 경우 롤백하고 예외를 다시 발생시킨다.

### update_reward.sql
- 프로시저의 내부에서 v_current_reward라는 지역 변수를 선언하고, 해당 회원의 현재 적립금을 조회하여 할당한다. 이후 v_current_reward 변수에 p_reward_amount를 더하여 업데이트할 적립금 값을 계산한다.
- UPDATE 문을 사용하여 회원 테이블에서 해당 회원의 적립금을 업데이트한다.
- COMMIT을 사용하여 트랜잭션을 커밋한다. 예외 처리 부분에서 NO_DATA_FOUND 예외가 발생한 경우, 해당 회원이 존재하지 않는 경우를 처리하고 예외를 발생시킨다

### update_member_grade.sql
- 업데이트 중인 테이블을 참조하기 위해서 트리거 대신 프로시저를 사용한다.
