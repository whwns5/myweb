<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/empUpdate.css">
<script>
	function returnPage() {
		location.href = '/myweb/section/emp.jsp';
	}
</script>
<%
	String idx_s = request.getParameter("idx");
	if(idx_s == null || idx_s.equals("")){
		idx_s="0";
	}
	
	int idx = Integer.parseInt(idx_s);
	String name = "";
	String email = "";
	String dept = "";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, pwd);
	PreparedStatement pstmt = null;
	
	String sql = "SELECT * FROM employee WHERE idx = ?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		idx = rs.getInt("idx");
		name = rs.getString("name");
		email = rs.getString("email");
		dept = rs.getString("dept");
		
		rs.close();
		pstmt.close();
		conn.close();
	} else {
%>
		<script>
			window.alert('해당 사원이 존재하지 않습니다.');
			location.href = '/myweb/section/emp.jsp';
		</script>
<%
		rs.close();
		pstmt.close();
		conn.close();
		return;
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
				<form name="empUpdate_ok" action="/myweb/section_ok/empUpdate_ok.jsp">
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