<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	MemberDao dao = new MemberDao();
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	boolean login = dao.loginCheck(id, pw);
    	String name = dao.loginName(id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 성공? <%=login %></h1>
	<h2><%=name %> 님 안녕하세요 !</h2>
</body>
</html>