
--약품
insert into medicine values(1111, '타이레놀');
insert into medicine values(2222, '아스피린');
select m_code"약품 코드", m_name"약품 이름" from medicine; 
select * from medicine;


--처방
insert into prescription values(1001, 1111, 3);
insert into prescription values(2002, 2222, 99);
select p_code"처방 코드", p_m_code"약품 코드", p_use"약품 사용량" from prescription;
select *from prescription;


--질병
insert into disease values(3344, '코로나');
insert into disease values(5566, 'A형간염');
select d_code"질병 코드", d_name"질병 이름" from disease;
select * from disease;


--물리치료
insert into therapy values (1, '도수치료', '100000');
insert into therapy values (2, '물리치료', '5000');
select t_code"물리치료 코드", t_name"물리치료 이름", t_price"물리치료 가격" from therapy;
select * from therapy;


--직원 (의사, 간호사)
insert into employee values(220011, '양승윤');
insert into employee values(210341, '윤성호');
select e_code"직원 코드", e_name"직원 이름" from employee;
select * from employee;


--병원 (ID)
insert into hospital_id values('superstarsatori', '참푸른병원', '대학로CGV', '010-1234-5678', '난비밀번호', 'super@star.satori', '난우편', 220011);
insert into hospital_id values('kimdeokbae', '참푸른병원', '창경궁', '010-3334-5678', '시크릿', 'abc@naver.com', '난우편', 210341);
select h_id"ID", h_name"병원이름", h_address"병원주소", h_phone"연락처", h_pwd"비밀번호", h_email"이메일", h_post"병원우편번호", h_e_code"직원코드" from hospital_id;
select * from hospital_id;


--환자 기본정보
insert into patient values(1, '홍길동', '1999-09-09', '010-1234-5678', '서울 턱별시', '남자', 190, 90, '동에번쩍 서에번쩍');
insert into patient values(2, '양승윤', '1995-12-31', '010-0000-9999', '신림동', '남자', 205, 45, '신림동 메이플왕');
select num"환자번호", name"환자이름", birth"생년월일", phone"연락처", address"주소", sex"성별", height"키", weight"몸무게", note"특이사항" from patient;
select * from patient;


--접수/대기 명단
insert into wait values(1, '머리가 아파요', 1);
insert into wait values(2, '눈이 퍽퍽해요', 2);
select w_num"접수번호", w_symptom"증상내용", w_p_num "환자 번호" from wait; 
select * from wait;


--진료기록 번호/ 진료날짜/ 처방금지 약품/ 처방코드/ 환자번호/ 질병코드/ 물리치료 코드/ 직원 코드
insert into RECORD values(1, '2023-07-02', '처방금지1', 1001, 1, 3344, 1, 220011);
insert into record values(2, '2023-07-04', '처방금지2', 2002, 2, 5566, 2, 210341);
select r_num"진료기록 번호", r_date"진료날짜", r_ban"처방금지 약품", r_p_code"처방코드", r_p_num"환자번호", r_p_code"질병코드", r_t_code"물리치료 코드", r_e_code"직원코드" from record; 
select * from record;


--요금 수납
insert into payment values(50000, 0, 1); 
insert into payment values(20000, 0, 2); 
select p_amount"처방금액", p_pay"수납한 금액", p_r_num"진료기록 번호" from payment;
select * from payment;


--물품재고 
insert into item values( 35923, 1, '이쑤시개', '소모품', '다스', 2, '2023-09-03', 30000, '비고', '메모');
select i_code"품목코드", i_num"물품번호", i_name"물품이름", i_category"카테고리", i_unit"단위", i_stock"재고량", i_expire"유통기한", i_price"물품단가", i_remark"비고", i_memo"메모" from item;
select * from item;


--출고(사용) 관리
insert into release values( 35923, '2023-07-05','15:24', '사용자', 20, '나는 비고입니다');
select rel_i_code"품목코드", rel_date"사용날짜", rel_time"사용시간", rel_user"사용자", rel_amount"사용량", rel_remark"비고" from release;
select * from release;


--폐기 관리
insert into discard values( 35923, '2023-07-05','16:49', '폐기담당자', 30, '나는 폐기 비고입니다');
select dis_i_code"품목코드", dis_date"폐기날짜", dis_time"폐기시간", dis_user"폐기담당자", dis_amount"폐기량", dis_remark"비고" from discard;
select * from discard;

