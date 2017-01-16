<%@page import="yong.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="yong.bbs.BbsDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<script>
	function show_bbsList() {
		location.href = '/myweb/section/bbs/bbsList.jsp';
	}
</script>
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article>
			<h2>본문 보기</h2>
		</article>
		<article>
			<table>
			<%
				String input_idx = request.getParameter("idx");
				BbsDTO bdto = null;
				if(input_idx != null){
					bdto = (BbsDTO) bdao.bbsContent(input_idx);
					
					if(bdto != null){
			%>
						<tr>
							<th>번호</th>
							<td><%=bdto.getIdx() %></td>
							<th>날짜</th>
							<td><%=bdto.getWritedate() %></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=bdto.getWriter() %></td>
							<th>조회수</th>
							<td><%=bdto.getReadnum() %></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><%=bdto.getSubject() %></td>
						</tr>
						<tr>
							<td colspan="4">
								<textarea rows="30" cols="80" name="content" readonly="readonly"><%=bdto.getContent() %></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<input type="button" value="목록보기" onclick="show_bbsList();">
							</td>
						</tr>
			<%
					} else {
			%>
						
			<%
					}
				}
			%>
			</table>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>