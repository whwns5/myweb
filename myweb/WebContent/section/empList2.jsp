<%@page import="yong.emp.EmpDAO"%>
<%@page import="yong.emp.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<jsp:useBean id="edao" class="yong.emp.EmpDAO"/>
<%
	String name = request.getParameter("name");

	ArrayList<Object> arrayResult = null;
	// EmpDTO dtos[] = edao.empList();
	
	if(name == null){
		arrayResult = edao.empList(); // 전체 출력
	} else {
		arrayResult = edao.empList(new EmpDTO(name));		
	}
%>		
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	
	<section>
		<article>
			<h2>모든 사원 내역</h2>
			<table>
				<thead>
					<tr>
						<th>사원번호</th>
						<th>사원이름</th>
						<th>E-MAIL</th>
						<th>부서명</th>
					</tr>
				</thead>
				<tbody>
					<%
						if(arrayResult.size() > 0){
							for(int i = 0 ; i < arrayResult.size() ; i++){	
					%>
								<tr>
					<%
									Object obResult = arrayResult.get(i);
									if(obResult instanceof EmpDTO){
									EmpDTO tempDTO = (EmpDTO) obResult;
					%>
									<td><%=tempDTO.getIdx()%></td>
									<td><%=tempDTO.getName()%></td>
									<td><%=tempDTO.getEmail()%></td>
									<td><%=tempDTO.getDept()%></td>
					<%
								}
					%>
								</tr>
					<%
							}
						} else {
					%>	
							<tr>
								<td colspan="4" align="center">등록된 사원이 없습니다.</td>
							</tr>
					<%	
						}
					%>
				</tbody>
			</table>
		</article>
	</section>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>