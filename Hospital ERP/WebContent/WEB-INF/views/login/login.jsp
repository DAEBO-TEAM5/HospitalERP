<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="./resources/Login.css" rel="stylesheet" type="text/css">
<link href="./resources/SignUp.css" rel="stylesheet" type="text/css">
<link href="./resources/findID.css" rel="stylesheet" type="text/css">
<link href="./resources/findpw.css" rel="stylesheet" type="text/css">

<head>
<link rel="icon" href="${pageContext.request.contextPath }/image/hp.png" /> <!-- //파비콘임 -->
<meta charset="UTF-8">
<title>5Ing Hospital</title>
</head>
<body>
	<img class="fit-picture" src="./image/hp2.png">
	<div id="login">
	    <h1 class="text-center text-info ">5Ing Hospital</h1>
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
	                            <a href="#" onclick="openPopup();return false;" class="text-info">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
	                            <a href="#" onclick="openPopup2();" class="text-info">ID찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
	                            <a href="#" onclick="openPopup3();" class="text-info">PW찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
	                <input class="formBtn" type="button" value="중복체크" name="h_idcheck" id="h_idcheck" onClick="idCheck()">
	            </div>
	            <div>
	                <input type="password" name="h_pwd" id="h_pwd" placeholder="비밀번호">
	                <input type="password" name="h_cwp" id="h_cwp" placeholder="비밀번호 확인">
	            </div>
	            <input type="text" name="h_name" id="h_name" placeholder="병원명">
	            <div class="search">
	                <input type="text" readonly name="h_post" id="h_post" placeholder="우편번호">
	                <input class="formBtn" type="button" value="검색" onclick="postOpener(event)">
	            </div>
	            <input type="text" readonly name="h_address" id="h_address" placeholder="주소">
	            <input type="text" name="h_e_code" id="h_e_code" placeholder="사원번호">
	            <div>
	                <input type="email" name="h_email" id="h_email" placeholder="이메일">
	                <input class="formBtn" type="button" value="중복체크" name="h_emailcheck" id="h_emailcheck" onClick="emailCheck()">
	            </div>
	            <div class="phone">
	                <input id="phone1" type="text" size="1" maxlength="3" oninput="changePhone1()" value="010" readonly> -
	                <input id="phone2" type="text" size="3" maxlength="4" oninput="changePhone2()"> -
	                <input id="phone3" type="text" size="3" maxlength="4" oninput="changePhone3()">
	                <input id="h_phone" type="hidden" name="h_phone">
	            </div>
	            <div>
	                <input type="submit" onclick="Validation(event);" value="가입" id="signbtn">
	                <input type="reset" onclick="resetBtnHandler()" value="다시 입력">
	            </div>
	        </form>
	    </div>
	</div>
	<div id="popup2" class="popup-overlay2">
	    <div class="popup-content2">
	        <span class="close-btn" onclick="closePopup2()">&times;</span>
	        <h4>ID찾기</h4>
	        <form action="${pageContext.request.contextPath}/findid.do" method="post">
	            <input type="text" name="h_name" id="h_name2" placeholder="병원명">
	            <input type="email" name="h_email" id="h_email2" placeholder="이메일">
	            <div>
	                <input class="formBtn2" type="submit" value="ID찾기" name="findID" id="h_findID">
	                <input type="reset" onclick="resetBtnHandler()" value="다시 입력">
	            </div>
	        </form>
	    </div>
	</div>
	<div id="popup3" class="popup-overlay3">
	    <div class="popup-content3">
	        <span class="close-btn" onclick="closePopup3()">&times;</span>
	        <h4>비밀번호 찾기</h4>
	        <form class="changepwdform" method="post">
	            <input type="text" name="h_id" id="h_id3" placeholder="ID" class="findpwdid">
	            <input type="email" name="h_email" id="h_email3" placeholder="이메일" class="findpwdemail">
	            <div>
	                <input class="formBtn2" type="submit" value="인증코드 메일전송" name="findpw" id="h_findpw">
	                <input type="reset" onclick="resetBtnHandler()" value="다시 입력">
	            </div>
	        </form>
	    </div>
	</div>
	<div id="popup4" class="popup-overlay3">
	    <div class="popup-content3">
	        <span class="close-btn" onclick="closePopup4()">&times;</span>
	        <h4>비밀번호 변경하기</h4>
	        <form action="${pageContext.request.contextPath}/memberChangePw.do" method="post" onsubmit="return checkForm()">
	            <input type="text" id="authenCode" name="authenCode" placeholder="인증번호를 입력하세요">
	            <div>
	                <input type="password" id="newPw" name="newPw" placeholder="새로운 비밀번호">
	                <input type="password" id="checkPw" name="checkPw" placeholder="비밀번호 확인">
	            </div>
	            <div>
	                <input type="submit" value="변경하기">
	                <input type="reset" onclick="resetBtnHandler()" value="다시 입력">
	            </div>
	        </form>
	    </div>
	</div>
 </body>
${script}
<script> 

function mailsend() {
	alert("인증코드 메일로 전송했습니다.");
}

 function checkForm() {
	
	var regIdPw = /^[a-zA-Z0-9]{4,12}$/;
    var authenCode = $('#authenCode').val();
    var newPw = $('#newPw').val();
    var checkPw = $('#checkPw').val();

    if(authenCode == null || authenCode === "" || newPw == null || 
    		newPw === "" || checkPw == null || checkPw === "") {
        alert('모든 입력란을 작성하세요.');
        return false;
    }

    if(newPw !== checkPw) {
        alert('비밀번호가 일치하지 않습니다.!');
        return false;
    }
    if (!regIdPw.test(newPw) || !regIdPw.test(checkPw)) {
        alert("비밀번호는 4~12자 영문 대소문자, 숫자만 입력하세요.");
        return false;
    }
  
	    $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/memberChangePw.do',
        data: $('form').serialize(),
        success: function(response) {
            alert('비밀번호가 변경되었습니다.');
            closePopup4(); 
        },
        error: function() {
      
            alert('인증코드 확인해주세요. \n\n 안될시 관리자에게 문의바랍니다.');
        }
    });

    return false;
}
 
function closePopup4() {
    $('#popup4').hide(); 
}  

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
        
        function openPopup2() {
            var popup2 = document.getElementById("popup2");
            popup2.style.visibility = "visible";
            popup2.style.opacity = "1";
        }
        
        function closePopup2() {
            var popup2 = document.getElementById("popup2");
            popup2.style.visibility = "hidden";
            popup2.style.opacity = "0";
            
        }  function openPopup3() {
            var popup3 = document.getElementById("popup3");
            popup3.style.visibility = "visible";
            popup3.style.opacity = "1";
        }
        
        function closePopup3() {
            var popup3 = document.getElementById("popup3");
            popup3.style.visibility = "hidden";
            popup3.style.opacity = "0";
            
        } function openPopup4() {
            var popup4 = document.getElementById("popup4");
            popup4.style.visibility = "visible";
            popup4.style.opacity = "1";
        }
        
        function closePopup4() {
            var popup4 = document.getElementById("popup4");
            popup4.style.visibility = "hidden";
            popup4.style.opacity = "0";
        } 

        function idCheck() {
            var h_id = document.getElementById("h_id").value;
           
            // 중복 체크를 위한 AJAX 요청
            $.ajax({
                url: "./checkid.do",
                method: "POST",
                data: { h_id: h_id },
                dataType: "text",
             
                success: function (response) {
                    // 중복 체크 결과에 따라 처리
                    if (response === "duplicate") {
                        alert("이미 사용 중인 아이디입니다.");
                    } else  {
                        alert("사용 가능한 아이디입니다.");
                        document.getElementById("h_id").readOnly = true; 
                    }
                },
                error: function () {
                    alert("중복 체크 과정에서 오류가 발생했습니다.");
                }
            });
        }
   
        function emailCheck() {
            var h_email = document.getElementById("h_email").value;
           
            // 중복 체크를 위한 AJAX 요청
            $.ajax({
                url: "./emailcheck.do",
                method: "POST",
                data: { h_email: h_email },
                dataType: "text",
             
                success: function (response) {
                    // 중복 체크 결과에 따라 처리
                    if (response === "duplicate") {
                        alert("이미 사용 중인 이메일입니다.");
                    } else  {
                        alert("사용 가능한 이메일입니다.");
                        document.getElementById("h_email").readOnly = true; 
                    }
                },
                error: function () {
                    alert("중복 체크 과정에서 오류가 발생했습니다.");
                }
            });
        }
        function resetBtnHandler() {
        	alert("초기화 했습니다.");
        	document.querySelector("#h_id").readOnly = false;
        	document.querySelector("#h_email").readOnly = false;
        }
	function postOpener(e){
		e.preventDefault();
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var h_post = document.getElementById("h_post");
	            var h_address = document.getElementById("h_address")
	            console.log(data);
	            h_address.value = data.address;
				h_post.value = data.zonecode;
	        }
	    }).open();
	}

function validatePhoneNumber(phoneNumber) {
	  const regex = /^\d{3}-\d{3,4}-\d{4}$/;
	  return regex.test(phoneNumber);
	}

// 유효성 검사 메서드
function Validation(event) {
event.preventDefault();

    //변수에 저장
    var h_id = document.getElementById("h_id");
    var h_name = document.getElementById("h_name");
    var h_address = document.getElementById("h_address");
    var phoneNumber = document.getElementById("h_phone");
    var h_phone1 = document.getElementById("phone1");
    var h_phone2 = document.getElementById("phone2");
    var h_phone3 = document.getElementById("phone3");
    var h_pwd = document.getElementById("h_pwd");
    var h_cwp = document.getElementById("h_cwp");
    var h_email = document.getElementById("h_email");
    var h_post = document.getElementById("h_post");
    var h_e_code = document.getElementById("h_e_code");

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
  
    //병원이름 확인 = 한글과 영어만 가능하도록
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
    
    //우편번호 확인
    if (h_post.value.trim() === "") {
        alert("검색을 눌러 우편번호 주소를 입력해주세요.");
        h_post.focus();
        return false;
    }
    
    //주소 확인 = 한글과 영어만 가능하도록
    if (h_address.value.trim() === "") {
        alert("검색을 눌러 우편번호 주소를 입력해주세요.");
        h_address.focus();
        return false;
    }
    //사원번호 확인
    if (h_e_code.value.trim() === "") {
        alert("사원번호 입력하세요.");
        h_e_code.focus();
        return false;
    }
    else if (!regExp.test(h_e_code.value.trim())) {
        alert("사원번호는 숫자만 입력 가능합니다. 다시 입력해주세요.");
        h_e_code.focus();
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
    
	//휴대폰 번호확인
    var phoneNumber =
        h_phone1.value + "-" +
        h_phone2.value + "-" +
        h_phone3.value;
	
      if (phoneNumber === "--") {
        alert("휴대폰 번호를 입력하세요.");
        h_phone1.focus();
        return false;
      } else if (!validatePhoneNumber(phoneNumber)) {
        alert("유효하지 않은 휴대폰 번호입니다.");
        h_phone1.focus();
        return false;
      }
         
       h_phone.value = phoneNumber; 
   
    // 유효성 문제 없을 시 폼에 submit
    var joinForm = document.getElementById("joinForm");
    joinForm.submit();
    
}
    
    $(document).ready(function(){
    	$('.changepwdform').submit(function(){

findpassword();
 
    		return false;
    	});
    });
    
    function findpassword(){
    		var h_id = document.getElementById('h_id3').value;
    		var h_email = document.getElementById('h_email3').value;
    		$.ajax({
    			type:'POST',
    			url: "./memberForgotPwPro.do",
    			data: {"h_id":h_id,"h_email":h_email},
    			success: function(response){
    				openPopup4();
    				closePopup3();
    				mailsend();
    			},

    		}).fail(() => {alert("Id Email 확인해주세요.")});
    }
</script>
</html>