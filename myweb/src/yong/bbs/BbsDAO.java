package yong.bbs;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import yong.db.yongDB;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static final int ERROR = -1;
	
	public BbsDAO() {
		super();
	}
	
	/** 게시글 작성 관련 메서드 */
	public int bbsWrite(BbsDTO bdto){
		
		conn = null;
		String sql = "";
		
		try{
			
			conn = yongDB.getConn();
											
			sql = "INSERT INTO JSP_bbs VALUES(JSP_bbs_idx.NEXTVAL, " // idx
					+ "?, " // writer
					+ "?, " // pwd
					+ "?, " // subject
					+ "?, " // content
					+ "SYSDATE, " // writedate
					+ "?, " // readnum
					+ "?, " // ref
					+ "?, " // lev
					+ "?)"; // sunbun
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bdto.getWriter()); // writer
			pstmt.setString(2, bdto.getPwd()); // pwd
			pstmt.setString(3, bdto.getSubject()); // subject
			pstmt.setString(4, bdto.getContent()); // content
			pstmt.setInt(5, 0); // readnum
			pstmt.setInt(6, 0); // ref
			pstmt.setInt(7, 0); // lev
			pstmt.setInt(8, 0); // sunbun
			
			int count = pstmt.executeUpdate();
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return this.ERROR;
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 게시글 전체 조회 관련 메서드 */
	public ArrayList<BbsDTO> bbsList(int currentPage, int pageSize){
		ArrayList<BbsDTO> arrayBdto = new ArrayList<BbsDTO>();
		
		conn = null;
		String sql = "";
		
		try{
			conn = yongDB.getConn();
			
			//sql = "SELECT * FROM JSP_bbs ORDER BY idx DESC";
			
			sql = "SELECT * "
					+ "FROM (SELECT t.*, rownum as numrow "
					+ 			"FROM (SELECT * FROM JSP_bbs ORDER BY idx DESC) t) "
					+ "WHERE numrow > ? and numrow <= ? ORDER BY idx DESC";

					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (currentPage-1) * pageSize);
			pstmt.setInt(2, currentPage * pageSize);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				//Date writedate = rs.getDate("writedate");
				java.sql.Date writedate = rs.getDate("writedate");
				/*
				java.util.Date myTime = rs.getTime("writedate");
				Calendar cal = new GregorianCalendar();
				cal.setTime( myTime );
				int hours = cal.get( Calendar.HOUR_OF_DAY ); // 시
				int minutes = cal.get( Calendar.MINUTE); // 분
				int seconds = cal.get( Calendar.SECOND); // 초
				System.out.println(hours + "시" + minutes + "분" + seconds +" 초");
				*/
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				
				BbsDTO tempBdto = new BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
				
				arrayBdto.add(tempBdto);
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
		
		return arrayBdto;
	}
	
	/** 본문보기 관련 메서드 */
	public BbsDTO bbsContent(String input_idx){
		BbsDTO bdto = null;
		
		conn = null;
		String sql = "";
		
		try{
			conn = yongDB.getConn();
			
			sql = "SELECT * FROM JSP_bbs WHERE idx = ? ORDER BY idx DESC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(input_idx));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				
				bdto = new BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
				
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
		
		return bdto;
		
	}
	
	/** 총 게시글 수 도출 메서드 */
	public int totalContent(){
		conn = null;
		String sql = "";
		int count = 0;
		
		try{
			conn = yongDB.getConn();
			
			sql = "SELECT COUNT(*) FROM JSP_bbs";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
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















