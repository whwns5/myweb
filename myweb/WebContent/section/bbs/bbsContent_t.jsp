<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.bbs.*" %>
<jsp:useBean id="bdao_t" class="yong.bbs.BbsDAO_t" scope="session"/>
<%
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
			<h2>자유게시판 본문</h2>
			<table border="1" bordercolor="blue" width="550" cellspacing="0">
				<tr>
					<th>번호</th>
					<td><%=dto_t.getIdx() %></td>
					<th>작성날짜</th>
					<td><%=dto_t.getWritedate() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=dto_t.getWriter() %></td>
					<th>조회수</th>
					<td><%=dto_t.getReadnum() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" align="left"><%=dto_t.getSubject()%></td>
				</tr>
				<tr height="250px">
					<td colspan="4" align="left" valign="top">
					 	<!-- <pre> --><%=dto_t.getContent().replaceAll("\n", "<br>")%><!-- </pre> -->
					 </td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						목록보기
					</td>
				</tr>
			</table>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>