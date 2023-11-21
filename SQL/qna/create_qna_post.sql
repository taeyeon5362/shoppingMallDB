CREATE OR REPLACE PROCEDURE create_qna_post(
 p_post_id IN VARCHAR2,
 p_post_name IN VARCHAR2,
 p_post_detail IN VARCHAR2,
 p_post_date IN VARCHAR2,
 p_member_id IN VARCHAR2
) AS
BEGIN
 -- Q&A글 작성
 INSERT INTO qna (postid, postname, postdetail, postdate, id)
 VALUES (p_post_id, p_post_name, p_post_detail, p_post_date, p_member_id);
 COMMIT;
EXCEPTION
 WHEN OTHERS THEN
 ROLLBACK;
 RAISE;
END;
