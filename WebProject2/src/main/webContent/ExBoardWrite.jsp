<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("loginId")==null){ %>
<script> alert("로그인하세요"); location.href="ExLogin.jsp"; </script>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<form action="ExBoardWriteAction.jsp" method="post">
		<h1>글 작성하기</h1>
		제목 : <input type="text" name="title"/><br/>
		내용 : <textarea rows="10" name="content"></textarea><br/>
		작성자 : <input type="text" name="writer" value="YG"/>
		<button>작성완료</button>
	</form>
</body>
</html>