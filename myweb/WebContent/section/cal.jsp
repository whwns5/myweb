<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/cal.css">
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article>
			<h2 class="cal_h2">사칙 계산기</h2>
			<form name="fm" action="/myweb/section_ok/cal_ok.jsp">
				<fieldset>
					<legend>계산기</legend>
					<input type="text" size="5" name="input_num_1">&nbsp;&nbsp;
					<select name="oper">
						<option value="+" >+</option>
						<option value="-">-</option>
						<option value="*">*</option>
						<option value="/">/</option>
					</select>&nbsp;&nbsp;
					<input type="text" size="5" name="input_num_2">&nbsp;&nbsp;
					=
					&nbsp;&nbsp; 
					<input type="submit" value="계산">
				</fieldset>
			</form>	
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>