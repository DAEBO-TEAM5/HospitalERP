<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="./resources/Login.css" rel="stylesheet" type="text/css">
<link href="./resources/SignUp.css" rel="stylesheet" type="text/css">
<head>
<link rel="icon" href="${pageContext.request.contextPath }/image/hp.png"/> <!-- //파비콘임 -->
<meta charset="UTF-8">

<title>ㅇㅇ Hospital</title>
</head>
<body>


 <div id="login">
        <h3 class="text-center text-white pt-5">5조 프로젝트</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">ID:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" onclick="javascript:form.action='./loginok.do';" value="로그인">
                            </div>
                            <div id="register-link" class="text-right"><br>
                                <a href="#" onclick="openPopup();return false;" class="text-info">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#" class="text-info">ID/PW찾기</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <div id="popup" class="popup-overlay">
	<div class="popup-content">
		<span class="close-btn" onclick="closePopup()">&times;</span>
		<h2>회원가입</h2>
		<form action="${pageContext.request.contextPath}/signup.do"  method="POST">
			<input type="text" name="h_id" id="h_id" placeholder="ID">
			<input type="text" name="h_name" id="h_name" placeholder="병원이름"> 
			<input type="text" name="h_address" id="h_address" placeholder="병원주소">
			<input type="text" name="h_phone" id="h_phone" placeholder="연락처">
			<div>
				<input type="password" name="h_pwd" id="h_pwd" placeholder="비밀번호" >
				<input type="password" name="h_pwd" id="h_pwd" placeholder="비밀번호 확인" >
			</div>
			<input type="email" name="h_email" id="h_email" placeholder="이메일">
			<input type="text" name="h_post" id="h_post" placeholder="병원우편번호">
			<input type="text" name="h_e_code" id="h_e_code" placeholder="직원코드">
			
			
			<input type="submit" value="가입">
		</form>
	</div>
</div>
</body>
</html>
<script>
	function openPopup() {
		var popup = document.getElementById("popup");
		popup.style.visibility = "visible";
		popup.style.opacity = "1";
	}

	function closePopup() {
		var popup = document.getElementById("popup");
		popup.style.visibility = "hidden";
		popup.style.opacity = "0";
	}
</script>