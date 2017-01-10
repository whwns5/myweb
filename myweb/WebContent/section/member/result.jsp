<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="yong.member.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="mdao" class="yong.member.MemberDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/section/member/result.css">
<%
	request.setCharacterEncoding("utf-8");
	String fkey = request.getParameter("fkey");
	String fvalue = request.getParameter("fvalue");
	ArrayList<Object> arrayResult = null;
%>
</head>
<body>
	<fieldset>
		<legend>모든 회원</legend>
		<table class="form-table">
				<thead>
					<tr>
						<th>IDX</th>
						<th>ID</th>
						<th>NAME</th>
						<th>TEL</th>
						<th>ADDR</th>
						<th>JOINDATE</th>
					</tr>
				</thead>
				<tbody>
<%
		arrayResult = mdao.memberFind(fkey, fvalue);

		if (arrayResult.size() > 0 && arrayResult != null) {
			for (int i = 0; i < arrayResult.size(); i++) {
%>
				<tr>
<%
				Object obResult = arrayResult.get(i);
				if (obResult instanceof MemberDTO) {
					MemberDTO tempDTO = (MemberDTO) obResult;
%>
					<td><%=tempDTO.getIdx()%></td>
					<td><%=tempDTO.getId()%></td>
					<td><%=tempDTO.getName()%></td>
					<td><%=tempDTO.getTel()%></td>
					<td><%=tempDTO.getAddr()%></td>
					<td><%=tempDTO.getJoindate()%></td>
<%
				}
%>
				</tr>
<%
			}
		} else {
%>	
			<tr>
				<td colspan="4">등록된 회원이 없습니다.</td>
			</tr>
<%	
		}
%>
	</tbody>
	</table>
	</fieldset>
</body>
</html>