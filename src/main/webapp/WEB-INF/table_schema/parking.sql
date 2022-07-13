------------------------------parking 테이블------------------
create table parking(
  park_id number not null,                   -- 주차장번호
  park_name varchar2(100),                   -- 주차장 이름
  park_capacity number,                   -- 총 주차면 수 
  mem_num number,                            -- 소유주 번호(번호로 member에서 아이디찾기)
  park_type varchar2(20),                  -- 주차장 종류 - [노상(공터), 노외(길가), 부설(건물), 기계식]
  detailAddr varchar2(300),                  -- 상세주소   
  park_public number(1),                  -- 공용(0)/사설(1)
  constraint park_pk primary key (park_id),      -- park_id 참조하여 park_pk 프라이머리키를 만듦
  constraint owner_fk foreign key (mem_num) references member (mem_num)
);

CREATE SEQUENCE PARK_ID nocache nocycle;
DROP SEQUENCE PARK_ID;
SELECT park_id.nextval FROM dual


INSERT INTO PARKING VALUES (PARKING_ID.NEXTVAL,'이젠주차장',300,18,'노상','서울 서초구 강남대로 241',1);
INSERT INTO PARKING VALUES (PARKING_ID.NEXTVAL,'강아지주차장',300,18,'부설','서울 서초구 강남대로 243',1);
INSERT INTO PARKING VALUES (PARKING_ID.NEXTVAL,'토끼주차장',300,18,'부설','서울 서초구 강남대로 251 (해동빌딩)',1);
INSERT INTO PARKING VALUES (PARKING_ID.NEXTVAL,'곰주차장',300,18,'부설','서울 서초구 강남대로 259 (호텔페이토)',1);

SELECT* FROM PARKING;
DROP TABLE PARKING;

------------------------------parking_detail 테이블------------------
create table parking_detail(               -- 주차장 상세
  park_id number not null,                   -- 주차장번호
  park_status number,                      -- 주차장사용가능여부   
  park_avgPoint number,                      -- 주차장평균평점
  park_rate number,                        -- 기본 주차요금
  park_time_rate number,                  -- 기본 주차시간   
  add_park_rate number,                     -- 추가단위 요금
  day_max_pay number,                     -- 하루 최대 요금
  constraint park_id_fk foreign key (park_id) references parking (park_id)
);
SELECT* FROM PARKING_DETAIL;
DROP TABLE PARKING_DETAIL;

INSERT INTO parking_detail VALUES (7,0,5,5,0300,300,300);

