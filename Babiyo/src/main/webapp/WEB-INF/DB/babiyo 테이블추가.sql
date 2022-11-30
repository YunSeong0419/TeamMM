
/* Drop Triggers */

DROP TRIGGER TRI_cash_history_no;
DROP TRIGGER TRI_inquiry_no;
DROP TRIGGER TRI_login_history_no;
DROP TRIGGER TRI_member_order_no;
DROP TRIGGER TRI_notice_image_no;
DROP TRIGGER TRI_notice_no;
DROP TRIGGER TRI_order_detail_no;
DROP TRIGGER TRI_product_image_no;
DROP TRIGGER TRI_product_no;
DROP TRIGGER TRI_review_image_no;
DROP TRIGGER TRI_review_no;


/* Drop Tables */

DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE cash_history CASCADE CONSTRAINTS;
DROP TABLE cash_history_category CASCADE CONSTRAINTS;
DROP TABLE favorite CASCADE CONSTRAINTS;
DROP TABLE inquiry CASCADE CONSTRAINTS;
DROP TABLE inquiry_category CASCADE CONSTRAINTS;
DROP TABLE interest CASCADE CONSTRAINTS;
DROP TABLE login_history CASCADE CONSTRAINTS;
DROP TABLE order_detail CASCADE CONSTRAINTS;
DROP TABLE member_order CASCADE CONSTRAINTS;
DROP TABLE review_image CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE member_grade CASCADE CONSTRAINTS;
DROP TABLE notice_image CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE notice_category CASCADE CONSTRAINTS;
DROP TABLE order_state CASCADE CONSTRAINTS;
DROP TABLE product_image CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE product_category CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_cash_history_no;
DROP SEQUENCE SEQ_inquiry_no;
DROP SEQUENCE SEQ_login_history_no;
DROP SEQUENCE SEQ_member_order_no;
DROP SEQUENCE SEQ_notice_image_no;
DROP SEQUENCE SEQ_notice_no;
DROP SEQUENCE SEQ_order_detail_no;
DROP SEQUENCE SEQ_product_image_no;
DROP SEQUENCE SEQ_product_no;
DROP SEQUENCE SEQ_review_image_no;
DROP SEQUENCE SEQ_review_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_cash_history_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_inquiry_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_login_history_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_member_order_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_notice_image_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_notice_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_order_detail_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_product_image_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_product_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_review_image_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_review_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE cart
(
	member_id varchar2(80) NOT NULL,
	product_no number NOT NULL,
	quantity number NOT NULL,
	UNIQUE (member_id, product_no)
);


CREATE TABLE cash_history
(
	no number NOT NULL,
	member_id varchar2(80) NOT NULL,
	category_code number NOT NULL,
	history_date date,
	amount number NOT NULL,
	balance number NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE cash_history_category
(
	code number NOT NULL,
	name varchar2(20) NOT NULL,
	PRIMARY KEY (code)
);


CREATE TABLE favorite
(
	member_id varchar2(80) NOT NULL,
	product_no number NOT NULL,
	UNIQUE (member_id, product_no)
);


CREATE TABLE inquiry
(
	no number NOT NULL,
	member_id varchar2(80) NOT NULL,
	category_code number NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	answer varchar2(4000),
	create_date date NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE inquiry_category
(
	code number NOT NULL,
	name varchar2(30) NOT NULL,
	PRIMARY KEY (code)
);


CREATE TABLE interest
(
	member_id varchar2(80) NOT NULL,
	list_no varchar2(20) NOT NULL,
	code number NOT NULL,
	UNIQUE (member_id, list_no)
);


CREATE TABLE login_history
(
	no number NOT NULL,
	member_id varchar2(80) NOT NULL,
	history_date date NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE member
(
	id varchar2(80) NOT NULL,
	password varchar2(80) NOT NULL,
	name varchar2(20) NOT NULL,
	email varchar2(100) NOT NULL UNIQUE,
	birthday date NOT NULL,
	gender varchar2(10) NOT NULL,
	phone varchar2(30) NOT NULL UNIQUE,
	nickname varchar2(40) NOT NULL UNIQUE,
	cash number NOT NULL,
	grade_code number NOT NULL,
	create_date date NOT NULL,
	modify_date date NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE member_grade
(
	code number NOT NULL,
	name varchar2(20) NOT NULL,
	PRIMARY KEY (code)
);


CREATE TABLE member_order
(
	no number NOT NULL,
	member_id varchar2(80) NOT NULL,
	order_date date NOT NULL,
	total_amount number NOT NULL,
	preview varchar2(50) NOT NULL,
	product_quantity number NOT NULL,
	receiver_name varchar2(20) NOT NULL,
	receiver_phone varchar2(20) NOT NULL,
	post varchar2(20) NOT NULL,
	address varchar2(100) NOT NULL,
	address_detail varchar2(100) NOT NULL,
	request varchar2(200),
	state_code number NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE notice
(
	no number NOT NULL,
	category_code number NOT NULL,
	title varchar2(200) NOT NULL,
	content varchar2(4000) NOT NULL,
	hit number DEFAULT 0 NOT NULL,
	create_date date DEFAULT sysdate NOT NULL,
	event_start_date date,
	event_end_date date,
	PRIMARY KEY (no)
);


CREATE TABLE notice_category
(
	code number NOT NULL,
	name varchar2(30) NOT NULL,
	PRIMARY KEY (code)
);


CREATE TABLE notice_image
(
	no number NOT NULL,
	notice_no number NOT NULL,
	original_name varchar2(200) NOT NULL,
	stored_name varchar2(200) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE order_detail
(
	no number NOT NULL,
	order_no number NOT NULL,
	product_no number NOT NULL,
	quantity number DEFAULT 1 NOT NULL,
	price number NOT NULL,
	PRIMARY KEY (no),
	UNIQUE (order_no, product_no)
);


CREATE TABLE order_state
(
	code number NOT NULL,
	name varchar2(20) NOT NULL,
	PRIMARY KEY (code)
);


CREATE TABLE product
(
	no number NOT NULL,
	category_code number,
	name varchar2(100) NOT NULL,
	price number NOT NULL,
	stock number NOT NULL,
	content varchar2(4000) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE product_category
(
	code number NOT NULL,
	name varchar2(20) NOT NULL,
	PRIMARY KEY (code)
);


CREATE TABLE product_image
(
	no number NOT NULL,
	product_no number NOT NULL,
	original_name varchar2(200) NOT NULL,
	stored_name varchar2(200) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE review
(
	no number NOT NULL,
	product_no number NOT NULL,
	member_id varchar2(80) NOT NULL,
	star_rating number(2,1) NOT NULL,
	content varchar2(4000),
	create_date date NOT NULL,
	modify_date date NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE review_image
(
	no number NOT NULL,
	review_no number NOT NULL,
	original_name varchar2(200) NOT NULL,
	stored_name varchar2(200) NOT NULL,
	PRIMARY KEY (no)
);



/* Create Foreign Keys */

ALTER TABLE cash_history
	ADD FOREIGN KEY (category_code)
	REFERENCES cash_history_category (code)
;


ALTER TABLE inquiry
	ADD FOREIGN KEY (category_code)
	REFERENCES inquiry_category (code)
;


ALTER TABLE cart
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE cash_history
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE favorite
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE inquiry
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE interest
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE login_history
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE member_order
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE review
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE member
	ADD FOREIGN KEY (grade_code)
	REFERENCES member_grade (code)
;


ALTER TABLE order_detail
	ADD FOREIGN KEY (order_no)
	REFERENCES member_order (no)
;


ALTER TABLE notice_image
	ADD FOREIGN KEY (notice_no)
	REFERENCES notice (no)
;


ALTER TABLE notice
	ADD FOREIGN KEY (category_code)
	REFERENCES notice_category (code)
;


ALTER TABLE member_order
	ADD FOREIGN KEY (state_code)
	REFERENCES order_state (code)
;


ALTER TABLE cart
	ADD FOREIGN KEY (product_no)
	REFERENCES product (no)
;


ALTER TABLE favorite
	ADD FOREIGN KEY (product_no)
	REFERENCES product (no)
;


ALTER TABLE order_detail
	ADD FOREIGN KEY (product_no)
	REFERENCES product (no)
;


ALTER TABLE product_image
	ADD FOREIGN KEY (product_no)
	REFERENCES product (no)
;


ALTER TABLE review
	ADD FOREIGN KEY (product_no)
	REFERENCES product (no)
;


ALTER TABLE interest
	ADD FOREIGN KEY (code)
	REFERENCES product_category (code)
;


ALTER TABLE product
	ADD FOREIGN KEY (category_code)
	REFERENCES product_category (code)
;


ALTER TABLE review_image
	ADD FOREIGN KEY (review_no)
	REFERENCES review (no)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_cash_history_no BEFORE INSERT ON cash_history
FOR EACH ROW
BEGIN
	SELECT SEQ_cash_history_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_inquiry_no BEFORE INSERT ON inquiry
FOR EACH ROW
BEGIN
	SELECT SEQ_inquiry_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_login_history_no BEFORE INSERT ON login_history
FOR EACH ROW
BEGIN
	SELECT SEQ_login_history_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_member_order_no BEFORE INSERT ON member_order
FOR EACH ROW
BEGIN
	SELECT SEQ_member_order_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_notice_image_no BEFORE INSERT ON notice_image
FOR EACH ROW
BEGIN
	SELECT SEQ_notice_image_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_notice_no BEFORE INSERT ON notice
FOR EACH ROW
BEGIN
	SELECT SEQ_notice_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_order_detail_no BEFORE INSERT ON order_detail
FOR EACH ROW
BEGIN
	SELECT SEQ_order_detail_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_image_no BEFORE INSERT ON product_image
FOR EACH ROW
BEGIN
	SELECT SEQ_product_image_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_no BEFORE INSERT ON product
FOR EACH ROW
BEGIN
	SELECT SEQ_product_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_review_image_no BEFORE INSERT ON review_image
FOR EACH ROW
BEGIN
	SELECT SEQ_review_image_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_review_no BEFORE INSERT ON review
FOR EACH ROW
BEGIN
	SELECT SEQ_review_no.nextval
	INTO :new.no
	FROM dual;
END;

/


insert into member_grade
values(1, '관리자');
insert into member_grade
values(2, '일반회원');

insert into cash_history_category
values(1, '충전');
insert into cash_history_category
values(2, '사용');

insert into inquiry_category
values(1, '주문');
insert into inquiry_category
values(2, '밀키트');
insert into inquiry_category
values(3, '회원');
insert into inquiry_category
values(4, '기타');


insert into notice_category
values(1, '공지');
insert into notice_category
values(2, '이벤트');

insert into product_category
values(1, '한식');
insert into product_category
values(2, '중식');
insert into product_category
values(3, '일식');
insert into product_category
values(4, '양식');
insert into product_category
values(5, '분식');
insert into product_category
values(6, '아시안');

insert into order_state
values(1, '대기');
insert into order_state
values(2, '완료');
insert into order_state
values(3, '취소');

insert into member
(id, password, name, email, birthday, gender, phone, nickname, cash
, grade_code, create_date, modify_date)
values('admin', '123', '관리자', 'admin@test.com', TO_DATE('19960325')
    , '남', '01011112222', 'admin1', 100000000, 1, sysdate, sysdate);

insert into member
(id, password, name, email, birthday, gender, phone, nickname, cash
, grade_code, create_date, modify_date)
values('dong', '123', '이동현', 'dong@test.com', TO_DATE('19960325')
    , '남', '01055553333', '동현', 100000, 2, sysdate, sysdate);

insert into product(CATEGORY_CODE, NAME, PRICE, STOCK, CONTENT)
values(1, '봉골레파스타', 6000, 100, '아주 맛있는 봉골레파스타!');
insert into product(CATEGORY_CODE, NAME, PRICE, STOCK, CONTENT)
values(1, '까르보나라', 8000, 100, '아주 맛있는 까르보나라!');
insert into product(CATEGORY_CODE, NAME, PRICE, STOCK, CONTENT)
values(1, '로제파스타', 7000, 100, '아주 맛있는 로제파스타!');


INSERT INTO PRODUCT_IMAGE(PRODUCT_NO, ORIGINAL_NAME, STORED_NAME)
VALUES(1, '봉골레사진.jpg', '봉골레.jpg');
INSERT INTO PRODUCT_IMAGE(PRODUCT_NO, ORIGINAL_NAME, STORED_NAME)
VALUES(2, '까르보.jpg', '까르보.jpg');
INSERT INTO PRODUCT_IMAGE(PRODUCT_NO, ORIGINAL_NAME, STORED_NAME)
VALUES(3, '로제.jpg', '로제.jpg');


insert into cart(member_id, product_no, quantity)
values('dong', 1, 3);
insert into cart(member_id, product_no, quantity)
values('dong', 2, 2);
insert into cart(member_id, product_no, quantity)
values('dong', 3, 4);

INSERT INTO FAVORITE(MEMBER_ID, PRODUCT_NO)
VALUES('dong', 1);
INSERT INTO FAVORITE(MEMBER_ID, PRODUCT_NO)
VALUES('dong', 2);
INSERT INTO FAVORITE(MEMBER_ID, PRODUCT_NO)
VALUES('dong', 3);




commit;



