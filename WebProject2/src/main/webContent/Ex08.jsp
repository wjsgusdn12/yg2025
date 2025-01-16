<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fail = request.getParameter("fail"); //"true"
	if(fail != null && fail.equals("true")){
%>
	<script>alert("로그인 정보가 잘못되었습니다");</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex08Servlet" method="post">
		ID : <input type="text" name="id"/><br/>
		PW : <input type="password" name="pw"/><br/>
		<input type="submit" nalue="로그인"/>
	</form>
</body>
</html>