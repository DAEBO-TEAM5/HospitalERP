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
  <!-- <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> fontawesome  -->
  <style>
  	 @import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');
  </style>
<title>진료기록</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<div class="container-fluid">
		<div class="container-fluid info">
		<c:import url="../include/header.jsp"></c:import>
	    		<div class="row">
	        		<div class="col-md-2 leftinfo">
	            		<p>
	            		<h2 style="text-align: center"><b>진료내역</b></h2>
	            		<form role="form" onsubmit="return false;">
		            		<div class="form-group">
		            			<input type="text" id = "search" placeholder="이름 / 전화번호" class="form-control" onkeyup="if(window.event.keyCode==13){patientSearchInfo()}" >
		            		</div>
		            		<div class="form-group">
		            			<button type="button" id="patient_search"class="btn btn-primary" style="width: 100%;" onclick="patientSearchInfo()" >검색</button>
		            		</div>
	            		</form>
	            		
	            		<div class="search_result">
	            			<div class="list-group">
	            			   <div class="list-group-item list-group-item-action list-group-item-info">검색 결과가 없습니다.</div>
							</div>
	            		</div>
	            		
	         		</div> <!-- 진료내역 -->
	         		<div class="col-md-4"  style="border-right: 1px solid black;">
	         			<div class="panel" style="height: 30%; display: flex;">
	         				<div class="patient_name" style="width: 15%;"></div>
				            	<div style="width: 85%;">
					            	<div>
					            		<div class="record_number"></div>
					            		<div class="patient_info"></div>
					            	</div>
					            
					        		<hr style="margin-bottom: 12px; margin-top: 12px">
				           			<div>
				           				<span style="font-size: 14px; font-weight: bold">접수메모(증상/내원목적)&nbsp;<i class="fa-solid fa-pen fa-2xs" style="color: black;"></i></span>
					            		<div class="form-control" id="jupsu" style="overflow-y:auto;"></div>
					           		</div>
				            </div>
				        </div>
	         			<div class="panel" style="height: calc(70% - 24px); display:flex;">
	         				<div style="width: 20%; margin-right: 12px;">
	         					<div style="text-align:center; font-size: 14px; font-weight: bold">방문일자&nbsp;<i class="fa-solid fa-calendar-days fa-2xs" style="color: black;"></i></div>
	         					<div class="date_button">
	         					
	         					</div>
	         				</div>
			            	<div style="width: 80%; background-color: white; border-radius: 4px;">
				            	<div class="record"></div>
				            		<div style="padding: 6px 12px 6px 12px;">
		          						<label>의사 소견</label>
          								<textarea class="form-control font_11" id="symptom" style="margin-bottom: 12px;" readonly rows="4"></textarea>
          								<label>병명</label>
       									<textarea class="form-control font_11" id="disease" style="margin-bottom: 12px;" readonly rows="4"></textarea>
		          								<label>처방</label>
		       									<table class="history">
									          		
									          	</table>
									    <label style="margin-top: 12px;">특이사항</label>
       									<textarea class="form-control font_11" id="special_note" style="margin-bottom: 12px;" readonly rows="4">없음</textarea>
		          							</div>
				            	
			            	</div>
	         			</div>
	    			</div>
    			<div class="col-md-4" style="border-right: 1px solid black;">
		            <div class ="panel" style="width:100%; height:calc(100% - 12px);">
		           		<div style="width: 100%; height:100%; background-color: white; border-radius: 4px;">
		           		<div>
		            		<div class="recipt" style="font-size: 14px">수납내역 <i class="fa-solid fa-receipt" style="color: black; size: 14px"></i></div>
		            			<div style=" margin:12px; border: 1px solid black; padding: 12px; border-radius: 4px">
				            		<div class="display-flex">
				            			<div class="left_text font_13">받을 금액</div>
				            			<div class="font_13 pay_amount"></div>
				            		</div>
		            				<hr style="margin-top: 8px; margin-bottom: 8px">
		            				<div class="display-flex">
				            			<div class="left_text font_11" data-bs-toggle="collapse" href="#pay_list" aria-expanded="false" aria-controls="pay_list"><i class="fa-solid fa-caret-right"></i> 총 진료비</div>
				            			<div class="font_11 pay_total"></div>
				            		</div>
				            		<div class="collapse font_dimgray" id="pay_list" style="padding: 6px 12px 0 12px;">
										
									</div>
		            			</div>
		            			
		            			
		            			<div style=" margin:12px; border: 1px solid black; padding: 12px;  border-radius: 4px">
				            		<div class="display-flex">
				            			<div class="left_text font_13">수납 금액</div>
				            			<div class="font_13 sunap" >0원</div>
				            		</div>
		            				<hr style="margin-top: 8px; margin-bottom: 8px">
		            				<div class="pay_add">

		            				</div>
		            				
		            				<div class="font_deepskyblue font_13 event" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="margin-left: 8px;">
		            				<!-- 	<i class="fa-solid fa-plus" style="color: deepskyblue"></i> 수납 추가 -->
		            				</div> 
		            	
		            			</div>
		            			
		            			<div style=" margin:12px; border: 1px solid black; padding: 12px;  border-radius: 4px">
				            		<div class="display-flex">
				            			<div class="left_text font_13">남은 금액</div>
				            			<div class="font_13 font_deepskyblue remaining_amount "></div>
				            		</div>
				            	</div>
				            	<div class="pay_end">
				            		<!-- <button class="pay_update">수납</button> -->
				            	</div>
		       			</div>
		       			<div>
		            	<div class="recipt" style="font-size: 14px;">문서발급 <i class="fa-solid fa-file-lines" style="size: 14px;"></i></div>
		            		<div style=" margin:12px; border: 1px solid black; padding: 12px;  border-radius: 4px">
				            	<div class="left_text font_13 margin_bottom pnt"><i class="fa-solid fa-file-lines"></i> 진료확인서</div>
				            	<div class="left_text font_13 margin_bottom pnt"><i class="fa-solid fa-file-lines"></i> 진단서</div>
		            			<div class="left_text font_13 margin_bottom pnt"><i class="fa-solid fa-file-lines"></i> 처방전</div>
		            			<div class="left_text font_13 margin_bottom pnt"><i class="fa-solid fa-file-lines"></i> 영수증</div>
		            			
		            		</div>
		            	</div>
		       		</div>
		            	
		            	
					</div>	
         		</div>

         		<div class="col-md-2 right">
         			<c:import url="../include/calendar.jsp"/>
         			
         						<div style="background-color : rgb(101, 178, 255); padding : 0px 12px 12px 12px; color : #fff; margin-top: 12px; border-radius: 4px;">
								    <div class="display-flex">
								        <div class="weather_icon"></div>
								        <div class="current_temp" style="font-size : 36pt; padding-left: 36px;"></div>
								   
								        <div style="padding-left: 12px;">
								        	<div class="weather_description" style="font-size : 20pt;"></div>
								        	<div class="city" style="font-size : 13pt"></div>
								        </div>
								    </div>
								
								    <div class="display-flex" style="justify-content: space-between;">
							            <div class="temp_min"></div>
							            <div class="temp_max"></div>
								    </div>
								    <div class="display-flex" style="justify-content: space-between;">
							            <div class="humidity"></div>
							            <div class="wind"></div>
								    </div>
								</div>
								
							<div style="width: 100%; height:20%; background-color: white; border-radius: 4px; margin-top: 12px">
							<div class="current" style="font-size: 14px;" >오늘의 현황 <i class="fa-solid fa-chart-simple"></i></div>
								<div class="display-flex font_13" style="margin: 12px">
									<div><i class="fa-solid fa-hospital-user"></i> 내원 환자 수 : </div>
									<div class="today_visit" style="margin-left: 6px" ></div>
									<div class="visit_difference" style="margin-left: 6px"></div>
								</div>
								<div class="display-flex font_13" style="margin: 0px 12px 12px 12px">
									<div><i class="fa-solid fa-won-sign"></i> 매출 : </div>
									<div class="today_money" style="margin-left: 6px"></div>
									<div class="money_difference" style="margin-left: 6px"></div>
								</div>
							</div>	
								
				</div>
      			
      			
  			</div>
		</div>
	</div>
	
	<!-- 수납 추가 Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title left_text font_13" id="staticBackdropLabel">수납 추가</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				
				<div class="modal-body">
					<div style="background-color: #F5F5F5; border-radius: 4px; padding:8px;">
						<div class="left_text font_13" style="color: gray; margin-bottom:6px;">남은 금액</div>
						<div class="font_13 remaining_amount "></div>
					</div>
					<div class="font_13 "style="color: dimgray; margin-top: 12px; margin-bottom: 3px" >결제수단*</div>
					<div class="display-flex">
						<div class="display-flex pay_select">
		           			<div class="left_text pay_check pay_cash"><i class="fa-regular fa-circle" style="font-size: 13px"></i></div>
		           			<div class="font_13" style="display: flex; align-items: end; ">현금</div>
		           		</div>
		           		<div class="display-flex pay_select">
	           				<div class="left_text pay_check pay_card"><i class="fa-regular fa-circle" style="font-size: 13px"></i></div>
	           				<div class="font_13" style="  display: flex; align-items: end;">카드</div>
	           			</div>
	           		</div>
			
					<div class="pay_main" style="margin-top: 12px; margin-bottom: 3px">
								
					</div>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary pay_ok">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 수납 추가 Modal end -->
</body>

<script type="text/javascript">





var weatherIcon = {
    '01' : 'fas fa-sun',
    '02' : 'fas fa-cloud-sun',
    '03' : 'fas fa-cloud',
    '04' : 'fas fa-cloud-meatball',
    '09' : 'fas fa-cloud-sun-rain',
    '10' : 'fas fa-cloud-showers-heavy',
    '11' : 'fas fa-poo-storm',
    '13' : 'far fa-snowflake',
    '50' : 'fas fa-smog'
};

	// 날씨 api - 서울
var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+'seoul'+"&appid="+"7a1ec66578807a91a8efeda47f1aea05";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {

        var $Icon = (resp.weather[0].icon).substr(0,2);
        var $weather_description = resp.weather[0].main;
        var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
        var $humidity = '습도 : ' + resp.main.humidity+ ' %';
        var $wind = '바람 : ' +resp.wind.speed + ' m/s';
        var $city = '서울';
        var $cloud = '구름' + resp.clouds.all +"%";
        var $temp_min = '최저 온도 : ' + Math.floor(resp.main.temp_min- 273.15) + 'º';
        var $temp_max = '최고 온도 : ' + Math.floor(resp.main.temp_max- 273.15) + 'º';
        

        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 30px; width : 30px; font-size: 3em; padding-top: 12px;"></i>');
        $('.weather_description').prepend($weather_description);
        $('.current_temp').prepend($Temp);
        $('.humidity').prepend($humidity);
        $('.wind').prepend($wind);
        $('.city').append($city);
        $('.cloud').append($cloud);
        $('.temp_min').append($temp_min);
        $('.temp_max').append($temp_max);               
    }
})



$(document).on("click", ".pay_update", function (e){
	var sunap_value =  uncomma($('.sunap').text())
	if(sunap_value == 0){
		alert('수납내역이 추가되지않음');
		return;
	}
	if(!confirm('수납 하시겠습니까?')){
        return false;
    }
	var cash = 0;
	var card = 0;
	
	for(var i = 0; i< $('.pay_input_result').length; i++){
		if($($('.pay_by')[i]).text().includes('현금')){
			cash += Number(uncomma(($($('.pay_input_result')[i]).text())))
		}else{
			card += Number(uncomma(($($('.pay_input_result')[i]).text())))
		}
		
	}

	$.ajax({	
		url: "./payment.do",
		type: "post",
		data : { r_num: $('#record_num').val(),
				cash: cash,
				card: card
			   },
		success: function(data){
			alert('수납이 정상적으로 처리되었습니다.')
			str = "<button class='pay_update pay_comp' disabled>수납완료</button>"
			$(".event").html("");
			$(".pay_end").html(str)
			$(".patient_target").trigger("click");
			$(".patient_target .unpaid").remove();

			
		},
		error: errFunc
	});	
	
});

$(document).on("click", ".pay_select", function (e){
	var str = "";
	str += "<div class='font_13' style='color: dimgray; margin-top: 12px; margin-bottom: 3px' >결제금액*</div>"
	str += "<div class='display-flex'>"
	str += "<input type='text' class='form-control pay_input' style='width: 25%; text-align: right; font-weight: bold;' onkeyup='inputNumberFormat(this)''></input>"
	str += "<div class='font_13' style='font-size: 13px; line-height: 25px;'> &nbsp;원</div>"
	str += "<div class='font_13 pay_all' style='line-height: 25px; margin-left: 12px;'>전액 입력</div>"
	str += "</div>"
	if(($(this).find(".pay_cash").length) === 1){
		str += "<div class='font_13' style='color: dimgray; margin-top: 12px; margin-bottom: 3px' >거스름돈</div>"
		str += "<div class='display-flex'>"
		str += "<input type='text' class='form-control pay_change' style='width: 25%; text-align: right; font-weight: bold;' readonly='readonly'></input>"
		str += "<div class='font_13' style='font-size: 13px; line-height: 25px;'> &nbsp;원</div>"
 		str += "</div>"
			
	}else{
	str += "<div class='font_13' style='color: dimgray; margin-top: 12px; margin-bottom: 3px' >할부개월*</div>"
	str += "<select class='form-select pay_day' aria-label='.form-select-sm'  style='width: 25%; font-size: 12px; height: 25px; padding-top: 3px; padding-bottom: 3px;'> <option selected>일시불</option>"	
	str += "<option value='zero'>1개월</option>"
	str += "<option value='one'>2개월</option>"
	str += "<option value='two'>3개월</option>"
	str += "</select>"
	}
	
	$('.pay_main').html(str)
});
 
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
} 

function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function inputOnlyNumberFormat(obj) {
    obj.value = onlynumber(uncomma(obj.value));
}

function onlynumber(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
}

var remaining = $($('.remaining_amount')[0]);

$(document).on("input", ".pay_input", function (){ //거스름돈 계산
	setTimeout(function () {
		let remaining = $($('.remaining_amount')[0]);
		let remaining_value = uncomma(remaining.text())
		let input_result = uncomma($('.pay_input').val())
		let change_value = input_result - remaining_value;
		
		if(change_value < 0){
			change_value = 0;
		}
		 $('.pay_change').val(comma(change_value))
		 
		}, 200);
});

$(document).on("click", ".pay_all", function (e){
	var remaining = $($('.remaining_amount')[0]);
	$('.pay_input').val(comma(uncomma(remaining.text())));
	$('.pay_change').val(comma(uncomma($('.pay_input').val()) - uncomma(remaining.text())))
});

$("#staticBackdrop").on("hidden.bs.modal", function () {
	$(this).find("input").val("");
	$('.pay_select').removeClass('pay_select_target');
	$('.pay_select').find(".fa-regular").removeClass('fa-circle-check');
	$('.pay_select').find(".fa-regular").addClass('fa-circle');
	$('.pay_main').html("");
	});
	

$(document).on("click", ".pay_ok", function (e){
		
	if(!$(".pay_main").find(".pay_input").val()){
		alert('결제 금액 입력 필요');
		return;
	}
	
	var str = $('.pay_add').html();
	
	var remaining = $($('.remaining_amount')[0]);
	var remaining_value = uncomma(remaining.text())
	var input_result = uncomma($('.pay_input').val())
	if(Number(input_result) > Number(remaining_value)){
		input_result = remaining_value;
	}
	$('.remaining_amount').html(comma(remaining_value - input_result) + "원")
	
	str += "<div class='display-flex'>"
	str += "<div class='left_text font_11 pay_by'>" + $('.pay_select_target').text().trim() + " </div>"
	
	str += "<div class='font_11 pay_input_result'>" + comma(input_result) + "원</div>"
	
	$('.pay_add').html(str)
	var sunapvalue = 0;
	for(var i = 0; i< $('.pay_input_result').length; i++){
		sunapvalue += Number(uncomma(($($('.pay_input_result')[i]).text())))
		$('.sunap').html(comma(sunapvalue) + "원")
	}
	
	$('.modal').modal('hide');

});


window.addEventListener('load', function() {
	var today = new Date();   
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	if(month <10){
		month = "0"+month 
	}
	var date = today.getDate();  // 날짜 
	
	year +=""
	month +=""
	date +=""
	
	patientSearchDate(year+month+date);
	
	//patientSearchDate("2023/7/13");
});
$(document).on("click", ".pay_select", function (e){  //날짜로 검색 (달력)
	$('.pay_select').find(".fa-regular").addClass('fa-circle');
	$('.pay_select').removeClass('pay_select_target');
	$('.pay_select').find(".fa-regular").removeClass('fa-circle-check');

	$(this).addClass('pay_select_target');
	$(this).find(".fa-regular").removeClass('fa-circle');
	$(this).find(".fa-regular").addClass('fa-circle-check');
});

var info;

function patientSearchInfo(){ //검색창 검색
	$.ajax({	
		url: "./patientsearchinfo.do",
		type: "post",
		data : { name: $('#search').val()},
		success: successSearch,
		error: errFunc
	});
	
	
}

function patientSearchDate(day){ //날짜로 검색
	$.ajax({	
		url: "./patientsearchdate.do",
		type: "post",
		data : { date: day},
		success: successSearch,
		error: errFunc
	});
	
	
}

$(document).on("click", ".test p", function (e){  //날짜로 검색 (달력)
	var day = $('#calYear').text()+$('#calMonth').text()+$(this).text();
	patientSearchDate(day);
	
	$.ajax({	
		url: "./dailysales.do",
		type: "post",
		data : { date1: day},
		success: dailyfunc,
		error: function(e){
			alert('무엇인가 오류' + e)
		}
	});
});


function successSearch(data){
	
	let str = "";
	var obj = JSON.parse(data);
	console.log(obj)
	
	/* 검색 결과 생성 */
	if(obj.list.length === 0){
		str += "<div class='list-group-item list-group-item-action list-group-item-info'>"
		str += "검색 결과가 없습니다."
		str += "</div>"
	}
	else{
		for(var i =0; i< obj.list.length; i++){
			str += "<div class='list-group-item list-group-item-action list-group-item-info result_set'>"
			str += "<div class='display-flex'>"
			str += "<span class = 'name'>" + obj.list[i].name + "</span>";
			str += "<span class = 'p_num'> pn." + obj.list[i].num + "</span><br>";
			if(obj.list[i].pay_check == 0){
				str += "<div class ='unpaid'><i class='fa-solid fa-circle-exclamation' style='color: red;'></i></div>"
			}
			
			str += "</div>"
			if(obj.list[i].r_num != null){
				str += "<span class = 'r_num semi_info'> rn." + obj.list[i].r_num + "</span><br>";
			}
			str += "<span class = 'semi_info'>"+ obj.list[i].birth + " | "+ obj.list[i].sex + " | </h4></span>";
			str += "<span class = 'phone semi_info'>" + obj.list[i].phone + "</span><br>";
			str += "<span class = 'semi_info'>" + obj.list[i].note + "</span><br>";
			str += "</div>"
		}
		
	}
	
	$('.list-group').html(str);
	var result_first = $($('.result_set')[0]);
	result_first.addClass('patient_target');
	
	$.ajax({	
		url: "./patientinfo.do",
		type: "post",
		data : { p_num: $('.list-group').find(".p_num").text().slice(4, 9)
			   },
		success: infoFunc,
		error: errFunc
	});
	
	
	
}
function errFunc(e){
	console.log('검색 결과 없음');	
}

$(function(){
	$(document).on("click", ".result_set", function (e){
		$('.result_set').removeClass('patient_target');
		$(this).addClass('patient_target');
		$.ajax({	
			url: "./patientinfo.do",
			type: "post",
			data : { p_num: $(this).find(".p_num").text().slice(4, 9)
				   },
			success: infoFunc,
			error: errFunc
		});
		
	});
	
});

/* 환자 클릭 시 제일 최근 정보 띄우는 부분 */
function infoFunc(data){ 
	$('.sunap').html(comma(0) + "원")
	var obj = JSON.parse(data);

	console.log(obj);
	var info_str = "";
	info = obj;
	info_str += obj.info[0].birth + " | " + obj.info[0].address + " | "+  obj.info[0].sex + " | " + obj.info[0].phone;
	
	$('.patient_name').html(obj.info[0].name);
	
	$('.record_number').html("pn."+obj.info[0].num);
	$('.patient_info').html(info_str);
	$('#jupsu').html(obj.info[1].symptom); //접수 메모로 수정 필요
	str = "<input type='hidden' id='record_num' value='"+ obj.info[1].r_num + "' /> ";
	$('.record').html("진료기록 [" + obj.info[1].date + "]  |  담당의 : " + obj.info[1].e_name + str);
	$('#symptom').html(obj.info[1].opinion);
	$('#disease').html(obj.info[1].disease);
	$('.pay').html(obj.info[1].p_amount)
	str_his = ""
	str_his += "<tr><th>번호</th> <th>품명</th> <th>투약일</th></tr>";
	for(var i = 0; i < obj.info[1].med.length; i++){
		str_his += "<tr> <td>" + (i+1) +" </td> <td> " + info.info[1].med[i].medName+ "</td> <td> " +info.info[1].med[i].use + "</td> </tr>"
		
	}
	$('.history').html(str_his)
	
	var str = "";
	if(info.info[1].pay_cash > 0){
		str += "<div class='display-flex'>"
		str += "<div class='left_text font_11 pay_by'>" + "현금" + " </div>"
		str += "<div class='font_11 pay_input_result'>" + comma(info.info[1].pay_cash) + "원</div>"
		str += "</div>"
	}
	if(info.info[1].pay_card > 0){
		str += "<div class='display-flex'>"
		str += "<div class='left_text font_11 pay_by'>" + "카드" + " </div>"
		str += "<div class='font_11 pay_input_result'>" + comma(info.info[1].pay_card) + "원</div>"
		str += "</div>"
	}
	
	$('.pay_add').html(str)
	str = "<i class='fa-solid fa-plus' style='color: deepskyblue'></i> 수납 추가"
	if(info.info[1].pay_cash + info.info[1].pay_card == info.info[1].pay_amount){
		str = "<button class='pay_update pay_comp' disabled>수납완료</button>"
		$(".event").html("");
		$(".pay_end").html(str)

	}else{
		str1 = "<i class='fa-solid fa-plus' style='color: deepskyblue'></i> 수납 추가"
		$(".event").html(str1);
		str = "<button class='pay_update'>수납</button>"
		$(".pay_end").html(str)

		
	}
	
	
	var str = "";

 	 for(var i =1; i < obj.info.length; i++){
		var year = obj.info[i].date.slice(0,4);
		var month = obj.info[i].date.slice(5,7);
		var day = obj.info[i].date.slice(8,10);
		str += "<button class='btn btn-outline-primary font_13 day_button'>" + year + "." + month +"." + day + "<span class='arrow'> &nbsp; <i class='fa-solid fa-play' style='color: white;'></i> </span>" + "</button>"
	} 
	$('.date_button').html(str);
	
	
	var first_button = $($('.day_button')[0]);
	first_button.addClass('button_target')
	$('.arrow').addClass('target_arrow')
	
	var first_arrow = $($('.arrow')[0]);
	first_arrow.removeClass('target_arrow')
	
	console.log('떼라피');
	console.log(obj);
	var str = ""
		for(var j = 0; j < obj.info[1].therapy.length; j++){
			if(obj.info[1].therapy[j].price != 0){
				str += "<div class='display-flex'>"
				str +=	"<div class='left_text font_11'>" + obj.info[1].therapy[j].thName + "</div>"
				str +=	"<div class='font_11'>" + numWithComma(obj.info[1].therapy[j].price) + "원" + "</div>"
				str +=	"</div>"
			}
		}
		str += "<div class='display-flex'>"
	 		str +=	"<div class='left_text font_11'>" + "진료비" + "</div>"
			str +=	"<div class='font_11'>" + comma(obj.info[1].pay_basic) + "원" + "</div>"
			str +=	"</div>"
		
		$('#pay_list').html(str)
		$('.pay_total').html(numWithComma(obj.info[1].pay_amount) + "원")
		$('.pay_amount').html(numWithComma(obj.info[1].pay_amount) + "원")
	var sunapvalue = 0;
	for(var i = 0; i< $('.pay_input_result').length; i++){
		sunapvalue += Number(uncomma(($($('.pay_input_result')[i]).text())))
		$('.sunap').html(comma(sunapvalue) + "원")
	}
	
	
	
	$('.remaining_amount').html(numWithComma(obj.info[1].pay_amount - obj.info[1].pay_cash - obj.info[1].pay_card) + "원")
	

}
var ddd = new Date();   
var year1 = ddd.getFullYear(); // 년도
var month1 = ddd.getMonth() + 1;  // 월
var date1 = ddd.getDate();  // 날짜 

$(function(){
	$.ajax({	
		url: "./dailysales.do",
		type: "post",
		data : { date1: year1 + '/' + month1 + '/' + date1},
		success: dailyfunc,
		error: function(e){
			alert('무엇인가 오류' + e)
		}
	});
});
function dailyfunc(data){
	var daily = JSON.parse(data);

	var avg_sales = daily.sale_total[0].avg_sales
	var today_sales = daily.sale_total[0].today_sales
	var avg_visit = daily.sale_total[0].avg_visit
	var today_visit = daily.sale_total[0].today_visit1
	
	$('.today_visit').text(comma(today_visit))
	$('.today_money').text(comma(today_sales))
	
	if(today_visit > avg_visit){
		$('.visit_difference').text("(+ " + comma(Number(today_visit - avg_visit)) + ")")
		$('.visit_difference').css("color", "red");
	}else if(today_visit == avg_visit){
		$('.visit_difference').text("(+ 0)")
		$('.visit_difference').css("color", "gray");
	}else{
		$('.visit_difference').text("(- " + comma(Number(avg_visit - today_visit)) + ")")
		$('.visit_difference').css("color", "blue");
	}
	
	if(today_sales > avg_sales){
		$('.money_difference').text("(+ " + comma(Number(today_sales - avg_sales)) + ")")
		$('.money_difference').css("color", "red");
	}else if(today_sales == avg_sales){
		$('.money_difference').text("(+ 0)")
		$('.money_difference').css("color", "gray");
	}else{
		$('.money_difference').text("(- " + comma(Number(avg_sales - today_sales)) + ")")
		$('.money_difference').css("color", "blue");
	}
	
}

function numWithComma(num) {
	  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
$(function(){
	$(document).on("click", ".date_button > button", function (e){
		$('.sunap').html(comma(0) + "원")
		var str = "";
		for(var i =1; i < info.info.length; i++){
			if(i === $(this).index() + 1){
				$('#jupsu').html(info.info[i].symptom);
				$('#symptom').html(info.info[i].opinion);
				$('#disease').html(info.info[i].disease);
				str = "<input type='hidden' id='record_num' value='"+ info.info[i].r_num + "' /> ";
				$('.record').html("진료기록 [" + info.info[i].date + "]  |  담당의 : " + info.info[i].e_name + str);
				str_his = "<tr><th>번호</th> <th>품명</th> <th>투약일</th></tr>"
				for(var j = 0; j < info.info[i].med.length; j++){
					
					str_his += "<tr> <td>" + (j+1) +" </td> <td> " + info.info[i].med[j].medName+ "</td> <td> " +info.info[i].med[j].use + "</td> </tr>"
				}		
				$('.history').html(str_his)
				
				$('.day_button').removeClass('button_target');
				var t_button = $($('.day_button')[i-1]);
				t_button.addClass('button_target')
				
				$('.arrow').addClass('target_arrow')
				var t_arrow = $($('.arrow')[i-1]);
				t_arrow.removeClass('target_arrow')
				
				var str = ""
				for(var j = 0; j < info.info[i].therapy.length; j++){
					if(info.info[i].therapy[j].price != 0){
						str += "<div class='display-flex'>"
						str +=	"<div class='left_text font_11'>" + info.info[i].therapy[j].thName + "</div>"
						str +=	"<div class='font_11'>" + numWithComma(info.info[i].therapy[j].price) + "원" + "</div>"
						str +=	"</div>"
					}
					
				}
				str += "<div class='display-flex'>"
			 		str +=	"<div class='left_text font_11'>" + "진료비" + "</div>"
					str +=	"<div class='font_11'>" + numWithComma(10000) + "원" + "</div>"
					str +=	"</div>"
				
					$('#pay_list').html(str)
					$('.pay_total').html(numWithComma(info.info[i].pay_amount) + "원")
					$('.pay_amount').html(numWithComma(info.info[i].pay_amount) + "원")
				
					var str = "";
					
				if(info.info[i].pay_cash > 0){
					str += "<div class='display-flex'>"
					str += "<div class='left_text font_11 pay_by'>" + "현금" + " </div>"
					str += "<div class='font_11 pay_input_result'>" + comma(info.info[i].pay_cash) + "원</div>"
					str += "</div>"
				}
				if(info.info[i].pay_card > 0){
					str += "<div class='display-flex'>"
					str += "<div class='left_text font_11 pay_by'>" + "카드" + " </div>"
					str += "<div class='font_11 pay_input_result'>" + comma(info.info[i].pay_card) + "원</div>"
					str += "</div>"
				}
				
				$('.pay_add').html(str)
				str = "<i class='fa-solid fa-plus' style='color: deepskyblue'></i> 수납 추가"
				
				if(info.info[i].pay_cash + info.info[i].pay_card == info.info[i].pay_amount){
					str = "<button class='pay_update pay_comp' disabled>수납완료</button>"
					$(".event").html("");
					$(".pay_end").html(str)
					
				}else{
					str1 = "<i class='fa-solid fa-plus' style='color: deepskyblue'></i> 수납 추가"
					$(".event").html(str1);
					str = "<button class='pay_update'>수납</button>"
					$(".pay_end").html(str)

				}
					
				$('.remaining_amount').html(numWithComma(info.info[i].pay_amount - info.info[i].pay_cash - info.info[i].pay_card) + "원")
			}
		}
		
	});
});

</script>
</html>