<%@page import="yong.bbs.BbsDTO_t"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="bdao_t" class="yong.bbs.BbsDAO_t" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<style>
h2{
	text-align: center;
}
table{
	width: 550px;
	margin: 0px auto;
	border-top: 2px double darkblue;
	border-bottom: 2px double darkblue;
	border-spacing: 0px;
}
table th{
	background: skyblue;
}
</style>
</head>
<%
	int totalCnt = bdao_t.getTotalCnt(); // 총 게시물 수
	//System.out.println(bdao_t.getTotalCnt());
	int listSize = 5; // 보여줄 리스트 수
	int pageSize = 5; // 보여줄 페이지 수
	String cp_s = request.getParameter("cp");
	if(cp_s == null || cp_s.equals("")){
		cp_s = "1";	
	}
	int cp = Integer.parseInt(cp_s); // 현재 위치

	int totalPage = totalCnt/listSize + 1; // 총 페이지 수
	if(totalCnt % listSize == 0)totalPage--;

	int userGroup = cp / pageSize; // 해당 페이지의 페이지 그룹
	if(cp % pageSize == 0)userGroup--;  
	
%>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article>
			<h2>자유 게시판</h2>
			<table>
				<thead>
					<tr>
						<th>순번</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					ArrayList<BbsDTO_t> arr = bdao_t.bbsList(cp, listSize);
					if(arr == null || arr.size() == 0 ){
				%>
						<tr>
							<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
						</tr>
				<%		
					} else {
						for(int i = 0 ; i < arr.size() ; i++){			
				%>		
							<tr>
								<td><%=arr.get(i).getIdx() %></td>
								<td><a href="/myweb/section/bbs/bbsContent_t.jsp?idx=<%=arr.get(i).getIdx() %>"><%=arr.get(i).getSubject() %></a></td>
								<td><%=arr.get(i).getWriter() %></td>
								<td><%=arr.get(i).getReadnum() %></td>
							</tr>
				<%			
						}
					}
				%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3" align="center">
						<%
						if(userGroup != 0){ // 현재 그룹이 첫 페이지 그룹이 아닌 경우
						%>
							<a href="/myweb/section/bbs/bbsList_t.jsp?cp=<%= (userGroup-1)*pageSize + pageSize %>">&lt;&lt;</a>
						<%
						}
						
						for(int i = (userGroup * pageSize) + 1 ; i <= (userGroup * pageSize) + pageSize ; i++){
						%>
							&nbsp;&nbsp;<a href="/myweb/section/bbs/bbsList_t.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
						<%
							if(i == totalPage)break;
						}
						
						if(userGroup != (totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)){ // 현재 그룹이 마지막 페이지가 해당하는 그룹에 해당되지 않는 경우
						%>
							<a href="/myweb/section/bbs/bbsList_t.jsp?cp=<%= ((userGroup+1)*pageSize) + 1 %>">&gt;&gt;</a>
						<%
						}
						%>
						</td>
						<td><a href="/myweb/section/bbs/bbsWrite_t.jsp">글쓰기</a></td>
					</tr>
				</tfoot>
			</table>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>