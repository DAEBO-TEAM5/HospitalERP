<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->
 
   <link href="${pageContext.request.contextPath }/resources/style.css" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- Jquery -->
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->
  <style>
  	 @import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');
  </style>
<title>진료기록</title>


</head>
<body>
	<div class="container-fluid">
		
		<div class="container-fluid info">
		<div class="d-flex" id="hospital_title">
			<div class="p-2 flex-grow-1">
				<i class="fa-solid fa-circle-user fa-lg"></i>&nbsp;ㅇㅇ병원님 반갑습니다.
			</div>
		    <div class="p-2"><a href="main2.do" class="title_nav">진료</a></div>
			<div class="p-2"><a href="item.do" class="title_nav">재고</a></div>
			<div class="p-2"><a href="#" class="title_nav">진료기록</a></div>  
		</div>
    		<div class="row" style="height: calc(100vh - 70.43px);">
        		<div class="col-md-2 leftinfo">
            		<p>
            		<h2 style="text-align: center"><b>진료내역</b></h2>
            		<form role="form">
	            		<div class="form-group">
	            			<input type="text" id = "search" placeholder="이름 / 전화번호" class="form-control"  onKeypress="javascript:if(event.keyCode==13) {test()}">
	            		</div>
	            		<div class="form-group">
	            			<button type="button" id="patient_search"class="btn btn-primary" style="width: 100%">검색</button>
	            		</div>
            		</form>
            		
            		<div class="search_result">
            			<div class="list-group">
            			   <div class="list-group-item list-group-item-action list-group-item-info">A simple dark list group item<br>efefe</div>
						</div>
            		</div>
            		
         		</div> <!-- 진료내역 -->
         		<div class="col-md-4"  style="border-right: 1px solid black;">
         			<div style="height:60px;" id ="patientinfo"></div>
					<div> 
						<div id="patientMemo"> 접수 메모 <br>
							<div class="form-control" id="jupsu" style="overflow-y:auto;"></div>
						</div>
					</div>
					<br><br><br>
					<div style="border-top: 1px solid black" id="hLine">
						<div class="container text-center">
      						<div class="row">
        						<div class="col-sm-4  gap-2 col-6 mx-auto box1">
          							<input class="btn btn-primary" type="button" value="날짜1">
          							<button type="button" class="btn btn-secondary" data-bs-toggle="button" autocomplete="off">Secondary</button>
        						</div>
        						<div class="col-sm-8">
         							<label>지난 진료 기록</label>
          								<div>
	          								<label>증상</label>
	          								<textarea class="form-control" id="symptom"></textarea>
	          								<label>병명</label>
	          								<textarea class="form-control" id="r_d_code"></textarea>
	          								<label>처방</label>
	       									<table class="history">
								          		<th>품명</th>
								          		<th>중량</th>
								          		<th>수</th>
								          		<tr>
								          			<td>1</td>
								          			<td></td>
								          			<td></td>
								          		</tr>
								          		<tr>
								          			<td>2</td>
								          			<td></td>
								          			<td></td>
								          		</tr>
								          	</table>
	          							</div>
        						</div>
      						</div>
      					</div>
					</div>
				</div>		
    			<div class="col-md-4" style="border-right: 1px solid black;">
		            <div style="background-color: skyblue; width:100%; height:100%;">
		            	<h3 style="padding: 5px">수납내역</h3>
		            	<div style="display: flex;">
			            	<div class="pay_title" style="width: 50%;">받을 금액</div>
			            	<div class="pay" style="width: 50%;">원</div>
		            	</div>
		            	<div class="form-control" style="width:90%; margin: 0 auto;">
							<ul>
								<li>총액</li>
								<ul>
									<li>50000원</li>
								</ul>
								<li>항목별 금액</li>
								<ul>
									<li>주사 3000원</li>
									<li>수액 5000원</li>
									<li>진료비 30000원</li>
									<li>팁 12000원</li>
								</ul>
							</ul>
		            	</div>
		            	<div style="display: flex;">
			            	<div class="pay_title" style="width: 50%;">수납 금액</div>
			            	<div class="pay" style="width: 50%;">원</div>
		            	</div>
		            	<br>
		            	<div style="display: flex;">
			            	<div class="pay_title" style="width: 50%;">남은 금액</div>
			            	<div class="pay" style="width: 50%;">원</div>
		            	</div>
		            	<br>
		            	<div style="border-top: 1px solid black" id="hLine">
			            	<h3 style="padding: 5px">문서발급</h3>
			            	<div class="form-control" style="width:90%; margin: 0 auto;">
								<ul>
									<li>진료확인서</li>
									<li>진단서</li>
									<li>처방전</li>
									<li>영수증</li>
								</ul>
			            	</div>
		            	</div>
					</div>	
         		</div>

         		<div class="col-md-2 right">
				    <div class="test">
        				<table class="Calendar">
            				<thead>
	                			<tr>
	                    			<td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
	                    			<td colspan="5">
	                        			<span id="calYear"></span>년
	                        			<span id="calMonth"></span>월
	                    			</td>
	                    			<td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
	                			</tr>
	               				<tr>
				               	    <td style="color:red;">일</td>
				                    <td>월</td>
				                    <td>화</td>
				                    <td>수</td>
				                    <td>목</td>
				                    <td>금</td>
				                    <td style="color:blue;">토</td>
				                </tr>
	            			</thead>

            				<tbody></tbody>
        				</table>
    				</div>
    				
				</div>
      			
      			
  			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
var temp;

$(function() {
	$('#patient_search').click(function(){
			$.ajax({	
				url: "./patientsearch.do",
				type: "post",
				data : { name: $('#search').val()},
				success: successFunc,
				error: errFunc
			});
		
	});
});

function successFunc(data){
	var str = "";
	var obj = JSON.parse(data);
	console.log(obj);
	console.log(obj.list.length);
	/* <div class="list-group-item list-group-item-action list-group-item-info result_set">A simple dark list group item<br>efefe</div> */
	for(var i =0; i< obj.list.length; i++){
		str += "<div class='list-group-item list-group-item-action list-group-item-info result_set'>"
		str += "<span class = 'name'><h4>" + obj.list[i].name + "</h4></span>";
		str += obj.list[i].birth + "<br>";
		str += "<span class = 'phone'>" + obj.list[i].phone + "</span><br>";
		str += "</div>"
	}
	
	$('.list-group').html(str);
}
function errFunc(e){
	alert("검색결과가 없습니다.");
}
$(function(){
	$(document).on("click", ".result_set", function (e){
		$.ajax({	
			url: "./patientinfo.do",
			type: "post",
			data : { name: $(this).find(".name").text(),
				phone: 	$(this).find(".phone").text()
			},
			success: infoFunc,
			error: function(){
				console.log('통신실패!!!')
			}
		});
	});
});
function infoFunc(data){
	var obj = JSON.parse(data);
	temp = obj;
	var info_str = "";
	info_str += "<h3 style='height:30px'>" + obj.info[0].name +"</h3>"
	info_str += obj.info[0].birth + "/" + obj.info[0].address + "/"+  obj.info[0].sex + "/" + obj.info[0].phone;
	$('#patientName').html(obj.info[0].name);
	$('#patientinfo').html(info_str);
	$('#jupsu').html(obj.info[0].note);
	$('#symptom').html(obj.info[0].symptom);
	$('#r_d_code').html(obj.info[0].r_d_code);
	$('.pay').html(obj.info[0].p_amount)
	var str = "";
	for(var i =0; i < obj.info.length; i++){
		str += "<button class='btn btn-primary' style='width:100%;'>" + obj.info[i].r_date + "</button>"
	}
	$('.box1').html(str);
}
$(function(){
	$(document).on("click", ".box1 > button", function (e){
		var str = "";
		console.log($(this).index())
		for(var i =0; i < temp.info.length; i++){
			if(i === $(this).index()){
				$('#jupsu').html(temp.info[i].note);
				$('#symptom').html(temp.info[i].symptom);
				$('#r_d_code').html(temp.info[i].r_d_code);
				$('.pay').html(temp.info[i].p_amount)
			}
		}
		
	});
});
window.onload = function () { buildCalendar(); }

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

    let tbody_Calendar = document.querySelector(".Calendar > tbody");
    document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
    document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

    while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }

    let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

    for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
        let nowColumn = nowRow.insertCell();        // 열 추가
    }

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

        let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


        let newDIV = document.createElement("p");
        newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
        nowColumn.appendChild(newDIV);

        if (nowDay.getDay() == 6) {                 // 토요일인 경우
            nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
        }

        if (nowDay < today) {                       // 지난날인 경우
            newDIV.className = "pastDay";
            newDIV.onclick = function () { choiceDate(this); }
        }
        else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
            newDIV.className = "today";
            newDIV.onclick = function () { choiceDate(this); }
        }
        else {                                      // 미래인 경우
            newDIV.className = "futureDay";
            newDIV.onclick = function () { choiceDate(this); }
        }
        
    }
}

// 날짜 선택
function choiceDate(newDIV) {
    if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
    }
    newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
}

// 이전달 버튼 클릭
function prevCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
    buildCalendar();    // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
    buildCalendar();    // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}
$(function(){
	$(document).on("click", ".test p", function (e){
		$.ajax({	
			url: "./patientsearch.do",
			type: "post",
			data : { date: $('#calYear').text()+$('#calMonth').text()+$(this).text()
			},
			success: successFunc,
			error: function(){
				console.log('통신실패!!!')
			}
		});
	});
});
</script>
</html>