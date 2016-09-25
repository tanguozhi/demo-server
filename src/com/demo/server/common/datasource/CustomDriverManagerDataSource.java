package com.demo.server.common.datasource;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.gz.tool.db.DBConnection;


public class CustomDriverManagerDataSource extends DriverManagerDataSource {
	private DBConnection mDBConnection = new DBConnection();
	public void setUrl(String url) {
		if(null!=url && !"".equals(url)) {
			String databaseName = mDBConnection.getDatabaseName();
			url = url.replaceAll("%@", databaseName);
		}
		super.setUrl(url);
	}
	
	public void setUsername(String username) {
		if("".equals(username)) {
			username = mDBConnection.getUserName();
		}
		super.setUsername(username);
	}
	
	public void setPassword(String password) {
		if("".equals(password)) {
			password = mDBConnection.getUserPassword();
		}
		super.setPassword(password);
	}

}
