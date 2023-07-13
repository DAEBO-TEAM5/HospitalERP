<%@page import="java.io.Console"%>
<%@page import="hospital.service.HospitalWaitingInfoService"%>
<%@page import="hospital.action.Action"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료</title>


 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->

  <link href="${pageContext.request.contextPath }/resources/main.css" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script> <!-- Jquery -->
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->


</head>
<body>
<div class="container-fluid">
	<c:import url="../include/header.jsp"></c:import>

	<div class="container-fluid info">
		<div class="row" style="height: 100%;">

			<div class="col-md-2 leftinfo">
				<p>
				<h2 style="text-align: center">
					<b>접수 / 대기</b>
				</h2>
				<div class="waitingList" id="waitList"></div>



				<!-- Button trigger modal -->
				<input type="button" value="등록" class="button-right modalBtn" id="modifyInfo" data-bs-toggle="modal" data-bs-target="#exampleModal">

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">대기 접수</h5>
								<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form role="form" id="patientForm">
									<div class="form-group">
										<label for="InputName">이름</label> 
										<input type="text" class="form-control" id="InputName" />
									</div>
									<div class="form-group">
										<label for="InputBirth">생년월일</label> 
										<input type="text" class="form-control" id="InputBirth" />
									</div>
									<div class="form-group">
										<label for="InputPhone">연락처</label> 
										<input type="text" class="form-control" id="InputPhone" />
									</div>
									<div class="form-group">
										<label for="InputAddress">주소</label> 
										<input type="text" class="form-control" id="InputAddress" />
									</div>
									<div class="form-group">
										<label>성별</label> 
										<input type="radio" name="gender" value="남">남 
										<input type="radio" name="gender" value="여">여
									</div>
									<div class="form-group">
										<label>키 / 몸무게</label> 
										<input type="text" class="form-control" id="InputHeight" /> 
										<input type="text" class="form-control" id="InputWeight" />
									</div>
									<div class="form-group">
										<label for="InputNote">특이사항</label>
										<textarea class="form-control" id="InputNote"></textarea>
									</div>
									<div class="form-group">
										<label for="InputSymptom">증상</label>
										<textarea class="form-control" id="InputSymptom"></textarea>
									</div>

									<br>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-primary">접수</button>
							</div>
							
							</form>


							</div>
							
						</div>
					</div>
				</div>


			</div>




			<div class="col-md-4" style="border-right: 1px solid black;">
				<h3 id="patientName" class="loadInfo"></h3>
				<div id="patientInfo">
					<!-- 환자 정보 load -->
					<span id="patientinfo" class="loadInfo"></span>
					<div id="patientMemo">
						접수 메모 <br>
						<div class="form-control" id="jupsu" readonly="readonly"></div>
					</div>

					<!-- Button trigger modal -->

					<input type="button" value="수정" class="button-right modalBtn" data-bs-toggle="modal" data-bs-target="#patientModal">


					<!-- Modal -->
					<div class="modal fade" id="patientModal" tabindex="-1" aria-labelledby="patientModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="patientModalLabel">환자 정보</h5>
									<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form role="form" id="patientInfoForm">
										<div class="form-group">
											<label for="LoadNum">고객번호</label> 
											<input type="text" class="form-control" id="LoadNum" disabled="disabled" />
										</div>
										<div class="form-group">
											<label for="LoadName">이름</label> 
											<input type="text" class="form-control" id="LoadName" />
										</div>
										<div class="form-group">
											<label for="LoadBirth">생년월일</label> 
											<input type="text" class="form-control" id="LoadBirth" />
										</div>
										<div class="form-group">
											<label for="LoadPhone">연락처</label> 
											<input type="text" class="form-control" id="LoadPhone" />
										</div>
										<div class="form-group">
											<label for="LoadAddress">주소</label> 
											<input type="text" class="form-control" id="LoadAddress" />
										</div>
										<div class="form-group">
											<label>성별</label> 
											<input type="radio" name="genderUpdate" value="남">남 
											<input type="radio" name="genderUpdate" value="여">여
										</div>
										<div class="form-group">
											<label>키 / 몸무게</label> 
											<input type="text" class="form-control" id="LoadHeight" /> 
											<input type="text" class="form-control" id="LoadWeight" />
										</div>
										<div class="form-group">
											<label for="LoadNote">특이사항</label>
											<textarea class="form-control" id="LoadNote"></textarea>
										</div> <br>

								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="submit" class="btn btn-primary">수정</button>
								</div>
									</form>


								</div>
							</div>
						</div>
					</div>
				</div>





				<br>
				<br>
				<br>
				<div style="border-top: 1px solid black" id="hLine">


					<div class="container text-center">
						<div class="row">
							<div class="col-sm-4  gap-2 col-6 mx-auto">
								<input class="btn btn-primary" type="button" value="날짜1">
								<button type="button" class="btn btn-secondary" data-bs-toggle="button" autocomplete="off">Secondary</button>
							</div>

							<div class="col-sm-8">
								<label>지난 진료 기록</label>
								<div>
									<label>증상</label>
									<textarea class="form-control"></textarea>
									<div class="form-control"></div>

									<label>병명</label>
									<textarea class="form-control"></textarea>

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
				<br><h2><b>진료 기록 작성</b></h2>
				<form role="form" method="post" id="recordForm">
					<div class="form-group">
						<label><b>의사 소견</b></label>
						<textarea class="form-control" name="d_note" id="d_note"></textarea>
						
						<div class="form-group" style="">
							<label> <b> < 처방약 > </b></label> <br>
							<select id="addMed" class="form-control medlist"></select> 
							<select id="medUsage" class="form-control medyang">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</option>
								<option value=4>4</option>
								<option value=5>5</option>
								<option value=6>6</option>
								<option value=7>7</option>
							</select> 
							<input class="btn btn-primary" type="button" value="+" onclick="prescriptionList();"> 
							<input class="btn btn-primary" type="button" value="-" onclick="prescriptionListDelete();">
						</div>
						<div class="result_table">
							<table id="result_med">
								<th class="medName">약품명</th>
								<th class="medYang">처방량</th>
							</table>
						</div>


						
						<div class="form-group" style="">
							<label> <b> < 물리치료 > </b> </label>  <br>
							<select id="addTh" class="form-control phlist"></select> 
							<input class="btn btn-primary" type="button" value="+" onclick="therapyList();"> 
							<input class="btn btn-primary" type="button" value="-" onclick="therapyDelete();">
						</div>
						<div class="result_table">
							<table id="result_Th">
								<th>물리치료 목록</th>
							</table>
						</div>


						
						<div class="form-group" style="">
							<label> <b> < 진단 질병 > </b></label> 
							<select id="addD" class="form-control"></select>
						</div>


					</div>
					
					<input type="reset" class="button-right" value="작성 취소">
					<input type="submit" class="button-right" value="작성 완료" onclick="insertRec();">

				</form>

			</div>


			<div class="col-md-2">
				<c:import url="../include/calendar.jsp" />
				<div class="memoForm">
					<textarea class="form-control" name="calendar_memo" id="calendar_memo"></textarea>
					<input type="reset" class="button-right" value="작성 취소">
					<input type="button" class="button-right" value="작성 완료" onclick="insertRec();">
					<input type="button" class="button-right" value="수정" onclick="insertRec();">
				</div>
			</div>



		</div>
	</div>

</div>


	<script type="text/javascript">
//대기 리스트 가져오고 화면에 출력
$(document).ready(function(){
	function loadWaitList(){
	$.ajax({
		type: 'post',
		url: "./mainWaitList.do",
		success : waitListFunc,
		error: errFunc
	});
	}
	loadWaitList();
});
function waitListFunc(data){
	var obj = JSON.parse(data);
	for(var k in obj.waitList){
		var num = obj.waitList[k].num;
		var name = obj.waitList[k].name;
		var birth = obj.waitList[k].birth;
		var sex = obj.waitList[k].sex;
		//console.log(name);
		//var test = "<button id ='child' value='1234'>버튼</button>";
		//$('#waitList').append(test);
		var waitList = "<button class='waitButton' id='listinfo' value='" + num + "'>";
		waitList += "<h4>"+ name +"</h4> "+ birth+" | "+ sex;
		waitList += "</button>";
		$('#waitList').append(waitList);
	}
}

//처방전_select리스트 불러오기
$(function(){
	$.ajax({
		type: 'post',
		url: "./mainSelectList.do",
		success : selectListFunc,
		error: errFunc
	});
});
function selectListFunc(data){
	var obj = JSON.parse(data);
	//console.log("obj---"+obj);
	//console.log("medlist---"+obj.final[0]);
	//console.log("therapylist---"+obj.final[1]);
	//console.log("diseaselist---"+obj.final[2]);
	//console.log(Array.isArray(obj.final[1]));
	
	for(var k in obj.final[0]){
		var m_name = obj.final[0][k].m_name;
		var m_code = obj.final[0][k].m_code;
		var selectOption = "<option  value='" + m_code + "'>" + m_name + "</option>";
		$('#addMed').append(selectOption);
	}
	for(var k in obj.final[1]){
		var therapy = obj.final[1][k];
		var selectOption = "<option  value='" + therapy + "'>" + therapy + "</option>";
		$('#addTh').append(selectOption);
	}
	for(var k in obj.final[2]){
		var disease = obj.final[2][k];
		var selectOption = "<option  value='" + disease + "'>" + disease + "</option>";
		$('#addD').append(selectOption);
	}
}

//대기환자 클릭하면 접수정보 띄워줌
 $(document).on('click', '#listinfo', function(){	 
	 var info = $(this).val();
	 console.log(info);
	 console.log('clicked');
	 //var button = document.querySelectorAll('.waitButton');
	 
	 $(".waitingList .active").removeClass('active');
	 $(this).addClass('active');
	 
	 $.ajax({
		 type: 'post',
		 url: "./waitinginfo.do",
		 data : {num: info },
		 success : patientInfo,
		error : function(msg, error) {
				alert(error);
			}
	 });
}); 
function patientInfo(data){
	var obj = JSON.parse(data);
	var str = "";
	str += obj.name+" / ";
	str += obj.birth+" / ";
	str += obj.sex;
	console.log(str);
	
	$('#patientName').html(obj.name);
	$('#patientinfo').html(str);
	$('#jupsu').html(obj.symptom);
}

function errFunc(msg, error){
	alert(error);
}
//-----------------------------------------------------------------------------
//접수모달
 $('#patientModal').on('show.bs.modal', function(e){	 
	var name =  $('#patientName').text();
	console.log("namename=============="+name);
	 //var info = $(this).val();
	 //console.log(info);
	 console.log('수정버튼--');
	 var winfo = $('#patientinfo').text();
	 var arr = winfo.split("/");
	 
	 birth = arr[1].trim();
	 console.log(birth);
	 
 	 $.ajax({
		 type: 'post',
		 url: "./loadPatientInfo.do",
		 data : {"name": name, "birth": birth },
		 success : ModifyInfo,
		error : function(msg, error) {
				alert(error);
			}
		 
	 }); 
});  
function ModifyInfo(data){
	var obj = JSON.parse(data);
	//console.log(obj);
	$('#LoadNum').val(obj.num);
	$('#LoadName').val(obj.name);
	$('#LoadBirth').val(obj.birth);
	$('#LoadPhone').val(obj.phone);
	$('#LoadAddress').val(obj.address);
	$('#LoadHeight').val(obj.height);
	$('#LoadWeight').val(obj.weight);
	$('#LoadNote').val(obj.note);
	console.log(obj.sex);
	if(obj.sex == 'man' || obj.sex == '남' || obj.sex == '남자'){            /////////////////////////이거 radio value 뭐로 할지 정하고 고쳐야함
		$("input:radio[name='genderUpdate'][value='남']").prop('checked', true);	
	}
	else $("input:radio[name='genderUpdate'][value='여']").prop('checked', true);
	
}

$(document).ready(function(){
	$('#patientInfoForm').submit(function(event){
		console.log("정보수정");
		ModifyForm();
		loadWaitList();
		return false;
	});
});

function ModifyForm(){
	console.log("ㅇㅇㅇㅇ");
	var num = document.getElementById('LoadNum').value;
	var name = document.getElementById('LoadName').value;
	var birth = document.getElementById('LoadBirth').value;
	var phone = document.getElementById('LoadPhone').value;
	var address = document.getElementById('LoadAddress').value;
	var gender = $('input[type=radio][name=genderUpdate]:checked').val();
	var height = document.getElementById('LoadHeight').value;
	var weight = document.getElementById('LoadWeight').value;
	var note = $('#LoadNote').val();
	
	console.log(gender);
	
	$.ajax({
		type:'POST',
		url: "./updatePatientInfo.do",
		data: {"name":name, "birth":birth, "phone":phone, "address":address, "gender":gender,
				"height":height, "weight":weight, "note":note, "num":num },
		success: function(response){
			$("#patientModal").modal('hide');
			alert('변경이 완료되었습니다');
			
		},
		error: function(msg, error) {
			alert(error);
		}
	});
}




//--------------------------------------------------------------------------------

/* function handleOnChange(e) {
	  // 선택된 데이터의 텍스트값 가져오기
	  const text = e.options[e.selectedIndex].text;
	  
	  console.log(e.options);
	  
	  // 선택한 텍스트 출력
	  document.getElementById('result').innerText
	    += text;
	} */
	
function prescriptionList() {

	  var m_name = document.getElementById("addMed");
	  var m_nameT = m_name.options[m_name.selectedIndex].text;
	  
	  var usage = document.getElementById("medUsage");
	  var usageT = usage.options[usage.selectedIndex].text;
	  
	  var med_table = "<tr id='prescriptionMedList'>  <td>" + m_nameT + "</td> <td>" + usageT + "</td> </tr>";
	  $('#result_med').append(med_table);
}

/* function prescriptionList(,,name) {

		  var m_name = document.getElementById("addMed");
		  var m_nameT = m_name.options[m_name.selectedIndex].text;
		  
		  var usage = document.getElementById("medUsage");
		  var usageT = usage.options[usage.selectedIndex].text;
		  
		  var med_table = "<tr id='prescriptionMedList'>  <td>  "+m_nameT+"</td> <td> " + usageT + "</td> </tr>";
		  $(name).append(med_table);
} */

function prescriptionListDelete() {
	$("tr").remove("#prescriptionMedList:last");
}

function therapyList() {
	  var t_name = document.getElementById("addTh");
	  var t_nameT = t_name.options[t_name.selectedIndex].text;
	  
	  var med_table = "<tr id='prescriptionThList'>  <td>" + t_nameT + "</td>  </tr>";
	  $('#result_Th').append(med_table);
}
function therapyDelete() {
	$("tr").remove("#prescriptionThList:last");
}

/* function diseaseList() {
	  var d_name = document.getElementById("addD");
	  var d_nameT = d_name.options[d_name.selectedIndex].text;
	  
	  var med_table = "<tr id='prescriptionDList'>  <td>" + d_nameT + "</td>  </tr>";
	  $('#result_D').append(med_table);
}
function diseaseDelete() {
	$("tr").remove("#prescriptionDList");
} */



//처방 레코드 추가
function insertRec() {
	var note = $('#d_note').val();
	var medTable = document.getElementById('result_med');
	var medRowList = medTable.rows;
	var medPres = [medRowList.length-1];
	
	for(i=1; i<medRowList.length; i++){
		var row = medRowList[i];
		
		var m_name = row.cells[0].innerHTML;
		var yang = row.cells[1].innerHTML;
		console.log(m_name);
		console.log(yang);
		
		medPres[i-1] = {m_name,yang};
		console.log("-------------------"+medPres[i-1]);
	}
	
	console.log(medPres);
	
	var tList = [];
	var thTable = document.getElementById('result_Th');
	var ThRowList = thTable.rows;
	for(i=1; i<ThRowList.length; i++){
		var row = ThRowList[i];
		var t_name = row.cells[0].innerHTML;
		tList[i-1] = t_name;
	}
	
	  var d_name = document.getElementById("addD");
	  var d_nameT = d_name.options[d_name.selectedIndex].text;
	  
	  var patientName = $('#patientName').text();
	  
	$.ajax({
		 type: 'post',
		 url: "./insertRecord.do",
		 data : {"note": note, "medPres": JSON.stringify(medPres), "tList": JSON.stringify(tList),
			 	"dName": d_nameT, "p_name": patientName },
		 success : function(data){
			 		var obj = JSON.parse(data);
			 		console.log(data);
			 		var pnum = obj.pnum;
			 		pnum = "."+pnum;
			 		console.log(pnum);
			 		$("button").remove(pnum);
			 		$('#recordForm').reset();
			 		$("tr").remove("#prescriptionThList");
			 		$("tr").remove("#prescriptionMedList");
			 		//loadWaitList();
		 		},
		error : function(msg, error) {
				alert(error);
			}
	 });  
	//function insertRecord(data){
		console.log("insert 성공");
		//var obj = JSON.parse(data);
		//console.log(obj);
		//var pnum = obj.pnum;
		//console.log(pnum);
		//$('button').remove('.'pnum);
	//}
	
}




//대기 리스트 추가 + 환자 정보 추가  (submit 클릭이벤트)
$(document).ready(function(){
	$('#patientForm').submit(function(event){
		console.log("오니");
		submitForm();
		
		loadWaitList();
		return false;
	});
});

function submitForm(){
	console.log("여기까지");
	var name = document.getElementById('InputName').value;
	var birth = document.getElementById('InputBirth').value;
	var phone = document.getElementById('InputPhone').value;
	var address = document.getElementById('InputAddress').value;
	var gender = $('input[type=radio][name=gender]:checked').val();
	var height = document.getElementById('InputHeight').value;
	var weight = document.getElementById('InputWeight').value;
	var note = $('#InputNote').val();
	//console.log("noteTttt============="+note);
	var symptom = document.getElementById('InputSymptom').value;
	//console.log("증상:::::::"+symptom);
	$.ajax({
		type:'POST',
		url: "./insertPatient.do",
		data: {"name":name, "birth":birth, "phone":phone, "address":address, "gender":gender,
				"height":height, "weight":weight, "note":note, "symptom": symptom},
		success: function(response){
			$("#exampleModal").modal('hide');
			alert('추가가 완료되었습니다');
			
		},
		error: function(msg, error) {
			alert(error);
		}
	});
}

//메모  ----캘린더
$(function(){
	$(document).on("click", ".test p", function (e){
		$.ajax({	
			url: "./loadCalendarMemo.do",
			type: "POST",
			data : { date: $('#calYear').text() +"-"+ $('#calMonth').text() +"-"+ $(this).text() },
			success: getMemo,
			error: function(msg, error) {
				alert(error);
			}
		});
	});
});
function getMemo(data){
	console.log("memo불러오기");
	var obj = JSON.parse(data);
	console.log(obj.memo);
	$('#calendar_memo').val(obj.memo);
	//var str = "<input type='button' class='button-right' value='수정' onclick=''>";
	//$('.memoForm').append(str);
}




	
</script>

</body>
</html>

