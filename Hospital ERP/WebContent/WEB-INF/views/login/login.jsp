<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="./resources/Login.css" rel="stylesheet" type="text/css">
<head>
<link rel="icon" href="${pageContext.request.contextPath }/image/hospital.png"/> <!-- //파비콘임 -->
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
                        <form id="login-form" class="form" action="./loginok.do" method="post">
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
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="로그인">
                            </div>
                            <div id="register-link" class="text-right"><br>
                                <a href="#" class="text-info">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#" class="text-info">ID/PW찾기</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>