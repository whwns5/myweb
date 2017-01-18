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
			<h2>자유 게시판 글쓰기</h2>
			<form name="bbsWrite_t" action="/myweb/section/bbs_t/bbsWrite_ok_t.jsp">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" required="required"></td>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" required="required"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" align="left">
						<input type="text" name="subject" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="15" cols="50" name="content" required="required"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" value="작성완료">
						<input type="reset" value="다시작성">
					</td>
		 		</tr>
			</table>
				
			</form>
		</article>
	</section>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>