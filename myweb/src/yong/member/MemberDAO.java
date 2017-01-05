package yong.member;

import java.sql.*;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
		dbConnect();
	}
	
	public void dbConnect(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String pwd = "1234";
			
			conn = DriverManager.getConnection(url, user, pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/** 회윈 정보 등록 관련 메서드 */
	public int memberJoin(MemberDTO mdto){
		
		try {
			String sql = "INSERT INTO JSP_member VALUES(JSP_member_idx.NEXTVAL, ?, ?, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD'))";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPwd());
			pstmt.setString(3, mdto.getName());
			pstmt.setString(4, mdto.getTel());
			pstmt.setString(5, mdto.getAddr());
			
			int count = pstmt.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 회원 아이디 체크 관련 메서드 */
	public boolean idCheck(String id){
		
		try {
			String sql = "SELECT * FROM JSP_member WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
}
