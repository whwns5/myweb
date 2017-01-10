package yong.db;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;
 
/** DBCP 활용 */
public class yongDB {
	
	static DataSource ds;
	
	static{ // 프로그램 시점에서 메모리에 올라간다.
		try{
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	
	public static Connection getConn() throws Exception{
		return ds.getConnection();
	}
}
