<%@page import="yong.emp.EmpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<script>
	function returnPage() {
		location.href = '/myweb/section/emp2.jsp';
	}
</script>
<jsp:useBean id="edao" class="yong.emp.EmpDAO"/>
<jsp:useBean id="edto" class="yong.emp.EmpDTO"/>
<jsp:setProperty property="*" name="edto"/>
<%
	
	int idx = 0;
	String name = "";
	String email = "";
	String dept = "";
	edto = (EmpDTO) edao.empSearch(edto);
	
	if(edto == null){
%>
		<script>
			window.alert('해당 사원이 존재하지 않습니다.');
			location.href = '/myweb/section/emp2.jsp';
		</script>
<% 	
	} else {
		idx = edto.getIdx();
		name = edto.getName();
		email = edto.getEmail();
		dept = edto.getDept();
	}
%>
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	
	<section>
		<article>
			<h2>사원 정보 수정</h2>
		</article>
		<article>
			<fieldset>
				<legend>사원 수정</legend>
				<form name="empUpdate_ok" action="/myweb/section_ok/empUpdate2_ok.jsp">
				<input type="hidden" name="idx" value="<%=idx%>">
	 			<table>
	 				<caption>UPDATE</caption>
	 				<tbody>
					<tr>
						<th>사원번호</th>
						<td><%=idx%></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" value="<%=name%>"></td>
					</tr>
					<tr>
						<th>E-MAIL</th>
						<td><input type="text" name="email" value="<%=email%>"></td>
					</tr>
					<tr>
						<th>부서</th>
						<td><input type="text" name="dept" value="<%=dept%>"></td>
					</tr>
					</tbody>
					<tfoot>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기" class="btn_css"> 
							<input type="button" value="돌아가기" class="btn_css" onclick="returnPage();">
						</td>	
					</tr>
					</tfoot>
				</table>
				</form>
			</fieldset>
		</article>
	</section>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>