--테이블DROP, 테이블 CREATE, 참조키 ALTER

DROP TABLE discard; -- 폐기
DROP TABLE release; -- 출고(사용)
DROP TABLE item; -- 물품재고
DROP TABLE item_code; --물품종류,코드
DROP TABLE wait; -- 접수/대기 명단
DROP TABLE hospital_id; -- 병원ID
DROP TABLE payment; -- 요금수납
DROP TABLE tr_mapping; 
DROP TABLE therapy; -- 물리 치료
DROP TABLE prescription; -- 처방전
DROP TABLE medicine; -- 약품 
DROP TABLE record; -- 환자 진료 기록
DROP TABLE memo;
DROP TABLE employee; -- 직원(의사/간호사)
DROP TABLE patient; -- 환자 기본정보
DROP TABLE disease; -- 질병명



CREATE TABLE patient (  --환자 기본정보
	num	number(10)		NOT NULL, --환자 번호
	name	varchar2(20)		NOT NULL, -- 환자이름
	birth	varchar2(20)		NOT NULL, -- 생년월일
	phone	varchar2(20)		NOT NULL, -- 연락처
	address	varchar2(200)		NULL, -- 주소
	sex	varchar2(10)		NULL, -- 성별
	height	number(10)		NULL, -- 키
	weight	number(10)		NULL, -- 몸무게
	note	varchar2(1000)		NULL -- 특이사항
);

CREATE TABLE record ( -- 환자 진료 기록
	r_num	number(10)		NOT NULL,  -- 진료 기록 번호
	r_date	date		NOT NULL, -- 진료 날짜
	r_opinion	varchar2(1000)		NULL, -- 의사소견 (진단결과)
	r_symptom	varchar2(1000)		NULL, -- 증상내용 (환자 말//접수대기 명단에서 지워질때 옮겨옴)
	r_p_num	number(10)		NULL,  -- 환자 번호 //환자 테이블
	r_d_code	number(10)		NULL, -- 질병 코드
	r_e_code 	number(10)		NOT NULL, -- 직원 코드
    r_pay number(10)  DEFAULT 0
);

CREATE TABLE wait ( -- 접수/대기 명단
	w_num	number(10)		NOT NULL, -- 접수 번호
	w_symptom	varchar2(1000)		NULL, -- 증상 내용
	w_p_num	number(10)		NOT NULL -- 환자 번호
);

CREATE TABLE item (  -- 물품 재고,입고 테이블
	i_num	number(10)		NOT NULL, -- 물품 번호
    i_i_code	number(10)		NOT NULL,  --품목 코드
	i_unit	varchar2(20)		NULL, -- 단위
	i_stock	number(10)		NULL, -- 재고량
   	i_expire	varchar2(20)		NULL, -- 유통기한
	i_price	number(10)		NULL, -- 물품 단가
	i_remark	varchar2(1000)		NULL, -- 비고
	i_memo	varchar2(1000)		NULL -- 메모
);

CREATE TABLE item_code ( --물품종류,코드
	i_code	number(10)		NOT NULL, --물품코드
	i_name	varchar2(50)		NULL, --물품이름
	i_category	varchar2(50)		NULL --물품 카테고리
);

CREATE TABLE hospital_id ( -- 병원
	h_id	varchar2(20)		NOT NULL, -- ID
	h_name	varchar2(50)		NULL, -- 병원이름
	h_address	varchar2(200)		NULL, -- 주소
	h_phone	varchar2(20)		NULL, -- 전화번호
	h_pwd	varchar2(30)		NOT NULL, -- 비밀번호
	h_email	varchar2(30)		NOT NULL, -- 이메일
	h_post	varchar2(10)		NULL, -- 우편번호
	h_e_code	number(10)		NOT NULL -- 직원코드
);

CREATE TABLE disease ( -- 질병
	d_code	number(10)		NOT NULL, -- 질병코드
	d_name	varchar2(50)		NULL -- 질병이름
);

CREATE TABLE payment ( -- 요금수납
    pay_num	number(10)		NOT NULL, -- 수납번호
	pay_amount	number(10)			NULL, -- 처방금액
	pay_basic   number(10)			DEFAULT 10000 NULL,
	pay_cash	number(10)			DEFAULT 0 NULL, -- 현금으로 수납한금액
    pay_card	number(10)			DEFAULT 0 NULL, -- 카드로 수납한금액
	pay_r_num	number(10)		NOT NULL -- 진료기록번호
);

CREATE TABLE medicine ( -- 약품
	m_code	number(10)		NOT NULL, -- 약품 코드
	m_name	varchar2(50)		NULL -- 약품 이름
);

CREATE TABLE therapy ( -- 물리 치료
	t_code	number(10)		NOT NULL, -- 물리치료 코드
	t_name	varchar2(50)		NULL, -- 물리치료 이름
	t_price	varchar2(20)		NULL -- 물리치료 가격
);

CREATE TABLE employee ( -- 직원
	e_code	number(10)		NOT NULL, -- 직원 코드
	e_name	varchar2(20)		NULL -- 직원 이름
);

CREATE TABLE prescription ( -- 처방전
	p_num	number(10)		NOT NULL, -- 처방 맵핑 번호
	p_m_code	number(10)		NOT NULL, -- 약품 코드
	p_use	number(10)		NULL, -- 약품 사용량
    p_r_num	number(10)		NOT NULL -- 진료 기록 번호
);

CREATE TABLE release ( -- 출고 관리
	rel_num	number(10)  NOT NULL, --출고 기록 번호       
	rel_date	date		NULL, -- 사용 날짜
    rel_time	varchar(20)		NULL, -- 사용 시간
	rel_user	varchar(20)		NULL, -- 사용자
	rel_amount	number(10)		NULL, -- 사용량
	rel_after   number(10)      NULL, -- 잔여량
    rel_remark	varchar(100)		NULL, -- 비고
    rel_i_code	number(10)		NOT NULL -- 품목 코드
);

CREATE TABLE discard ( -- 폐기 관리
    dis_num	number(10)  NOT NULL, --출고 기록 번호    
	dis_date	date		NULL, -- 폐기 날짜
    dis_time	varchar(20)		NULL, -- 폐기 시간
	dis_user	varchar(20)		NULL, -- 폐기 담당자
	dis_amount	number(10)		NULL, -- 폐기량
	dis_after   number(10)      NULL, -- 잔여량
    dis_remark	varchar(100)		NULL, -- 비고
    dis_i_code	number(10)		NOT NULL -- 품목 코드
);

CREATE TABLE tr_mapping (
	tr_num	number(10)		NOT NULL, --TR맵핑 번호
	tr_t_code	number(10)		NOT NULL, --물리치료 코드
	tr_r_num	number(10)		NOT NULL  -- 진료기록 번호
);

CREATE TABLE memo (
	m_num	number(10)		NOT NULL,
	m_memo	varchar2(20)		NULL,
	m_date	date		NULL,
	m_e_code	number(10)		NOT NULL
);



ALTER TABLE patient ADD CONSTRAINT PK_PATIENT PRIMARY KEY (
	num
);

ALTER TABLE record ADD CONSTRAINT PK_RECORD PRIMARY KEY (
	r_num
);

ALTER TABLE wait ADD CONSTRAINT PK_WAIT PRIMARY KEY (
    w_num
);

ALTER TABLE hospital_id ADD CONSTRAINT PK_HOSPITAL_ID PRIMARY KEY (
	h_id
);

ALTER TABLE disease ADD CONSTRAINT PK_DISEASE PRIMARY KEY (
	d_code
);

ALTER TABLE payment ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	pay_num
);

ALTER TABLE medicine ADD CONSTRAINT PK_MEDICINE PRIMARY KEY (
	m_code
);

ALTER TABLE therapy ADD CONSTRAINT PK_THERAPY PRIMARY KEY (
	t_code
);

ALTER TABLE employee ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY (
	e_code
);

ALTER TABLE prescription ADD CONSTRAINT PK_PRESCRIPTION PRIMARY KEY (
	p_num
);

ALTER TABLE release ADD CONSTRAINT PK_RELEASE PRIMARY KEY (
	rel_num
);

ALTER TABLE tr_mapping ADD CONSTRAINT PK_TR_MAPPING PRIMARY KEY (
	tr_num
);

ALTER TABLE discard ADD CONSTRAINT PK_DISCARD PRIMARY KEY (
	dis_num
);

ALTER TABLE item ADD CONSTRAINT PK_ITEM PRIMARY KEY (
	i_num,
	i_i_code
);

ALTER TABLE item_code ADD CONSTRAINT PK_ITEM_CODE PRIMARY KEY (
	i_code
);

ALTER TABLE memo ADD CONSTRAINT PK_MEMO PRIMARY KEY (
	m_num
);

ALTER TABLE record ADD CONSTRAINT FK_patient_TO_record_1 FOREIGN KEY (
	r_p_num
)
REFERENCES patient (
	num
);

ALTER TABLE record ADD CONSTRAINT FK_disease_TO_record_1 FOREIGN KEY (
	r_d_code
)
REFERENCES disease (
	d_code
);

ALTER TABLE record ADD CONSTRAINT FK_employee_TO_record_1 FOREIGN KEY (
	r_e_code
)
REFERENCES employee (
	e_code
);

ALTER TABLE wait ADD CONSTRAINT FK_patient_TO_wait_1 FOREIGN KEY (
	w_p_num
)
REFERENCES patient (
	num
);

ALTER TABLE hospital_id ADD CONSTRAINT FK_employee_TO_hospital_id_1 FOREIGN KEY (
	h_e_code
)
REFERENCES employee (
	e_code
);

ALTER TABLE payment ADD CONSTRAINT FK_record_TO_payment_1 FOREIGN KEY (
	pay_r_num
)
REFERENCES record (
	r_num
);

ALTER TABLE prescription ADD CONSTRAINT FK_medicine_TO_prescription_1 FOREIGN KEY (
	p_m_code
)
REFERENCES medicine (
	m_code
);

ALTER TABLE prescription ADD CONSTRAINT FK_record_TO_prescription_1 FOREIGN KEY (
	p_r_num
)
REFERENCES record (
	r_num
);

ALTER TABLE release ADD CONSTRAINT FK_item_code_TO_release_1 FOREIGN KEY (
	rel_i_code
)
REFERENCES item_code (
	i_code
);

ALTER TABLE tr_mapping ADD CONSTRAINT FK_therapy_TO_tr_mapping_1 FOREIGN KEY (
	tr_t_code
)
REFERENCES therapy (
	t_code
);

ALTER TABLE tr_mapping ADD CONSTRAINT FK_record_TO_tr_mapping_1 FOREIGN KEY (
	tr_r_num
)
REFERENCES record (
	r_num
);

ALTER TABLE discard ADD CONSTRAINT FK_item_code_TO_discard_1 FOREIGN KEY (
	dis_i_code
)
REFERENCES item_code (
	i_code
);

ALTER TABLE item ADD CONSTRAINT FK_item_code_TO_item_1 FOREIGN KEY (
	i_i_code
)
REFERENCES item_code (
	i_code
);

ALTER TABLE memo ADD CONSTRAINT FK_employee_TO_memo_1 FOREIGN KEY (
	m_e_code
)
REFERENCES employee (
	e_code
);
ALTER TABLE item ADD CONSTRAINT UQ_i_i_code UNIQUE(
    i_i_code
);



-----------------------------------------------------------------------
drop sequence m_code_seq;
drop sequence d_code_seq;
drop sequence t_code_seq;
drop sequence e_code_seq;
drop sequence num_seq;
drop sequence w_num_seq;
drop sequence r_num_seq;
drop sequence pay_num_seq;
drop sequence i_code_num_seq;
drop sequence p_num_seq;
drop sequence tr_num_seq;
drop sequence rel_num_seq;
drop sequence dis_num_seq;
drop sequence i_num_seq;
drop sequence m_num_seq;


--약품          medicine 
create sequence m_code_seq --약품 코드
INCREMENT by 1
start with 10001;

--질병명       disease
create sequence d_code_seq --질병 코드
INCREMENT by 1
start with 20001;

--물리치료    therapy 
create sequence t_code_seq --물리치료 코드 
INCREMENT by 1
start with 30001;

--직원           employee
create sequence e_code_seq --직원 코드
INCREMENT by 1
start with 40001;

--환자 기본정보 patient
create sequence num_seq --환자 번호
INCREMENT by 1
start with 50001;

--접수/대기명단 wait 
create sequence w_num_seq --접수 번호
INCREMENT by 1
start with 60001;

--환자 진료기록 record
create sequence r_num_seq --진료 기록번호
INCREMENT by 1
start with 70001;

--요금 수납     payment 
create sequence pay_num_seq  --수납 번호 
INCREMENT by 1
start with 80001;

--물품종류 코드        item_code 
create sequence i_code_num_seq  --품목 코드
INCREMENT by 1
start with 90001;


--처방전 번호(약품+진료기록 맵핑 번호) prescription --처방맵핑번호
create sequence p_num_seq
start with 1001;

-- 달력 메모 테이블 m_num --메모번호
create sequence m_num_seq
start with 5001;

--물리치료+환자 맵핑 번호 tr_mapping --맵핑번호
create sequence tr_num_seq
start with 6001;

--물품 재고, 입고 번호
create sequence i_num_seq
start with 7001;

--출고 기록 번호
create sequence rel_num_seq
start with 8001;

--폐기 기록 번호
create sequence dis_num_seq
start with 9001;

