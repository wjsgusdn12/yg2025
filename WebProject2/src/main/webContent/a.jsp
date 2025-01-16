<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//RequestDispatcher rd = request.getRequestDispatcher("b.jsp");
	request.setAttribute("result", "ture");
	//rd.forward(request, response);  // 주소창에서 a.jsp 라고 치면 그대로 뜸, 서버간에 이동이라 웹브라우저는 그걸 모름
	response.sendRedirect("b.jsp"); // 주소창에 a.jsp 라고 치면 b.jsp(받은 html 의 주소)로 뜸
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <script>location.href="b.jsp";</script> --%>
	<%-- <a href="b.jsp">클릭</a> --%>
	
</body>
</html>