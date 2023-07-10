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
			<input class="formBtn" type="button" value="중복체크" name="h_idcheck" id="h_idcheck" onClick="idCheck()">  
			</div>
			<div>
				<input type="password" name="h_pwd" id="h_pwd" placeholder="비밀번호" >
				<input type="password" name="h_cwp" id="h_cwp" placeholder="비밀번호 확인" >
			</div>
			<input type="text" name="h_name" id="h_name" placeholder="병원이름"> 
			<div>
			<input type="text" readonly name="h_post" id="h_post" placeholder="우편번호">
			<button class="formBtn" onclick="postOpener(event)">검색</button>
			</div>
			<input type="text" readonly name="h_address" id="h_address" placeholder="주소">
			<input type="text" name="h_e_code" id="h_e_code" placeholder="직원코드">
			<input type="email" name="h_email" id="h_email" placeholder="이메일">
			
			  <div class="phone">
            <input id="phone1" type="text" size="1" maxlength="3" oninput="changePhone1()"> -
            <input id="phone2" type="text" size="3" maxlength="4" oninput="changePhone2()"> -
            <input id="phone3" type="text" size="3" maxlength="4" oninput="changePhone3()">
            <input id="h_phone" type="hidden" name="h_phone"> <!-- 속성 추가 -->
       		 </div>
        <div class="auth">
            <div id="certificationNumber">000000</div>
            <button disabled id="sendMessage" onclick="getToken()">인증번호 전송</button>
        </div>

        <div class="timer">
            <div id="timeLimit">03:00</div>
            <button disabled id="completion" onclick="checkCompletion()">인증확인</button>
        </div>
        
			<!-- <input type="text" name="h_phone" id="h_phone" placeholder="연락처"> -->
			
			
			<div>
			<input type="submit" onclick="Validation(event);" value="가입" id="signUpButton">
			<!-- <input type="submit" onclick="Validation(event);" value="가입"> -->
            <input type="reset" onclick="alert('초기화 했습니다.')" value="다시 입력">
            </div>
		</form>
	</div>
</div>
</body>
</html>
<script>
//휴대폰 번호 입력 부분
function changePhone1(){
    const phone1 = document.getElementById("phone1").value // 010
    if(phone1.length === 3){
        document.getElementById("phone2").focus();
    }
}
function changePhone2(){
    const phone2 = document.getElementById("phone2").value // 010
    if(phone2.length === 4){
        document.getElementById("phone3").focus();
    }
}
function changePhone3(){
    const phone3 = document.getElementById("phone3").value // 010
    if(phone3.length === 4){
      document.getElementById("sendMessage").focus();
      document.getElementById("sendMessage").setAttribute("style","background-color:yellow;")
      document.getElementById("sendMessage").disabled = false;
    }
}

// 문자인증+타이머 부분
function initButton(){
  document.getElementById("sendMessage").disabled = true;
  document.getElementById("completion").disabled = true;
  document.getElementById("certificationNumber").innerHTML = "000000";
  document.getElementById("timeLimit").innerHTML = "03:00";
  document.getElementById("sendMessage").setAttribute("style","background-color:none;")
  document.getElementById("completion").setAttribute("style","background-color:none;")
}

let processID = -1;

const getToken = () => {

  // 인증확인 버튼 활성화
  document.getElementById("completion").setAttribute("style","background-color:yellow;")
  document.getElementById("completion").disabled = false;

  if (processID != -1) clearInterval(processID);
  const token = String(Math.floor(Math.random() * 1000000)).padStart(6, "0");
  document.getElementById("certificationNumber").innerText = token;
  let time = 180;
  processID = setInterval(function () {
    if (time < 0 || document.getElementById("sendMessage").disabled) {
      clearInterval(processID);
      initButton();
      return;
    }
    let mm = String(Math.floor(time / 60)).padStart(2, "0");
    let ss = String(time % 60).padStart(2, "0");
    let result = mm + ":" + ss;
    document.getElementById("timeLimit").innerText = result;
    time--;
  }, 50);
};

/* function checkCompletion() {
	  // 인증번호 확인
	  var enteredToken = document.getElementById("enteredToken").value;
	  var certificationNumber = document.getElementById("certificationNumber").innerText;
	  if (enteredToken !== certificationNumber) {
	    alert("인증번호가 일치하지 않습니다.");
	    return;
	  }
 */
function checkCompletion(){
  alert("문자 인증이 완료되었습니다.")
  initButton();
  document.getElementById("completion").innerHTML="인증완료"
  document.getElementById("signUpButton2").disabled = false;
  document.getElementById("signUpButton2").setAttribute("style","background-color:yellow;")
}
</script>
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
<!--         <script type="text/javascript">
	$(function(){
		$('#id').blur(function(){
			$.ajax(
					{
						type: 'post',
						url : 'MemberIdCheckAction.do' ,
						data: { id : $('#id').val() } ,
						dataType : 'xml' ,
						success: function(data) {
							console.log(data);
							var x = $(data).find('id').text();
							console.log(x);
							
							if( x == 'y' ) {
								$('#help_text').html('사용가능 아이디');
							} else {
								$('#help_text').html('<b>사용불가능</b>');
								$('#id').text();
							}
						}
					}		
			);
		});
	});
</script> -->
        <script>
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
                    } else {
                        alert("사용 가능한 아이디입니다.");
                    }
                },
                error: function () {
                    alert("중복 체크 과정에서 오류가 발생했습니다.");
                }
            });
        }
    </script> 

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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

</script>
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

function validatePhoneNumber(phoneNumber) {
	  const regex = /^\d{3}-\d{3,4}-\d{4}$/;
	  return regex.test(phoneNumber);
	}
// 유효성 검사 메서드
function Validation(event) {
event.preventDefault();

    //변수에 저장
    var h_id = document.getElementById("h_id")
    var h_name = document.getElementById("h_name")
    var h_address = document.getElementById("h_address")
    /* var h_phone = document.getElementById("h_phone") */
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
    /* else if (!regExp.test(h_post.value.trim())) {
        alert("우편번호는 숫자만 입력 가능합니다. 다시 입력해주세요.");
        h_post.focus();
        return false;
    } */

    //주소 확인 = 한글과 영어만 가능하도록
    if (h_address.value.trim() === "") {
        alert("검색을 눌러 우편번호 주소를 입력해주세요.");
        h_address.focus();
        return false;
    }
    //의사코드 확인
    if (h_e_code.value.trim() === "") {
        alert("직원명 입력하세요.");
        h_e_code.focus();
        return false;
    }
    else if (!regExp.test(h_e_code.value.trim())) {
        alert("직원명 숫자만 입력 가능합니다. 다시 입력해주세요.");
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
   
    

 /*    else if (!regName.test(h_address.value.trim())) {
        alert("병원 주소는 최소 2글자 이상, 한글과 영어만 입력하세요.");
        h_post.focus();
        return false;
    } */
    
    
    
    var phoneNumber =
        h_phone1.value.trim() +
        "-" +
        h_phone2.value.trim() +
        "-" +
        h_phone3.value.trim();
      if (phoneNumber === "--") {
        alert("휴대폰 번호를 입력하세요.");
        h_phone1.focus();
        return false;
      } else if (!validatePhoneNumber(phoneNumber)) {
        alert("유효하지 않은 휴대폰 번호입니다.");
        h_phone1.focus();
        return false;
      }

    //휴대폰 번호 확인
    /*  if (h_phone.value.trim() === "") {
        alert("전화번호를 입력하세요.");
        h_phone.focus();
        return false;
    }
     else if (!regExp.test(h_phone.value.trim())) {
        alert("전화번호는 숫자만 입력 가능합니다. 다시 입력해주세요.");
        h_phone.focus();
        return false;
   */
   
   
    // 유효성 문제 없을 시 폼에 submit
    var joinForm = document.getElementById("joinForm");
    joinForm.submit();
   
}
</script>
