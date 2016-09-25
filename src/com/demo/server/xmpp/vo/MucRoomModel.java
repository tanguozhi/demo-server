/**
 * @author tanguozhi
 */
package com.demo.server.xmpp.vo;

import java.io.Serializable;
import java.sql.ResultSet;


public class MucRoomModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String serviceID, roomID, name, naturalName, description, subject, roomPassword;

	public String getRoomPassword() {
		return roomPassword;
	}

	public void setRoomPassword(String roomPassword) {
		this.roomPassword = roomPassword;
	}

	public String getServiceID() {
		return serviceID;
	}

	public void setServiceID(String serviceID) {
		this.serviceID = serviceID;
	}

	public String getRoomID() {
		return roomID;
	}

	public void setRoomID(String roomID) {
		this.roomID = roomID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNaturalName() {
		return naturalName;
	}

	public void setNaturalName(String naturalName) {
		this.naturalName = naturalName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public void rsToModel(ResultSet rs) {
		try {
			this.setRoomID(rs.getString("roomID"));
			this.setName(rs.getString("name"));
			this.setNaturalName(rs.getString("naturalName"));
			this.setDescription(rs.getString("description"));
			this.setSubject(rs.getString("subject"));
			this.setRoomPassword(rs.getString("roomPassword"));
		} catch (Exception err) {
			
		}
	}

}
