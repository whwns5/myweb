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
			<h2>beanTest.jsp</h2>
		</article>
		<article>
			<form name="fm" action="/myweb/section_ok/beanTest_ok.jsp">
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="text" name="age"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="addr"></td>
					</tr>
					<tr>
						<th>전번</th>
						<td><input type="text" name="tel"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="전달"></td>
					</tr>
				</table>
			</form>
		</article>
	</section>

	<%@ include file="/footer/footer.jsp" %>
</body>
</html>