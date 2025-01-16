<%@page import="dto.ReplyDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if(session.getAttribute("loginId")==null){ %>
<script> alert("로그인하세요"); location.href="ExLogin.jsp"; </script>
<% } %>
    
<%
	int bno = 0;
	try{
		bno = Integer.parseInt(request.getParameter("bno"));
	}catch(NumberFormatException e){
		RequestDispatcher rd = request.getRequestDispatcher("ExBoardList.jsp");
		rd.forward(request, response);
	}
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.getBoardDtoByBno(bno);
	
	ArrayList<ReplyDto> listReplies = dao.getReplyList(bno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
	$(function(){
		$(".list_button").click(function(){
			/* location.href="ExBoardList.jsp"; */
			history.back();
		});
		$(".modify_button").click(function(){
			location.href="ExBoardModify.jsp?bno=<%=bno%>";
		});
		$(".delete_button").click(function(){
			let yn = confirm("정말 삭제하시겠습니까?");
			if(yn==true){
				location.href="ExBoardDeleteAction.jsp?bno=<%=bno%>";
			}
			
		});
	});
</script>
</head>
<body>
	<h1>글 상세보기</h1>
	<div>글번호 : <%=dto.getBno() %></div>
	<div>제목 : <%=dto.getTitle() %></div>
	<div>내용 : <%=dto.getContent() %></div>
	<div>작성자 : <%=dto.getWriter() %></div>
	<button class="list_button">목록보기</button>
	<button class="modify_button">수정하기</button>
	<button class="delete_button">삭제하기</button>
	<br/>
	<div>
		<form action="ExBoardReplyWriteAction.jsp" method="post">
			<input type="hidden" name="bno" value="<%=dto.getBno()%>"/>
			댓글작성
			<textarea name="content"></textarea>
			<input type="submit" value="작성완료"/>
		</form>
	</div>
	<div>
		<% for(ReplyDto dtoList : listReplies){%>
			<div>
		■ <%= dtoList.getContent()%> -   <%= dtoList.getWriter()%> (  <%=dtoList.getWriterDate() %> )
			</div>
		<% }%>
	</div>
</body>
</html>