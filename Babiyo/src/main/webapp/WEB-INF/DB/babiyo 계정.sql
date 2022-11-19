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

commit;