<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article>
			<h2>계산 결과</h2>
			<% 
				String num1_s = request.getParameter("input_num_1");
				String num2_s = request.getParameter("input_num_2");
			
				int num1 = Integer.parseInt(num1_s);
				int num2 = Integer.parseInt(num2_s);
				// int num2 = Integer.parseInt(request.getParameter("input_num_2"));
				// 웹에서는 추천되는 형식은 아니다.
				String oper = request.getParameter("oper");
				char oper_c = oper.charAt(0);
				
				int result = 0;

				switch(oper_c){
					case '+': result = num1 + num2; break;			
					case '-': result = num1 - num2; break;
					case '*': result = num1 * num2; break;
					case '/': result = num1 / num2; break;			
				}
			%>
			<h3><%=num1%>&nbsp;&nbsp;<%=oper%>&nbsp;&nbsp;<%=num2%>&nbsp;&nbsp;=&nbsp;&nbsp;<%=result%></h3>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>