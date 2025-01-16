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
		$(".btn").click(function(){
			let bno = $(".bno").val();
			$.ajax({
				type:'post',
				data:{"bno":bno},
				url:'ExAjaxServlet2_1',
				success:function(data){
					let str = 	"글번호 : "+data.bno+"<br/>"
							+	"제목 : "+data.title+"<br/>"
							+ 	"내용 : "+data.content+"<br/>"
							+ 	"작성자 : "+data.writer+" ";
					alert(str);
					$(".div").html(str);
				},
				error:function(r,s,e){
					alert("에러");
				}
			}); 
		});
	});
</script>
</head>
<body>
	BNO : <input class="bno" type="text" name="bno"/>
	<button class="btn">버튼</button>
	<div class="div"></div>
</body>
</html>