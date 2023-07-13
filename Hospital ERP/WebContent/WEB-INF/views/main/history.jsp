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
	            		<form role="form">
		            		<div class="form-group">
		            			<input type="text" id = "search" placeholder="이름 / 전화번호" class="form-control"  onKeypress="javascript:if(event.keyCode==13) {test()}">
		            		</div>
		            		<div class="form-group">
		            			<button type="button" id="patient_search"class="btn btn-primary" style="width: 100%;" onclick="patientSearch()">검색</button>
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
       									<textarea class="form-control" id="r_d_code" style="margin-bottom: 12px;"></textarea>
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
				            			<div class="font_13">20,000원</div>
				            		</div>
		            				<hr style="margin-top: 8px; margin-bottom: 8px">
		            				<div class="display-flex">
				            			<div class="left_text font_11" data-bs-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="fa-solid fa-caret-right"></i> 총 진료비</div>
				            			<div class="font_11">20,000원</div>
				            		</div>
				            		<div class="collapse font_gray" id="collapseExample" style="padding: 6px 12px 0 12px;">
										<div class="display-flex">
				            				<div class="left_text font_11">주사</div>
				            				<div class="font_11">10,000원</div>
				            			</div>
				            			<div class="display-flex">
				            				<div class="left_text font_11">수액</div>
				            				<div class="font_11">10,000원</div>
				            			</div>
				            			<div class="display-flex">
				            				<div class="left_text font_11">물리치료</div>
				            				<div class="font_11">10,000원</div>
				            			</div>
				            			<div class="display-flex">
				            				<div class="left_text font_11">진료비</div>
				            				<div class="font_11">10,000원</div>
				            			</div>
									</div>
		            			</div>
		            			
		            			
		            			<div style=" margin:12px; border: 1px solid black; padding: 12px;">
				            		<div class="display-flex">
				            			<div class="left_text font_13">수납 금액</div>
				            			<div class="font_13">0원</div>
				            		</div>
		            				<hr style="margin-top: 8px; margin-bottom: 8px">
		            				<div class="font_deepskyblue font_13 event" style="margin-left: 8px;"><i class="fa-solid fa-plus" style="color: deepskyblue"></i> 수납 추가</div>
		            	
		            			</div>
		            			
		            			<div style=" margin:12px; border: 1px solid black; padding: 12px;">
				            		<div class="display-flex">
				            			<div class="left_text font_13">남은 금액</div>
				            			<div class="font_13 font_deepskyblue">20,000원</div>
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
</body>

<script type="text/javascript">
var temp;

function patientSearch(){
	$(function() {
		$.ajax({	
			url: "./patientsearch.do",
			type: "post",
			data : { name: $('#search').val()},
			success: successFunc,
			error: errFunc
		});
	});
}

function successFunc(data){
	var str = "";
	var obj = JSON.parse(data);
	if(obj.list.length === 0){
		str += "<div class='list-group-item list-group-item-action list-group-item-info result_set'>"
		str += "검색 결과가 없습니다."
		str += "</div>"
	}
	else{
		for(var i =0; i< obj.list.length; i++){
			str += "<div class='list-group-item list-group-item-action list-group-item-info result_set'>"
			str += "<span class = 'name'>" + obj.list[i].name + "</span>";
			str += "<span class = 'p_num'> pn." + obj.list[i].num + "</span><br>";
			str += "<span class = 'semi_info'>"+ obj.list[i].birth + " | "+ obj.list[i].sex + " | </h4></span>";
			str += "<span class = 'phone semi_info'>" + obj.list[i].phone + "</span><br>";
			str += "<span class = 'semi_info'>" + obj.list[i].note + "</span><br>";
			str += "</div>"
		}
	}
	$('.list-group').html(str);
}
function errFunc(e){
	alert("검색결과가 없습니다.");
}

$(function(){
	$(document).on("click", ".result_set", function (e){
		console.log($(this).find(".p_num").text().slice(4));
		$.ajax({	
			url: "./patientinfo.do",
			type: "post",
			data : { p_num: $(this).find(".p_num").text().slice(4)
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
	info_str += obj.info[0].birth + " | " + obj.info[0].address + " | "+  obj.info[0].sex + " | " + obj.info[0].phone;
	$('.patient_name').html(obj.info[0].name);
	$('.record_number').html("rn. "+obj.info[0].p_r_num);
	$('.patient_info').html(info_str);
	$('#jupsu').html(obj.info[0].note);
	$('.record').html("진료기록 [" + obj.info[0].r_date + "]  |  담당의 : " + obj.info[0].name);
	$('#symptom').html(obj.info[0].symptom);
	$('#r_d_code').html(obj.info[0].r_d_code);
	$('.pay').html(obj.info[0].p_amount)
	var str = "";
	for(var i =0; i < obj.info.length; i++){
		var year = obj.info[i].r_date.slice(0,4);
		var month = obj.info[i].r_date.slice(4,6);
		var day = obj.info[i].r_date.slice(6,8);
		str += "<button class='btn btn-outline-primary'>" + obj.info[i].r_date + "</button>"
	}
	$('.date_button').html(str);
}
$(function(){
	$(document).on("click", ".date_button > button", function (e){
		var str = "";
		console.log($(this).index())
		for(var i =0; i < temp.info.length; i++){
			if(i === $(this).index()){
				$('#jupsu').html(temp.info[i].note);
				$('#symptom').html(temp.info[i].symptom);
				$('#r_d_code').html(temp.info[i].r_d_code);
				$('.pay').html(temp.info[i].p_amount)
				$('.record').html("진료기록 [" + temp.info[i].r_date + "]  |  담당의 : " + temp.info[i].name);
			}
		}
		
	});
});

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