<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/include.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="d-flex" id="hospital_title">
		<div class="p-2 flex-grow-1">
			<a href="main2.do"><img src="${pageContext.request.contextPath }/image/logo.png" height="50px"/></a>ㅇㅇ병원 ㅇㅇㅇ님 반갑습니다.
			<a href="#"><i class="fa-solid fa-arrow-right-from-bracket" style="color: white;"></i></a>
		</div>
		<button onclick="location.href='${pageContext.request.contextPath }/logout.do'">로그아웃</button>
	    <div class="p-2"><a href="main2.do" class="title_nav">진료</a></div>
		<div class="p-2"><a href="item.do" class="title_nav">재고</a></div>
		<div class="p-2"><a href="history.do" class="title_nav">진료기록</a></div>  
	</div>
</body>
</html>