/**
 * 
 */
package com.demo.server.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gz.tool.db.DBConnection;

/**
 * @author Tan.Guo.Zhi
 *
 */
public class Uuid {
	private static String uuidTableName = "tbl_uuid";
	private static String column_uuid = "uuid";
	private static String column_table_name = "table_name";
	private static String spe = "1";
	
	public static String getUuid(String tableName) {
		return getUuid(tableName, null);
	}
	
	public static String getUuid(String tableName, String prefix) {
		String uuid = "";
		boolean isExit = false;
		
		//
		boolean bFlag = tableIsExit(uuidTableName);
		if(!bFlag) {
			bFlag = createTable();
			if(!bFlag) {
				return uuid;
			}
		}
		
		DBConnection dbConnection = new DBConnection();
		Connection conn = dbConnection.open();
		
		try {
			String sql = "select * from "+uuidTableName +" where "+column_table_name+"='"+tableName+"'";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				uuid = rs.getString(1);
				
				isExit = true;
			}
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("tbl_uuid表格不存在:"+tableName);
			
		}
		dbConnection.close();
		
		if(uuid.equals("")) {
			uuid = "0";
			
			if(null!=prefix) {
				uuid = prefix+spe+uuid;
			}
		}
		//先去掉前缀
		uuid = uuid.replaceAll(prefix+spe, "");
		
		uuid = formatUuid(uuid);
		
		if(null!=prefix) {
			uuid = prefix+spe+uuid;
		}
		
		if(isExit) {
			update(tableName, uuid);
		} else {
			insert(tableName, uuid);
		}
		
		return uuid;
	}
	
	public static boolean createTable() {
		boolean bFlag = false;
		
		DBConnection dbConnection = new DBConnection();
		Connection conn = dbConnection.open();
		
		if(null==conn) {
			return bFlag;
		}
		
		try {
			String sql = "CREATE TABLE "+uuidTableName+" ("+column_uuid+" varchar(30)  NOT NULL, "+column_table_name+" varchar(30)  primary key NOT NULL)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.execute();

			pstmt.close();
			conn.close();
			
			bFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		dbConnection.close();
		
		return bFlag;
	}
	
	/**
	 * 检测表格是否存在
	 * @param tableName
	 * @return
	 */
	private static boolean tableIsExit(String tableName) {
		boolean bFlag = false;
		
		DBConnection dbConnection = new DBConnection();
		Connection conn = dbConnection.open();
		
		if(null==conn) {
			return bFlag;
		}
		
		try {
			String sql = "show tables";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString(1);
				if(name.equals(tableName)) {
					bFlag = true;
					break;
				}
			}
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("");
			e.printStackTrace();
		}
		dbConnection.close();
		
		return bFlag;
	}
	
	private static void insert(String uuid, String value) {
		DBConnection dbConnection = new DBConnection();
		Connection conn = dbConnection.open();

		try {
			String sql = "insert into "+uuidTableName+" ("+column_table_name+","+column_uuid+") values('"+uuid+"','"+value+"')";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.execute();
			
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			
			
		}
		dbConnection.close();
	}
	
	private static void update(String tableName, String uuid) {
		DBConnection dbConnection = new DBConnection();
		Connection conn = dbConnection.open();

		try {
			String sql = "update "+uuidTableName+" set "+column_uuid+"='"+uuid+"',"+column_table_name+"='"+tableName+"' where "+column_table_name+"='"+tableName+"'";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.execute();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			
			
		}
		dbConnection.close();
	}
	
	private static String formatUuid(String uuid) {
		int _uuid = Integer.parseInt(uuid);
		_uuid++;
		
		uuid = ""+_uuid;
		
		for(int i=uuid.length(); i<10; i++) {
			uuid = "0"+uuid;
		}
		
		return uuid;
	}
}
