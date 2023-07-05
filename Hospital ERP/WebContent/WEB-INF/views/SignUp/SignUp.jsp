<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="./resources/SignUp.css" rel="stylesheet" type="text/css">
<head>
<title>회원가입</title>

</head>
<body>
	<button onclick="openPopup()">회원가입</button>
	
	<div id="popup" class="popup-overlay">
		<div class="popup-content">
			<span class="close-btn" onclick="closePopup()">&times;</span>
			<h2>회원가입</h2>
			<form>
				<input type="text" placeholder="ID">
				<input id="pwd" type="password" placeholder="비밀번호"> <input id="pwd" type="password" placeholder="비밀번호 확인">
				<input type="text" placeholder="병원명"> 
				<input type="text" placeholder="전화번호">
				<input type="email" placeholder="병원명">
				<input type="email" placeholder="병원명">
				<input type="tel" placeholder="병원명">
				
				<!-- <select>
					<option value="male">남성</option>
					<option value="female">여성</option>
				</select> -->
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