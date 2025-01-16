<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = new MemberDao();
	boolean result = dao.loginCheck(id, pw);
	
	if(result){
		session.setAttribute("loginId", id);
%>
<!--------------------- jsp 영역아님 ------------------------>
	
	<script>
		alert("로그인되었습니다");
		location.href="ExBoardList.jsp";
	</script>
<!--------------------- jsp 영역아님 ------------------------>
<%
	}else{
%>
<!--------------------- jsp 영역아님 ------------------------>
	<Script>
		alert("로그인 실패");
		location.href="ExLogin.jsp";
	</Script>
<!--------------------- jsp 영역아님 ------------------------>
<%
	}
%>