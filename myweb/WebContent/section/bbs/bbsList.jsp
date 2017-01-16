<%@page import="yong.bbs.BbsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="yong.bbs.BbsDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/section/bbs/bbsList.css?ver=2">
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<script>
	function show_bbsWrite() {
		location.href = '/myweb/section/bbs/bbsWrite.jsp';
	}
</script>
</head>
<%
	// startPage
	// endPage
	// pageSize 
	//String pageNum
	// currentPage
	
	int pageSize = 10; // 한 화면에 보여질 최대 게시물 수
	int totalContent = bdao.totalContent(); // 총 게시글 수
	int totalPage = 1; // 페이지 갯수
	if(totalContent != 0){
		totalPage = (int) Math.ceil(totalContent / (double)pageSize);
	} else {
		totalPage = 1;
	}

	
	String currentPage_s = request.getParameter("currentPage"); // 현재 페이지
	int currentPage = 1;
	if(currentPage_s != null){ // 파라미터가 존재할 경우
		currentPage = Integer.parseInt(currentPage_s); // 받아온 값으로 교체
	}
	String currentPageDept_s = request.getParameter("currentPageDept"); // 현재 페이지들의 댑스
	int currentPageDept = 0;
	if(currentPageDept_s != null){
		currentPageDept = Integer.parseInt(currentPageDept_s);
	}
	
	
	
%>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article class="form-container">
			<div class="form-title"><h2>자유 게시판</h2></div>
			<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
						<th>조회</th>
						<th>추천</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<BbsDTO> arrayBdto = null;
						arrayBdto = (ArrayList<BbsDTO>) bdao.bbsList(currentPage, pageSize);
						
						if(arrayBdto == null || arrayBdto.size() == 0){
					%>
							<tr>
								<td colspan="6">게시글이 없습니다.</td>
							</tr>	
					<%
						} else {
							for(int i = 0 ; i < arrayBdto.size() ; i++){			
					%>
								<tr>
									<td><%=arrayBdto.get(i).getIdx() %></td>
									<td><a href="/myweb/section/bbs/bbsContent.jsp?idx=<%=arrayBdto.get(i).getIdx() %>"><%=arrayBdto.get(i).getSubject() %></a></td>
									<td><%=arrayBdto.get(i).getWriter() %></td>
									<td><%=arrayBdto.get(i).getWritedate() %></td>
									<td><%=arrayBdto.get(i).getReadnum() %></td>
									<td>0</td>
								</tr>
					<%
							}
						}
					%>
					<tr>
						<td colspan="6">
						<div class="submit-container">
							<input class="submit-button" type="button" value="글쓰기" onclick="show_bbsWrite();">
						</div>	
						</td>
					</tr>
					<tr>
						<td colspan="6">
					<% 
							if(currentPageDept > 0){
					%>
								<a href="/myweb/section/bbs/bbsList.jsp?currentPage=<%= (currentPageDept*5) - 5 + 1 %>&currentPageDept=<%=currentPageDept - 1%>">이전으로</a>
					<%			
							} else {
					%>
								<a href="#">이전으로</a>
					<%			
							}
					
							for(int i = (currentPageDept*5) + 1 ; i <= (currentPageDept*5) + 5; i++){
								if( i <= totalPage){										
					%>
								<a class="aRed" href="/myweb/section/bbs/bbsList.jsp?currentPage=<%=i%>&currentPageDept=<%=currentPageDept%>">[<%=i%>]</a>
					<%
								} 
							}
							
							if( (currentPageDept+1)*5 < totalPage ) {
					%>
								<a href="/myweb/section/bbs/bbsList.jsp?currentPage=<%= (currentPageDept*5) + 5 + 1 %>&currentPageDept=<%=currentPageDept + 1%>">다음으로</a>
					<%			
							} else {
					%>
								<a href="#">다음으로</a>
					<%		
							}
							
					%>
					
							
						</td>
					</tr>
				</tbody>
			</table>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>