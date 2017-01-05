<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/empList.css">
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
						Class.forName("oracle.jdbc.driver.OracleDriver");
						String url = "jdbc:oracle:thin:@localhost:1521:orcl";
						String user = "scott";
						String pwd = "1234";
						Connection conn = DriverManager.getConnection(url, user, pwd);
						
						PreparedStatement pstmt = null;
						String name = request.getParameter("name");
						if(name == null){
							String sql = "SELECT * FROM employee order by idx desc";
							pstmt = conn.prepareStatement(sql);
						} else {
							String sql = "SELECT * FROM employee WHERE name = ? order by idx desc";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, name);
						}

						ResultSet rs = pstmt.executeQuery();
						
						if(rs.next()){
							do{
					%>
								<tr>
									<td><%=rs.getInt("idx")%></td>
									<td><%=rs.getString("name")%></td>
									<td><%=rs.getString("email")%></td>
									<td><%=rs.getString("dept")%></td>
								</tr>
					<%
							}while(rs.next());
						} else {
					%>
							<tr>
								<td colspan="4" align="center">등록된 사원이 없습니다.</td>
							</tr>
					<%
						}
						
						rs.close();
						pstmt.close();
						conn.close();
					%>
				</tbody>
			</table>
		</article>
	</section>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>