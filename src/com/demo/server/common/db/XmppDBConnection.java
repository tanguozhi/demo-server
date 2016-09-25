package com.demo.server.common.db;

import java.sql.Connection;
import java.sql.DriverManager;

import org.apache.struts2.ServletActionContext;

import com.gz.tool.db.DBConnection;

public class XmppDBConnection {
	private static XmppDBConnection dbConnection;
	private DBConnection mDBConnection = new DBConnection();
	
	private Connection conn;
	
    //数据库名称
    String database = "xmpp_db";

    // MySQL配置时的用户名
    String userName = "root";
    // MySQL配置时的密码
    String userPassword = ""; 
    
    public static XmppDBConnection getInstance() {
    	if(null==dbConnection) {
    		dbConnection = new XmppDBConnection();
    	}
    	return dbConnection;
    }
   
    /**
     * 打开并连接数据库
     * @return
     */
	public Connection open() {
        try {
        	if(null!=conn) {
    			if(!conn.isClosed()) {
    				conn.close();
    			}
    		}
			Class.forName(mDBConnection.getDirver());
			// 连续数据库
	        conn = DriverManager.getConnection(mDBConnection.getUrl()+database, userName, userPassword); 
		} catch (Exception e) {
			conn = null;
			
			ServletActionContext.getRequest().setAttribute("contextError", "XMPP数据库链接失败...");
			
			e.printStackTrace();
		}        
        
        return conn;
	}
	
	public void close() {
		try {
        	if(null!=conn) {
    			if(!conn.isClosed()) {
    				conn.close();
    				conn = null;
    			}
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
