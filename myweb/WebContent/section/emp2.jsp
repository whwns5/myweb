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
			<h2>사원 관리 프로그램(Beans)</h2>
			<form name="empAdd2" action="/myweb/section_ok/empAdd2_ok.jsp">
				<fieldset>
					<legend>사원 등록</legend>
					<table>
						<tr>
							<th>사원이름</th>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<th>E-MAIL</th>
							<td><input type="text" name="email"></td>
						</tr>
						<tr>
							<th>부서명</th>
							<td><input type="text" name="dept"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="사원등록">
								<input type="reset" value="다시쓰기">
							</td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
		<article>
			<form name="empDel2" action="/myweb/section_ok/empDel2_ok.jsp">
				<fieldset>
					<legend>사원 퇴사</legend>
					<table>
						<tr>
							<th>사원이름</th>
							<td><input type="text" name="name" required="required"></td>
							<td><input type="submit" value="퇴사처리">
						</tr>
					</table>
 				</fieldset>
			</form>
		</article>
		<article>
			<fieldset>
				<legend>모든 사원 내역</legend>
				<h3><a href="/myweb/section/empList2.jsp">모든 사원 내역 보기</a></h3>
			</fieldset>
		</article>
		<article>
			<form name="empSearch" action="/myweb/section/empList2.jsp">
				<fieldset>
					<legend>사원 검색</legend>
					<table>
						<tr>
							<th>사원이름</th>
							<td><input type="text" name="name" required="required"></td>
							<td><input type="submit" value="사원검색"></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
		<article>
			<form name="empUpdate" action="/myweb/section/empUpdate2.jsp">
				<fieldset>
					<legend>사원 수정</legend>
					<table>
						<tr>
							<th>사원번호</th>
							<td><input type="text" name="idx" required="required"></td>
							<td><input type="submit" value=조회></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
	</section>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>