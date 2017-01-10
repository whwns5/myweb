package yong.member;

import java.sql.*;
import java.util.ArrayList;

import yong.db.yongDB;
import yong.emp.EmpDTO;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
		//dbConnect();
	}
	
//	public void dbConnect(){
//		try{
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//			String user = "scott";
//			String pwd = "1234";
//			
//			conn = DriverManager.getConnection(url, user, pwd);
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//	}
	
	/** 회윈 정보 등록 관련 메서드 */
	public int memberJoin(MemberDTO mdto){
		
		try {
			
			conn = yongDB.getConn();
			
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
			conn = yongDB.getConn();
			
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
	
	/** 회원 검색 관련 메서드 */
	public ArrayList<Object> memberFind(String fkey, String fvalue){
		ArrayList<Object> arraymdto = new ArrayList<Object>();
		String sql = "";

		try {
			conn = yongDB.getConn();
			
			if(fkey.equals("ID")){
				sql = "SELECT * FROM jsp_member WHERE id = ? ORDER BY idx DESC";
			} else if(fkey.equals("이름")){
				sql = "SELECT * FROM jsp_member WHERE name = ? ORDER BY idx DESC";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fvalue);
			
			rs = pstmt.executeQuery();

			// Vector<EmpDTO> v = new Vector<EmpDTO>();
			// Vector 와 ArrayListd의 차이점 : 벡터는 복사가 되는 기능이 있다.

			while (rs.next()) {
				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr");
				String joindate = rs.getString("joindate");
				//java.sql.Date joinDate = rs.getDate("joindate");
				
				arraymdto.add(new MemberDTO(idx, id, pwd, name, tel, addr, joindate));
				// v.add(new EmpDTO(idx, name, email, dept));
			}

			// EmpDTO dtos[] = new EmpDTO[v.size()];
			// v.copyInto(dtos);
			
			return arraymdto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 로그인 검증 관련 메서드 */
	public int loginCheck(String id, String pwd){
		
		String sql = "";
		String rsPwd = "";
		
		try {
			conn = yongDB.getConn();
			
			sql = "SELECT pwd FROM jsp_member WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){ // 해당 아이디로 검색된 결과가 있는 경우
				rsPwd = rs.getString("pwd"); // 해당 아이디의 패스워드를 가져온다.
				
				if(pwd.equals(rsPwd)){ // 사용자가 입력한 pwd와 데이터 베이스의 pwd가 일치할 경우
					return 3; // 3 -> 아이디와 패스워드가 모두 일치 합니다.
				} else {
					return 2; // 2 -> 아이디는 일치하지만 패스워드가 틀립니다.
				}
				
			} else {
				return 1; // 1 -> 해당 ID가 존재하지 않습니다.
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 0;
	}
	
	/** 회원이름 정보도출 관련 메서드 */
	public String getUserInfo(String id){
		
		String sql = "";
		String name = "";
		
		try {
			conn = yongDB.getConn();
			
			sql = "SELECT name FROM jsp_member WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				name = rs.getString("name");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return name;
	}

}
