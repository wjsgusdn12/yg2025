<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	form{
		padding : 20px;
		font-size:20px;
		border:1px solid #3f3f3f;
		width:280px;
	}
</style>
</head>
<body>
	<form action="ExLoginAction.jsp" method="post">
		ID : <input type="text" name="id"/><br/>
		PW : <input type="password" name="pw"/><br/>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>