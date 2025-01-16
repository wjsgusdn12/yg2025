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
	let current_page = 1;
	
	window.onscroll = function () {
	    const totalPageHeight = document.body.scrollHeight;
	    const scrollPoint = window.scrollY + window.innerHeight;
	    if (scrollPoint >= totalPageHeight) {
	       /* alert("요청 page = " + ++current_page); */
	    	current_page++;
	       
	       $.ajax({
	    	   type:'post',
	    	   url:'ExAjaxBoardListServlet',
	    	   data:{"page_num":current_page},
	    	   success:function(obj){
	    		   console.log(obj);
	    		   
	    		   for(let i=0; i<=obj.length-1; i++){
	    			   let str = '<tr>' +
	    			   			'<td class="bno">'+ obj[i].bno +'</td>' + 
	    			   			'<td>'+ obj[i].title +'</td>' + 
	    			   			'<td>'+ obj[i].writer +'</td>' + 
								'</tr>';
						$("#table1").append(str);
	    		   }
	    		   
	    	   },
	    	   error:function(r,s,e){
	    		   alert("[에러] code : " + r.status 
	    				+ ", message : " + r.responseText
	    				+ ", error : " + e);
	    	   }
	       });
	    }
	}
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
	<h1>게시글 목록보기 (무한스크롤)</h1>
	<button class="register_button">글 작성하기</button>
	<table id="table1">
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
						<%-- <span class="reply_cnt">[<%=dao.getReplyCountByBno(dtos.getBno()) %>]</span> --%>
					<% }%>
				</td>
				<td><%=dtos.getWriter() %></td>
			</tr>
		<% }%>
	</table>
</body>
</html>