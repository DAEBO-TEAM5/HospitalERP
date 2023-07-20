
--약품 //코드 m_code 10001~ 10021
insert into medicine values(m_code_seq.nextval, '타이레놀');
insert into medicine values(m_code_seq.nextval, '아스피린');
insert into medicine values(m_code_seq.nextval, '에스녹틸정');
insert into medicine values(m_code_seq.nextval, '로토씨큐브아쿠아차지아이점안액' );
insert into medicine values(m_code_seq.nextval, '디티아이주100mg(다카르바진)' );
insert into medicine values(m_code_seq.nextval, '리렌스연고(구아이아줄렌) 20g' );
insert into medicine values(m_code_seq.nextval, '리렌스연고(구아이아줄렌) 30g' );
insert into medicine values(m_code_seq.nextval, '아로나민아이정' );
insert into medicine values(m_code_seq.nextval, '아로나민아이플러스정' );
insert into medicine values(m_code_seq.nextval, '아이간E점안액' );
insert into medicine values(m_code_seq.nextval, '아이나졸캠슐(플루코나졸)' );
insert into medicine values(m_code_seq.nextval, '에스녹틸정 ');
insert into medicine values(m_code_seq.nextval, '오셀타미비르');
insert into medicine values(m_code_seq.nextval, '시트라진');
insert into medicine values(m_code_seq.nextval, '엔알라프릴');
insert into medicine values(m_code_seq.nextval, '메트포르민');
insert into medicine values(m_code_seq.nextval, '사모테리손');
insert into medicine values(m_code_seq.nextval, '글루코사민');
insert into medicine values(m_code_seq.nextval, '프로자크');
insert into medicine values(m_code_seq.nextval, '오메프라졸');
insert into medicine values(m_code_seq.nextval, '시스플라틴');
select m_code"약품 코드", m_name"약품 이름" from medicine; 
select * from medicine;


--질병 //코드 d_code 20001~20012
insert into disease values(d_code_seq.nextval, '코로나');
insert into disease values(d_code_seq.nextval, 'A형간염');
insert into disease values(d_code_seq.nextval, '장염');
insert into disease values(d_code_seq.nextval, '독감');
insert into disease values(d_code_seq.nextval, '알레르기');
insert into disease values(d_code_seq.nextval, '고혈압');
insert into disease values(d_code_seq.nextval, '당뇨병');
insert into disease values(d_code_seq.nextval, '천식');
insert into disease values(d_code_seq.nextval, '관절염');
insert into disease values(d_code_seq.nextval, '우울증');
insert into disease values(d_code_seq.nextval, '위궤양');
insert into disease values(d_code_seq.nextval, '암');
select d_code"질병 코드", d_name"질병 이름" from disease;
select * from disease;
select * from record;


--추가치료 //코드 t_code  30001~30010
insert into therapy values (t_code_seq.nextval, '없음', '0');
insert into therapy values (t_code_seq.nextval, '이오테라피', '2000');
insert into therapy values (t_code_seq.nextval, '포도당 주사', '5000');
insert into therapy values (t_code_seq.nextval, '독감 주사', '50000');
insert into therapy values (t_code_seq.nextval, '초음파 치료', '6000');

insert into therapy values (t_code_seq.nextval, '레이저 치료', '12000');
insert into therapy values (t_code_seq.nextval, '전기 자극 치료', '10000');
insert into therapy values (t_code_seq.nextval, '체외충격파 치료', '30000');
insert into therapy values (t_code_seq.nextval, '냉열 요법', '10000');
insert into therapy values (t_code_seq.nextval, '운동 치료', '30000');

select t_code"물리치료 코드", t_name"물리치료 이름", t_price"물리치료 가격" from therapy;
select * from therapy;


--직원 (의사, 간호사) //코드 e_code 40001~40010: 의사 , 45001~45999: 간호사
insert into employee values(e_code_seq.nextval, '김지민');
insert into employee values(e_code_seq.nextval, '이서연');
insert into employee values(e_code_seq.nextval, '신지애');
insert into employee values(e_code_seq.nextval, '정준열');
insert into employee values(e_code_seq.nextval, '박준호');
insert into employee values(e_code_seq.nextval, '최예은');
insert into employee values(e_code_seq.nextval, '정세진');
insert into employee values(e_code_seq.nextval, '윤현우');
insert into employee values(e_code_seq.nextval, '김지후');
insert into employee values(e_code_seq.nextval, '이예린');

insert into employee values(45001, '최수민');
insert into employee values(45002, '조민준');
insert into employee values(45003, '정시우');
insert into employee values(45004, '박하연');
insert into employee values(45005, '손미래');
insert into employee values(45006, '강태준');
insert into employee values(45007, '윤서율');
insert into employee values(45008, '남현빈');
insert into employee values(45009, '강백호');
insert into employee values(45010, '채치수');
select e_code"직원 코드", e_name"직원 이름" from employee;
select * from employee;


--병원 (ID)
insert into hospital_id values('superstarsatori', '참푸른병원', '대학로CGV', '010-1234-5678', 'pwd123', 'super@star.satori', '난우편', 40001);
insert into hospital_id values('kimdeokbae', '참푸른병원', '창경궁', '010-3334-5678', 'pass123', 'abc@naver.com', '난우편', 40002);
select h_id"ID", h_name"병원이름", h_address"병원주소", h_phone"연락처", h_pwd"비밀번호", h_email"이메일", h_post"병원우편번호", h_e_code"직원코드" from hospital_id;
select * from hospital_id;


--환자 기본정보 //코드 num 50001~ 50030
insert into patient values(num_seq.nextval, '홍길동', '1999-09-09', '010-1234-5678', '서울 턱별시', '남자', 190, 90, '동에번쩍 서에번쩍');
insert into patient values(num_seq.nextval, '양승윤', '1995-12-31', '010-0000-9999', '신림동', '남자', 205, 45, '신림동 잠만보');
insert into patient values(num_seq.nextval, '윤성호', '1994-08-21', '010-5344-2342', '의정부', '여자', 187, 77, '의정부 자바머신');
insert into patient values(num_seq.nextval, '정준열', '1992-05-17', '010-5823-9657', '부산', '여자', 187, 77, '뜨거운 부산남자');
insert into patient values(num_seq.nextval, '신지애', '1983-02-03', '010-9107-4286', '서울', '남자', 187, 77, '5팀의 희망');
insert into patient values(num_seq.nextval, '김영수', '1987-07-26', '010-6890-7063', '강원도', '여자', 187, 77, '행복한 하루되세요.');
insert into patient values(num_seq.nextval, '이지은', '1996-10-08', '010-1475-1948', '대구', '남자', 187, 77, '내일은 새로운 시작이야.');
insert into patient values(num_seq.nextval, '박준호', '1985-04-12', '010-7438-8294', '대전', '여자', 187, 77, '꿈을 이뤄나갈 때야!');
insert into patient values(num_seq.nextval, '최민지', '1990-08-20', '010-5236-6721', '인천', '남자', 187, 77, '이상한 사람(주의필요)');
insert into patient values(num_seq.nextval, '정성민', '1994-06-30', '010-8102-2342', '수원', '남자', 187, 77, '호들갑이 심함');
insert into patient values(num_seq.nextval, '김덕배', '1990-01-01', '010-1234-5678', '서울시 강남구', '남성', 175, 70, '알레르기 있음');
insert into patient values(num_seq.nextval, '김수지', '1985-03-15', '010-9876-5432', '서울시 종로구', '여성', 160, 55, '수술 경력 있음');
insert into patient values(num_seq.nextval, '이철수', '1995-07-10', '010-2222-3333', '부산시 해운대구', '남성', 180, 80, '천식환자');
insert into patient values(num_seq.nextval, '박지민', '1992-11-20', '010-5555-6666', '대구시 동구', '남성', 168, 65, '무릎 통증 있음');
insert into patient values (num_seq.nextval, '정형돈', '1982-02-02', '010-8888-8888', '세종시', '남성', 175, 73, '독거 노인');
insert into patient values(num_seq.nextval, '송영철', '1988-09-05', '010-7777-8888', '인천시 부평구', '남성', 172, 75, '심장질환');
insert into patient values (num_seq.nextval, '이미란', '1994-04-25', '010-1111-2222', '경기도 수원시', '여성', 163, 58, '골반 근육 약함');
insert into patient values (num_seq.nextval, '유재석', '1980-12-07', '010-4444-9999', '대전시 유성구', '남성', 178, 68, '저혈압 조심');
insert into patient values (num_seq.nextval, '김태희', '1981-03-29', '010-3333-7777', '광주시 남구', '여성', 165, 50, '피가 잘 안 뽑힘');
insert into patient values (num_seq.nextval, '장동건', '1978-06-14', '010-7777-7777', '전주시 덕진구', '남성', 181, 82, '건강 상태 양호');
--
--insert into patient values (num_seq.nextval, '한지민', '1990-08-18', '010-6666-6666', '울산시 남구', '여성', 167, 54, '직원들한테 잘 해줌');
--insert into patient values (num_seq.nextval, '송지효', '1985-10-28', '010-2222-5555', '제주시', '여성', 162, 49, '기관지 약함');
--insert into patient values (num_seq.nextval, '서장훈', '1976-09-12', '010-5555-2222', '경남 창원시', '남성', 179, 70, '목 디스크 있음');
--insert into patient values (num_seq.nextval, '김종국', '1977-07-05', '010-9999-8888', '강원도 춘천시', '남성', 176, 72, '비염 환자');
--insert into patient values (num_seq.nextval, '전현무', '1980-11-30', '010-3333-3333', '충북 청주시', '남성', 180, 75, '어깨 근육 약함');
--insert into patient values (num_seq.nextval, '김희철', '1983-12-25', '010-4444-4444', '전북 전주시', '남성', 170, 62, '중이염 많음');
--insert into patient values (num_seq.nextval, '홍진영', '1985-02-15', '010-6666-3333', '광주시 북구', '여성', 163, 52, '성대 접착 조심');
--insert into patient values (num_seq.nextval, '유병재', '1975-04-03', '010-7777-5555', '대구시 중구', '남성', 177, 75, '고혈압 있음');
--insert into patient values (num_seq.nextval, '이승기', '1987-01-31', '010-2222-9999', '울산시 동구', '남성', 178, 72, '결혼 잘 못함');
--insert into patient values (num_seq.nextval, '한효주', '1987-09-10', '010-8888-5555', '부산시 사하구', '여성', 165, 53, '목소리 아름다움');

select num"환자번호", name"환자이름", birth"생년월일", phone"연락처", address"주소", sex"성별", height"키", weight"몸무게", note"특이사항" from patient;
select * from patient;


--접수/대기 명단 //코드 60001~
insert into wait values(w_num_seq.nextval, '머리가 아파요', 50001);
insert into wait values(w_num_seq.nextval, '눈이 퍽퍽해요', 50002);
insert into wait values(w_num_seq.nextval, '배가 아파요', 50003);
insert into wait values(w_num_seq.nextval, '다리가 아파요', 50004);
insert into wait values(w_num_seq.nextval, '허리가 아파요', 50005);
insert into wait values(w_num_seq.nextval, '손가락이 아파요', 50006);
insert into wait values(w_num_seq.nextval, '두통', 50007);
insert into wait values(w_num_seq.nextval, '복통', 50008);
--insert into wait values(w_num_seq.nextval, '근육통', 50009);
--insert into wait values(w_num_seq.nextval, '구토', 50010);
--insert into wait values(w_num_seq.nextval, '설사', 50011);
insert into wait values(w_num_seq.nextval, '가려움증', 50012);
insert into wait values(w_num_seq.nextval, '코막힘', 50013);
insert into wait values(w_num_seq.nextval, '피로감', 50014);
insert into wait values(w_num_seq.nextval, '기침', 50015);
insert into wait values(w_num_seq.nextval, '손가락이 또 아파요', 50016);
INSERT INTO wait VALUES (w_num_seq.nextval, '코막힘, 목 간지럽고 아픔', 50017);
INSERT INTO wait VALUES (w_num_seq.nextval, '코막힘, 재채기, 코 주변 통증', 50018);
INSERT INTO wait VALUES (w_num_seq.nextval, '목 아픔, 인후통, 발열', 50019);
INSERT INTO wait VALUES (w_num_seq.nextval, '귀 통증, 귀에서 이물질 느낌', 50020);


select w_num"접수번호", w_symptom"증상내용", w_p_num "환자 번호" from wait; 
select * from wait;


--진료기록 번호/ 진료날짜/ 의사소견/증상내용(복사)/ 환자번호/ 질병코드/ 직원 코드   //진료기록 코드 70001~
insert into RECORD values(r_num_seq.nextval, '2023-07-10', '의사소견1', '머리가 아파요', 50001, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-10', '의사소견2', '눈이 퍽퍽해요', 50002, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-11', '의사소견3', '머리가 아파요', 50003, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-11', '의사소견4', '배가 아파요', 50004, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-12', '의사소견5', '다리가 아파요', 50005, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-12', '의사소견6', '허리가 아파요', 50006, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-13', '의사소견7', '손가락이 아파요', 50007, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-13', '의사소견8', '두통', 50008, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-14', '의사소견9', '복통', 50009, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-14', '의사소견10', '근육통', 50010, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-15', '의사소견11', '구토', 50011, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-15', '의사소견12', '피로감', 50012, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-16', '의사소견13', '설사', 50013, 20001, 40001 ,0);
insert into RECORD values(r_num_seq.nextval, '2023-07-16', '의사소견14', '기침', 50014, 20001, 40001 ,0);


insert into RECORD values(r_num_seq.nextval, '2023-07-16', '의사소견15', '머리가 아파요', 50005, 20001, 40001 ,0);
insert into record values(r_num_seq.nextval, '2023-07-17', '의사소견16', '눈이 퍽퍽해요', 50012, 20002, 40002 ,0);
insert into record values(r_num_seq.nextval, '2023-07-17', '의사소견17', '배가 아파요', 50013, 20003, 40003 ,0);
insert into record values(r_num_seq.nextval, '2023-07-18', '의사소견18', '다리가 아파요', 50014, 20004, 40004 ,0);
insert into record values(r_num_seq.nextval, '2023-07-18', '의사소견19', '허리가 아파요', 50001, 20004, 40005 ,0);
insert into record values(r_num_seq.nextval, '2023-07-18', '의사소견20', '손가락이 아파요', 50002, 20005, 40006 ,0);
insert into record values(r_num_seq.nextval, '2023-07-18', '의사소견21', '두통', 50003, 20006, 40007 ,0);
insert into record values(r_num_seq.nextval, '2023-07-18', '의사소견22', '복통', 50004, 20007, 40008 ,0);
insert into record values(r_num_seq.nextval, '2023-07-18', '의사소견23', '근육통', 50005, 20008, 40001 ,0);
insert into record values(r_num_seq.nextval, '2023-07-18', '의사소견24', '구토', 50006, 20009, 40002 ,0);
insert into record values(r_num_seq.nextval, '2023-07-19', '의사소견25', '설사', 50007, 20010, 40003 ,0);
insert into record values(r_num_seq.nextval, '2023-07-20', '의사소견26', '가려움증', 50008, 20011, 40004 ,0);
insert into record values(r_num_seq.nextval, '2023-07-21', '의사소견27', '코막힘', 50015, 20012, 40005 ,0);
insert into record values(r_num_seq.nextval, '2023-07-21', '의사소견28', '피로감', 50009, 20001, 40006 ,0);
insert into record values(r_num_seq.nextval, '2023-07-21', '의사소견29', '기침', 50010, 20005, 40007 ,0);
insert into record values(r_num_seq.nextval, '2023-07-21', '의사소견30', '손가락이 또 아파요', 50011, 20004, 40008 ,0);


select r_num"진료기록 번호", r_date"진료날짜", r_opinion"의사소견(진단결과)",r_symptom"증상내용", r_p_num"환자번호", r_d_code"질병코드", r_e_code"직원코드" from record; 
select * from record;


--처방  //처방 코드 1001~
insert into prescription values(p_num_seq.nextval, 10001, 3, 70001);
insert into prescription values(p_num_seq.nextval, 10002, 4, 70001);
insert into prescription values(p_num_seq.nextval, 10003, 5, 70002);
insert into prescription values(p_num_seq.nextval, 10004, 6, 70002);
insert into prescription values(p_num_seq.nextval, 10005, 7, 70003);
insert into prescription values(p_num_seq.nextval, 10006, 8, 70003);
insert into prescription values(p_num_seq.nextval, 10007, 9, 70004);
insert into prescription values(p_num_seq.nextval, 10008, 10, 70004);
insert into prescription values(p_num_seq.nextval, 10009, 11, 70005);
insert into prescription values(p_num_seq.nextval, 10010, 12, 70005);
insert into prescription values(p_num_seq.nextval, 10011, 13, 70006);
insert into prescription values(p_num_seq.nextval, 10012, 14, 70007);
insert into prescription values(p_num_seq.nextval, 10001, 15, 70008);
insert into prescription values(p_num_seq.nextval, 10002, 16, 70009);
insert into prescription values(p_num_seq.nextval, 10003, 17, 70011);
insert into prescription values(p_num_seq.nextval, 10004, 18, 70012);
insert into prescription values(p_num_seq.nextval, 10005, 18, 70013);
insert into prescription values(p_num_seq.nextval, 10006, 18, 70014);
insert into prescription values(p_num_seq.nextval, 10007, 18, 70015);
insert into prescription values(p_num_seq.nextval, 10008, 18, 70016);
insert into prescription values(p_num_seq.nextval, 10009, 18, 70017);
insert into prescription values(p_num_seq.nextval, 10010, 18, 70018);
insert into prescription values(p_num_seq.nextval, 10011, 18, 70019);
insert into prescription values(p_num_seq.nextval, 10012, 18, 70020);
--insert into prescription values(p_num_seq.nextval, 10001, 3, 70021);
--insert into prescription values(p_num_seq.nextval, 10002, 4, 70022);
--insert into prescription values(p_num_seq.nextval, 10003, 5, 70023);
--insert into prescription values(p_num_seq.nextval, 10004, 6, 70024);
--insert into prescription values(p_num_seq.nextval, 10005, 7, 70025);
--insert into prescription values(p_num_seq.nextval, 10006, 8, 70026);
--insert into prescription values(p_num_seq.nextval, 10007, 9, 70027);
--insert into prescription values(p_num_seq.nextval, 10008, 10, 70028);
--insert into prescription values(p_num_seq.nextval, 10009, 11, 70029);
--insert into prescription values(p_num_seq.nextval, 10010, 12, 70030);
--insert into prescription values(p_num_seq.nextval, 10011, 13, 70031);
--insert into prescription values(p_num_seq.nextval, 10012, 14, 70032);
--insert into prescription values(p_num_seq.nextval, 10001, 3, 70033);
--insert into prescription values(p_num_seq.nextval, 10002, 4, 70034);
--insert into prescription values(p_num_seq.nextval, 10003, 5, 70035);
--insert into prescription values(p_num_seq.nextval, 10004, 6, 70036);
--insert into prescription values(p_num_seq.nextval, 10005, 7, 70037);
--insert into prescription values(p_num_seq.nextval, 10006, 8, 70038);
--insert into prescription values(p_num_seq.nextval, 10007, 9, 70039);
--insert into prescription values(p_num_seq.nextval, 10008, 10, 70040);

select p_num"맵핑 번호", p_m_code"약품 코드", p_use"약품 사용량", p_r_num"진료 기록 번호" from prescription;
select *from prescription;

--요금 수납  //코드 80001~
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 10000, 70001); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 12000, 70002); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 15000, 70003); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 60000, 70004); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 16000, 70005); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 32000, 70006); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 50000, 70007);
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 40000, 70008); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 12000, 70009); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 15000, 70010); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 66000, 70011); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 22000, 70012); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 20000, 70013); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 40000, 70014); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 20000, 70015); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 40000, 70016); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 12000, 70017); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 65000, 70018); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 16000, 70019); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 10000, 70020);
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 10000, 70021); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 12000, 70022); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 15000, 70023); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 60000, 70024); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 16000, 70025); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 22000, 70026); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 20000, 70027); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 40000, 70028); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 20000, 70029); 
insert into payment(pay_num, pay_amount,pay_r_num) values(pay_num_seq.nextval, 40000, 70030); 

select pay_num"수납 번호", pay_amount"처방금액", pay_basic"기본금액", pay_cash"현금 수납한 금액", pay_card"카드 수납한 금액", pay_r_num"진료기록 번호" from payment;
select * from payment;
select * from record;
select * from patient;
select * from hospital_id;

--물품종류코드   //코드 90001~

insert into item_code values( i_code_num_seq.nextval, '면봉', '카테고리4');
insert into item_code values( i_code_num_seq.nextval, '붕대', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '정맥 카테터', '카테고리4');
insert into item_code values( i_code_num_seq.nextval, '소독용 장갑', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '알코올 솜', '카테고리4');
insert into item_code values( i_code_num_seq.nextval, '거즈 패드', '카테고리4');
insert into item_code values( i_code_num_seq.nextval, '드레싱', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '포도당', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '코에 쏘는 약', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '입에 쏘는 약', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '탄력 붕대', '카테고리4');
insert into item_code values( i_code_num_seq.nextval, '수술용 마스크', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '수술용 드레이프', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '멸균 수술 가운', '카테고리3');
insert into item_code values( i_code_num_seq.nextval, '멸균된 메스 날', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '봉합사', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '상처 스트립', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '흡수성 면불', '카테고리3');
insert into item_code values( i_code_num_seq.nextval, '체온계', '카테고리3');
insert into item_code values( i_code_num_seq.nextval, '혈압측정기', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '청진기', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '심전도 전극', '카테고리3');
insert into item_code values( i_code_num_seq.nextval, '산소포화도계', '카테고리4');
insert into item_code values( i_code_num_seq.nextval, '네뷸라이저 키트', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '소변 수거 봉투', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, 'Foley 카테터', '카테고리3');
insert into item_code values( i_code_num_seq.nextval, '코마스크 (NG)', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '산소 튜브', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '정맥 주사 용액', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '방부제용액 ', '카테고리3');
insert into item_code values( i_code_num_seq.nextval, '배변기', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '폴리비닌요오딘', '카테고리1');
insert into item_code values( i_code_num_seq.nextval, '일회용 환자 가운', '카테고리2');
insert into item_code values( i_code_num_seq.nextval, '코 삽관', '카테고리3');
insert into item_code values( i_code_num_seq.nextval, '밴드 에이드', '카테고리4');
select i_code"품목코드",i_name"물품이름", i_category"카테고리" from item_code;
select * from item_code;


--달력 메모 테이블 // 메모번호 5001~
insert into memo values(m_num_seq.nextval, '메모', '2023-07-20', 40001);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-21', 40002);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-16', 40003);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-17', 40004);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-18', 40001);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-19', 40002);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-20', 40003);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-16', 40004);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-17', 40001);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-18', 45002);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-20', 45003);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-21', 45004);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-16', 45001);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-17', 45002);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-18', 45003);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-19', 45001);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-20', 45002);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-16', 45003);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-17', 45001);
insert into memo values(m_num_seq.nextval, '메모', '2023-07-18', 45002);
select * from memo;
select m_num"메모번호", m_memo"내용", m_date"날짜", m_e_code"직원코드" from memo;

select * from employee;
-- 물리치료 환자 맵핑 //물리치료맵핑 6001~
insert into tr_mapping values(tr_num_seq.nextval, 30001, 70001);
insert into tr_mapping values(tr_num_seq.nextval, 30002, 70002);
insert into tr_mapping values(tr_num_seq.nextval, 30003, 70003);
insert into tr_mapping values(tr_num_seq.nextval, 30004, 70004);
insert into tr_mapping values(tr_num_seq.nextval, 30005, 70005);
insert into tr_mapping values(tr_num_seq.nextval, 30006, 70006);
insert into tr_mapping values(tr_num_seq.nextval, 30007, 70006);
insert into tr_mapping values(tr_num_seq.nextval, 30008, 70007);
insert into tr_mapping values(tr_num_seq.nextval, 30009, 70007);
insert into tr_mapping values(tr_num_seq.nextval, 30010, 70008);
insert into tr_mapping values(tr_num_seq.nextval, 30002, 70009);
insert into tr_mapping values(tr_num_seq.nextval, 30003, 70010);
insert into tr_mapping values(tr_num_seq.nextval, 30004, 70011);
insert into tr_mapping values(tr_num_seq.nextval, 30005, 70011);
insert into tr_mapping values(tr_num_seq.nextval, 30006, 70012);
insert into tr_mapping values(tr_num_seq.nextval, 30007, 70013);
insert into tr_mapping values(tr_num_seq.nextval, 30008, 70014);
insert into tr_mapping values(tr_num_seq.nextval, 30009, 70015);
insert into tr_mapping values(tr_num_seq.nextval, 30010, 70016);
insert into tr_mapping values(tr_num_seq.nextval, 30002, 70017);
insert into tr_mapping values(tr_num_seq.nextval, 30003, 70018);
insert into tr_mapping values(tr_num_seq.nextval, 30004, 70018);
insert into tr_mapping values(tr_num_seq.nextval, 30005, 70019);
insert into tr_mapping values(tr_num_seq.nextval, 30001, 70020);
insert into tr_mapping values(tr_num_seq.nextval, 30001, 70021);
insert into tr_mapping values(tr_num_seq.nextval, 30002, 70022);
insert into tr_mapping values(tr_num_seq.nextval, 30003, 70023);
insert into tr_mapping values(tr_num_seq.nextval, 30004, 70024);
insert into tr_mapping values(tr_num_seq.nextval, 30005, 70025);
insert into tr_mapping values(tr_num_seq.nextval, 30006, 70026);
insert into tr_mapping values(tr_num_seq.nextval, 30007, 70027);
insert into tr_mapping values(tr_num_seq.nextval, 30008, 70028);
insert into tr_mapping values(tr_num_seq.nextval, 30009, 70029);
insert into tr_mapping values(tr_num_seq.nextval, 30010, 70030);

select tr_num"물리치료 맵핑번호", tr_t_code"물리치료 코드", tr_r_num"진료 기록 번호" from tr_mapping;
select * from tr_mapping;


--입고 관리 // 물품 재고, 입고 번호 7001 ~
insert into item values ( i_num_seq.nextval, 90001, '다스', 50, '2023-09-03', 3000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90002, '10개 1묶음', 50, '2024-08-03', 50000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90003, '낱개', 200, '2025-04-30', 700, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90004, '5개 1묶음', 50, '2025-06-20', 9999, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90005, '10개 1묶음', 150, '2029-12-31', 20000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90006, '10개 1묶음', 350, '2029-05-11', 20000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90007, '100ml', 30, '2024-12-31', 10000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90008, '30ml', 200, '2024-06-06', 5000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90009, '50ml', 100, '2024-11-17', 4000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90010, '100ml', 30, '2023-11-27', 100000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90011, '다스', 30, '2023-11-27', 25000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90012, '다스', 40, '2023-09-03', 30000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90013, '10개 1묶음', 20, '2024-07-03', 2000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90014, '낱개', 100, '2025-04-30', 700, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90015, '5개 1묶음', 30, '2024-06-20', 1900, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90016, '10개 1묶음', 170, '2029-01-21', 2000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90017, '다스', 12, '2023-09-03', 3500, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90018, '10개 1묶음', 31, '2023-05-13', 4600, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90019, '낱개', 150, '2024-04-18', 1700, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90020, '5개 1묶음', 30, '2024-06-20', 3300, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90021, '다스', 16, '2024-09-03', 4000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90022, '10개 1묶음', 16, '2024-01-03', 5000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90023, '낱개', 200, '2024-03-20', 1700, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90024, '5개 1묶음', 30, '2023-11-11', 1999, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90025, '낱개', 100, '2031-03-21', 17000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90026, '다스', 12, '2025-09-16', 16000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90027, '10개 1묶음', 11, '2024-05-13', 2000, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90028, '낱개', 100, '2024-08-24', 3700, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90029, '5개 1묶음', 50, '2023-11-20', 4900, '비고', '메모');
insert into item values ( i_num_seq.nextval, 90030, '30ml', 300, '2026-09-24', 6300, '비고', '메모');

select i_num"물품 번호", i_unit"단위", i_stock"입고량", i_expire"유통기한", i_price"물품단가", i_remark"비고", i_memo"메모", i_i_code"품목코드" from item;
select * from item;
select * from item_code;



--출고(사용) 관리 // 출고 기록 번호 8001~
insert into release values( rel_num_seq.nextval, '2023-07-05','11:11', '최수민', 1, 50, '비고', 90001);
insert into release values( rel_num_seq.nextval, '2023-07-06','12:12', '조민준', 2, 50, '비고', 90002);
insert into release values( rel_num_seq.nextval, '2023-07-07','13:13', '정시우', 3, 200, '비고', 90003);
insert into release values( rel_num_seq.nextval, '2023-07-08','14:44', '박하연', 4, 50, '비고', 90004);
insert into release values( rel_num_seq.nextval, '2023-07-09','15:55', '손미래', 5, 150, '비고', 90005);
insert into release values( rel_num_seq.nextval, '2023-07-10','16:43', '강태준', 4, 350, '비고', 90006);
insert into release values( rel_num_seq.nextval, '2023-07-11','17:23', '윤서율', 3, 30, '비고', 90007);
insert into release values( rel_num_seq.nextval, '2023-07-12','18:12', '남현빈', 2, 200, '비고', 90008);
insert into release values( rel_num_seq.nextval, '2023-07-13','09:21', '강백호', 1, 100, '비고', 90009);
insert into release values( rel_num_seq.nextval, '2023-07-14','10:52', '채치수', 2, 30, '비고', 90010);
insert into release values( rel_num_seq.nextval, '2023-07-15','11:53', '최수민', 3, 40, '비고', 90011);
insert into release values( rel_num_seq.nextval, '2023-07-16','12:44', '조민준', 4, 30, '비고', 90012);
insert into release values( rel_num_seq.nextval, '2023-07-17','13:35', '정시우', 5, 20, '비고', 90013);
insert into release values( rel_num_seq.nextval, '2023-07-18','14:26', '박하연', 4, 100, '비고', 90014);
insert into release values( rel_num_seq.nextval, '2023-07-19','15:17', '손미래', 3, 30, '비고', 90015);
select rel_num"출고기록 번호", rel_date"사용날짜", rel_time"사용시간", rel_user"사용자", rel_amount"사용량", rel_after"잔여량", rel_remark"비고", rel_i_code"품목코드" from release;
select * from release;


--폐기 관리 // 폐기 기록 번호 9001~
insert into discard values( dis_num_seq.nextval, '2023-07-05','09:14', '강태준', 10, 170, '폐기 사유: 유통기한 초과', 90016);
insert into discard values( dis_num_seq.nextval, '2023-07-06','10:23', '윤서율', 9, 12, '폐기 사유: 유통기한 초과', 90017);
insert into discard values( dis_num_seq.nextval, '2023-07-07','11:35', '남현빈', 8, 31, '폐기 사유: 불량', 90018);
insert into discard values( dis_num_seq.nextval, '2023-07-08','12:44', '강백호', 7, 150, '폐기 사유: 리콜', 90019);
insert into discard values( dis_num_seq.nextval, '2023-07-09','13:53', '채치수', 6, 30, '폐기 사유: 유통기한 초과', 90020);
insert into discard values( dis_num_seq.nextval, '2023-07-10','14:42', '최수민', 5, 16, '폐기 사유: 유통기한 초과', 90021);
insert into discard values( dis_num_seq.nextval, '2023-07-11','13:31', '조민준', 6, 16, '폐기 사유: 불량', 90022);
insert into discard values( dis_num_seq.nextval, '2023-07-12','16:22', '정시우', 7, 200, '폐기 사유: 리콜', 90023);
insert into discard values( dis_num_seq.nextval, '2023-07-13','17:13', '박하연', 8, 30, '폐기 사유: 유통기한 초과', 90024);
insert into discard values( dis_num_seq.nextval, '2023-07-14','15:24', '손미래', 9, 100, '폐기 사유: 유통기한 초과', 90025);
insert into discard values( dis_num_seq.nextval, '2023-07-15','16:35', '강태준', 10, 12, '폐기 사유: 불량', 90026);
insert into discard values( dis_num_seq.nextval, '2023-07-16','14:44', '윤서율', 9, 11, '폐기 사유: 리콜', 90027);
insert into discard values( dis_num_seq.nextval, '2023-07-17','13:53', '남현빈', 8, 100, '폐기 사유: 유통기한 초과', 90028);
insert into discard values( dis_num_seq.nextval, '2023-07-18','14:22', '강백호', 7, 50, '폐기 사유: 유통기한 초과', 90029);
insert into discard values( dis_num_seq.nextval, '2023-07-19','17:41', '채치수', 6, 300, '폐기 사유: 불량', 90030);
select dis_num"폐기기록 번호", dis_date"폐기날짜", dis_time"폐기시간", dis_user"폐기담당자", dis_amount"폐기량", dis_after"잔여량", dis_remark"비고", dis_i_code"품목코드" from discard;
select * from discard;

commit;


-- 약품(medicine) //코드 10001~ 10021  ::: 아마 알 필요 없음

-- 질병(disease) //코드 20001~20012   ::: 아마 알 필요 없음

-- 추가치료(therapy) //코드 t_code  30001~30010  ::: 아마 알 필요 없음

-- 직원(employee (의사, 간호사) //코드 e_code  40001~40010: 의사 , 45001~45999: 간호사   ::: ※※ 회원 가입 시 필요
--        >> 회원 가입시 : 40002~40010  // 45001~ 45010 사용 가능

-- 환자 기본정보(patient) //코드 num 50001~ 50030  ::: 아마 알 필요 없음

-- 접수/대기 명단(wait) //코드 w_num 60001~60030)  ::: 아마 알 필요 없음

-- 진료기록(record) //코드 r_num (70001~70030)   ::: 아마 알 필요 없음
	-- >>70021~70040 사용 가능

-- 요금 수납(payment)  //코드 pay_num 80001~80020    ::: 아마 알 필요 없음


-- 물품 종류 코드 (item_code)//코드 i_code_num 90001 ~ 90035    ::: ※※ 재고 추가 시 필요
-- 	>> 재고 추가시 90031~ 90035 추가 가능,  사용/폐기 추가시 90001~90030 사용

-- 처방 테이블 // p_num 1001~1044  ::: 아마 알 필요 없음

-- 달력메모 테이블 (memo) // 코드 m_num 5001~ 5020   ::: 아마 알 필요 없음

-- 물리치료 환자 맵핑 (tr_mapping) // 코드 tr_num 6001~6026    ::: 아마 알 필요 없음

-- 재고번호 (item) // 코드 i_num 7001~ 7030  ::: 아마 알 필요 없음

-- 출고-사용 (release) // 코드 rel_num 8001~8015 ::: 아마 알 필요 없음

-- 출고-폐기 (discard) //코드 dis_num 9001~9015 ::: 아마 알 필요 없음
