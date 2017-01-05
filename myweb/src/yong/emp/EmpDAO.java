package yong.emp;

import java.sql.*;
import java.util.*;

public class EmpDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public EmpDAO() {
		// TODO Auto-generated constructor stub
		System.out.println("EmpDAO객체 생성됨!");
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
	
	/** 사원 등록 관련 메서드 */
	public int empAdd(EmpDTO dto){
		
		try {
		
			String sql = "INSERT INTO employee VALUES(employee_idx.NEXTVAL, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getDept());
			
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
	
	/** 사원 삭제 관련 메서드 */
	public int empDel(EmpDTO dto){
		
		try{
		
			String sql = "DELETE FROM employee WHERE name = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			
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
	
	/** 사원 전체 조회 관련 메서드 */
	// public EmpDTO[] empList(){
	public ArrayList<Object> empList(){
		
		ArrayList<Object> arrayEdto = new ArrayList<Object>();
		
		try{
			
			String sql = "SELECT * FROM employee ORDER BY idx DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
		
			// Vector<EmpDTO> v = new Vector<EmpDTO>();
			// Vector 와 ArrayListd의 차이점 : 벡터는 복사가 되는 기능이 있다.
					
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				arrayEdto.add(new EmpDTO(idx, name, email, dept));
				// v.add(new EmpDTO(idx, name, email, dept));
			}
			
			// EmpDTO dtos[] = new EmpDTO[v.size()];
			// v.copyInto(dtos);
		
			
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
		
		return arrayEdto;
	}

	
	
	/** 사원 이름 검색 조회 관련 메서드 */
	public ArrayList<Object> empList(Object dto){
		ArrayList<Object> arrayDTO = new ArrayList<Object>();
		EmpDTO inputDTO = null;
		
		try{
			if(dto instanceof EmpDTO){
				inputDTO = (EmpDTO) dto;
			}
			
			String sql = "SELECT * FROM employee WHERE name = ? ORDER BY idx DESC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputDTO.getName());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				arrayDTO.add(new EmpDTO(idx, name, email, dept));
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
		
		return arrayDTO;
	}
	
	/** 사원 idx 검색 조회 관련 메서드 */
	public Object empSearch(Object dto){
		EmpDTO inputDTO = null;
		EmpDTO resultDTO = null;
		
		try {
			if(dto instanceof EmpDTO){
				inputDTO = (EmpDTO) dto;
			}
			
			String sql = "SELECT * FROM employee WHERE idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inputDTO.getIdx());
			
			rs = pstmt.executeQuery();
		
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				resultDTO = new EmpDTO(idx, name, email, dept);
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
		
		return resultDTO;
	}
	
	/** 사원 수정 관련 메서드 */
	public int empUpdate(Object dto){
		EmpDTO inputDTO = null;
		
		try {
			if(dto instanceof EmpDTO){
				inputDTO = (EmpDTO) dto;
			}
			
			String sql = "UPDATE employee SET name = ?, email = ?, dept = ? WHERE idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputDTO.getName());
			pstmt.setString(2, inputDTO.getEmail());
			pstmt.setString(3, inputDTO.getDept());
			pstmt.setInt(4, inputDTO.getIdx());
			
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
}
