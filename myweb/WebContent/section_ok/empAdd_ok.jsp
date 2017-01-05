<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String dept = request.getParameter("dept");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, pwd);
	String sql = "INSERT INTO employee VALUES(employee_idx.NEXTVAL, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, email);
	pstmt.setString(3, dept);
	
	int count = pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	if(count > 0){ // 성공적으로 실행 시
%>
		<script>
			window.alert('사원이 등록되었습니다.');
			location.href = '/myweb/section/emp.jsp'; // <a>태그와 같은 기능을 하는 객체
		</script>	
<%
	} else {
%>
		<script>
			window.alert('사원등록에 실패하였습니다!');
			location.href = '/myweb/section/emp.jsp'; // <a>태그와 같은 기능을 하는 객체
		</script>
<%	
	}
%>