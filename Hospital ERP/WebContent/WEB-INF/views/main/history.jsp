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
		          						<label>증상</label>
          								<textarea class="form-control" id="symptom" style="margin-bottom: 12px;"></textarea>
          								<label>병명</label>
       									<textarea class="form-control" id="disease" style="margin-bottom: 12px;"></textarea>
		          								<label>처방</label>
		       									<table class="history">
									          		
									          	</table>
									    <label style="margin-top: 12px;">특이사항</label>
       									<textarea class="form-control" id="special_note" style="margin-bottom: 12px;">없음</textarea>
		          							</div>
				            	
			            	</div>
	         			</div>
	    			</div>
    			<div class="col-md-4" style="border-right: 1px solid black;">
		            <div class ="panel" style="width:100%; height:calc(100% - 12px);">
		           		<div style="width: 100%; height:100%; background-color: white; border-radius: 4px;">
		           		<div>
		            		<div class="recipt" style="font-size: 14px">수납내역 <i class="fa-solid fa-receipt" style="color: black; size: 14px"></i></div>
		            			<div style=" margin:12px; border: 1px solid black; padding: 12px;">
				            		<div class="display-flex">
				            			<div class="left_text font_13">받을 금액</div>
				            			<div class="font_13 pay_amount"></div>
				            		</div>
		            				<hr style="margin-top: 8px; margin-bottom: 8px">
		            				<div class="display-flex">
				            			<div class="left_text font_11" data-bs-toggle="collapse" href="#pay_list" aria-expanded="false" aria-controls="pay_list"><i class="fa-solid fa-caret-right"></i> 총 진료비</div>
				            			<div class="font_11 pay_total">20,000원</div>
				            		</div>
				            		<div class="collapse font_gray" id="pay_list" style="padding: 6px 12px 0 12px;">
										
									</div>
		            			</div>
		            			
		            			
		            			<div style=" margin:12px; border: 1px solid black; padding: 12px;">
				            		<div class="display-flex">
				            			<div class="left_text font_13">수납 금액</div>
				            			<div class="font_13">0원</div>
				            		</div>
		            				<hr style="margin-top: 8px; margin-bottom: 8px">
		            				<div class="font_deepskyblue font_13 event" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="margin-left: 8px;"><i class="fa-solid fa-plus" style="color: deepskyblue"></i> 수납 추가</div>
		            	
		            			</div>
		            			
		            			<div style=" margin:12px; border: 1px solid black; padding: 12px;">
				            		<div class="display-flex">
				            			<div class="left_text font_13">남은 금액</div>
				            			<div class="font_13 font_deepskyblue remaining_amount "></div>
				            		</div>
				            	</div>
		       			</div>
		       			<div>
		            	<div class="recipt" style="font-size: 14px">문서발급 <i class="fa-solid fa-file-lines" style="size: 14px;"></i></div>
		            		<div style=" margin:12px; border: 1px solid black; padding: 12px;">
				            	<div class="left_text font_13 margin_bottom"><i class="fa-solid fa-file-lines"></i> 진료확인서</div>
				            	<div class="left_text font_13 margin_bottom"><i class="fa-solid fa-file-lines"></i> 진단서</div>
		            			<div class="left_text font_13 margin_bottom"><i class="fa-solid fa-file-lines"></i> 처방전</div>
		            			<div class="left_text font_13 margin_bottom"><i class="fa-solid fa-file-lines"></i> 영수증</div>
		            			<button class="ttt">꺄아아아악</button>
		            		</div>
		            	</div>
		       		</div>
		            	
		            	
					</div>	
         		</div>

         		<div class="col-md-2 right">
         			<c:import url="../include/calendar.jsp"/>
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
	        남은 금액 : 20000원
	    		<div>결제수단</div>
	    		<div class="display-flex">
		    		<div class="display-flex pay_select">
	           			<div class="left_text pay_check"><i class="fa-regular fa-circle" style="font-size: 13px"></i></div>
	           			<div class="font_13" style="  display: flex; align-items: end;">현금</div>
	           		</div>
	           		<div class="display-flex pay_select">
           			<div class="left_text pay_check"><i class="fa-regular fa-circle" style="font-size: 13px"></i></div>
           			<div class="font_13" style="  display: flex; align-items: end;">카드</div>
           		</div>
           		<div class="display-flex pay_select">
           			<div class="left_text pay_check"><i class="fa-regular fa-circle" style="font-size: 13px"></i></div>
           			<div class="font_13" style="  display: flex; align-items: end;">외상</div>
           		</div>
           		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Understood</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 수납 추가 Modal end -->
</body>

<script type="text/javascript">
window.addEventListener('load', function() {
	let today = new Date();   
	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜

	//patientSearchDate(year + '/' + month + '/' + date);
	patientSearchDate("2023/7/13");
	
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
});


function successSearch(data){
	let str = "";
	var obj = JSON.parse(data);

	/* 검색 결과 생성 */
	if(obj.list.length === 0){
		str += "<div class='list-group-item list-group-item-action list-group-item-info'>"
		str += "검색 결과가 없습니다."
		str += "</div>"
	}
	else{
		for(var i =0; i< obj.list.length; i++){
			str += "<div class='list-group-item list-group-item-action list-group-item-info result_set'>"
			str += "<span class = 'name'>" + obj.list[i].name + "</span>";
			str += "<span class = 'p_num'> pn." + obj.list[i].num + "</span><br>";
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
	let result_first = $($('.result_set')[0]);
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
	var obj = JSON.parse(data);
	let total_pay = 0;
	console.log(obj);
	var info_str = "";
	info = obj;
	info_str += obj.info[0].birth + " | " + obj.info[0].address + " | "+  obj.info[0].sex + " | " + obj.info[0].phone;
	
	$('.patient_name').html(obj.info[0].name);
	$('.record_number').html("pn."+obj.info[0].num);
	$('.patient_info').html(info_str);
	$('#jupsu').html(obj.info[0].note); //접수 메모로 수정 필요
	$('.record').html("진료기록 [" + obj.info[1].date + "]  |  담당의 : " + obj.info[1].e_name);
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
	
	var str = ""
		for(var j = 0; j < obj.info[1].therapy.length; j++){
			str += "<div class='display-flex'>"
			str +=	"<div class='left_text font_11'>" + obj.info[1].therapy[j].thName + "</div>"
			str +=	"<div class='font_11'>" + numWithComma(obj.info[1].therapy[j].price) + "원" + "</div>"
			total_pay += obj.info[1].therapy[j].price;
			str +=	"</div>"
			
		}
		str += "<div class='display-flex'>"
	 		str +=	"<div class='left_text font_11'>" + "진료비" + "</div>"
			str +=	"<div class='font_11'>" + numWithComma(10000) + "원" + "</div>"
			total_pay += 10000;
			str +=	"</div>"
		
		$('#pay_list').html(str)
		$('.pay_total').html(numWithComma(total_pay) + "원")
		$('.pay_amount').html(numWithComma(total_pay) + "원")
	
	$('.remaining_amount').html(numWithComma(total_pay - 0) + "원")
	

}

function numWithComma(num) {
	  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
$(function(){
	$(document).on("click", ".date_button > button", function (e){
		var str = "";
		var total_pay = 0;
		for(var i =1; i < info.info.length; i++){
			if(i === $(this).index() + 1){
				$('#jupsu').html(info.info[i].note);
				$('#symptom').html(info.info[i].opinion);
				$('#disease').html(info.info[i].disease);
				
				for(var j = 0; j < info.info[i].therapy.length; j++){
					str += "<div class='display-flex'>"
		 				str +=	"<div class='left_text font_11'>" + info.info[i].therapy[j].thName + "</div>"
						str +=	"<div class='font_11'>" + numWithComma(info.info[i].therapy[j].price) + "원" + "</div>"
						total_pay += info.info[i].therapy[j].price;
						str +=	"</div>"
						
				}
				str += "<div class='display-flex'>"
			 		str +=	"<div class='left_text font_11'>" + "진료비" + "</div>"
					str +=	"<div class='font_11'>" + numWithComma(10000) + "원" + "</div>"
					total_pay += 10000;
					str +=	"</div>"
				$('#pay_list').html(str)
				$('.pay_total').html(numWithComma(total_pay) + "원")
				$('.pay_amount').html(numWithComma(total_pay) + "원")
				
				$('.record').html("진료기록 [" + info.info[i].date + "]  |  담당의 : " + info.info[i].e_name);
				str_his = ""
				for(var j = 0; j < info.info[i].med.length; j++){
					
					str_his += "<tr><th>번호</th> <th>품명</th> <th>투약일</th></tr>";
					str_his += "<tr> <td>" + (j+1) +" </td> <td> " + info.info[i].med[j].medName+ "</td> <td> " +info.info[i].med[j].use + "</td> </tr>"
				}		
				$('.history').html(str_his)
				
				$('.day_button').removeClass('button_target');
				var t_button = $($('.day_button')[i-1]);
				t_button.addClass('button_target')
				
				$('.arrow').addClass('target_arrow')
				var t_arrow = $($('.arrow')[i-1]);
				t_arrow.removeClass('target_arrow')
			}
		}
		
	});
});

</script>
</html>