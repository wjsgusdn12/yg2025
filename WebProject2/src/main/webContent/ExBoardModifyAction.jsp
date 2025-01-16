<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int bno = Integer.parseInt(request.getParameter("bno"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.getBoardDtoByBno(bno);
	dao.modifyBoardByBno(bno, title, content);
	
%>
<script>
	alert("수정완료하였습니다");
	location.href="ExBoardDetail.jsp?bno=<%=dto.getBno()%>";
</script>