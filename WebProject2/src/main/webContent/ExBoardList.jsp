<%@page import="java.util.ArrayList"%>
<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if(session.getAttribute("loginId")==null){ %>
<script> alert("로그인하세요"); location.href="ExLogin.jsp"; </script>
<% } %>
    
<%
	String id = (String)session.getAttribute("loginId");
	int pageNum = 1;
	try{
		 pageNum = Integer.parseInt(request.getParameter("page"));
	}catch(NumberFormatException e){
		
	}
	BoardDao dao = new BoardDao();
	ArrayList<BoardDto> dto = dao.getBoardListByPageNumber(pageNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 내용 게시판 crud</title>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
	$(function(){
		$("td").click(function(){
			let bno = $(this).parent().find(".bno").text();
			location.href="ExBoardDetail.jsp?bno="+bno;
		});
		$(".register_button").click(function(){
			location.href="ExBoardWrite.jsp";
		});
		$("#btn_logout").click(function(){
			location.href="logout.jsp";
		});
	});
</script>
<style>
	table{
		border-collapse:collapse;
	}
	th,td{
		padding:10px;
		border:1px solid gray;
	}
	button{
		background-color:white;
		margin:10px;
		border-radius:5px;
	}
	.div_pagination{
		display:flex;
		align-items:center;
		justidfy-content:center;
		padding:5px;
		gap:10px;
		margin:0px 0px 0px 20px;
	}
	.reply_cnt{
		color:red;
	}
</style>
</head>
<body>
	<button id="btn_logout">로그아웃</button>
	<span><%=id %>님 반갑습니다</span>
	<h1>게시글 목록보기 (<%=pageNum %>페이지)</h1>
	<button class="register_button">글 작성하기</button>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<% for(BoardDto dtos : dto){%>
			<tr>
				<td class="bno"><%=dtos.getBno() %></td>
				<td>
					<%=dtos.getTitle() %>
					<%if(dao.getReplyCountByBno(dtos.getBno())>0) {%>
						<span class="reply_cnt">[<%=dao.getReplyCountByBno(dtos.getBno()) %>]</span>
					<% }%>
				</td>
				<td><%=dtos.getWriter() %></td>
			</tr>
		<% }%>
	</table>
	<div class="div_pagination">
		<%
			/* int countBoard = dao.getCountBoard(); // 모든 게시글의 개수
			int startPageNum = (pageNum/5*5 - (pageNum%5==0 ? 5:0))+1;
			int endPageNum = startPageNum + 4;
			int lastPageNum = countBoard/15 + (countBoard%15!=0 ? 1:0);
			if(endPageNum > lastPageNum){
				endPageNum = lastPageNum;
			} */
			int countBoard = dao.getCountBoard();
			int startPageNum = (pageNum/7*7 - (pageNum%7==0?7:0))+1;
			int endPageNum = startPageNum+6;
			int lastPageNum = countBoard/10 + (countBoard%10!=0?1:0);
			if(endPageNum > lastPageNum){
				endPageNum = lastPageNum;
			}
			// 현재페이지 : pageNum
		%>
		<%-- <%if(startPageNum > 1){ %>
			<a href="ExBoardList.jsp?page=<%=startPageNum-1%>">&lt;&lt;</a>
		<%} %> --%>
		
		<%if(pageNum != 1){ %>
			<a href="ExBoardList.jsp?pageNum=<%=pageNum-1%>"> < </a>
		<% }%>
		
		<%for(int i=startPageNum; i<=endPageNum; i++){ %>
			<%if(pageNum != i){ %>
				<a href="ExBoardList.jsp?page=<%=i%>"><%=i%></a>
			<%}else{ %>
				<b><%=i %></b>
			<%} %>
		<%} %>
		
		<%if(pageNum != lastPageNum){ %>
			<a href="ExBoardList.jsp?pageNum=<%=pageNum+1%>"> > </a>
		<% }%>
		
		<%-- <%if(lastPageNum >= startPageNum+5){ %>
			<a href="ExBoardList.jsp?page=<%=endPageNum+1%>">&gt;&gt;</a>
		<%} %> --%>
	</div>
</body>
</html>