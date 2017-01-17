<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int totalCnt = 62; // 총 게시물 수
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
	<h4>총 게시물 수 : <%=totalCnt %></h4>
	<h4>보여줄 리스트 수 : <%=listSize %>/ 보여줄 페이지 수 : <%=pageSize %></h4>
	<h4>총 페이지 수 : <%=totalPage %></h4>
	<h4>현재 위치 : <%=cp %></h4>
	<hr>
	<%
	if(userGroup != 0){
	%>
		<a href="/myweb/section/bbs/pageTest.jsp?cp=<%= (userGroup-1)*pageSize + pageSize %>">&lt;&lt;</a>
	<%
	}
	
	for(int i = (userGroup * pageSize) + 1 ; i <= (userGroup * pageSize) + pageSize ; i++){
	%>
		&nbsp;&nbsp;<a href="/myweb/section/bbs/pageTest.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
	<%
		if(i == totalPage)break;
	}
	
	if(userGroup != (totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)){ // 마지막 게시글이 해당되는 페이지 그룹이 아닌 경우
	%>
		<a href="/myweb/section/bbs/pageTest.jsp?cp=<%= ((userGroup+1)*pageSize) + 1 %>">&gt;&gt;</a>
	<%
	}
	%>
</body>
</html>