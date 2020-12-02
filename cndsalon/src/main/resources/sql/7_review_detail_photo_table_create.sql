-- 리뷰글 정보관련 TABLE 모음 --

-- 7. 리뷰글 사진정보 TABLE CREATE --

CREATE TABLE REVIEW_PHOTO_TBL (
-- 리뷰글 코드(외래키)
R_CODE VARCHAR2(30) NOT NULL,
-- 리뷰글 사진 경로
R_PHOTOPATH VARCHAR2(500) NOT NULL,
-- 리뷰글 사진 이름(파일이름 중복되지 않는 규칙 부여 필요)
R_PHOTONAME VARCHAR2(100) NOT NULL,
-- 리뷰글 사진 원래 파일명
R_PHOTONAME_ORIGIN VARCHAR2(100) NOT NULL
);

commit;

-- 7-1. 리뷰글에 대한 FK 생성
ALTER TABLE REVIEW_PHOTO_TBL ADD CONSTRAINT 
FK_REVIEW_PHOTO_R_CODE FOREIGN KEY(R_CODE)
REFERENCES REVIEW_DETAIL_TBL(R_CODE);

COMMIT;