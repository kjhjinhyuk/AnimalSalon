-- 매장 정보의 대한 CREATE TABLE --

-- 1.매장 정보 TABLE 생성
CREATE TABLE SHOP_INFO_TBL (
-- 매장 코드
S_CODE VARCHAR2(30) NOT NULL PRIMARY KEY,
-- 매장 이름 
S_NAME VARCHAR2(100) NOT NULL,
-- 매장 주소
S_ADDR VARCHAR2(200) NOT NULL,
-- 매장 전화번호
S_PHONE VARCHAR2(24),
-- 매장 좌표정보(X축)
S_GPS_X VARCHAR2(200),
-- 매장 좌표정보(X축)
S_GPS_Y VARCHAR2(200),
-- 매장 운영 시간
S_TIME VARCHAR2(30),
-- 매장 소개글 제목
S_TITLE VARCHAR2(200),
-- 매장 소개글 내용
S_CONTENT VARCHAR2(2000),
-- 주차가능 여부
S_PARKING CHAR(2) DEFAULT 0,
-- Free wifi
S_WIFI CHAR(2) DEFAULT 0,
-- 지하철근처
S_SUBWAY CHAR(2) DEFAULT 0,
-- 추가요금 없음
S_CHARGE CHAR(2) DEFAULT 0,
-- 픽업 가능
S_PICKUP CHAR(2) DEFAULT 0,
-- 대형견 가능
S_BIGDOG CHAR(2) DEFAULT 0,
-- 디자이너 평점 총합 의 평균
S_AVG_SCORE NUMBER(30) DEFAULT 0); 

commit;


-- 1-1.매장 코드 SEQUENCE 생성
CREATE SEQUENCE SHOP_INFO_TBL_SEQ
	START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999
    NOCYCLE; 
    commit;

    
-- 매장 코드 SEQUENCE TEST용 CONCAT으로 "고정문자열"+SEQUENCE
INSERT INTO SHOP_INFO_TBL (S_CODE,S_NAME,S_ADDR) VALUES
(CONCAT('CNDSHOP_',SHOP_INFO_TBL_SEQ.NEXTVAL),'TEST1','TEST2');

commit;

select * from shop_info_tbl;
