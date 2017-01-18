<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.bbs.*" %>
<jsp:useBean id="bdao_t" class="yong.bbs.BbsDAO_t" scope="session"/>
<%
	String cp = request.getParameter("cp");
	String idx_s = request.getParameter("idx");
	if(idx_s == null || idx_s.equals("")){
		idx_s = "0";
	}
	
	int idx = Integer.parseInt(idx_s);
	
	BbsDTO_t dto_t = bdao_t.bbsContent(idx);
	if(dto_t == null){
%>	
		<script>
			window.alert('잘못된 접근방식 또는 삭제된 게시글입니다.');
		</script>
<%
		return;
	} 
%>
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
			<h2>수정하기</h2>
			<form name="bbsUpdate" action="/myweb/section/bbs_t/bbsUpdate_ok.jsp">
			<input type="hidden" name="cp" value="<%=cp%>">
			<input type="hidden" name="idx" value="<%=dto_t.getIdx()%>">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" readonly="readonly" value="<%=dto_t.getWriter()%>"></td>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" readonly="readonly" value="<%=dto_t.getPwd()%>"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" align="left">
						<input type="text" name="subject" required="required" value="<%=dto_t.getSubject()%>">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="15" cols="50" name="content" required="required"><%=dto_t.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" value="수정완료">
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