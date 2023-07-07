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
<title>Insert title here</title>


 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->

  <link href="${pageContext.request.contextPath }/resources/main.css" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script> <!-- Jquery -->
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->


</head>
<body>
<div class="container-fluid">
	<div class="d-flex" id="title">
			<div class="p-2 flex-grow-1">
				<i class="fa-solid fa-circle-user"></i>병원님 반갑습니다.
			</div>
		    <div class="p-2"><a href="#" class="title-a">진료</a></div>
			<div class="p-2"><a href="#" class="title-a">재고</a></div>
			<div class="p-2"><a href="#" class="title-a">진료기록</a></div>
			  
		</div>
	
	
	<div class="container-fluid info" >
		<div class="row" style=" height: 100%;">

			<div class="col-md-2 leftinfo" >
			<p>
				<h2 style="text-align: center"><b>접수 / 대기</b></h2>
				<div class="form-group"></div>
				
				
				
				<div class="list-group" id="waitList">
					<c:forEach var="waitlist" items="${ list }">
						<button type="button" class="list-group-item list-group-item-action" id="listinfo" value="${ waitlist.num }"> ${waitlist.name} / ${waitlist.sex} / ${waitlist.birth}</button>
					</c:forEach>
				</div>
				
				<input type="button" value="등록" id="button-right">

			</div>

			<div class="col-md-4"  style="border-right: 1px solid black;">
				<h3 id="patientName" class="loadInfo"></h3>
				<div> 
					<!-- 환자 정보 load -->
					<span id="patientinfo" class="loadInfo"></span>
					<div id="patientMemo"> 접수 메모 <br>
						<div class="form-control" id="jupsu" readonly="readonly"></div>
					</div>
				</div>
				
				
				
				
				
				<br><br><br>
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
				<h3> 진료 기록 작성</h3>
				<!-- <form role="form" method="post" > -->
					<div class="form-group">
				<label>의사 소견</label>
          		<textarea class="form-control" name="d_note" id="d_note"></textarea>
          		
          		<div class="form-group" style="">
          			<label> < 처방약  > </label>
          			<select id="addMed" class="form-control" ></select>
          			<select id="medUsage">
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
          		<div> 
          			<table id="result_med">
          				<th>약품명</th>
          				<th>처방량</th>
          			</table>
          		</div>
          		
          		
          		
          		<div class="form-group" style="">
          			<label> < 물리치료  > </label>
          			
          			<select id="addTh" class="form-control" ></select>
          			
          			<input class="btn btn-primary" type="button" value="+" onclick="therapyList();">
          			<input class="btn btn-primary" type="button" value="-" onclick="therapyDelete();">
          		</div>
          		<div> 
          			<table id="result_Th"> <th>물리치료 목록</th> </table>
          		</div>
          		
          		
          		
          		<div class="form-group" style="">
          			<label> < 진단 질병  > </label>
          			
          			<select id="addD" class="form-control" ></select>
          		
          			<input class="btn btn-primary" type="button" value="+" onclick="diseaseList();">
          			<input class="btn btn-primary" type="button" value="-" onclick="diseaseDelete();">
          		</div>
          		<div> 
          			<table id="result_D">
          				<th>약품명</th>
          				<th>처방량</th>
          			</table>
          		</div>
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		</div>
          		<br>
				<input type="reset" id="button-right" value = "작성 취소" >
          		<input type="submit" id="button-right" value = "작성 완료" onclick="insertRec();">
          		
          		<!-- </form> -->
          		
			</div>


			<div class="col-md-2">
			
			</div>
			
			
			
		</div>
	</div>

</div>


<script type="text/javascript">

$(document).ready(function(){
	$.ajax({
		type: 'get',
		url: "./mainWaitList.do",
		success : waitListFunc,
		error: errFunc
	});
});

/* $(function(){
	$.ajax({
		type: 'get',
		url: "./mainWaitList.do",
		success : waitListFunc,
		error: errFunc
	});
}); */

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
		var waitList = "<button class='list-group-item list-group-item-action' id='listinfo' value='" + num + "'>"+ name +" / "+ sex+" / "+ birth+ "</button>";
		$('#waitList').append(waitList);
	}
}

//처방전_select리스트 불러오기
$(function(){
	$.ajax({
		type: 'get',
		url: "./mainSelectList.do",
		success : selectListFunc,
		error: errFunc
	});
});

function selectListFunc(data){
	var obj = JSON.parse(data);
	
	console.log("obj---"+obj);
	console.log("medlist---"+obj.final[0]);
	console.log("therapylist---"+obj.final[1]);
	console.log("diseaselist---"+obj.final[2]);
	console.log(Array.isArray(obj.final[1]));
	
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








 $(document).on('click', '#listinfo', function(){	 
	 var info = $(this).val();
	 console.log(info);
	 console.log('clicked');
	 
	 $.ajax({
		 type: 'get',
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
	$("tr").remove("#prescriptionMedList");
}

function therapyList() {
	  var t_name = document.getElementById("addTh");
	  var t_nameT = t_name.options[t_name.selectedIndex].text;
	  
	  var med_table = "<tr id='prescriptionThList'>  <td>" + t_nameT + "</td>  </tr>";
	  $('#result_Th').append(med_table);
}
function therapyDelete() {
	$("tr").remove("#prescriptionThList");
}

function diseaseList() {
	  var d_name = document.getElementById("addD");
	  var d_nameT = d_name.options[d_name.selectedIndex].text;
	  
	  var med_table = "<tr id='prescriptionDList'>  <td>" + d_nameT + "</td>  </tr>";
	  $('#result_D').append(med_table);
}
function diseaseDelete() {
	$("tr").remove("#prescriptionDList");
}



	
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
		
		//medPres[m_name] = yang;
		medPres[i-1] = {m_name,yang};
		console.log("-------------------"+medPres[i-1]);
		
		
	}
	
	//console.log("딕서너리 잘 들어갔나++++++++"+medPres);
	console.log(medPres);
	
	//console.log(note);
	//console.log(typeof note);
	//console.log(typeof medPres);
	//console.log(Array.isArray(medPres));
	
	/* for(var key in medPres){
		console.log("key: "+key+ " value: "+medPres[key]);
	} */

	
	/* var testtest = [{med: "약1", yang: 2},{med: "약2", yang: 1},{med: "약3", yang: 3},
		]; */
	//console.log(testtest);
	
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
	  
	  //console.log("이름--------------------"+patientName);

	$.ajax({
		 type: 'post',
		 url: "./insertRecord.do",
		 data : {"note": note, "medPres": JSON.stringify(medPres), "tList": JSON.stringify(tList),
			 	"dName": d_nameT, "p_name": patientName },
		 success : insertRecord(),
		error : function(msg, error) {
				alert(error);
			}
		 
	 });  
	
}

function insertRecord(){
	console.log("insert 성공");
}
	
</script>


</body>
</html>

