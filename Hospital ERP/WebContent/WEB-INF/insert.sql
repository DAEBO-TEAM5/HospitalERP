
--약품 //코드 10001~
insert into medicine values(m_code_seq.nextval, '타이레놀');
insert into medicine values(m_code_seq.nextval, '아스피린');
insert into medicine values(m_code_seq.nextval, '에스녹틸정 ');
select m_code"약품 코드", m_name"약품 이름" from medicine; 
select * from medicine;


--질병 //코드 20001~
insert into disease values(d_code_seq.nextval, '코로나');
insert into disease values(d_code_seq.nextval, 'A형간염');
insert into disease values(d_code_seq.nextval, '장염');
select d_code"질병 코드", d_name"질병 이름" from disease;
select * from disease;


--물리치료 //코드 30001~
insert into therapy values (t_code_seq.nextval, '없음', '0');
insert into therapy values (t_code_seq.nextval, '도수치료', '100000');
insert into therapy values (t_code_seq.nextval, '물리치료', '5000');

select t_code"물리치료 코드", t_name"물리치료 이름", t_price"물리치료 가격" from therapy;
select * from therapy;


--직원 (의사, 간호사) //코드 40001~
insert into employee values(e_code_seq.nextval, '신지애');
insert into employee values(e_code_seq.nextval, '정준열');
select e_code"직원 코드", e_name"직원 이름" from employee;
select * from employee;


--병원 (ID)
insert into hospital_id values('superstarsatori', '참푸른병원', '대학로CGV', '010-1234-5678', '난비밀번호', 'super@star.satori', '난우편', 40001);
insert into hospital_id values('kimdeokbae', '참푸른병원', '창경궁', '010-3334-5678', '시크릿', 'abc@naver.com', '난우편', 40002);
select h_id"ID", h_name"병원이름", h_address"병원주소", h_phone"연락처", h_pwd"비밀번호", h_email"이메일", h_post"병원우편번호", h_e_code"직원코드" from hospital_id;
select * from hospital_id;


--환자 기본정보 //코드 50001~
insert into patient values(num_seq.nextval, '홍길동', '1999-09-09', '010-1234-5678', '서울 턱별시', '남자', 190, 90, '동에번쩍 서에번쩍');
insert into patient values(num_seq.nextval, '양승윤', '1995-12-31', '010-0000-9999', '신림동', '남자', 205, 45, '신림동 메이플왕');
insert into patient values(num_seq.nextval, '윤성호', '1994-08-21', '010-5344-2342', '의정부', '남자', 187, 77, '의정부 자바머신');
select num"환자번호", name"환자이름", birth"생년월일", phone"연락처", address"주소", sex"성별", height"키", weight"몸무게", note"특이사항" from patient;
select * from patient;


--접수/대기 명단 //코드 60001~
insert into wait values(w_num_seq.nextval, '머리가 아파요', 50001);
insert into wait values(w_num_seq.nextval, '눈이 퍽퍽해요', 50002);
insert into wait values(w_num_seq.nextval, '배가 아파요', 50003);
insert into wait values(w_num_seq.nextval, '다리가 아파요', 50001);
insert into wait values(w_num_seq.nextval, '허리가 아파요', 50002);
insert into wait values(w_num_seq.nextval, '손가락이 아파요', 50003);
insert into wait values(w_num_seq.nextval, '손가락이 또 아파요', 50003);

select w_num"접수번호", w_symptom"증상내용", w_p_num "환자 번호" from wait; 
select * from wait;


--진료기록 번호/ 진료날짜/ 의사소견/증상내용(복사)/ 환자번호/ 질병코드/ 직원 코드   //진료기록 코드 70001~
insert into RECORD values(r_num_seq.nextval, '2023-07-02', '의사소견1', '증상내용(복사)1', 50001, 20001, 40001);
insert into record values(r_num_seq.nextval, '2023-07-04', '의사소견2', '증상내용(복사)2', 50002, 20002, 40002);
insert into record values(r_num_seq.nextval, '2023-07-07', '의사소견3', '증상내용(복사)3', 50003, 20001, 40001);
insert into record values(r_num_seq.nextval, '2023-07-13', '의사소견4', '증상내용(복사)4', 50001, 20001, 40002);
insert into record values(r_num_seq.nextval, '2023-07-13', '의사소견5', '증상내용(복사)5', 50002, 20001, 40002);
insert into record values(r_num_seq.nextval, '2023-07-13', '의사소견6', '증상내용(복사)6', 50003, 20001, 40001);
insert into record values(r_num_seq.nextval, '2023-07-13', '의사소견7', '증상내용(복사)7', 50003, 20001, 40001);

select r_num"진료기록 번호", r_date"진료날짜", r_opinion"의사소견(진단결과)",r_symptom"증상내용", r_p_num"환자번호", r_d_code"질병코드", r_e_code"직원코드" from record; 
select * from record;


--처방  //처방맵핑 코드 1001~
insert into prescription values(p_num_seq.nextval, 10001, 3, 70001);
insert into prescription values(p_num_seq.nextval, 10002, 99, 70002);
insert into prescription values(p_num_seq.nextval, 10003, 88, 70003);
insert into prescription values(p_num_seq.nextval, 10001, 77, 70004);
insert into prescription values(p_num_seq.nextval, 10002, 56, 70005);
insert into prescription values(p_num_seq.nextval, 10003, 55, 70006);
insert into prescription values(p_num_seq.nextval, 10003, 44, 70007);

select p_num"맵핑 번호", p_m_code"약품 코드", p_use"약품 사용량", p_r_num"진료 기록 번호" from prescription;
select *from prescription;


--요금 수납  //코드 80001~
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, (SELECT t.t_price FROM payment p JOIN record r ON p.pay_r_num = r.r_num JOIN tr_mapping tm ON r.r_num = tm.tr_r_num
					JOIN therapy t ON tm.tr_t_code = t.t_code WHERE p.pay_r_num = 70001) + (select pay_basic from payment where pay_r_num=70001), 70001); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 15000, 70002); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 20000, 70003); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 40000, 70004); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 30000, 70005); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 66000, 70006); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 23000, 70007); 
select pay_num"수납 번호", pay_amount"처방금액", pay_basic"기본금액", pay_cash"현금 수납한 금액", pay_card"카드 수납한 금액", pay_r_num"진료기록 번호" from payment;
select * from payment;


--물품종류코드   //코드 90001~
insert into item_code values( i_code_num_seq.nextval, '이쑤시개', '소모품' );
insert into item_code values( i_code_num_seq.nextval, '면봉', '소모품');
insert into item_code values( i_code_num_seq.nextval, '거즈', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '붕대', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '목발', '카테고리3');
select i_code"품목코드",i_name"물품이름", i_category"카테고리" from item_code;
select * from item_code;


--달력 메모 테이블 // 메모번호 5001~
insert into memo values(m_num_seq.nextval, '메모', '2023-07-20', 40001);
insert into memo values(m_num_seq.nextval, '메모2', '2023-07-25', 40002);
select * from memo;
select m_num"메모번호", m_memo"내용", m_date"날짜", m_e_code"직원코드" from memo;


-- 물리치료 환자 맵핑 //물리치료맵핑 6001~
insert into tr_mapping values(tr_num_seq.nextval, 30001, 70001);
insert into tr_mapping values(tr_num_seq.nextval, 30002, 70002);
insert into tr_mapping values(tr_num_seq.nextval, 30001, 70003);
insert into tr_mapping values(tr_num_seq.nextval, 30002, 70004);
insert into tr_mapping values(tr_num_seq.nextval, 30003, 70005);
insert into tr_mapping values(tr_num_seq.nextval, 30003, 70006);
insert into tr_mapping values(tr_num_seq.nextval, 30002, 70007);
select tr_num"물리치료 맵핑번호", tr_t_code"물리치료 코드", tr_r_num"진료 기록 번호" from tr_mapping;
select * from tr_mapping;


--입고 관리 // 물품 재고, 입고 번호 7001 ~
insert into item values ( i_num_seq.nextval, 90001, '다스', 2, '2023-09-03', 30000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90002, '되', 11, '2023-07-03', 50000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90003, '개', 100, '2025-04-30', 700, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90004, '묶음', 50, '2025-06-20', 9999, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90005, '개', 3, '2099-12-31', 200000, '비고', '메모');

select i_num"물품 번호", i_unit"단위", i_stock"입고량", i_expire"유통기한", i_price"물품단가", i_remark"비고", i_memo"메모", i_i_code"품목코드" from item;
select * from item;
select * from item_code;



--출고(사용) 관리 // 출고 기록 번호 8001~
insert into release values( rel_num_seq.nextval, '2023-07-05','15:24', '사용자', 20, 5, '나는 비고입니다', 90001);
insert into release values( rel_num_seq.nextval, '2023-07-03','15:24', '사용자', 20, 5, '나는 비고입니다', 90002);
select rel_num"출고기록 번호", rel_date"사용날짜", rel_time"사용시간", rel_user"사용자", rel_amount"사용량", rel_after"잔여량", rel_remark"비고", rel_i_code"품목코드" from release;
select * from release;


--폐기 관리 // 폐기 기록 번호 9001~
insert into discard values( dis_num_seq.nextval, '2023-07-05','16:49', '폐기담당자', 30, 10, '나는 폐기 비고입니다', 90001);
insert into discard values( dis_num_seq.nextval, '2023-07-03','13:49', '폐기담당자', 30, 10, '나는 폐기 비고입니다', 90002);
select dis_num"폐기기록 번호", dis_date"폐기날짜", dis_time"폐기시간", dis_user"폐기담당자", dis_amount"폐기량", dis_after"잔여량", dis_remark"비고", dis_i_code"품목코드" from discard;
select * from discard;

commit;