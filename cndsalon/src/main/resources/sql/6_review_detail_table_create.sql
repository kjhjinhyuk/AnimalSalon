-- 리뷰글 정보관련 TABLE 모음 --

-- 6. 리뷰글 TABLE CREATE --

CREATE TABLE REVIEW_DETAIL_TBL (
-- 리뷰글 코드
R_CODE VARCHAR2(30) NOT NULL PRIMARY KEY,
-- 리뷰글 작성자
R_WRITER VARCHAR2(30) NOT NULL,
-- 리뷰글 제목
R_TITLE VARCHAR2(200) NOT NULL,
-- 리뷰대상 매장코드
S_CODE VARCHAR2(30) NOT NULL,
-- 리뷰대상 디자이너코드
D_CODE VARCHAR2(30) NOT NULL,
-- 리뷰내용
R_CONTENT VARCHAR2(2000),
-- 리뷰글 별점
R_SCORE NUMBER(20),
-- 리뷰글 공감 수
R_EMPATY NUMBER(20),
-- 리뷰글 조회수
R_COUNT NUMBER(20),
-- 리뷰글 업로드 일시
R_DATE DATE DEFAULT SYSDATE);

commit;

-- 6-1. 리뷰글에 대한 FK 생성
ALTER TABLE REVIEW_DETAIL_TBL ADD CONSTRAINT 
FK_REVIEW_DETAIL_S_CODE FOREIGN KEY(S_CODE)REFERENCES SHOP_INFO_TBL(S_CODE);
ALTER TABLE REVIEW_DETAIL_TBL ADD CONSTRAINT 
FK_REVIEW_DETAIL_D_CODE FOREIGN KEY(D_CODE)REFERENCES SHOP_DESIGNER_TBL(D_CODE);


-- 6-2.리뷰글 코드 SEQUENCE 생성
CREATE SEQUENCE REVIEW_DETAIL_TBL_SEQ
	START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999
    NOCYCLE; 
    commit;

-- 매장 코드 SEQUENCE TEST용 CONCAT으로 "고정문자열"+SEQUENCE
INSERT INTO REVIEW_DETAIL_TBL (R_CODE,R_WRITER,R_TITLE,S_CODE,D_CODE,
R_CONTENT,R_SCORE,R_EMPATY,R_COUNT) VALUES
(CONCAT('CNDREVIEW_',REVIEW_DETAIL_TBL_SEQ.NEXTVAL),
'USERTEST_1','매장 리뷰 제목TEST','CNDSHOP_1','CNDDESIGNER_1',
'매장 내용 TEST매장 내용 TEST매장 내용 TEST',5,200,600);

commit;

SELECT * FROM REVIEW_DETAIL_TBL;