<%@page import="java.sql.Connection"%>
<%@page import="hospital.utils.ConnectionHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{

		
		Connection conn = ConnectionHelper.getConnection();
		
		out.print("<h1>DBCP Connection success!!!!!!<h1><br><br>");
	}catch (Exception e){
		e.printStackTrace();
	}
%>
<a href="history.do">MainPage</a>
</body>
</html>

