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
  <link href="${pageContext.request.contextPath }/resources/main.css" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- Jquery -->
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->
<title>진료기록</title>


</head>
<body>
	<div class="container-fluid">
		<div class="d-flex" id="title">
			<div class="p-2 flex-grow-1">
				<i class="fa-solid fa-circle-user fa-lg"></i>&nbsp;ㅇㅇ병원님 반갑습니다.
			</div>
		    <div class="p-2"><a href="main2.do" class="title-a">진료</a></div>
			<div class="p-2"><a href="item.do" class="title-a">재고</a></div>
			<div class="p-2"><a href="#" class="title-a">진료기록</a></div>  
		</div>
		<div class="container-fluid info">
      		<div class="row" style="height: 100%;">
         		<div class="col-md-2 leftinfo">
            		<p>
            		<h2 style="text-align: center"><b>진료내역</b></h2>
            		<form role="form">
	            		<div class="form-group">
	            			<input type="text" id = "search" placeholder="이름/전화번호" class="form-control"  onKeypress="javascript:if(event.keyCode==13) {test()}">
	            		</div>
	            		<div class="form-group">
	            			<button type="button" id="patient_search"class="btn btn-primary" style="width: 100%">검색</button>
	            		</div>
            		</form>
            		<div class="result" style="background-color: #00AAFF; overFlow-y : auto;" id="open">
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
		            	</div>
					</div>	
         		</div>

         		<div class="col-md-2">
         
        		</div>
         
         
         
      		</div>
  		</div>
	</div>
</body>

<script type="text/javascript">
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
var temp;
function successFunc(data){
	var str = "";
	var obj = JSON.parse(data);
	console.log(obj.list.length)
	for(var i =0; i< obj.list.length; i++){
		str += "<div class='result_set'>"
		str += "<span class = 'name'>" + obj.list[i].name + "</span><br>";
		str += obj.list[i].birth + "<br>";
		str += "<span class = 'phone'>" + obj.list[i].phone + "</span><br>";
		str += "</div>"
	}
	
	$('#open').html(str);
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
		$(this).css("background-color", "pink");
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
			}
		}
		
	});
});
</script>
</html>