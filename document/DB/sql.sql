CREATE TABLE "memberResult" (
	"adm_id"	VARCHAR2(50)		NOT NULL,
	"score_date"	Date		NOT NULL,
	"total"	number		NOT NULL,
	"t_name"	varchar2(20)		NOT NULL
);

CREATE TABLE "cart" (
	"cart_no"	NUMBER		NOT NULL,
	"p_id"	VARCHAR2(20)		NOT NULL,
	"adm_id"	VARCHAR2(50)		NOT NULL,
	"cart_quan"	NUMBER		NOT NULL,
	"Field"	VARCHAR2(20)		NULL
);

CREATE TABLE "qna" (
	"qna_no"	NUMBER		NOT NULL,
	"qna_date"	DATE		NOT NULL,
	"qna_answer"	VARCHAR2(10)		NOT NULL,
	"qna_category"	VARCHAR2(20)		NOT NULL,
	"qna_sec_category"	VARCHAR2(20)		NULL,
	"qna_title"	VARCHAR2(999)		NOT NULL,
	"qna_content"	VARCHAR2(999)		NOT NULL,
	"qna_reply"	VARCHAR2(999)		NULL,
	"qna_reply_date"	DATE		NULL,
	"adm_id"	VARCHAR2(50)		NOT NULL
);

CREATE TABLE "master" (
	"adm_id"	VARCHAR2(50)		NOT NULL,
	"mas_paper"	VARCHAR2(100)		NOT NULL,
	"mas_sveri"	VARCHAR2(100)		NOT NULL,
	"mas_intro"	VARCHAR2(1000)		NULL,
	"mas_addr"	VARCHAR2(500)		NULL,
	"mas_auth"	VARCHAR2(100)		NOT NULL,
	"mas_prof"	VARCHAR2(100)		NULL,
	"mas_regi"	DATE		NOT NULL,
	"mas_confirm"	VARCHAR2(5)		NOT NULL
);

CREATE TABLE "request" (
	"adm_id"	VARCHAR2(50)		NOT NULL
);

CREATE TABLE "product" (
	"p_id"	varchar2(20)		NOT NULL,
	"p_name"	varchar2(50)		NOT NULL,
	"p_vol"	number		NOT NULL,
	"p_detail"	varchar2(1000)		NOT NULL,
	"p_price"	number		NOT NULL,
	"p_cate"	varchar2(20)		NOT NULL,
	"p_date"	Date		NOT NULL,
	"p_mimg"	varchar2(20)		NOT NULL,
	"p_img"	varchar2(20)		NOT NULL,
	"p_type"	varchar2(20)		NOT NULL
);

CREATE TABLE "order" (
	"ord_no"	NUMBER		NOT NULL,
	"ord_date"	Date		NOT NULL,
	"ord_ing"	VARCHAR(50)		NOT NULL,
	"cart_no"	NUMBER		NOT NULL,
	"adm_id"	VARCHAR2(50)		NULL,
	"invoice_no"	NUMBER		NULL
);

CREATE TABLE "review" (
	"r_no"	number		NOT NULL,
	"review"	varchar2(100)		NOT NULL,
	"r_date"	Date		NOT NULL,
	"p_id"	varchar2(20)		NOT NULL,
	"adm_id"	VARCHAR2(50)		NOT NULL
);

CREATE TABLE "testresult" (
	"t_score"	number		NOT NULL,
	"t_result"	varchar2(300)		NOT NULL,
	"t_name"	varchar2(20)		NOT NULL
);

CREATE TABLE "Delivery" (
	"del_no"	NUMBER		NOT NULL,
	"del_name"	VARCHAR2(50)		NOT NULL,
	"del_address1"	VARCHAR2(50)		NOT NULL,
	"del_address2"	VARCHAR2(50)		NOT NULL,
	"del_address3"	VARCHAR2(50)		NULL,
	"del_phone"	VARCHAR2(50)		NOT NULL,
	"del_memo"	VARCHAR2(50)		NULL,
	"ord_no"	NUMBER		NOT NULL,
	"adm_id"	VARCHAR2(50)		NULL
);

CREATE TABLE "admin" (
	"adm_id"	VARCHAR2(50)		NOT NULL,
	"adm_name"	VARCHAR2(50)		NOT NULL,
	"adm_nick"	VARCHAR2(50)		NOT NULL,
	"adm_pw"	VARCHAR2(100)		NOT NULL,
	"adm_mail"	VARCHAR2(50)		NOT NULL,
	"adm_add1"	VARCHAR2(200)		NOT NULL,
	"adm_add2"	VARCHAR2(200)		NOT NULL,
	"adm_add3"	VARCHAR2(200)		NOT NULL,
	"adm_phone"	VARCHAR2(50)		NOT NULL,
	"adm_email"	VARCHAR2(200)		NOT NULL,
	"adm_birth"	Date		NOT NULL,
	"adm_path"	VARCHAR2(100)		NOT NULL,
	"adm_type"	CHAR(1)		NOT NULL,
	"adm_regi"	Date		NOT NULL
);

CREATE TABLE "test" (
	"t_name"	varchar2(20)		NOT NULL,
	"t_item"	varchar2(200)		NOT NULL,
	"t_num"	number		NOT NULL
);

CREATE TABLE "Payment" (
	"pay_no"	NUMBER		NOT NULL,
	"pay_agree"	VARCHAR2(50)		NULL,
	"pay_total"	NUMBER		NOT NULL,
	"ord_no"	NUMBER		NOT NULL,
	"pay_date"	Date		NOT NULL,
	"pay_canceldate"	Date		NULL,
	"adm_id"	VARCHAR2(50)		NULL
);

CREATE TABLE "comm" (
	"cm_no"	NUMBER		NOT NULL,
	"cm_title"	VARCHAR2(50)		NULL,
	"cm_cont"	VARCHAR2(999)		NULL,
	"cm_heart"	NUMBER		NULL,
	"cm_hit"	NUMBER		NULL,
	"cm_reply"	NUMBER		NULL,
	"comm_Date"	DATE		NULL,
	"adm_id"	VARCHAR2(50)		NULL,
	"category_no"	NUMBER		NOT NULL
);

CREATE TABLE "Notice" (
	"not_no"	NUMBER		NOT NULL,
	"not_categoty"	VARCHAR(20)		NULL,
	"not_title"	VARCHAR(20)		NULL,
	"not_cont"	VARCHAR(999)		NULL,
	"not_hit"	NUMBER		NULL,
	"not_image"	VARCHAR(100)		NOT NULL,
	"not_date"	DATE		NULL
);

CREATE TABLE "commReply" (
	"cmre_no"	NUMBER		NOT NULL,
	"cmre_cont"	VARCHAR2(999)		NULL,
	"cmre_date"	DATE		NULL,
	"cm_no"	NUMBER		NOT NULL,
	"adm_id"	VARCHAR2(50)		NULL
);

CREATE TABLE "category" (
	"category_no"	NUMBER		NOT NULL,
	"category"	VARCHAR2(20)		NULL
);

ALTER TABLE "cart" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"cart_no"
);

ALTER TABLE "qna" ADD CONSTRAINT "PK_QNA" PRIMARY KEY (
	"qna_no"
);

ALTER TABLE "master" ADD CONSTRAINT "PK_MASTER" PRIMARY KEY (
	"adm_id"
);

ALTER TABLE "request" ADD CONSTRAINT "PK_REQUEST" PRIMARY KEY (
	"adm_id"
);

ALTER TABLE "product" ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY (
	"p_id"
);

ALTER TABLE "order" ADD CONSTRAINT "PK_ORDER" PRIMARY KEY (
	"ord_no"
);

ALTER TABLE "review" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"r_no"
);

ALTER TABLE "Delivery" ADD CONSTRAINT "PK_DELIVERY" PRIMARY KEY (
	"del_no"
);

ALTER TABLE "admin" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"adm_id"
);

ALTER TABLE "test" ADD CONSTRAINT "PK_TEST" PRIMARY KEY (
	"t_name"
);

ALTER TABLE "Payment" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	"pay_no"
);

ALTER TABLE "comm" ADD CONSTRAINT "PK_COMM" PRIMARY KEY (
	"cm_no"
);

ALTER TABLE "Notice" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"not_no"
);

ALTER TABLE "commReply" ADD CONSTRAINT "PK_COMMREPLY" PRIMARY KEY (
	"cmre_no"
);

ALTER TABLE "category" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"category_no"
);

ALTER TABLE "master" ADD CONSTRAINT "FK_admin_TO_master_1" FOREIGN KEY (
	"adm_id"
)
REFERENCES "admin" (
	"adm_id"
);

ALTER TABLE "request" ADD CONSTRAINT "FK_admin_TO_request_1" FOREIGN KEY (
	"adm_id"
)
REFERENCES "admin" (
	"adm_id"
);
