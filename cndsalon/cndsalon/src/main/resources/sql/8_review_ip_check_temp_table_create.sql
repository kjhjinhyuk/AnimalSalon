-- 리뷰글 정보관련 TABLE 모음 --

-- 8. 리뷰글 조회수 중복방지 TEMP_TABLE CREATE --

CREATE TABLE REVIEW_TEMP_IP_TBL (
-- 리뷰글 코드(외래키)
R_CODE VARCHAR2(30) NOT NULL,
-- 리뷰글 HIT IP
USER_IP CHAR(20),
-- 해당글 조회 일시
USER_HIT_DATE DATE DEFAULT SYSDATE
);
-- 8-1. 리뷰글에 대한 FK 생성
ALTER TABLE REVIEW_TEMP_IP_TBL ADD CONSTRAINT 
FK_REVIEW_TEMP_IP_R_CODE FOREIGN KEY(R_CODE)
REFERENCES REVIEW_DETAIL_TBL(R_CODE);

COMMIT;