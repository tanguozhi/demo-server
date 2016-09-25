/**
 * @author tanguozhi
 */
package com.demo.server.push.vo;

import java.io.Serializable;
import java.sql.ResultSet;


public class PushModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String serviceID, tokens, message;
	
	private int count = 1;
	
	public String getServiceID() {
		return serviceID;
	}


	public void setServiceID(String serviceID) {
		this.serviceID = serviceID;
	}


	public String getTokens() {
		return tokens;
	}


	public void setTokens(String tokens) {
		this.tokens = tokens;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public void rsToModel(ResultSet rs) {
		try {
			this.setTokens(rs.getString("token"));
		} catch (Exception err) {
			
		}
	}

}
