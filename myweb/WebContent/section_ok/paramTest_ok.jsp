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
			<h2>넘어온 파라미터 확인하기</h2>
			
			<%
				String name = request.getParameter("name");
				String pwd = request.getParameter("pwd");
				String se = request.getParameter("se");
				String cb[] = request.getParameterValues("cb");
				String cbStr = "";
				if( cb != null ){
					for(int i = 0 ; i < cb.length ; i++){
						cbStr += cb[i] + " ";
					}
				}else{
					cbStr += "선택한 취미가 없습니다.";
				}
			%>
			<h4>넘어온 이름값 : <%=name%></h4>
			<h4>넘어온 비밀번호 : <%=pwd%></h4>
			<h4>넘어온 성별 : <%=se%></h4>
			<h4>넘어온 취미 : <%=cbStr%></h4>
			<h4>넘어온 취미 : 
			<%
				if( cb != null ){
					for(int i = 0 ; i < cb.length ; i++){
						out.print(cb[i] + "&nbsp;&nbsp;&nbsp;&nbsp;");
					}
				}else{
					out.println("선택한 취미가 없습니다.");
				}
			%>
			</h4>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp"%>
</body>
</html>