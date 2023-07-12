<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/include.css" rel="stylesheet">

</head>
<body>
	<div class="d-flex" id="hospital_title">
		<div class="p-2 flex-grow-1">
			<a href="main2.do"><img src="${pageContext.request.contextPath }/image/logo.png" height="50px"/></a>ㅇㅇ병원 ㅇㅇㅇ님 반갑습니다.
		</div>
	    <div class="p-2"><a href="main2.do" class="title_nav">진료</a></div>
		<div class="p-2"><a href="item.do" class="title_nav">재고</a></div>
		<div class="p-2"><a href="history.do" class="title_nav">진료기록</a></div>  
	</div>
</body>
</html>