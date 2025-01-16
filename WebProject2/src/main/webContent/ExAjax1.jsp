<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script>
		$(function(){
			$("#btn1").click(function(){
				$.ajax({
					type:'post',
					url:'ExAjaxServlet',
					success:function(data){
						//alert("성공!");
						console.log(data);
						alert(data.check); // !!
						alert(data.check2); // ??
					},
					error:function(r,s,e){
						alert("에러!");
					}
				});
			});
			
		});
	</script>
	<style>
		#btn1{
			
		}
	</style>
</head>
<body>
	<button id="btn1">버튼1</button>
</body>
</html>