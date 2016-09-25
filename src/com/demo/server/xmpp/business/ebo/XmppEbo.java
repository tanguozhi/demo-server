/**
 * @author tanguozhi
 */
package com.demo.server.xmpp.business.ebo;

import java.util.ArrayList;

import com.demo.server.xmpp.business.ebi.XmppEbi;
import com.demo.server.xmpp.dao.dao.XmppDao;
import com.demo.server.xmpp.vo.*;


/**
 * @author TanGuozhi
 *
 */
public class XmppEbo implements XmppEbi{
	/*
	 * 
	 */
	private XmppDao dao = null;
	public void setDao(XmppDao dao){
		this.dao = dao;
	}
	
	@Override
	public MucRoomModel getMucRoomByName(String roomName) {
		
		return dao.getMucRoomByName(roomName);
	}

	@Override
	public MucRoomModel getMucRoomByID(String roomID) {
		return dao.getMucRoomByID(roomID);
	}

	@Override
	public ArrayList<MucRoomModel> getUserInRoomsByName(String userName) {
		
		
		return dao.getUserInRoomsByName(userName);
	}
	
	@Override
	public ArrayList<MucRoomUsersModel> getRoomAffiliationUserByRoomID(String roomID) {
		return dao.getRoomAffiliationUserByRoomID(roomID);
	}
	
	@Override
	public ArrayList<MucRoomUsersModel>	getRoomMemberUserByRoomID(String roomID) {
		return dao.getRoomMemberUserByRoomID(roomID);
	}
	
	@Override
	public boolean	quitRoomMember(String roomID, String jid) {
		return dao.quitRoomMember(roomID, jid);
	}
}
