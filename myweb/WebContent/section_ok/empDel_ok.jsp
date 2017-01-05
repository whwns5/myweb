<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> <!-- 가독성을 위해서 -->
<%		

	String name = request.getParameter("name");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, pwd);
	String sql = "DELETE FROM employee WHERE name = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	
	int count = pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	String msg = count > 0 ? "퇴사처리가 완료 되었습니다." : "퇴사처리중 문제가 발생 했습니다.";
	
%>
	<script>
		window.alert('<%=msg%>');
		location.href = '/myweb/section/emp.jsp'; // <a>태그와 같은 기능을 하는 객체
	</script>
