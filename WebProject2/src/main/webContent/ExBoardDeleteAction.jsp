<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDao dao = new BoardDao();
	dao.deleteBoardByBno(bno);
%>
<script>
	alert("삭제되었습니다");
	location.href="ExBoardList.jsp";
</script>