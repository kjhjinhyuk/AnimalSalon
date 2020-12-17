------ 예약내역테이블
CREATE TABLE BOOKING (
    B_CODE VARCHAR2(30),    -- 예약코드
    ID VARCHAR2(50),        -- 아이디
    M_CODE VARCHAR2(30),    -- 메뉴코드
    D_CODE VARCHAR2(30),    -- 디자이너코드
    S_CODE VARCHAR2(30),    -- 매장코드
    B_DATE DATE,            -- 예약일정(년월일,요일)
    B_TIME DATE,            -- 예약일정(시간)
    B_BEAUTY_TIME NUMBER,      -- 시술 소요시간
    B_PRICE NUMBER,         -- 예약 금액
    B_STATUS CHAR(1) DEFAULT '0',       -- 예약 상태 / 0: 예약진행중, 1: 시술완료, 2: 취소(환불), 3: 삭제
    B_CANCEL_REASON VARCHAR2(20), -- 예약 취소 사유
    PRIMARY KEY (B_CODE)
    );
    
------ 메뉴테이블
CREATE TABLE SHOP_MENU (
    M_CODE VARCHAR2(30),    -- 메뉴코드
    S_CODE VARCHAR2(30),    -- 매장코드
    M_TYPE VARCHAR2(24),    -- 종분류 / 강아지 OR 고양이
    M_NAME VARCHAR2(50),    -- 메뉴명
    M_TIME NUMBER,            -- 소요시간
    M_PRICE NUMBER,         -- 금액
    M_INFO VARCHAR2(300),   -- 상품부가정보
    PRIMARY KEY (M_CODE),
    FOREIGN KEY (S_CODE) REFERENCES SHOP_INFO_TBL(S_CODE)
    );

------ 메뉴옵션테이블
CREATE TABLE SHOP_MENU_OPTION (
    M_CODE VARCHAR2(30), -- 메뉴코드
    S_CODE VARCHAR2(30), -- 매장코드
    O_NAME VARCHAR2(30), -- 옵션명
    O_TIME NUMBER,         -- 추가 소요시간
    O_PRICE NUMBER       -- 추가 금액
    );

------ 메뉴사진테이블
CREATE TABLE SHOP_MENU_PHOTO (
    M_CODE VARCHAR2(30),                -- 메뉴코드
    S_CODE VARCHAR2(30),                -- 매장코드
    M_P_PATH VARCHAR2(500) NOT NULL,    -- 사진파일경로
    M_P_SYSNAME VARCHAR2(100) NOT NULL, -- 사진파일시스템이름
    M_P_ORGNAME VARCHAR2(100) NOT NULL, -- 사진파일원본이름
    FOREIGN KEY (M_CODE) REFERENCES SHOP_MENU(M_CODE) ON DELETE CASCADE,
    FOREIGN KEY (S_CODE) REFERENCES SHOP_INFO_TBL(S_CODE) ON DELETE CASCADE
    );


---------------------------------------TEST DATA 
    -- 메뉴 test data
    INSERT INTO SHOP_MENU (M_CODE, S_CODE, M_TYPE, M_NAME, M_TIME, M_PRICE, M_INFO) VALUES ('MENU_1', 'CNDSHOP_1', '강아지', '전체미용+목욕', 90, 40000, '메뉴 전체미용+목욕의 부가정보입니다');
    INSERT INTO SHOP_MENU (M_CODE, S_CODE, M_TYPE, M_NAME, M_TIME, M_PRICE, M_INFO) VALUES ('MENU_2', 'CNDSHOP_1', '강아지', '부분미용+목욕', 60, 30000, '메뉴 부분미용+목욕의 부가정보입니다');
    INSERT INTO SHOP_MENU (M_CODE, S_CODE, M_TYPE, M_NAME, M_TIME, M_PRICE, M_INFO) VALUES ('MENU_3', 'CNDSHOP_1', '강아지', '부분미용', 30, 15000, '메뉴 부분미용의 부가정보입니다');
    INSERT INTO SHOP_MENU (M_CODE, S_CODE, M_TYPE, M_NAME, M_TIME, M_PRICE, M_INFO) VALUES ('MENU_4', 'CNDSHOP_1', '강아지', '목욕', 30, 15000, '메뉴 목욕의 부가정보입니다');
    
    INSERT INTO SHOP_MENU (M_CODE, S_CODE, M_TYPE, M_NAME, M_TIME, M_PRICE, M_INFO) VALUES ('MENU_5', 'CNDSHOP_1', '고양이', '무마취 미용(단모)', 120, 50000, '무마취미용(단모)의 부가정보입니다');
    INSERT INTO SHOP_MENU (M_CODE, S_CODE, M_TYPE, M_NAME, M_TIME, M_PRICE, M_INFO) VALUES ('MENU_6', 'CNDSHOP_1', '고양이', '무마취 미용(장모)', 150, 60000, '무마취미용(장모)의 부가정보입니다');
    INSERT INTO SHOP_MENU (M_CODE, S_CODE, M_TYPE, M_NAME, M_TIME, M_PRICE, M_INFO) VALUES ('MENU_7', 'CNDSHOP_1', '고양이', '마취 미용', 180, 70000, '마취 미용의 부가정보입니다');
    commit;

    -- 메뉴 옵션 test data
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_1', 'CNDSHOP_1', '소형', 0, 0);
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_1', 'CNDSHOP_1', '중형', 30, 5000);
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_1', 'CNDSHOP_1', '대형', 60, 10000);

    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_2', 'CNDSHOP_1', '소형', 0, 0);
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_2', 'CNDSHOP_1', '중형', 30, 5000);
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_2', 'CNDSHOP_1', '대형', 60, 10000);
    
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_3', 'CNDSHOP_1', '소형', 0, 0);
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_3', 'CNDSHOP_1', '중형', 0, 5000);
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_3', 'CNDSHOP_1', '대형', 30, 10000);
    
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_4', 'CNDSHOP_1', '소형', 0, 0);
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_4', 'CNDSHOP_1', '중형', 0, 5000);
    INSERT INTO SHOP_MENU_OPTION (M_CODE, S_CODE, O_NAME, O_TIME, O_PRICE) VALUES ('MENU_4', 'CNDSHOP_1', '대형', 30, 10000);
    commit;