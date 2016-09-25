/**
 * @author tanguozhi
 */
package com.demo.server.xmpp.business.ebi;

import java.util.ArrayList;

import com.demo.server.xmpp.vo.*;

/**
 * @author TanGuoZhi
 *
 */
public interface XmppEbi {
	
	/**
	 * 通过房间名称获取房间信息
	 * @param roomName
	 * @return
	 */
	public MucRoomModel getMucRoomByName(String roomName);
	
	/**
	 * 通过房间ID获取房间信息
	 * @param roomID
	 * @return
	 */
	public MucRoomModel getMucRoomByID(String roomID);
	
	/**
	 * 通过用户名称获取用户所在的房间
	 * @param userName
	 * @return
	 */
	public ArrayList<MucRoomModel> getUserInRoomsByName(String userName);
	
	/**
	 * 通过房间ID获取房间的管理员
	 * @param roomID
	 * @return
	 */
	public ArrayList<MucRoomUsersModel> getRoomAffiliationUserByRoomID(String roomID);
	
	/**
	 * 通过房间ID获取房间的会员
	 * @param roomID
	 * @return
	 */
	public ArrayList<MucRoomUsersModel>	getRoomMemberUserByRoomID(String roomID);
	
	/**
	 * 房间会员退出房间
	 * @param roomID
	 * @return
	 */
	public boolean	quitRoomMember(String roomID, String jid);
	
}
