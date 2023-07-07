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
		
		<form id="joinForm" action="${pageContext.request.contextPath}/signup.do" method="POST">
			<div>
			<input type="text" name="h_id" id="h_id" placeholder="ID">
			<input type="button" value="중복체크" name="h_idcheck" id="h_idcheck" onClick="idCheck()">  
			</div>
			<input type="text" name="h_name" id="h_name" placeholder="병원이름"> 
			<input type="text" name="h_address" id="h_address" placeholder="병원주소">
			<input type="text" name="h_phone" id="h_phone" placeholder="연락처">
			<div>
				<input type="password" name="h_pwd" id="h_pwd" placeholder="비밀번호" >
				<input type="password" name="h_cwp" id="h_cwp" placeholder="비밀번호 확인" >
			</div>
			<input type="email" name="h_email" id="h_email" placeholder="이메일">
			<input type="text" name="h_post" id="h_post" placeholder="병원우편번호">
			<input type="text" name="h_e_code" id="h_e_code" placeholder="직원코드">
			
			
			<input type="submit" onclick="Validation(event);" value="가입">
            <input type="reset" onclick="alert('초기화 했습니다.')" value="다시 입력">
            
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
<script>
// 유효성 검사 메서드
function Validation(event) {
event.preventDefault();

    //변수에 저장
    var h_id = document.getElementById("h_id")
    var h_name = document.getElementById("h_name")
    var h_address = document.getElementById("h_address")
    var h_phone = document.getElementById("h_phone")
    var h_pwd = document.getElementById("h_pwd")
    var h_cwp = document.getElementById("h_cwp")
    var h_email = document.getElementById("h_email")
    var h_post = document.getElementById("h_post")
    var h_e_code = document.getElementById("h_e_code")

    // 정규식
    // id, pw
    var regIdPw = /^[a-zA-Z0-9]{4,12}$/;
    // 이름
    var regName = /^[가-힣a-zA-Z]{2,15}$/;
    // 이메일
    var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    // 숫자만
    var regExp = /^[0-9]*$/;
    
    //아이디 확인
    if (h_id.value.trim() === "") {
        alert("아이디를 입력하세요.");
        h_id.focus();
        return false;
    }

    //아이디 영어 대소문자 확인
    else if (!regIdPw.test(h_id.value.trim())) {
        alert("ID는 4~12자 영문 대소문자, 숫자만 입력하세요.");
        h_id.focus();
        return false;
    }
  
    //이름 확인 = 한글과 영어만 가능하도록
    if (h_name.value.trim() === "") {
        alert("병원명을 입력하세요.");
        h_name.focus();
        return false;
    }

    else if (!regName.test(h_name.value.trim())) {
        alert("병원명은 최소 2글자 이상, 한글과 영어만 입력하세요.");
        h_name.focus();
        return false;
    }

    //주소 확인 = 한글과 영어만 가능하도록
    if (h_address.value.trim() === "") {
        alert("주소를 입력하세요.");
        h_address.focus();
        return false;
    }

    else if (!regName.test(h_address.value.trim())) {
        alert("병원 주소는 최소 2글자 이상, 한글과 영어만 입력하세요.");
        h_address.focus();
        return false;
    }

    //휴대폰 번호 확인
    
     if (h_phone.value.trim() === "") {
        alert("전화번호를 입력하세요.");
        h_phone.focus();
        return false;
    }
     else if (!regExp.test(h_phone.value.trim())) {
        alert("전화번호는 숫자만 입력 가능합니다. 다시 입력해주세요.");
        h_phone.focus();
        return false;
    }

    //비밀번호 확인
    if (h_pwd.value.trim() === "") {
        alert("비밀번호를 입력하세요.");
        h_pwd.focus();
        return false;
    }
    
    //비밀번호 영어 대소문자 확인
    else if (!regIdPw.test(h_pwd.value.trim())) {
        alert("비밀번호는 4~12자 영문 대소문자, 숫자만 입력하세요.");
        h_pwd.focus();
        return false;
    }
    
    //비밀번호와 아이디 비교
    else if (h_pwd.value.trim() === h_id.value.trim()) {
        alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.");
        h_pwd.focus();
        return false;
    }

    //비밀번호 확인
    if (h_cwp.value.trim() !== h_pwd.value.trim()) {
        alert("비밀번호와 동일하지 않습니다.");
        h_cwp.focus();
        return false;
    }

    //메일주소 확인
    if (h_email.value.trim() === "") {
        alert("메일주소를 입력하세요.");
        h_email.focus();
        return false;
    }
    
    else if (!regMail.test(h_email.value.trim())) {
        alert("잘못된 이메일 형식입니다.");
        h_email.focus();
        return false;
    }

    //우편번호 확인
    if (h_post.value.trim() === "") {
        alert("우편번호를 입력하세요.");
        h_post.focus();
        return false;
    }
    else if (!regExp.test(h_post.value.trim())) {
        alert("우편번호는 숫자만 입력 가능합니다. 다시 입력해주세요.");
        h_post.focus();
        return false;
    }
    
    //의사코드 확인
    if (h_e_code.value.trim() === "") {
        alert("메일주소를 입력하세요.");
        h_e_code.focus();
        return false;
    }
    else if (!regExp.test(h_e_code.value.trim())) {
        alert("의사코드는 숫자만 입력 가능합니다. 다시 입력해주세요.");
        h_e_code.focus();
        return false;
    }

    // 유효성 문제 없을 시 폼에 submit
    var joinForm = document.getElementById("joinForm");
    joinForm.submit();
   
}
</script>
