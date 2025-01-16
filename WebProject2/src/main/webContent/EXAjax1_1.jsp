<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
	$(function(){
		$(".btn").click(function(){
			$.ajax({
				type:'post',
				url:'ExAjaxServlet1_1',
				success:function(data){
					alert(data.check);
				},
				error:function(r,s,e){
					alert("에러!");
				}
			});
		});
	});
</script>
</head>
<body>
	<button class="btn">버튼</button>
</body>
</html>