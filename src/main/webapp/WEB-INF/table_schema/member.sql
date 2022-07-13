<cmd에서 오라클 유저(parking) 생성하기>
sqlplus / nolog -- 계정없이 로그인
sqlplus / as sysdba --관리가 계정으로 접속
conn system as sysdba; --password : oracle
create user parking identified by 1234;
grant connect, resource to parking; <-- 권한주기(connect, resource은 일반적인 권한 - DDL, DML사용가능)
grant create view to parking;
alter user parking account unlock;


-- parking/1234로 접속해서 테이블만들기
select * from tab;

----------------------------------memeber 테이블 만들기------------------------------------------------
create table member(
  mem_num number not null, -- 멤버 식별 번호
  mem_id varchar2(100) unique not null, -- 아이디,	*unique : 고유값, 중복허용x
  mem_pwd varchar2(300) not null, -- 비밀번호
  mem_auth number(1),  -- 0관리자 1사용자 2사장님
  mem_token varchar2(300), --카카오톡에서 받아올 토큰
  constraint mem_pk primary key (mem_num) -- mem_num을 참조하여 member_pk라는 프라이머리키를 만듦   
  );

create sequence mem_num nocache nocycle;
drop sequence mem_num;
SELECT* FROM MEMBER;
DROP TABLE MEMBER;

--관리자 아이디만들기(관리자도 member_car까지 있어야 로그인됨)
INSERT INTO MEMBER (mem_num, mem_id,mem_pwd, mem_auth, mem_token) VALUES (mem_num.nextval,'admin','1111',0,'1111');
INSERT INTO member_detail(mem_num,mem_name,mem_phone,mem_dis) VALUES (19, '관리자', '010-1234-5678',0);
INSERT INTO member_car(mem_num, car_id, car_model,category) VALUES (19, '12서울123', '아우디', '소형');
--관리자 아이디만들기
----------------------------------member_detail 테이블만들기------------------------------------------------
CREATE TABLE member_detail ( --멤버 상세정보
mem_num number not null, -- member테이블에서 받아옴
mem_name varchar2(20) not null, -- 이름
mem_phone varchar2(20) not null, --전화번호
mem_dis number(1), -- 0일반인 1몸이 불편하신분들(장애인, 임산부, 노약자 등)
constraint member_detail_pk PRIMARY KEY (mem_name),
constraint member_detail_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);

SELECT* FROM MEMBER_DETAIL;
DROP TABLE MEMBER_DETAIL;

----------------------------------member_car 테이블-------------------------------------------
CREATE TABLE member_car ( 			-- 회원차량정보
mem_num number not null, 			-- 회원번호
car_id varchar2(20) not null, 		-- 차량번호
car_model varchar2(20) not null, 	-- 차량모델
category varchar2(10) not null,		-- 차 카테고리(소형,중형,대형) 
constraint member_car_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num),
PRIMARY KEY (car_id)
);

SELECT* FROM MEMBER_CAR;
DROP TABLE MEMBER_CAR;

 

	 	
update member set mem_auth = 2 where mem_num=	
update member_detail set mem_phone = 2, mem_dis where mem_num=
update member_car set car_id = 2, car_model,category where mem_num=
	 
	 
	 
	 
	 
	 
	 
	 
	 
