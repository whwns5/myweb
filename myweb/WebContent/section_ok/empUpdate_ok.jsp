<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String dept = request.getParameter("dept");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, pwd);
	
	String sql = "UPDATE employee SET name = ?, email = ?, dept = ? WHERE idx = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, email);
	pstmt.setString(3, dept);
	pstmt.setInt(4, idx);
	
	int count = pstmt.executeUpdate();

	pstmt.close();
	conn.close();
	
	String msg = count > 0 ? "사원 정보 수정이 완료 되었습니다." : "사원 정보 수정중 문제가 발생 했습니다.";
%>
	<script>
		window.alert('<%=msg%>');
		location.href = '/myweb/section/emp.jsp'; // <a>태그와 같은 기능을 하는 객체
	</script>
