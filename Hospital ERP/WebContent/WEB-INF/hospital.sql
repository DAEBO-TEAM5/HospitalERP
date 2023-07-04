--인서트 문은 알아서... 

DROP TABLE wait;
DROP TABLE item;
DROP TABLE hospital_id;
DROP TABLE payment;
DROP TABLE record;
DROP TABLE patient;
DROP TABLE disease;
DROP TABLE medicine;
DROP TABLE therapy;



CREATE TABLE patient ( --환자 기본 정보
	num	number(10)		NOT NULL, --환자번호
	name	varchar2(20)		NOT NULL, --환자이름
	birth	varchar2(20)		NOT NULL, --생년월일
	phone	varchar2(20)		NOT NULL, --연락처
	address	varchar2(200)		NULL, --주소
	sex	varchar2(10)		NULL, --성별
	height	number(10)		NULL, --키
	weight	number(10)		NULL, --몸무게
	note	varchar2(300)		NULL --특이사항
);


CREATE TABLE record ( -- 환자 진료 기록
	r_num	number(10)		NOT NULL, -- 진료 기록 번호
	r_date	varchar2(20)		NOT NULL, --진료 날짜
	r_ban	varchar2(300)		NULL, -- 처방 금지 약품
	r_doctor	varchar2(20)		NULL, --담당의
	r_m_code 	number(10)		NULL, --약품 코드
	r_p_num	number(10)		NULL, --환자 번호
	r_d_code	number(10)		NULL, --질병 코드
	r_t_code	number(10)		NULL --물리치료 코드
);


CREATE TABLE wait ( --접수/대기 명단
	w_num	 number(10)		NOT NULL, --접수 번호
	w_symptom	 varchar2(300)		NULL, --증상 내용
	w_p_num	 number(10)		NOT NULL --환자 번호
);


CREATE TABLE item ( --물품 재고 
	i_code	number(10)		NOT NULL, --품목 코드
	i_num	number(10)		NULL, -- 물품 번호
	i_name	varchar2(50)		NOT NULL, --물품 이름
	i_category	varchar2(50)		NULL, --카테고리
	i_unit	varchar2(20)		NULL, --단위
	i_stock	number(10)		NULL, --재고량
	i_expire	varchar2(20)		NULL, --유통기한
	i_price	number(10)		NULL, --물품단가
	i_remark	varchar2(300)		NULL, --비고
	i_memo	varchar2(300)		NULL --메모
);


CREATE TABLE hospital_id ( --병원아이디
	h_id	varchar2(20)		NOT NULL, --병원ID
	h_name	varchar2(50)		NULL, --병원명
	h_address	varchar2(200)		NULL, --병원주소
	h_phone	varchar2(20)		NULL, --병원 전화번호
	h_pwd	varchar2(30)		NOT NULL, --병원 비밀번호
	h_post	varchar2(10)		NULL --병원 우편번호
);


CREATE TABLE disease ( --질병명
	d_code	number(10)		NOT NULL, --질병 코드
	d_name	varchar2(50)		NULL --질병 이름
);


CREATE TABLE payment ( --요금 수납
	p_amount	varchar2(20)		NULL, --처방 금액
	p_pay	varchar2(20)		NULL, --수납한 금액
	p_r_num	number(10)		NOT NULL --진료기록 번호
);


CREATE TABLE medicine ( --약품테이블
	m_code	number(10)		NOT NULL, --약품코드
	m_name	varchar2(50)		NULL --약품명
);


CREATE TABLE therapy ( --물리치료
	t_code	number(10)		NOT NULL, -- 물리치료 코드
	t_name	varchar2(50)		NULL, --물리치료 이름
	t_price	varchar2(20)		NULL --물리치료 가격
);


ALTER TABLE patient ADD CONSTRAINT "PK_PATIENT" PRIMARY KEY (
	num
);

ALTER TABLE record ADD CONSTRAINT "PK_RECORD" PRIMARY KEY (
	r_num
);

ALTER TABLE wait ADD CONSTRAINT "PK_WAIT" PRIMARY KEY (
	w_num
);

ALTER TABLE item ADD CONSTRAINT "PK_ITEM" PRIMARY KEY (
	i_code
);

ALTER TABLE hospital_id ADD CONSTRAINT "PK_HOSPITAL_ID" PRIMARY KEY (
	h_id
);

ALTER TABLE disease ADD CONSTRAINT "PK_DISEASE" PRIMARY KEY (
	d_code
);

ALTER TABLE medicine ADD CONSTRAINT "PK_MEDICINE" PRIMARY KEY (
	m_code
);

ALTER TABLE therapy ADD CONSTRAINT "PK_THERAPY" PRIMARY KEY (
	t_code
);

ALTER TABLE record ADD CONSTRAINT "FK_medicine_TO_record_1" FOREIGN KEY (
	r_m_code
)
REFERENCES medicine (
	m_code
);

ALTER TABLE record ADD CONSTRAINT "FK_patient_TO_record_1" FOREIGN KEY (
	r_p_num
)
REFERENCES patient (
	num
);

ALTER TABLE record ADD CONSTRAINT "FK_disease_TO_record_1" FOREIGN KEY (
	r_d_code
)
REFERENCES disease (
	d_code
);

ALTER TABLE record ADD CONSTRAINT "FK_therapy_TO_record_1" FOREIGN KEY (
	r_t_code
)
REFERENCES therapy (
	t_code
);

ALTER TABLE wait ADD CONSTRAINT "FK_patient_TO_wait_1" FOREIGN KEY (
	w_p_num
)
REFERENCES patient (
	num
);

ALTER TABLE payment ADD CONSTRAINT "FK_record_TO_payment_1" FOREIGN KEY (
	p_r_num
)
REFERENCES record (
	r_num
);

