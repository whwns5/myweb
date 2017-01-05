<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/emp.css"> 

</head>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article>
		<h2>사원 관리 프로그램</h2>
		</article>
		<article>
			<form name="empAdd" action="/myweb/section_ok/empAdd_ok.jsp">
				<fieldset>
					<legend>사원 등록</legend>
					<table>
						<tr>
							<th>*사원 이름</th>					<!-- 필수 입력 -->
							<td><input type="text" name="name" required="required"></td>
						</tr>
						<tr>
							<th>*E-MAIL</th>
							<td><input type="text" name="email" required="required"></td>
						</tr>
						<tr>
							<th>*부서</th>
							<td><input type="text" name="dept" required="required"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"	value="사원등록">
														   <input type="reset" value="다시작성">
							</td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
		<article>
			<form name="empDel" action="/myweb/section_ok/empDel_ok.jsp">
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
				<h3><a href="/myweb/section/empList.jsp">모든 사원 내역 보기</a></h3>
			</fieldset>
		</article>
		<article>
			<form name="empSearch" action="/myweb/section/empList.jsp">
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
			<form name="empUpdate" action="/myweb/section/empUpdate.jsp">
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