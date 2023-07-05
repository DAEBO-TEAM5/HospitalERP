--테이블DROP, 테이블 CREATE, 참조키 ALTER

DROP TABLE discard; -- 폐기
DROP TABLE release; -- 출고(사용)
DROP TABLE item; -- 물품재고
DROP TABLE wait; -- 접수/대기 명단
DROP TABLE hospital_id; -- 병원ID
DROP TABLE payment; -- 요금수납
DROP TABLE record; -- 환자 진료 기록
DROP TABLE employee; -- 직원(의사/간호사)
DROP TABLE patient; -- 환자 기본정보
DROP TABLE disease; -- 질병명
DROP TABLE prescription; -- 처방전
DROP TABLE medicine; -- 약품 
DROP TABLE therapy; -- 물리 치료


CREATE TABLE patient (  --환자 기본정보
	num	number(10)		NOT NULL, --환자 번호
	name	varchar2(20)		NOT NULL, -- 환자이름
	birth	varchar2(20)		NOT NULL, -- 생년월일
	phone	varchar2(20)		NOT NULL, -- 연락처
	address	varchar2(200)		NULL, -- 주소
	sex	varchar2(10)		NULL, -- 성별
	height	number(10)		NULL, -- 키
	weight	number(10)		NULL, -- 몸무게
	note	varchar2(300)		NULL -- 특이사항
);

CREATE TABLE record ( -- 환자 진료 기록
	r_num	number(10)		NOT NULL,  -- 진료 기록 번호
	r_date	varchar2(20)		NOT NULL, -- 진료 날짜
	r_ban	varchar2(300)		NULL, -- 처방 금지 약품
	r_p_code	number(10)		NULL, -- 약품 코드 // 약품테이블
	r_p_num	number(10)		NULL,  -- 환자 번호 //환자 테이블
	r_d_code	number(10)		NULL, -- 질병 코드
	r_t_code	number(10)		NULL, -- 물리치료 코드
	r_e_code 	number(10)		NOT NULL -- 직원 코드
);

CREATE TABLE wait ( -- 접수/대기 명단
	w_num	number(10)		NOT NULL, -- 접수 번호
	w_symptom	varchar2(300)		NULL, -- 증상 내용
	w_p_num	number(10)		NOT NULL -- 환자 번호
);

CREATE TABLE item ( -- 물품 재고 테이블
	i_code	number(10)		NOT NULL, -- 품목 코드
	i_num	number(10)		NULL, -- 물품 번호
	i_name	varchar2(50)		NOT NULL, -- 물품 이름
	i_category	varchar2(50)		NULL, -- 카테고리
	i_unit	varchar2(20)		NULL, -- 단위
	i_stock	number(10)		NULL, -- 재고량
	i_expire	varchar2(20)		NULL, -- 유통기한
	i_price	number(10)		NULL, -- 물품 단가
	i_remark	varchar2(300)		NULL, -- 비고
	i_memo	varchar2(300)		NULL -- 메모
);

CREATE TABLE hospital_id ( -- 병원
	h_id	varchar2(20)		NOT NULL, -- ID
	h_name	varchar2(50)		NULL, -- 병원이름
	h_address	varchar2(200)		NULL, -- 주소
	h_phone	varchar2(20)		NULL, -- 전화번호
	h_pwd	varchar2(30)		NOT NULL, -- 비밀번호
	h_email	varchar2(30)		NULL, -- 이메일
	h_post	varchar2(10)		NULL, -- 우편번호
	h_e_code	number(10)		NOT NULL -- 직원코드
);

CREATE TABLE disease ( -- 질병
	d_code	number(10)		NOT NULL, -- 질병코드
	d_name	varchar2(50)		NULL -- 질병이름
);

CREATE TABLE payment ( -- 요금수납
	p_amount	number(10)			NULL, -- 처방금액
	p_pay	number(10)			NULL, -- 수납한금액
	p_r_num	number(10)		NOT NULL -- 진료기록번호
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
	p_code	number(10)		NOT NULL, -- 처방 코드
	p_m_code	number(10)		NOT NULL, -- 약품 코드
	p_use	number(10)		NULL -- 약품 사용량
);

CREATE TABLE release ( -- 출고 관리
	rel_i_code	number(10)		NOT NULL, -- 품목 코드
	rel_date	varchar(20)		NULL, -- 사용 날짜
    rel_time	varchar(20)		NULL, -- 사용 시간
	rel_user	varchar(20)		NULL, -- 사용자
	rel_amount	number(10)		NULL, -- 사용량
    rel_remark	varchar(100)		NULL -- 비고
);

CREATE TABLE discard ( -- 폐기 관리
	dis_i_code	number(10)		NOT NULL, -- 품목 코드
	dis_date	varchar(20)		NULL, -- 폐기 날짜
    dis_time	varchar(20)		NULL, -- 폐기 시간
	dis_user	varchar(20)		NULL, -- 폐기 담당자
	dis_amount	number(10)		NULL, -- 폐기량
    dis_remark	varchar(100)		NULL -- 비고
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

ALTER TABLE employee ADD CONSTRAINT "PK_EMPLOYEE" PRIMARY KEY (
	e_code
);

ALTER TABLE prescription ADD CONSTRAINT "PK_PRESCRIPTION" PRIMARY KEY (
	p_code
);

ALTER TABLE record ADD CONSTRAINT "FK_prescription_TO_record_1" FOREIGN KEY (
	r_p_code
)
REFERENCES prescription (
	p_code
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

ALTER TABLE record ADD CONSTRAINT "FK_employee_TO_record_1" FOREIGN KEY (
	r_e_code
)
REFERENCES employee (
	e_code
);

ALTER TABLE wait ADD CONSTRAINT "FK_patient_TO_wait_1" FOREIGN KEY (
	w_p_num
)
REFERENCES patient (
	num
);

ALTER TABLE hospital_id ADD CONSTRAINT "FK_employee_TO_hospital_id_1" FOREIGN KEY (
	h_e_code
)
REFERENCES employee (
	e_code
);

ALTER TABLE payment ADD CONSTRAINT "FK_record_TO_payment_1" FOREIGN KEY (
	p_r_num
)
REFERENCES record (
	r_num
);

ALTER TABLE prescription ADD CONSTRAINT "FK_medicine_TO_prescription_1" FOREIGN KEY (
	p_m_code
)
REFERENCES medicine (
	m_code
);

ALTER TABLE release ADD CONSTRAINT "FK_item_TO_release_1" FOREIGN KEY (
	rel_i_code
)
REFERENCES item (
	i_code
);

ALTER TABLE discard ADD CONSTRAINT "FK_item_TO_discard_1" FOREIGN KEY (
	dis_i_code
)
REFERENCES item (
	i_code
);