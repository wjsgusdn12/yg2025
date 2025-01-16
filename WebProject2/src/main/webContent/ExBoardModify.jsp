<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if(session.getAttribute("loginId")==null){ %>
<script> alert("로그인하세요"); location.href="ExLogin.jsp"; </script>
<% } %>
    
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.getBoardDtoByBno(bno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
	$(function(){
		$(".modify_button").click(function(){
			
		});
	});
</script>
</head>
<body>
	<h1>글 수정하기</h1>
	<form action="ExBoardModifyAction.jsp" method="post">
		<input type="hidden" name="bno" value="<%=dto.getBno() %>"/><br/>
		<div>제목 : <input type="text" name="title" value="<%=dto.getTitle() %>"/></div>
		<div>내용 : <input type="text" name="content" value="<%=dto.getContent() %>"/></div>
		<div>작성자 : <%=dto.getWriter() %></div>
		<button class="modify_button">수정완료</button>
	</form>
</body>
</html>