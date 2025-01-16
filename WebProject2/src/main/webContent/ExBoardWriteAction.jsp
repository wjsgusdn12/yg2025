<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	BoardDao dao = new BoardDao();
	dao.registerBoard(title, content, writer);
%>
<script>
	alert("글 작성이 완료되었습니다");
	location.href="ExBoardList.jsp";
</script>