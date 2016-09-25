/**
 * @author tanguozhi
 */
package com.demo.server.xmpp.vo;

import java.io.Serializable;
import java.sql.ResultSet;


public class MucRoomUsersModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String serviceID, roomID, jid, affiliation, nickname, firstName, lastName, url, email, faqentry;

	public void rsToModel(ResultSet rs) {
		try {
			this.setRoomID(rs.getString("roomID"));
			this.setJid(rs.getString("jid"));
			this.setAffiliation(rs.getString("affiliation"));
			this.setNickname(rs.getString("nickname"));
			this.setFirstName(rs.getString("firstName"));
			this.setLastName(rs.getString("lastName"));
			this.setUrl(rs.getString("url"));
			this.setEmail(rs.getString("email"));
			this.setFaqentry(rs.getString("faqentry"));
		} catch (Exception err) {
		}
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



	public String getJid() {
		return jid;
	}



	public void setJid(String jid) {
		this.jid = jid;
	}



	public String getAffiliation() {
		return affiliation;
	}



	public void setAffiliation(String affiliation) {
		this.affiliation = affiliation;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getFaqentry() {
		return faqentry;
	}



	public void setFaqentry(String faqentry) {
		this.faqentry = faqentry;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
