CREATE OR REPLACE FUNCTION get_qna_info(
 p_post_id IN VARCHAR2
) RETURN VARCHAR2 AS
 v_qna_info VARCHAR2(200);
BEGIN
 -- Q&A 정보 조회
 SELECT '게시물 ID: ' || q.postid || ', 제목: ' || q.postname || ', 내용: ' || q.postdetail ||
 ', 작성일자: ' || q.postdate || ', 작성자 ID: ' || q.id
 INTO v_qna_info
 FROM qna q
 WHERE q.postid = p_post_id;
 RETURN v_qna_info;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 -- 해당 게시물 ID에 대한 정보가 없는 경우 예외 처리
 RETURN 'Q&A 정보를 찾을 수 없습니다.';
 WHEN OTHERS THEN
 -- 예외 발생 시 예외 메시지 반환
 RETURN SQLERRM;
END;
