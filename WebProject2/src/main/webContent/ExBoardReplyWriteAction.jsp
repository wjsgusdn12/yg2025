<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int bno = Integer.parseInt(request.getParameter("bno"));
	String content = request.getParameter("content");
	String writer = (String)session.getAttribute("loginId");
	
	BoardDao dao = new BoardDao();
	dao.registerReply(bno, writer, content);
%>
<script>
	alert("댓글이 등록되었습니다");
	location.href="ExBoardDetail.jsp?bno=<%=bno%>";
</script>