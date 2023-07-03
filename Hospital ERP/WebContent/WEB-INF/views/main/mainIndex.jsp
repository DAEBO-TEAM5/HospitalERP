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


<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->
  <link href="${pageContext.request.contextPath }/resources/style.css?after" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script> <!-- Jquery -->
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->


<!-- 
<style type="text/css">
.container-fluid {
	height: 100vh;
	border: 1px solid black;
}
.col-md-3 {
	height: 100%;
	/* border: 1px solid red; */
}
.vr {
	currentColor: blue;
	color: black;

	width: 0.2px;
	font-size: 10px;
}
.verticalLine {
	width: 0.2px;
	border: 1px solid black;
	height: 100%;
}
table, th, tr, td {
	border: 1px solid black;
}
</style>
 -->
 <script type="text/javascript">
/*  function loadInfo() {
	 var num = $("listinfo");
	request.setAttribute("num", num});
} */
 
<%--  $('#listinfo').click(function() {
	var info = this.val();
	console.log(var);
	 $.ajax({
		 type: 'POST',
		 url: "<%=request.getContextPath()%>/Hospital.do",
		 data : {"" : },
		 success : function(data) {
				var as = eval(data);  
				alert("data : " + as[0] + "/ " + as[1]);
			},
		error : function(msg, error) {
				alert(error);
			}
		 
	 });
	 
 }); --%>
 
 </script>
 
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
				<h2><b>접수 / 대기</b></h2>
				<div class="form-group"></div>
				
				
				
				<div class="list-group">
					<c:forEach var="waitlist" items="${ list }">
						<button type="button" class="list-group-item list-group-item-action" id="listinfo" onclick=""> ${waitlist.name} / ${waitlist.sex} / ${waitlist.birth}</button>
					</c:forEach>
				</div>
				
				
				<input type="button" value="등록" id="button-right">
			</div>

			<!-- <div class="verticalLine"></div> -->

			<div class="col-md-4"  style="border-right: 1px solid black;">
				<h3>환자 이름</h3>
				<div> 
					<!-- 환자 정보 load -->
					생년월일 주소 나이 성별 전화번호
					<div style="background-color: lightgrey;"> 접수 메모 <br>
						<textarea class="form-control"></textarea>
					</div>
				</div>
				
				
				
				
				
				<br><br><br>
				<div style="border-top: 1px solid black">
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
				
				<!-- <form role="form">
					<div class="form-group">

						<label for="exampleInputEmail1"> Email address </label> <input
							type="email" class="form-control" id="exampleInputEmail1" />
					</div>
					<div class="form-group">

						<label for="exampleInputPassword1"> Password </label> <input
							type="password" class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">

						<label for="exampleInputFile"> File input </label> <input
							type="file" class="form-control-file" id="exampleInputFile" />
						<p class="help-block">Example block-level help text here.</p>
					</div>
					<div class="checkbox">

						<label> <input type="checkbox" /> Check me out
						</label>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form> -->
				
			</div>


			<div class="col-md-4" style="border-right: 1px solid black;">
				<h3> 진료 기록 작성</h3>
				<form role="form" method="post">
					<div class="form-group">
				<label>증상</label>
          		<textarea class="form-control" ></textarea>
          		
          		<label>병명</label>
          		<textarea class="form-control" ></textarea>
          		
          		<label>처방</label>
          		<textarea class="form-control" ></textarea>
          		
          		<label>처방주의약품</label>
          		<textarea class="form-control" ></textarea>
          		</div>
          		
				<input type="reset" id="button-right" value = "작성 취소">
          		<input type="submit" id="button-right" value = "작성 완료">
          		
          		</form>
          		
			</div>

			<!-- <div class="vr"></div> -->

			<div class="col-md-2">
			
			</div>
			
			
			
		</div>
	</div>

</div>



</body>
</html>

