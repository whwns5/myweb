package yong.bbs;

import java.sql.*;
import java.util.*;


public class BbsDAO_t {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BbsDAO_t() {
		super();
	}
	
	/** 글쓰기 관련 메서드 */
	public int bbsWrite(BbsDTO_t dto_t){
		try{
			conn = yong.db.yongDB.getConn();
			String sql = "INSERT INTO JSP_bbs VALUES(JSP_bbs_idx.NEXTVAL, ?, ?, ?, ?, SYSDATE, 0, 0, 0, 0)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto_t.getWriter());
			ps.setString(2, dto_t.getPwd());
			ps.setString(3, dto_t.getSubject());
			ps.setString(4, dto_t.getContent());
			
			int count = ps.executeUpdate();
			
			return count;
			
		} catch (Exception e){
			e.printStackTrace();
			return -1;
		} finally {
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 목록 관련 메서드*/
	public ArrayList<BbsDTO_t> bbsList(int cp, int ls){
		
		try{
			conn = yong.db.yongDB.getConn();
			//String sql = "SELECT * FROM JSP_bbs ORDER BY idx DESC";
			
			String sql = "SELECT * FROM "
					+ "(SELECT rownum as rnum, a.* FROM "
					+ "(SELECT * FROM JSP_bbs ORDER BY idx DESC) a) b "
					+ "WHERE rnum >= (" + cp + "-1)*" + ls + "+ 1 AND rnum <= " + cp + "*" + ls;  
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			ArrayList<BbsDTO_t> arr = new ArrayList<BbsDTO_t>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				
				BbsDTO_t dto_t = new BbsDTO_t(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
			
				arr.add(dto_t);
			}
			
			return arr;
			
		} catch(Exception e){
			e.printStackTrace();
			return null;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e){
				
			}
		}
		
	}
	
	/** 본문 관련 메서드 */
	public BbsDTO_t bbsContent(int idx){
		try{
			conn = yong.db.yongDB.getConn();
			String sql = "SELECT * FROM JSP_bbs WHERE idx = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			rs = ps.executeQuery();
			
			BbsDTO_t dto = null;
			
			if(rs.next()){
				
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				
				dto = new BbsDTO_t(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
				
			}
			
			return dto;

		} catch (Exception e){
			e.printStackTrace();
			
			return  null;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 총 게시물 수 관련 메서드 */
	public int getTotalCnt(){
		try{
			conn = yong.db.yongDB.getConn();
			
			String sql = "SELECT COUNT(*) FROM JSP_bbs";
	
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			rs.next(); // count 는 무조건 나오기 때문
			
			int count = rs.getInt(1);
			
			count = count == 0 ? 1 : count;
		
			return count;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)rs.close();
				if(conn!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
}
