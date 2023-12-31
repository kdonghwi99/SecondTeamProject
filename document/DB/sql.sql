--0. talkdog 기존 유저 삭제
--sys 계정으로 들어가
select sid,serial#,username,status from v$session where schemaname = 'TALKDOG';
--그 후 sid, serial를 차례대로 ','안에 넣음 (여러 개 일시 모두 다 )
alter system kill SESSION 'sid,serial';
--삭제
DROP USER TALKDOG CASCADE;

--1. talkdog user 등록하기 (SYS 계정)
CREATE USER talkdog IDENTIFIED BY 1111; GRANT RESOURCE, CREATE SESSION TO talkdog;

--1-2. 계정에 권한을 생성
grant connect, dba, resource to TALKDOG;

--2. talkdog 오라클 db에 접속하기

--3. 테이블 CREATE, ALTER(key값)
CREATE TABLE memberResult (
	adm_id	VARCHAR2(50)		NOT NULL,
	score_date	Date		NOT NULL,
	total	number		NOT NULL,
	t_name	varchar2(20)		NOT NULL
);

CREATE TABLE cart (
	cart_no	NUMBER		NOT NULL,
	p_id	VARCHAR2(50)		NOT NULL,
	adm_id	VARCHAR2(50)		NOT NULL,
	cart_quan	NUMBER		NOT NULL,
	cart_opt	VARCHAR2(50)		NULL
);

CREATE TABLE qna (
	qna_no	NUMBER		NOT NULL,
	qna_date	DATE		NOT NULL,
	qna_answer	VARCHAR2(50)		NOT NULL,
	qna_category	VARCHAR2(50)		NOT NULL,
	qna_sec_category	VARCHAR2(50)		NULL,
	qna_title	VARCHAR2(999)		NOT NULL,
	qna_content	VARCHAR2(999)		NOT NULL,
	qna_reply	VARCHAR2(999)		NULL,
	qna_reply_date	DATE		NULL,
	adm_id	VARCHAR2(50)		NOT NULL
);

create table master (
	adm_id varchar2(50) not null,
	mas_paper varchar2(100) not null,
	mas_sveri varchar2(100) not null,
	mas_intro varchar2(1000),
	mas_addr varchar2(500),
	mas_auth varchar2(100),
	mas_prof varchar2(100),
	mas_regi date not null,
	mas_confirm varchar2(10),
    mas_school varchar2(900)
);
alter table master add mas_cert varchar2(900);

CREATE TABLE request (
	adm_id	VARCHAR2(50)		NOT NULL
);

CREATE TABLE product (
	p_id	varchar2(20)		NOT NULL,
	p_name	varchar2(50)		NOT NULL,
	p_vol	number		NOT NULL,
	p_detail	varchar2(1000)		NOT NULL,
	p_price	number		NOT NULL,
	p_cate	varchar2(20)		NOT NULL,
	p_date	Date		NOT NULL,
	p_mimg	varchar2(20)		NOT NULL,
	p_img	varchar2(20)		NOT NULL,
	p_type	varchar2(20)	NULL
);

CREATE TABLE order_ (
	ord_no	VARCHAR(50)		NOT NULL,
	ord_date	Date		NOT NULL,
	ord_ing	VARCHAR(50)		NOT NULL,
	cart_no	NUMBER		NOT NULL,
	adm_id	VARCHAR2(50)   NOT NULL,
	invoice_no	NUMBER		NULL
);

CREATE TABLE review (
	r_no	number		NOT NULL,
	review	varchar2(100)		NOT NULL,
	r_date	Date		NOT NULL,
	p_id	varchar2(20)		NOT NULL,
	adm_id	VARCHAR2(50)		NOT NULL
);

CREATE TABLE testresult (
	t_score	number		NOT NULL,
	t_result	varchar2(300)		NOT NULL,
	t_name	varchar2(20)		NOT NULL
);

CREATE TABLE testname (
	t_name	varchar2(20)		NOT NULL
);

CREATE TABLE delivery (
	del_no		VARCHAR2(50)		NOT NULL,
	del_name	VARCHAR2(50)		NOT NULL,
	del_address1	VARCHAR2(50)		NOT NULL,
	del_address2	VARCHAR2(50)		NOT NULL,
	del_address3	VARCHAR2(50)		NULL,
	del_phone	VARCHAR2(50)		NOT NULL,
	del_memo	VARCHAR2(50)		NULL,
	ord_no	VARCHAR2(50)		NULL,
	adm_id	VARCHAR2(50)		NULL
);

CREATE TABLE admin (
	adm_id	VARCHAR2(50)		NOT NULL,
	adm_name	VARCHAR2(50)		NOT NULL,
	adm_nick	VARCHAR2(50)		NOT NULL,
	adm_pw	VARCHAR2(100)		NOT NULL,
	adm_mail	VARCHAR2(50)		NOT NULL,
	adm_add1	VARCHAR2(200)		NOT NULL,
	adm_add2	VARCHAR2(200)		NOT NULL,
	adm_add3	VARCHAR2(200)		NOT NULL,
	adm_phone	VARCHAR2(50)		NOT NULL,
	adm_email	VARCHAR2(200)		NOT NULL,
	adm_birth	Date		 NULL,
	adm_path	VARCHAR2(100)		 NULL,
	adm_type	CHAR(1)		NOT NULL,
	adm_regi	Date		NOT NULL
);

CREATE TABLE test (
	t_name	varchar2(20)		NOT NULL,
	t_item	varchar2(200)		NOT NULL,
	t_num	number		NOT NULL
);

CREATE TABLE payment (
	pay_no	VARCHAR(50)		NOT NULL,
	pay_agree	VARCHAR2(50)		NULL,
	pay_total	NUMBER		NOT NULL,
	ord_no	VARCHAR(50)		NOT NULL,
	pay_date	VARCHAR(50)		NOT NULL,
	pay_canceldate	VARCHAR(50)		NULL,
	adm_id	VARCHAR2(50)		NULL
);

CREATE TABLE comm (
   cm_no   NUMBER      NOT NULL,
   cm_title   VARCHAR2(999)      NOT NULL,
   cm_cont   VARCHAR2(999)      NOT NULL,
   cm_heart   NUMBER      NOT NULL,
   cm_hit   NUMBER      NOT NULL,
   comm_Date   DATE      NOT NULL,
   adm_id   VARCHAR2(50)      NOT NULL,
   category_no   NUMBER      NOT NULL
);

CREATE TABLE notice (
   not_no   NUMBER      NOT NULL,
   not_category   VARCHAR(50)      NOT NULL,
   not_title   VARCHAR(999)      NOT NULL,
   not_cont   VARCHAR(999)      NOT NULL,
   not_hit   NUMBER      NOT NULL,
   not_image   VARCHAR(100)       NULL,
   not_date   DATE      NOT NULL
);

CREATE TABLE commReply (
   cmre_no   NUMBER      NOT NULL,
   cmre_cont   VARCHAR2(999)      NOT NULL,
   cmre_date   DATE      NOT NULL,
   cm_no   NUMBER      NOT NULL,
   adm_id   VARCHAR2(50)      NOT NULL
);

CREATE TABLE category (
   category_no   NUMBER      NOT NULL,
   category   VARCHAR2(20)      NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	cart_no
);

ALTER TABLE qna ADD CONSTRAINT PK_QNA PRIMARY KEY (
	qna_no
);

ALTER TABLE master ADD CONSTRAINT PK_MASTER PRIMARY KEY (
	adm_id
);

ALTER TABLE request ADD CONSTRAINT PK_REQUEST PRIMARY KEY (
	adm_id
);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	p_id
);

ALTER TABLE order_ ADD CONSTRAINT PK_ORDER PRIMARY KEY (
	ord_no
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	r_no
);

ALTER TABLE delivery ADD CONSTRAINT PK_DELIVERY PRIMARY KEY (
	del_no
);

ALTER TABLE admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	adm_id
);

ALTER TABLE test ADD CONSTRAINT PK_TEST PRIMARY KEY (
	t_name
);

ALTER TABLE payment ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	pay_no
);

ALTER TABLE comm ADD CONSTRAINT PK_COMM PRIMARY KEY (
	cm_no
);

ALTER TABLE notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	not_no
);

ALTER TABLE commReply ADD CONSTRAINT PK_COMMREPLY PRIMARY KEY (
	cmre_no
);

ALTER TABLE category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	category_no
);

ALTER TABLE master ADD CONSTRAINT FK_admin_TO_master_1 FOREIGN KEY (
	adm_id
)
REFERENCES admin (
	adm_id
);

ALTER TABLE request ADD CONSTRAINT FK_admin_TO_request_1 FOREIGN KEY (
	adm_id
)
REFERENCES admin (
	adm_id
);

-- delivery, order_,  payment fk 제약조건 추가
ALTER TABLE delivery ADD CONSTRAINT DELIVERY_FK1 FOREIGN KEY (
	adm_id
)
REFERENCES admin (
	adm_id
);
ALTER TABLE delivery ADD CONSTRAINT DELIVERY_FK2 FOREIGN KEY (
	ord_no
)
REFERENCES order_ (
	ord_no
);

ALTER TABLE order_ ADD CONSTRAINT ORDER__FK1 FOREIGN KEY (
	adm_id
)
REFERENCES admin (
	adm_id
);
ALTER TABLE order_ ADD CONSTRAINT ORDER__FK2 FOREIGN KEY (
	cart_no
)
REFERENCES cart (
	cart_no
);

ALTER TABLE payment ADD CONSTRAINT PAYMENT_FK1 FOREIGN KEY (
	ord_no
)
REFERENCES ORDER_ (
	ord_no
);
ALTER TABLE payment ADD CONSTRAINT PAYMENT_FK2 FOREIGN KEY (
	adm_id
)
REFERENCES admin (
	adm_id
);

alter table admin MODIFY adm_type CHARACTER default '0';


--4. 시퀀스, 트리거 생성
	--QNA 시퀀스 
	CREATE SEQUENCE QNA_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999;
	
	--CART 시퀀스
	CREATE SEQUENCE CART_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999;
	
	-- review r_no 시퀀스
	CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1 NOCACHE;
	
	-- test t_num 시퀀스
	CREATE SEQUENCE test_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;

	-- community 시퀀스
	CREATE SEQUENCE COMMUNITY_SEQ INCREMENT BY 1 START WITH 1;

	-- notice 시퀀스
	CREATE SEQUENCE NOTICE_SEQ INCREMENT BY 1 START WITH 1;

	-- reply 시퀀스
	CREATE SEQUENCE COMMREPLY_SEQ INCREMENT BY 1 START WITH 1;

	--주문 번호 생성 트리거
	create or replace TRIGGER TRG_GENERATE_ORD_NO
	BEFORE INSERT ON order_
	FOR EACH ROW
	DECLARE
	    v_ord_no NUMBER;
	BEGIN
	    -- 해당 ADM_ID에 대해 가장 최근의 주문 번호를 조회
	    SELECT MAX(TO_NUMBER(SUBSTR(ord_no, 9))) INTO v_ord_no
	    FROM order_
	    WHERE adm_id = :NEW.adm_id;
	
	    -- 만약 주문 번호가 없을 경우(첫 주문일 경우), 일련번호를 1로 설정
	    IF v_ord_no IS NULL THEN
	        v_ord_no := 1;
	    ELSE
	        -- 기존 주문 번호가 있을 경우, 일련번호를 +1 증가시킴
	        v_ord_no := v_ord_no + 1;
	    END IF;
	
	    -- 새로운 ORD_NO를 생성하여 삽입 (시스템 날짜(YYMMDD) + 일련번호)
	    :NEW.ord_no := TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(v_ord_no, 4, '0');
	END;
	
	--배송 번호 생성 트리거
		create or replace TRIGGER TRG_GENERATE_DEL_NO
	BEFORE INSERT ON delivery
	FOR EACH ROW
	BEGIN
	    SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYMMDD') || NVL(TO_CHAR(MAX(SUBSTR(del_no,7))), '00')) + 1
	    INTO :NEW.del_no
	    FROM delivery;
	END;
	

--6. 각 테이블에 insert 하기
	--admin
	INSERT INTO admin VALUES ('aaa', 'aaa', 'aaa', '1111','01010','aaa1', 'aaa2', 'aaa3', '010-1222-2222', 'aaa@gmail.com', null, null, '0', '20200212');
	insert into admin values('admin', 'admin', 'admin', '1111',
	'01010','aaaa1', 'aaaa2', 'aaaa3', 
	'010-1111-1111', 'admin@gmail.com', null, null, '0', '20200213');
	insert into admin values('test', 'tester', '테스터', '1111',
	'01010','aaaa1', 'aaaa2', 'aaaa3', 
	'010-1111-1111', 'admin@gmail.com', null, null, '0', '20200213');
	insert into admin values('master', 'master', '전문가', '1111',
	'01010','aaaa1', 'aaaa2', 'aaaa3', 
	'010-1111-1111', 'admin@gmail.com', null, null, '1', '20200213');

	--qna (페이징 확인할 수 있게 5번 run)
	INSERT INTO qna VALUES (QNA_SEQ.NEXTVAL, SYSDATE, '답변대기', '주문관련', '주문취소','주문한 거 취소하고 싶어요.', '주문번호 어쩌구저쩌구 샬라샬라 샀는데 이거 취소처리 해주세요.', NULL, NULL, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '커뮤니티', null, '커뮤니티 관련 문의', '드립니다', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '커뮤니티', null, '커뮤니티 관련 문의', '드립니다', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '기타', null, '문의사항을 ', '이러이러한 문의사항이 있어요.', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '주문관련', '반품', '반품요청드립니다.', '주문번호 12341234 반품요청', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '배송관련', null, '배송이 안됐는데 배송이 됐다고 뜹니다.', '주문번호는 45784578입니다. 뭐죠?', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '커뮤니티', null, '커뮤니티 관련 문의', '드립니다', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '주문관련', '반품', '반품요청드립니다.', '주문번호 12341234 반품요청', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '배송관련', null, '배송이 안됐는데 배송이 됐다고 뜹니다.', '주문번호는 45784578입니다. 뭐죠?', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '주문관련', '반품', '반품요청드립니다.', '주문번호 12341234 반품요청', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '배송관련', null, '배송이 안됐는데 배송이 됐다고 뜹니다.', '주문번호는 45784578입니다. 뭐죠?', null, null, 'aaa');
	INSERT INTO qna VALUES (qna_seq.NEXTVAL, SYSDATE, '답변대기', '기타', null, '문의 드릴 게 있는데요..', '이러이러한 문의사항이 있어요.', null, null, 'aaa');


	--product
  	Insert into PRODUCT (P_ID,P_NAME,P_VOL,P_DETAIL,P_PRICE,P_CATE,P_DATE,P_MIMG,P_IMG,P_TYPE) values ('p111','칼슘마그네슘',234,'뼈 치아건강 신경근육 도움',15000,'medi',to_date('23/08/08','RR/MM/DD'),'p111.jpg','i111.jpg',null);
	Insert into PRODUCT (P_ID,P_NAME,P_VOL,P_DETAIL,P_PRICE,P_CATE,P_DATE,P_MIMG,P_IMG,P_TYPE) values ('p112','비오틴',45,'영양',12000,'medi',to_date('23/08/08','RR/MM/DD'),'p112.jpg','i112.jpg',null);
	Insert into PRODUCT (P_ID,P_NAME,P_VOL,P_DETAIL,P_PRICE,P_CATE,P_DATE,P_MIMG,P_IMG,P_TYPE) values ('p123','자존감대화법',673,'자존감 대화 하는 방법',200000,'book',to_date('23/08/08','RR/MM/DD'),'p123.jpg','i123.jpg',null);
	Insert into PRODUCT (P_ID,P_NAME,P_VOL,P_DETAIL,P_PRICE,P_CATE,P_DATE,P_MIMG,P_IMG,P_TYPE) values ('p116','라벤더아로마',645,'심신안정 라벤더',25000,'aroma',to_date('23/08/08','RR/MM/DD'),'p116.jpg','i116.jpg',null);
	Insert into PRODUCT (P_ID,P_NAME,P_VOL,P_DETAIL,P_PRICE,P_CATE,P_DATE,P_MIMG,P_IMG,P_TYPE) values ('p115','신경정신의학',234,'신경전달물질과 뇌 과학!',17000,'book',to_date('23/08/08','RR/MM/DD'),'p115.jpg','i115.jpg',null);

	-- order_
	-- (fk) adm_id 자리엔 admin 테이블 adm_id 중 하나 기입
	-- (fk) adm_id 자리엔 cart 테이블 cart_no 중 하나 기입
	-- cart_no와 adm_id는 각 테이블에 서로 일치해야함
	insert into order_ (ord_no, ord_date, ord_ing, cart_no, adm_id, invoice_no)
    values (DEFAULT, TO_DATE('2023-08-03', 'YYYY-MM-DD'), 'In Progress', 1, 'aaa', 1234567891234);

	
	-- delivery
	-- (fk) adm_id 자리엔 admin 테이블 adm_id 중 하나 기입
	-- (fk) ord_no 자리엔 order_ 테이블 ord_no 중 하나 기입
	insert into delivery (del_no, del_name, del_address1, del_address2, del_address3, del_phone, del_memo, ord_no, adm_id) 
    values (DEFAULT, 'John Doe', 22761, '청라루비로 68', '청라동', '010-3333-3333', 'Leave at the doorstep', 2308060004, 'aaa');



    -- payment
    -- PAY_NO은 API 공부 후 일단 넘어오는 값 생각
    -- (fk) ord_no 자리엔 order_ 테이블 ord_no 중 하나 기입
    -- PAY_DATE도 아마 넘어오는 값 있을듯
	insert into payment (pay_no, pay_agree, pay_total, ord_no, pay_date, pay_canceldate, adm_id)
    values (2023080702, 11111, 130000, 2308060004, TO_DATE('2023-08-07', 'YYYY-MM-DD'), NULL, 'aaa');

-- category insert
INSERT INTO category values(1, '사랑');
INSERT INTO category values(2, '정신건강');
INSERT INTO category values(3, '취업/학업');
INSERT INTO category values(4, '인간관계');
INSERT INTO category values(5, '기타');

-- testname insert
INSERT INTO testname values('불안');
INSERT INTO testname values('우울');
INSERT INTO testname values('스트레스');

-- community insert
INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,'정말 고민입니다..','고민고민',0,0,sysdate,'test',1);
INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,'너무 힘드네요','힘들엉',0,0,sysdate,'test',2);
INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,'어려워요ㅠ','어려워',0,0,sysdate,'test',3);
INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,'사람 만나기 무서워요','무서웡',0,0,sysdate,'test',4);
INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,'여자친구가 좋아할 선물','고민고민',0,0,sysdate,'aaa',1);
INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,'살기 싫어요','우울해',0,0,sysdate,'aaa',2);
INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,'취업하고싶은데..','어려워',0,0,sysdate,'aaa',3);
INSERT INTO comm VALUES (COMMUNITY_SEQ.NEXTVAL,'저희 직장에 대머리 부장님이 계신데','성격이 이상해!',0,0,sysdate,'aaa',4);

-- notice insert
INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, '공지사항', '공지사항입니다', '8월 16일 오전 9시부터 서버 점검이 있을 예정입니다. 홈페이지 이용에 참고 바랍니다.', 0, '../resources/images/null', SYSDATE);
INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, '이벤트', '230707이벤트!', '이벤트 시작합니다!', 0, '../resources/images/null', '2023-07-07');
INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, '이벤트', '230716이벤트!', '이벤트 시작합니다!', 0, '../resources/images/null', '2023-07-16');
INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, '이벤트', '230730이벤트!', '이벤트 시작합니다!', 0, '../resources/images/null', '2023-07-30');
INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, '이벤트', '230801이벤트!', '이벤트 시작합니다!', 0, '../resources/images/null', '2023-08-01');
INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, '이벤트', '230811이벤트!', '이벤트 시작합니다!', 0, '../resources/images/null', '2023-08-11');
INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, '이벤트', '230816이벤트!', '이벤트 시작합니다!', 0, '../resources/images/null', '2023-08-16');
INSERT INTO notice values(NOTICE_SEQ.NEXTVAL, '이벤트', '230707이벤트!', '이벤트 시작합니다!', 0, '../resources/images/null', '2023-07-07');

-- commReply insert
INSERT INTO commReply VALUES(COMMREPLY_SEQ.NEXTVAL, '댓글', SYSDATE, 7, 'test');
INSERT INTO commReply VALUES(COMMREPLY_SEQ.NEXTVAL, '댓ㅐㅐ대대대ㅐ대ㅐ댓글', SYSDATE, 7, 'test');
INSERT INTO commReply VALUES(COMMREPLY_SEQ.NEXTVAL, '댓글3', SYSDATE, 7, 'test');
INSERT INTO commReply VALUES(COMMREPLY_SEQ.NEXTVAL, '댓글4', SYSDATE, 8, 'test');
INSERT INTO commReply VALUES(COMMREPLY_SEQ.NEXTVAL, '댓글5', SYSDATE, 8, 'admin');

---- 테이블 삭제 구문
DROP TABLE category;
DROP TABLE commReply;
DROP TABLE notice;
DROP TABLE comm;
DROP TABLE payment;
DROP TABLE delivery;
DROP TABLE test;
DROP TABLE testresult;
DROP TABLE review;
DROP TABLE order_;
DROP TABLE product;
DROP TABLE master;
DROP TABLE request;
DROP TABLE qna;
DROP TABLE cart;
DROP TABLE memberResult;
DROP TABLE admin;   
