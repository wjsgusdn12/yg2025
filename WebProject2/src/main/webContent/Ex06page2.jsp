<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int a = Integer.parseInt(request.getParameter("a"));
	int b = Integer.parseInt(request.getParameter("b"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	a : <%=a %><br/>
	b : <%=b %><br/>
	<%
		int total = 0;
		for(int i=a; i<=b; i++){
			total += i;
		}
		out.print("a 부터 b 까지 의 합 : " + total);
	%>
</body>
</html>